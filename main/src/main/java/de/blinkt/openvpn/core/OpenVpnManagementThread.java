package de.blinkt.openvpn.core;

import android.content.Context;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Handler;
import android.os.ParcelFileDescriptor;
import androidx.annotation.NonNull;
import android.system.Os;
import android.util.Log;
import de.blinkt.openvpn.R;

import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Vector;

public class OpenVpnManagementThread implements Runnable, OpenVPNManagement {

    private static final String TAG = "OpenVPNManagement";
    private static final Vector<OpenVpnManagementThread> active = new Vector<>();
    private final Handler mResumeHandler;
    private LocalSocket mSocket;
    private final VpnProfile mProfile;
    private final OpenVPNService mOpenVPNService;
    private final LinkedList<FileDescriptor> mFDList = new LinkedList<>();
    private boolean mWaitingForRelease = false;
    private long mLastHoldRelease = 0;
    private pauseReason lastPauseReason = pauseReason.noNetwork;
    private PausedStateCallback mPauseCallback;
    private boolean mShuttingDown;
    private final String mSocketPath;
    private int mBytecountInterval = 2; // Default bytecount interval in seconds

    private final Runnable mResumeHoldRunnable = () -> {
        if (shouldBeRunning()) {
            releaseHoldCmd();
        }
    };

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mResumeHandler = new Handler(openVpnService.getMainLooper());
        this.mSocketPath = openVpnService.getCacheDir().getAbsolutePath() + "/" + "mgmtsocket";
    }

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService, String socketPath) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mResumeHandler = new Handler(openVpnService.getMainLooper());
        this.mSocketPath = socketPath;
    }

    private static boolean stopOpenVPN() {
        synchronized (active) {
            for (OpenVpnManagementThread mt : active) {
                try {
                    if (mt.mSocket != null) {
                        mt.mSocket.close();
                    }
                } catch (IOException e) {
                    VpnStatus.logError("Error closing management socket: " + e.getMessage());
                }
                mt.mShuttingDown = true;
            }
            active.clear();
        }
        return true;
    }

    public boolean openManagementInterface(@NonNull Context c) {
        try {
            File socketFile = new File(mSocketPath);
            int tries = 0;
            final int MAX_TRIES = 50;

            while (tries < MAX_TRIES) {
                if (socketFile.exists()) {
                    break;
                }
                Thread.sleep(100);
                tries++;
            }

            if (!socketFile.exists()) {
                VpnStatus.logError("Management socket not found: " + mSocketPath);
                return false;
            }

            mSocket = new LocalSocket();
            mSocket.connect(new LocalSocketAddress(mSocketPath, LocalSocketAddress.Namespace.FILESYSTEM));
            return true;

        } catch (Exception e) {
            VpnStatus.logException("Cannot connect to management socket", e);
            return false;
        }
    }

    private boolean managementCommand(String cmd) {
        if (mSocket == null || !mSocket.isConnected()) {
            VpnStatus.logWarning("Socket not connected, cannot send command: " + cmd);
            return false;
        }

        try {
            OutputStream out = mSocket.getOutputStream();
            out.write(cmd.getBytes());
            out.flush();
            return true;
        } catch (IOException e) {
            VpnStatus.logException("Error sending command: " + cmd, e);
            return false;
        }
    }

    @Override
    public void run() {
        byte[] buffer = new byte[2048];
        String pendingInput = "";

        synchronized (active) {
            active.add(this);
        }

        try (InputStream instream = mSocket.getInputStream()) {
            // Send initialization commands
            managementCommand("version 3\n");
            //managementCommand("hold release\n");
            managementCommand("state on\n");
            managementCommand("bytecount " + mBytecountInterval + "\n");

            while (!Thread.interrupted() && !mShuttingDown) {
                int numBytesRead = instream.read(buffer);
                if (numBytesRead == -1) {
                    VpnStatus.logInfo("Management socket closed by remote end");
                    break;
                }

                // Process ancillary file descriptors
                try {
                    FileDescriptor[] fds = mSocket.getAncillaryFileDescriptors();
                    if (fds != null) {
                        Collections.addAll(mFDList, fds);
                    }
                } catch (IOException e) {
                    VpnStatus.logException("Error reading fds from socket", e);
                }

                String input = new String(buffer, 0, numBytesRead, "UTF-8");
                pendingInput += input;
                pendingInput = processInput(pendingInput);
            }
        } catch (IOException e) {
            if (!mShuttingDown) {
                VpnStatus.logException("Management socket error", e);
            }
        } finally {
            try {
                if (mSocket != null) {
                    mSocket.close();
                }
            } catch (IOException e) {
                // Ignore
            }

            synchronized (active) {
                active.remove(this);
            }

            VpnStatus.logInfo("Management thread exiting");
        }
    }

    private void protectFileDescriptor(FileDescriptor fd) {
        try {
            Method getInt = FileDescriptor.class.getDeclaredMethod("getInt$");
            int fdint = (Integer) getInt.invoke(fd);
            if (!mOpenVPNService.protect(fdint)) {
                VpnStatus.logWarning("Could not protect VPN socket");
            }
            fdClose(fd);
        } catch (Exception e) {
            VpnStatus.logException("Failed to protect FD", e);
        }
    }

    private void fdClose(FileDescriptor fd) {
        try {
            Os.close(fd);
        } catch (Exception e) {
            VpnStatus.logException("Failed to close FD", e);
        }
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
        if (command.startsWith(">") && command.contains(":")) {
            String[] parts = command.split(":", 2);
            String cmd = parts[0].substring(1);
            String argument = parts[1];

            switch (cmd) {
                case "INFO":
                    // Ignore informational messages
                    break;
                case "PASSWORD":
                    processPWCommand(argument);
                    break;
                case "HOLD":
                    handleHold(argument);
                    break;
                case "NEED-OK":
                    processNeedCommand(argument);
                    break;
                case "BYTECOUNT":
                    processByteCount(argument);
                    break;
                case "STATE":
                    if (!mShuttingDown) processState(argument);
                    break;
                case "PROXY":
                    processProxyCMD(argument);
                    break;
                case "LOG":
                    processLogMessage(argument);
                    break;
                case "INFOMSG":
                    processInfoMessage(argument);
                    break;
                default:
                    VpnStatus.logWarning("Unknown management command: " + command);
                    break;
            }
        } else if (command.startsWith("PROTECTFD: ")) {
            FileDescriptor fdToProtect = mFDList.pollFirst();
            if (fdToProtect != null) {
                protectFileDescriptor(fdToProtect);
            }
        }
    }

    private void processInfoMessage(String info) {
        VpnStatus.logDebug("Server info: " + info);
    }

    private void processLogMessage(String argument) {
        String[] args = argument.split(",", 4);
        if (args.length < 4) return;

        VpnStatus.LogLevel level;
        switch (args[1]) {
            case "W": level = VpnStatus.LogLevel.WARNING; break;
            case "D": level = VpnStatus.LogLevel.VERBOSE; break;
            case "F": level = VpnStatus.LogLevel.ERROR; break;
            default: level = VpnStatus.LogLevel.INFO; break;
        }

        try {
            int logLevel = Integer.parseInt(args[2]) & 0x0F;
            VpnStatus.logMessageOpenVPN(level, logLevel, args[3]);
        } catch (NumberFormatException e) {
            VpnStatus.logError("Invalid log level: " + args[2]);
        }
    }

    boolean shouldBeRunning() {
        return mPauseCallback != null && mPauseCallback.shouldBeRunning();
    }

    private void handleHold(String argument) {
        mWaitingForRelease = true;
        String[] parts = argument.split(":");
        if (parts.length < 2) return;

        try {
            int waitTime = Integer.parseInt(parts[1]);
            if (shouldBeRunning()) {
                VpnStatus.updateStateString("CONNECTRETRY",
                        String.valueOf(waitTime),
                        R.string.state_waitconnectretry,
                        ConnectionStatus.LEVEL_CONNECTING_NO_SERVER_REPLY_YET);

                mResumeHandler.postDelayed(mResumeHoldRunnable, waitTime * 1000L);
            } else {
                VpnStatus.updateStatePause(lastPauseReason);
            }
        } catch (NumberFormatException e) {
            VpnStatus.logError("Invalid hold time: " + parts[1]);
        }
    }

    private void releaseHoldCmd() {
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);

        // Prevent too frequent release commands
        if ((System.currentTimeMillis() - mLastHoldRelease) < 5000) {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException ignored) {}
        }

        mWaitingForRelease = false;
        mLastHoldRelease = System.currentTimeMillis();

        managementCommand("hold release\n");
        managementCommand("bytecount " + mBytecountInterval + "\n");
        managementCommand("state on\n");
    }

    public void releaseHold() {
        if (mWaitingForRelease) {
            releaseHoldCmd();
        }
    }

    private void processProxyCMD(String argument) {
        managementCommand("proxy NONE\n");
    }

    private void processState(String argument) {
        String[] args = argument.split(",", 3);
        if (args.length < 2) return;

        String currentState = args[1];
        String message = args.length > 2 ? args[2].replace(",,", "") : "";
        VpnStatus.updateStateString(currentState, message);
    }

    private void processByteCount(String argument) {
        int comma = argument.indexOf(',');
        if (comma == -1) return;

        try {
            long in = Long.parseLong(argument.substring(0, comma));
            long out = Long.parseLong(argument.substring(comma + 1));
            VpnStatus.updateByteCount(in, out);
        } catch (NumberFormatException e) {
            VpnStatus.logError("Invalid bytecount format: " + argument);
        }
    }

    private void processNeedCommand(String argument) {
        int p1 = argument.indexOf('\'');
        int p2 = argument.indexOf('\'', p1 + 1);
        if (p1 == -1 || p2 == -1) return;

        String needed = argument.substring(p1 + 1, p2);
        String extra = argument.substring(p2 + 2); // Skip colon and space
        String status = "ok";

        switch (needed) {
            case "PROTECTFD":
                protectFileDescriptor(mFDList.pollFirst());
                break;

            case "DNSSERVER":
            case "DNS6SERVER":
                mOpenVPNService.addDNS(extra);
                break;

            case "DNSDOMAIN":
                mOpenVPNService.addSearchDomain(extra);
                break;

            case "ROUTE": {
                String[] routeParts = extra.split(" ");
                if (routeParts.length >= 4) {
                    mOpenVPNService.addRoute(
                            routeParts[0],
                            routeParts[1],
                            routeParts[2],
                            routeParts[3]
                    );
                }
                break;
            }

            case "ROUTE6":
                mOpenVPNService.addRoutev6(extra, "tun0");
                break;

            case "IFCONFIG": {
                String[] ifconfigParts = extra.split(" ");
                if (ifconfigParts.length >= 2) {
                    int mtu = -1;
                    if (mProfile.mUseCustomConfig) {
                        mtu = mProfile.mCustomConfig.indexOf("mtu-disc");
                    }
                    mOpenVPNService.setLocalIP(
                            ifconfigParts[0],
                            ifconfigParts[1],
                            mtu,
                            "vpn"
                    );
                }
                break;
            }

            case "IFCONFIG6":
                mOpenVPNService.setLocalIPv6(extra);
                break;

            case "HTTPPROXY":
                // Not implemented
                status = "ignore";
                break;

            case "PERSIST_TUN_ACTION":
                status = mOpenVPNService.getTunReopenStatus();
                break;

            case "OPENTUN":
                ParcelFileDescriptor pfd = mOpenVPNService.openTun();
                if (pfd != null && sendTunFD(needed, pfd)) {
                    return;
                } else {
                    status = "cancel";
                }
                break;

            default:
                VpnStatus.logWarning("Unknown needok command: " + needed);
                status = "ignore";
                break;
        }

        String cmd = String.format("needok '%s' %s\n", needed, status);
        managementCommand(cmd);
    }

    private boolean sendTunFD(String needed, ParcelFileDescriptor pfd) {
        try {
            // Get the file descriptor integer
            Method getInt = FileDescriptor.class.getDeclaredMethod("getInt$");
            int fdInt = pfd.detachFd();

            // Create new FileDescriptor with the integer
            FileDescriptor fd = new FileDescriptor();
            Method setInt = FileDescriptor.class.getDeclaredMethod("setInt$", int.class);
            setInt.invoke(fd, fdInt);

            // Send the file descriptor
            FileDescriptor[] fds = {fd};
            mSocket.setFileDescriptorsForSend(fds);

            // Send the management command
            managementCommand(String.format("needok '%s' %s\n", needed, "ok"));

            // Reset file descriptors
            mSocket.setFileDescriptorsForSend(null);
            return true;
        } catch (Exception e) {
            VpnStatus.logException("Error sending tun FD", e);
            return false;
        } finally {
            try {
                pfd.close();
            } catch (Exception e) {
                // Ignore
            }
        }
    }

    private void processPWCommand(String argument) {
        if (argument.startsWith("Verification Failed")) {
            VpnStatus.updateStateString("AUTH_FAILED", argument,
                    R.string.state_auth_failed, ConnectionStatus.LEVEL_AUTH_FAILED);
            return;
        }

        int p1 = argument.indexOf('\'');
        int p2 = argument.indexOf('\'', p1 + 1);
        if (p1 == -1 || p2 == -1) {
            VpnStatus.logError("Invalid PASSWORD command: " + argument);
            return;
        }

        String needed = argument.substring(p1 + 1, p2);
        String pw = null;
        String username = null;

        switch (needed) {
            case "Private Key":
                pw = mProfile.getPasswordPrivateKey();
                break;
            case "Auth":
                pw = mProfile.getPasswordAuth();
                username = mProfile.mUsername;
                break;
        }

        if (pw == null) {
            VpnStatus.logError("No password available for: " + needed);
            return;
        }

        if (username != null) {
            managementCommand(String.format("username '%s' %s\n",
                    needed, VpnProfile.openVpnEscape(username)));
        }

        managementCommand(String.format("password '%s' %s\n",
                needed, VpnProfile.openVpnEscape(pw)));
    }

    @Override
    public void networkChange(boolean sameNetwork) {
        if (mWaitingForRelease) {
            releaseHold();
        } else {
            managementCommand(sameNetwork ?
                    "network-change samenetwork\n" : "network-change\n");
        }
    }

    @Override
    public void setPauseCallback(PausedStateCallback callback) {
        mPauseCallback = callback;
    }

    @Override
    public void sendCRResponse(String response) {
        managementCommand("cr-response " + response + "\n");
    }

    public void signalusr1() {
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);
        if (!mWaitingForRelease) {
            managementCommand("signal SIGUSR1\n");
        } else {
            VpnStatus.updateStatePause(lastPauseReason);
        }
    }

    public void reconnect() {
        signalusr1();
        releaseHold();
    }

    @Override
    public void pause(pauseReason reason) {
        lastPauseReason = reason;
        signalusr1();
    }

    @Override
    public void resume() {
        releaseHold();
        lastPauseReason = pauseReason.noNetwork;
    }

    @Override
    public boolean stopVPN(boolean replaceConnection) {
        managementCommand("signal SIGTERM\n");
        mShuttingDown = true;

        try {
            if (mSocket != null) {
                mSocket.close();
            }
        } catch (IOException e) {
            // Ignore
        }

        return true;
    }
}