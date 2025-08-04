
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

    private int mPushedMtu = 1500; // Default to a standard MTU
    private String mPushedIp = null;
    private String mPushedMask = null;
    private boolean mRedirectGateway = false;
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
    private void parsePushReply(String logLine) {
        PqcVpnLog.i("Parsing PUSH_REPLY from log line.");
        int p1 = logLine.indexOf('\'');
        int p2 = logLine.lastIndexOf('\'');
        if (p1 == -1 || p2 == -1 || p1 == p2) return;

        String pushData = logLine.substring(p1 + 1, p2);
        if (!pushData.startsWith("PUSH_REPLY")) return;

        // Split off the "PUSH_REPLY" part and then split the options
        String[] options = pushData.split(",", 2)[1].split(",");

        for (String option : options) {
            String[] parts = option.trim().split(" ", 2);
            String key = parts[0];
            String value = (parts.length > 1) ? parts[1] : "";

            PqcVpnLog.d("PUSH PARSER: Found option '" + key + "' with value '" + value + "'");

            switch (key) {
                case "redirect-gateway":
                    mRedirectGateway = true;
                    PqcVpnLog.i("PUSH PARSER: Set mRedirectGateway=true");
                    break;
                case "ifconfig":
                    String[] ifconfigArgs = value.split(" ");
                    if (ifconfigArgs.length >= 2) {
                        mPushedIp = ifconfigArgs[0];
                        mPushedMask = ifconfigArgs[1];
                        PqcVpnLog.i("PUSH PARSER: Stored IP=" + mPushedIp + ", Mask=" + mPushedMask);
                    }
                    break;
                case "route":
                    String[] routeArgs = value.split(" ");
                    if (routeArgs.length >= 2) {
                        if ("0.0.0.0".equals(routeArgs[0])) {
                            PqcVpnLog.d("PUSH PARSER: Ignoring redundant default route (handled by redirect-gateway).");
                            continue; // Skip to the next option
                        }
                        mRoutes.add(new CIDRIP(routeArgs[0], routeArgs[1]));
                        PqcVpnLog.i("PUSH PARSER: Stored specific route " + routeArgs[0] + "/" + routeArgs[1]);
                    }
                    break;
                case "dhcp-option":
                    String[] dhcpArgs = value.split(" ");
                    if (dhcpArgs.length >= 2 && "DNS".equals(dhcpArgs[0])) {
                        if (!mDnslist.contains(dhcpArgs[1])) {
                            mDnslist.add(dhcpArgs[1]);
                            PqcVpnLog.i("PUSH PARSER: Stored DNS " + dhcpArgs[1]);
                        }
                    }
                    break;
                case "tun-mtu":
                    try {
                        mPushedMtu = Integer.parseInt(value);
                        PqcVpnLog.i("PUSH PARSER: Stored MTU=" + mPushedMtu);
                    } catch (NumberFormatException e) {
                        PqcVpnLog.w("PUSH PARSER: Could not parse MTU value: " + value);
                    }
                    break;
            }
        }
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
        if (p1 == -1 || p2 == -1) return;

        String needed = argument.substring(p1 + 1, p2);
        String fullArgs = argument.substring(p2 + 2).trim();
        PqcVpnLog.d("[DEBUG_MGMT] >>>> Received NEED-OK <<<<");
        PqcVpnLog.d("[DEBUG_MGMT] Command: '" + needed + "'");
        PqcVpnLog.d("[DEBUG_MGMT] Full Args: '" + fullArgs + "'");
        PqcVpnLog.d("[DEBUG_MGMT] Current redirectGateway flag state: " + mRedirectGateway);

        String[] argv = fullArgs.split(" ");
        String value = argv[argv.length - 1];

        switch (needed) {
            case "IFCONFIG":
                PqcVpnLog.d("[DEBUG_MGMT] IFCONFIG case entered.");
                String[] ifconfigArgs = fullArgs.split(" ");
                if (ifconfigArgs.length >= 2) {
                    mBuilder.setSession(mProfile.getName());
                    int prefix = CIDRIP.calculateLenFromMask(ifconfigArgs[1]);
                    mBuilder.addAddress(ifconfigArgs[0], prefix);
                    PqcVpnLog.d("[DEBUG_MGMT] IFCONFIG: Added address " + ifconfigArgs[0] + "/" + prefix);
                } else {
                    PqcVpnLog.e("[DEBUG_MGMT] IFCONFIG: Malformed arguments.", null);
                }
                managementCommand("needok '" + needed + "' ok\n");
                break;

            case "ROUTE":
                PqcVpnLog.d("[DEBUG_MGMT] ROUTE case entered.");
                String[] routeArgs = fullArgs.split(" ");
                if (routeArgs.length >= 2) {
                    mRoutes.add(new CIDRIP(routeArgs[0], routeArgs[1]));
                    PqcVpnLog.d("[DEBUG_MGMT] ROUTE: Stored route " + routeArgs[0] + "/" + routeArgs[1]);
                } else {
                    PqcVpnLog.e("[DEBUG_MGMT] ROUTE: Malformed arguments.", null);
                }
                managementCommand("needok '" + needed + "' ok\n");
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
                PqcVpnLog.d("[DEBUG_MGMT] Acknowledging DNSSERVER NEED-OK (already processed by PUSH parser).");
                managementCommand("needok '" + needed + "' ok\n");
                break;

            case "OPENTUN":
                PqcVpnLog.d("[DEBUG_MGMT] OPENTUN case entered.");
                try {
                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Configuring final VpnService parameters.");

                    mBuilder.setMtu(mPushedMtu);
                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Set MTU to " + mPushedMtu);
                    // --- BEGIN DEFINITIVE FIX ---
                    // Use the IP address and netmask we parsed from the PUSH_REPLY log.
                    if (mPushedIp != null && mPushedMask != null) {
                        int prefix = CIDRIP.calculateLenFromMask(mPushedMask);
                        mBuilder.addAddress(mPushedIp, prefix);
                        PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Added address from PUSH_REPLY: " + mPushedIp + "/" + prefix);
                    } else {
                        // This is a fatal error. The VPN cannot work without an IP.
                        PqcVpnLog.e("[DEBUG_MGMT] OPENTUN: FATAL - No pushed IP address was parsed before OPENTUN was called.", null);
                        managementCommand("needok 'OPENTUN' cancel\n");
                        return; // Stop processing
                    }
                    // --- END DEFINITIVE FIX ---

                    for (String dns : mDnslist) {
                        PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Adding DNS: " + dns);
                        mBuilder.addDnsServer(dns);
                    }
                    for (CIDRIP route : mRoutes) {
                        PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Adding specific route: " + route.mIp + "/" + route.len);
                        mBuilder.addRoute(route.mIp, route.len);
                    }

                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Checking redirectGateway flag. Current state: " + mRedirectGateway);
                    if (mRedirectGateway) {
                        PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: redirectGateway is TRUE. Adding default routes 0.0.0.0/0 and ::/0.");
                        mBuilder.addRoute("0.0.0.0", 0);
                        mBuilder.addRoute("::", 0);
                    } else {
                        PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: redirectGateway is FALSE. NOT adding default routes.");
                    }

                    mBuilder.addDisallowedApplication(mOpenVPNService.getPackageName());
                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Calling establish().");

                    ParcelFileDescriptor tunFd = mBuilder.establish();
                    if (tunFd == null) throw new IllegalStateException("VpnService.establish() returned null.");

                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: VpnService established successfully. FD=" + tunFd.getFd());
                    mSocket.setFileDescriptorsForSend(new FileDescriptor[]{tunFd.getFileDescriptor()});
                    managementCommand("needok 'OPENTUN' ok\n");
                    mSocket.setFileDescriptorsForSend(null);
                    tunFd.close();
                    PqcVpnLog.d("[DEBUG_MGMT] OPENTUN: Successfully sent TUN FD.");

                } catch (Exception e) {
                    PqcVpnLog.e("[DEBUG_MGMT] OPENTUN: FATAL Exception.", e);
                    managementCommand("needok 'OPENTUN' cancel\n");
                }
                break;

            case "PERSIST_TUN_ACTION":
                managementCommand("needok 'PERSIST_TUN_ACTION' OPEN_BEFORE_CLOSE\n");
                break;

            case "PROTECTFD":
                try {
                    FileDescriptor[] fds = mSocket.getAncillaryFileDescriptors();
                    if (fds != null && fds.length > 0) {

                        // --- BEGIN DEFINITIVE FIX ---
                        // The FileDescriptor object does not have a public getInt$() method.
                        // The official and required way to get the raw integer FD for the
                        // VpnService.protect() call is by using reflection.
                        java.lang.reflect.Field descriptorField = FileDescriptor.class.getDeclaredField("descriptor");
                        descriptorField.setAccessible(true);
                        int fdToProtect = descriptorField.getInt(fds[0]);
                        // --- END DEFINITIVE FIX ---

                        PqcVpnLog.i("Received PROTECTFD request for fd=" + fdToProtect);

                        if (mOpenVPNService.protect(fdToProtect)) {
                            PqcVpnLog.i("Successfully protected socket for fd=" + fdToProtect);
                            managementCommand("needok '" + needed + "' ok\n");
                        } else {
                            PqcVpnLog.e("Failed to protect socket for fd=" + fdToProtect, null);
                            managementCommand("needok '" + needed + "' cancel\n");
                        }
                    } else {
                        PqcVpnLog.e("Received PROTECTFD request but no file descriptor was attached.", null);
                        managementCommand("needok '" + needed + "' cancel\n");
                    }
                } catch (Exception e) { // Catch generic Exception for reflection errors
                    PqcVpnLog.e("Error getting/protecting ancillary file descriptor for PROTECTFD", e);
                    managementCommand("needok '" + needed + "' cancel\n");
                }
                break;
            default:
                PqcVpnLog.w("Acknowledging unhandled >NEED-OK request for: " + needed);
                managementCommand("needok '" + needed + "' ok\n");
                break;
        }
    }


    private void processCommand(String command) {
        if (! command.startsWith(">")) return;
        String[] parts = command.split(":", 2);
        String cmd = parts[0].substring(1);
        String argument = parts.length > 1 ? parts[1] : "";

        switch (cmd) {
            case "INFO":
            case "ECHO":
                // ignore
                break;

            case "STATE":
                processState(argument);
                break;

            //
            // <— NEW: catch any ROUTE pushes from the server —
            //
            case "REDIRECT_GATEWAY":
                mRedirectGateway = true;
                PqcVpnLog.i("REDIRECT_GATEWAY flag set to TRUE based on server push.");
                // No response is needed for this command.
                break;
            case "LOG":
                if (argument.contains("PUSH: Received control message:")) {
                    parsePushReply(argument);
                }
                // We no longer need to log every native message to VpnStatus here,
                // as the OpenVPNProcessThread already logs them to Logcat.
                break;
            case "ROUTE": {
                // argument format: dest,netmask,gateway,flags,metric
                String[] f = argument.split(",");
                if (f.length >= 2) {
                    String dest    = f[0].trim();
                    String netmask = f[1].trim();
                    mRoutes.add(new CIDRIP(dest, netmask));
                    PqcVpnLog.d(TAG + "PUSHED ROUTE: " + dest + " / " + netmask);
                }
                break;
            }
            case "ROUTE6": {
                // argument format: cidr,gw,flags,metric
                String cidr = argument.split(",", 2)[0].trim();
                mRoutesv6.add(CIDRIP.parse(cidr));
                PqcVpnLog.d(TAG + "PUSHED ROUTE6: " + cidr);
                break;
            }
            //
            // ————————————————————————————————————————————
            //

            case "NEED-OK":
                processNeedCommand(argument);
                break;

            case "HOLD":
                managementCommand("hold release\n");
                break;

            case "BYTECOUNT":
                // ignore
                break;

            case "FATAL":
            case "ERROR":
                VpnStatus.logError("Native process reported a fatal error: " + argument);
                break;

            default:
                PqcVpnLog.w(TAG + "Unhandled cmd: " + cmd + " → " + argument);
                break;
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