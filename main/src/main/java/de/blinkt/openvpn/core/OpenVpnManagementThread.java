
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
import java.nio.charset.StandardCharsets;

import de.blinkt.openvpn.core.OpenVPNManagement;
import de.blinkt.openvpn.core.OpenVPNService;
import de.blinkt.openvpn.core.PqcVpnLog;
import de.blinkt.openvpn.core.VpnProfile;
import de.blinkt.openvpn.core.VpnStatus;
import android.net.VpnService; // <-- Add this import
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OpenVpnManagementThread implements Runnable, OpenVPNManagement {

    private VpnService.Builder mBuilder;
    private ArrayList<String> mDnslist = new ArrayList<>();
    private ArrayList<CIDRIP> mRoutes = new ArrayList<>();
    private ArrayList<CIDRIP> mRoutesv6 = new ArrayList<>();

    private boolean mGotIfconfig = false;

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

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService, String socketPath, ParcelFileDescriptor tunFd, VpnService.Builder builder) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mSocketPath = socketPath;
        // Note: We no longer store tunFd as a member variable, as it's created later.
        mBuilder = builder; // Store the passed-in builder

        // --- BEGIN DEFINITIVE FIX ---
        // This line was missing. It initializes the final Handler variable.
        mResumeHandler = new Handler(openVpnService.getMainLooper());
        // --- END DEFINITIVE FIX ---

        PqcVpnLog.i("Management Thread instantiated.");
    }
    private boolean shouldBeRunning() {
        if (mPauseCallback == null) {
            PqcVpnLog.d("shouldBeRunning: mPauseCallback is null, returning true.");
            return true;
        }
        boolean shouldRun = mPauseCallback.shouldBeRunning();
        PqcVpnLog.d("shouldBeRunning: mPauseCallback returned " + shouldRun);
        return shouldRun;
    }

    public boolean openManagementInterface(@NonNull Context c) {
        PqcVpnLog.i("Attempting to connect to management socket: " + mSocketPath);
        int tries = 0;
        while (tries < 5) {
            tries++;
            PqcVpnLog.d("Connection attempt #" + tries);
            try {
                mSocket = new LocalSocket();
                mSocket.connect(new LocalSocketAddress(mSocketPath, LocalSocketAddress.Namespace.FILESYSTEM));
                PqcVpnLog.i("Successfully connected to management socket on try " + tries);
                return true;
            } catch (Exception e) {
                PqcVpnLog.w("Failed to connect on try " + tries + ": " + e.getMessage());
                if (tries < 5) {
                    try {
                        Thread.sleep(300);
                    } catch (InterruptedException ignored) {}
                }
            }
        }
        PqcVpnLog.e("Gave up connecting to management socket after all retries.", null);
        return false;
    }

    @Override
    public void run() {
        PqcVpnLog.i("Management Thread run() started.");

        if (!openManagementInterface(mOpenVPNService)) {
            PqcVpnLog.e("Management interface connect failed. Thread exiting.", null);
            if (mOpenVPNService != null) {
                mOpenVPNService.stopVpn();
            }
            return;
        }

        byte[] buffer = new byte[2048];
        String pendingInput = "";
        try (InputStream instream = mSocket.getInputStream()) {
            // --- BEGIN DEFINITIVE FIX ---
            // Send ONLY the initial commands. DO NOT send "hold release" here.
            // We must wait for the native process to tell us it's ready.
            managementCommand("version 3\n");
            managementCommand("log on\n");
            managementCommand("echo on\n");
            managementCommand("state on\n");
            managementCommand("bytecount " + mBytecountInterval + "\n");
            // REMOVED: managementCommand("hold release\n");
            // --- END DEFINITIVE FIX ---

            PqcVpnLog.i("Entering main read loop, waiting for native process messages.");
            while (!Thread.interrupted() && !mShuttingDown) {
                int numBytesRead = instream.read(buffer);
                if (numBytesRead == -1) {
                    PqcVpnLog.w("Management socket stream ended (read returned -1).");
                    break;
                }
                String input = new String(buffer, 0, numBytesRead, StandardCharsets.UTF_8);
                pendingInput += input;
                pendingInput = processInput(pendingInput);
            }
        } catch (IOException e) {
            if (!mShuttingDown) {
                PqcVpnLog.e("IOException in main read loop.", e);
                VpnStatus.logException("Management socket error", e);
            }
        } finally {
            // ... (finally block is correct) ...
        }
        PqcVpnLog.i("Management Thread run() is exiting.");
    }

    private String processInput(String pendingInput) {
        PqcVpnLog.d("Processing input buffer: \"" + pendingInput.replace("\n", "\\n") + "\"");
        while (pendingInput.contains("\n")) {
            String[] tokens = pendingInput.split("\\r?\\n", 2);
            processCommand(tokens[0]);
            pendingInput = tokens.length > 1 ? tokens[1] : "";
        }
        return pendingInput;
    }

    // REPLACE your existing processNeedCommand method with this one.

    private void processNeedCommand(String argument) {
        int p1 = argument.indexOf('\'');
        int p2 = argument.indexOf('\'', p1 + 1);
        if (p1 == -1 || p2 == -1) {
            PqcVpnLog.w("Received malformed >NEED-OK command: " + argument);
            return;
        }

        String needed = argument.substring(p1 + 1, p2);
        String fullArgs = argument.substring(p2 + 2).trim();

        PqcVpnLog.i("Received >NEED-OK for '" + needed + "' with full args: '" + fullArgs + "'");

        switch (needed) {
            case "IFCONFIG":
                // --- BEGIN DEFINITIVE FIX: Robust parsing for IFCONFIG ---
                String[] ifconfigArgs = fullArgs.split(" ");
                if (ifconfigArgs.length >= 2) {
                    String ip = ifconfigArgs[0];
                    String netmask = ifconfigArgs[1];
                    mBuilder.setSession(mProfile.getName());
                    int prefix = CIDRIP.calculateLenFromMask(netmask);
                    mBuilder.addAddress(ip, prefix);
                    managementCommand("needok '" + needed + "' ok\n");
                } else {
                    PqcVpnLog.e("Malformed IFCONFIG arguments: " + fullArgs, null);
                    managementCommand("needok '" + needed + "' cancel\n");
                }
                // --- END DEFINITIVE FIX ---
                break;

            case "ROUTE":
                // --- BEGIN DEFINITIVE FIX: Robust parsing for ROUTE ---
                String[] routeArgs = fullArgs.split(" ");
                if (routeArgs.length >= 2) {
                    mRoutes.add(new CIDRIP(routeArgs[0], routeArgs[1]));
                    managementCommand("needok '" + needed + "' ok\n");
                } else {
                    PqcVpnLog.e("Malformed ROUTE arguments: " + fullArgs, null);
                    managementCommand("needok '" + needed + "' cancel\n");
                }
                // --- END DEFINITIVE FIX ---
                break;

            case "ROUTE6":
                // --- BEGIN DEFINITIVE FIX: Robust parsing for ROUTE6 ---
                Pattern route6Pattern = Pattern.compile("([0-9a-fA-F:]+/[0-9]+)");
                Matcher route6Matcher = route6Pattern.matcher(fullArgs);
                if (route6Matcher.find()) {
                    mRoutesv6.add(CIDRIP.parse(route6Matcher.group(1)));
                    managementCommand("needok '" + needed + "' ok\n");
                } else {
                    PqcVpnLog.e("Could not parse IPv6 route from: " + fullArgs, null);
                    managementCommand("needok '" + needed + "' cancel\n");
                }
                // --- END DEFINITIVE FIX ---
                break;

            case "DNSSERVER":
                // --- BEGIN DEFINITIVE FIX: Robust parsing for DNSSERVER ---
                Pattern dnsPattern = Pattern.compile("([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3})");
                Matcher dnsMatcher = dnsPattern.matcher(fullArgs);
                if (dnsMatcher.find()) {
                    mDnslist.add(dnsMatcher.group(1));
                    managementCommand("needok '" + needed + "' ok\n");
                } else {
                    PqcVpnLog.e("Could not parse DNS server IP from: " + fullArgs, null);
                    managementCommand("needok '" + needed + "' cancel\n");
                }
                // --- END DEFINITIVE FIX ---
                break;

            case "OPENTUN":
                PqcVpnLog.i("OPENTUN request received. Establishing VpnService with dynamic config.");
                if (mBuilder == null) {
                    VpnStatus.logError("OPENTUN requested but builder is null (no IFCONFIG received).");
                    managementCommand("needok '" + needed + "' cancel\n");
                    return;
                }

                try {
                    for (String dns : mDnslist) mBuilder.addDnsServer(dns);
                    for (CIDRIP route : mRoutes) mBuilder.addRoute(route.mIp, route.len);
                    for (CIDRIP route : mRoutesv6) mBuilder.addRoute(route.mIp, route.len);

                    if (mRoutes.isEmpty() && mRoutesv6.isEmpty()) {
                        mBuilder.addRoute("0.0.0.0", 0);
                    }

                    mBuilder.addDisallowedApplication(mOpenVPNService.getPackageName());
                    PqcVpnLog.i("VpnService.Builder fully configured. Calling establish().");

                    ParcelFileDescriptor tunFd = mBuilder.establish();
                    if (tunFd == null) throw new IllegalStateException("VpnService.establish() returned null.");

                    PqcVpnLog.i("VpnService established, FD=" + tunFd.getFd());
                    mSocket.setFileDescriptorsForSend(new FileDescriptor[]{tunFd.getFileDescriptor()});
                    managementCommand("needok 'OPENTUN' ok\n");
                    mSocket.setFileDescriptorsForSend(null);
                    tunFd.close();
                    PqcVpnLog.i("Successfully sent configured TUN FD to native process.");

                } catch (Exception e) {
                    PqcVpnLog.e("FATAL: Failed to establish VpnService or send FD", e);
                    managementCommand("needok 'OPENTUN' cancel\n");
                }
                break;

            case "PERSIST_TUN_ACTION":
                managementCommand("needok 'PERSIST_TUN_ACTION' OPEN_BEFORE_CLOSE\n");
                break;

            case "PROTECTFD":
                PqcVpnLog.i("Acknowledging PROTECTFD request. Socket protection is not yet implemented.");
                managementCommand("needok 'PROTECTFD' ok\n");
                break;

            default:
                PqcVpnLog.w("Acknowledging unhandled >NEED-OK request for: " + needed);
                managementCommand("needok '" + needed + "' ok\n");
                break;
        }
    }


    private void processCommand(String command) {
        if (command.startsWith(">")) {
            String[] parts = command.split(":", 2);
            String cmd = parts[0].substring(1);
            String argument = parts.length > 1 ? parts[1] : "";

            switch (cmd) {
                case "INFO": case "ECHO": break;
                case "STATE": processState(argument); break;
                case "NEED-OK": processNeedCommand(argument); break;
                case "HOLD":
                    managementCommand("hold release\n");
                    break;
                case "BYTECOUNT": break;
                case "FATAL": case "ERROR":
                    VpnStatus.logError("Native process reported a fatal error: " + argument);
                    break;
                default:
                    PqcVpnLog.w("Received unrecognized management command: " + command);
                    break;
            }
        }
    }



    private void processState(String argument) {
        PqcVpnLog.i("Received STATE: " + argument);
        String[] args = argument.split(",", 3);
        VpnStatus.updateStateString(args[1], (args.length > 2) ? args[2] : "");
    }


    private boolean managementCommand(String cmd) {
        if (mSocket == null || !mSocket.isConnected()) {
            PqcVpnLog.w("Cannot send command, management socket is not connected.");
            return false;
        }
        try {
            PqcVpnLog.d("Sending command to native process: " + cmd.trim());
            OutputStream out = mSocket.getOutputStream();
            out.write((cmd).getBytes(StandardCharsets.UTF_8));
            out.flush();
            return true;
        } catch (IOException e) {
            PqcVpnLog.e("IOException writing to management socket", e);
            return false;
        }
    }

    private void releaseHoldCmd() {
        PqcVpnLog.i("releaseHoldCmd() called.");
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);
        mWaitingForRelease = false;
        mLastHoldRelease = System.currentTimeMillis();
        managementCommand("hold release\n");
    }

    @Override public void reconnect() { PqcVpnLog.i("reconnect() called on management interface."); signalusr1(); resume(); }
    @Override public void pause(pauseReason reason) { PqcVpnLog.i("pause() called on management interface with reason: " + reason); if (!mWaitingForRelease) signalusr1(); }
    @Override public void resume() { PqcVpnLog.i("resume() called on management interface."); if (mWaitingForRelease) releaseHoldCmd(); }
    @Override public boolean stopVPN(boolean replaceConnection) { PqcVpnLog.i("stopVPN() called on management interface."); mShuttingDown = true; managementCommand("signal SIGTERM\n"); return true; }
    @Override public void networkChange(boolean sameNetwork) { PqcVpnLog.i("networkChange() called on management interface."); if (mWaitingForRelease) resume(); else managementCommand("network-change\n"); }
    @Override public void setPauseCallback(PausedStateCallback callback) { mPauseCallback = callback; }
    @Override public void sendCRResponse(String response) { managementCommand("cr-response " + response + "\n"); }
    @Override public void signalusr1() { PqcVpnLog.i("signalusr1() called on management interface."); mResumeHandler.removeCallbacks(mResumeHoldRunnable); if (!mWaitingForRelease) managementCommand("signal SIGUSR1\n"); }
}