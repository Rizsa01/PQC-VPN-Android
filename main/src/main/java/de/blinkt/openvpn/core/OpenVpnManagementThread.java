package de.blinkt.openvpn.core;

import android.content.Context;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Handler;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import androidx.annotation.NonNull;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;

public class OpenVpnManagementThread implements Runnable, OpenVPNManagement {

    private static final String TAG = "PQC_VPN_Mgmt";
    private final VpnProfile mProfile;
    private final OpenVPNService mOpenVPNService;
    private final String mSocketPath;
    private LocalSocket mSocket;
    private ParcelFileDescriptor mTunFd;
    private final Handler mResumeHandler;
    private boolean mShuttingDown = false;
    private boolean mWaitingForRelease = false;
    private long mLastHoldRelease = 0;
    private int mBytecountInterval = 2;
    private PausedStateCallback mPauseCallback;

    private final Runnable mResumeHoldRunnable = () -> {
        if (shouldBeRunning()) {
            releaseHoldCmd();
        }
    };

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService, String socketPath, ParcelFileDescriptor tunFd) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mSocketPath = socketPath;
        mTunFd = tunFd;
        mResumeHandler = new Handler(openVpnService.getMainLooper());
        Log.i(TAG, "Management Thread instantiated.");
    }

    public boolean openManagementInterface(@NonNull Context c) {
        int tries = 0;
        while (tries < 5) {
            tries++;
            try {
                mSocket = new LocalSocket();
                // Use FILESYSTEM namespace for sockets created in the app's cache directory
                mSocket.connect(new LocalSocketAddress(mSocketPath, LocalSocketAddress.Namespace.FILESYSTEM));
                Log.i(TAG, "Successfully connected to management socket on try " + tries);
                return true;
            } catch (Exception e) {
                Log.w(TAG, "Failed to connect to management socket (try " + tries + "): " + e.getMessage());
                if (tries < 5) {
                    try {
                        Thread.sleep(300);
                    } catch (InterruptedException ignored) {}
                }
            }
        }
        Log.e(TAG, "Could not connect to management socket after all retries.");
        return false;
    }

    @Override
    public void run() {
        Log.i(TAG, "Management Thread starting");

        if (!openManagementInterface(mOpenVPNService)) {
            Log.e(TAG, "Management interface connect failed. Thread exiting.");
            if (mOpenVPNService != null) {
                mOpenVPNService.stopVpn();
            }
            return;
        }

        byte[] buffer = new byte[2048];
        String pendingInput = "";
        try (InputStream instream = mSocket.getInputStream()) {
            // 1. Send initial setup commands
            managementCommand("version 3\n");
            managementCommand("log off\n");
            managementCommand("echo on\n");
            managementCommand("state on\n");
            managementCommand("bytecount " + mBytecountInterval + "\n");

            Log.i(TAG, "Management connection established. Releasing hold to start connection.");

            // 2. ### DEFINITIVE FIX: Proactively release the hold to break the deadlock ###
            // The native process will not send any requests until this is done.
            releaseHoldCmd();

            // 3. Now, enter the loop to process messages from the un-paused native process.
            while (!Thread.interrupted() && !mShuttingDown) {
                int numBytesRead = instream.read(buffer);
                if (numBytesRead == -1) {
                    Log.w(TAG, "Management socket stream ended.");
                    break;
                }
                String input = new String(buffer, 0, numBytesRead, "UTF-8");
                pendingInput += input;
                pendingInput = processInput(pendingInput);
            }
        } catch (IOException e) {
            if (!mShuttingDown) VpnStatus.logException("Management socket error", e);
        } finally {
            if (mSocket != null) {
                try {
                    mSocket.close();
                } catch (IOException e) {}
            }
        }
        Log.i(TAG, "Management thread exiting");
    }


    private String processInput(String pendingInput) {
        while (pendingInput.contains("\n")) {
            String[] tokens = pendingInput.split("\\r?\\n", 2);
            processCommand(tokens[0]);
            pendingInput = tokens.length > 1 ? tokens[1] : "";
        }
        return pendingInput;
    }

    private void processCommand(String command) {
        // All management messages from the server start with ">"
        if (command.startsWith(">")) {
            String[] parts = command.split(":", 2);
            String cmd = parts[0].substring(1);
            String argument = parts.length > 1 ? parts[1] : "";

            switch (cmd) {
                case "INFO":
                case "ECHO":
                    // These are informational, can be ignored or logged for debug
                    break;
                case "STATE":
                    processState(argument);
                    break;
                case "NEED-OK":
                    processNeedCommand(argument);
                    break;
                case "HOLD":
                    // The native process is confirming it is waiting for a 'hold release'
                    mWaitingForRelease = true;
                    VpnStatus.updateStateString("WAIT", "Waiting for client configuration");
                    break;
                case "BYTECOUNT":
                    // Handle byte count if needed for UI
                    break;
                case "FATAL":
                case "ERROR":
                    VpnStatus.logError("Native process reported a fatal error: " + argument);
                    break;
                default:
                    Log.d(TAG, "MGMT_CMD: " + command);
                    break;
            }
        } else if (command.startsWith("SUCCESS: ") || command.startsWith("INFO: ")) {
            // These are responses to our commands, can be ignored.
        } else {
            Log.w(TAG, "Unrecognized management message: " + command);
        }
    }

    private void processState(String argument) {
        String[] args = argument.split(",", 3);
        String state = args[1];
        String message = (args.length > 2) ? args[2] : "";
        VpnStatus.updateStateString(state, message);
    }

    private void processNeedCommand(String argument) {
        int p1 = argument.indexOf('\'');
        int p2 = argument.indexOf('\'', p1 + 1);
        if (p1 == -1 || p2 == -1) {
            Log.e(TAG, "Malformed NEED-OK command: " + argument);
            return;
        }

        String needed = argument.substring(p1 + 1, p2);
        String status = "ok";

        if ("OPENTUN".equals(needed)) {
            if (mTunFd != null) {
                Log.i(TAG, "Received OPENTUN request. Sending pre-established file descriptor.");
                try {
                    // Send the file descriptor over the socket
                    mSocket.setFileDescriptorsForSend(new FileDescriptor[]{mTunFd.getFileDescriptor()});
                    // IMPORTANT: Send the command *after* setting the FDs to be sent
                    managementCommand("needok '" + needed + "' ok\n");
                    // Clear the FDs so they aren't sent with the next command
                    mSocket.setFileDescriptorsForSend(null);

                    // We can now close our copy of the FD
                    mTunFd.close();
                    mTunFd = null;

                    // ### DEFINITIVE FIX ###
                    // Now that the native process has the TUN FD, we can release the hold
                    // and allow the TLS connection to begin.
                    Log.i(TAG, "TUN FD provided, now releasing hold.");
                    releaseHoldCmd();
                    return; // Command handled, we can exit the function.

                } catch (Exception e) {
                    VpnStatus.logException("Could not send fd over management socket", e);
                    status = "cancel";
                }
            } else {
                Log.e(TAG, "Received OPENTUN request, but mTunFd is null! This should not happen.");
                status = "cancel";
            }
        }
        // Send a response for other NEED-OK types or if there was an error
        managementCommand(String.format("needok '%s' %s\n", needed, status));
    }

    private boolean managementCommand(String cmd) {
        if (mSocket == null || !mSocket.isConnected()) {
            Log.w(TAG, "Cannot send command, management socket is not connected.");
            return false;
        }
        try {
            OutputStream out = mSocket.getOutputStream();
            out.write((cmd).getBytes("UTF-8"));
            out.flush();
            return true;
        } catch (IOException e) {
            Log.e(TAG, "IOException writing to management socket", e);
            return false;
        }
    }

    private void releaseHoldCmd() {
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);
        if ((System.currentTimeMillis() - mLastHoldRelease) < 2000) {
            // Avoid spamming hold release commands
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ignored) {}
        }
        mWaitingForRelease = false;
        mLastHoldRelease = System.currentTimeMillis();
        managementCommand("hold release\n");
        managementCommand("state on\n"); // Re-enable state messages after hold
    }

    private boolean shouldBeRunning() {
        return mPauseCallback == null || mPauseCallback.shouldBeRunning();
    }

    // --- Implementation of OpenVPNManagement interface ---
    @Override public void reconnect() { signalusr1(); resume(); }
    @Override public void pause(pauseReason reason) { if (!mWaitingForRelease) signalusr1(); }
    @Override public void resume() { if (mWaitingForRelease) releaseHoldCmd(); }
    @Override public boolean stopVPN(boolean replaceConnection) { mShuttingDown = true; managementCommand("signal SIGTERM\n"); return true; }
    @Override public void networkChange(boolean sameNetwork) { if (mWaitingForRelease) resume(); else managementCommand("network-change\n"); }
    @Override public void setPauseCallback(PausedStateCallback callback) { mPauseCallback = callback; }
    @Override public void sendCRResponse(String response) { managementCommand("cr-response " + response + "\n"); }
    @Override public void signalusr1() { mResumeHandler.removeCallbacks(mResumeHoldRunnable); if (!mWaitingForRelease) managementCommand("signal SIGUSR1\n"); }
}