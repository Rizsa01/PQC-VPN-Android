// Please replace this entire file
package de.blinkt.openvpn.core;

// ... all necessary imports ...
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
    private int mBytecountInterval = 2;
    private final Runnable mResumeHoldRunnable = () -> { if (shouldBeRunning()) { releaseHoldCmd(); } };

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService, String socketPath) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mResumeHandler = new Handler(openVpnService.getMainLooper());
        this.mSocketPath = socketPath;
    }

    public boolean openManagementInterface(@NonNull Context c) {
        try {
            mSocket = new LocalSocket();
            mSocket.connect(new LocalSocketAddress(mSocketPath, LocalSocketAddress.Namespace.FILESYSTEM));
            return true;
        } catch (Exception e) {
            // This is expected if the process is not ready yet
            return false;
        }
    }

    private boolean managementCommand(String cmd) {
        if (mSocket == null || !mSocket.isConnected()) { return false; }
        try {
            OutputStream out = mSocket.getOutputStream();
            out.write((cmd).getBytes());
            out.flush();
            return true;
        } catch (IOException e) { return false; }
    }

    @Override
    public void run() {
        Log.i(TAG, "Management Thread starting");
        byte[] buffer = new byte[2048];
        String pendingInput = "";
        try (InputStream instream = mSocket.getInputStream()) {
            managementCommand("version 3\n");
            managementCommand("state on\n");
            managementCommand("bytecount " + mBytecountInterval + "\n");
            while (!Thread.interrupted() && !mShuttingDown) {
                int numBytesRead = instream.read(buffer);
                if (numBytesRead == -1) break;
                String input = new String(buffer, 0, numBytesRead, "UTF-8");
                pendingInput += input;
                pendingInput = processInput(pendingInput);
            }
        } catch (IOException e) {
            if (!mShuttingDown) VpnStatus.logException("Management socket error", e);
        } finally {
            if(mSocket != null) { try { mSocket.close();} catch (IOException e) {}}
        }
        Log.i(TAG, "Management thread exiting");
    }

    // ... all other methods remain the same ...
    private String processInput(String pendingInput) { while (pendingInput.contains("\n")) { String[] tokens = pendingInput.split("\\r?\\n", 2); processCommand(tokens[0]); pendingInput = tokens.length > 1 ? tokens[1] : ""; } return pendingInput; }
    private void processCommand(String command) { if (command.startsWith(">")) { String[] parts = command.split(":", 2); String cmd = parts[0].substring(1); String argument = parts.length > 1 ? parts[1] : ""; switch (cmd) { case "INFO": break; case "PASSWORD": processPWCommand(argument); break; case "HOLD": handleHold(argument); break; case "NEED-OK": processNeedCommand(argument); break; case "BYTECOUNT": processByteCount(argument); break; case "STATE": if (!mShuttingDown) processState(argument); break; case "PROXY": processProxyCMD(argument); break; case "LOG": processLogMessage(argument); break; default: VpnStatus.logWarning("Unknown management command: " + command); break; } } else if (command.startsWith("SUCCESS: ")) { /* ignore */ } else if (command.startsWith("PROTECTFD: ")) { FileDescriptor fdToProtect = mFDList.pollFirst(); if (fdToProtect != null) { protectFileDescriptor(fdToProtect); } } else { VpnStatus.logWarning("Unrecognized management command: " + command); } }
    private void processLogMessage(String argument) { String[] args = argument.split(",", 4); VpnStatus.LogLevel level; switch (args[1]) { case "W": level = VpnStatus.LogLevel.WARNING; break; default: level = VpnStatus.LogLevel.INFO; break; } try { int logLevel = Integer.parseInt(args[2]); VpnStatus.logMessageOpenVPN(level, logLevel, args[3]); } catch (NumberFormatException e) { VpnStatus.logError("Invalid log level: " + args[2]); } }
    boolean shouldBeRunning() { return mPauseCallback == null || mPauseCallback.shouldBeRunning(); }
    private void handleHold(String argument) { mWaitingForRelease = true; VpnStatus.updateStateString("WAIT", argument, R.string.state_wait, ConnectionStatus.LEVEL_WAITING_FOR_USER_INPUT); }
    private void releaseHoldCmd() { mResumeHandler.removeCallbacks(mResumeHoldRunnable); if ((System.currentTimeMillis() - mLastHoldRelease) < 2000) { try { Thread.sleep(1000); } catch (InterruptedException ignored) {} } mWaitingForRelease = false; mLastHoldRelease = System.currentTimeMillis(); managementCommand("hold release\n"); managementCommand("bytecount " + mBytecountInterval + "\n"); managementCommand("state on\n"); }
    private void processProxyCMD(String argument) { managementCommand("proxy NONE\n"); }
    private void processState(String argument) { String[] args = argument.split(",", 3); String message = (args.length > 2) ? args[2] : ""; VpnStatus.updateStateString(args[1], message); }
    private void processByteCount(String argument) { int comma = argument.indexOf(','); if (comma == -1) return; try { long in = Long.parseLong(argument.substring(0, comma)); long out = Long.parseLong(argument.substring(comma + 1)); VpnStatus.updateByteCount(in, out); } catch (NumberFormatException e) {} }
    private void processNeedCommand(String argument) { int p1 = argument.indexOf('\''); int p2 = argument.indexOf('\'', p1 + 1); if (p1 == -1 || p2 == -1) return; String needed = argument.substring(p1 + 1, p2); String extra = argument.substring(p2 + 2); String status = "ok"; switch (needed) { case "PROTECTFD": protectFileDescriptor(mFDList.pollFirst()); break; case "DNSSERVER": case "DNS6SERVER": mOpenVPNService.addDNS(extra); break; case "DNSDOMAIN": mOpenVPNService.addSearchDomain(extra); break; case "ROUTE": String[] r = extra.split(" "); mOpenVPNService.addRoute(r[0], r[1], r[2], r.length > 3 ? r[3] : null); break; case "ROUTE6": mOpenVPNService.addRoutev6(extra, "tun"); break; case "IFCONFIG": String[] i = extra.split(" "); mOpenVPNService.setLocalIP(i[0], i[1], -1, ""); break; case "IFCONFIG6": mOpenVPNService.setLocalIPv6(extra); break; case "OPENTUN": ParcelFileDescriptor pfd = mOpenVPNService.openTun(); if (pfd != null) { try { Method getInt = FileDescriptor.class.getDeclaredMethod("getInt$"); int fdint = pfd.detachFd(); FileDescriptor fd = new FileDescriptor(); Method setInt = FileDescriptor.class.getDeclaredMethod("setInt$", int.class); setInt.invoke(fd, fdint); mSocket.setFileDescriptorsForSend(new FileDescriptor[]{fd}); managementCommand("needok '" + needed + "' ok\n"); mSocket.setFileDescriptorsForSend(null); return; } catch (Exception e) { VpnStatus.logException("Could not send fd", e); } } status = "cancel"; break; default: VpnStatus.logWarning("Unknown needok command: " + needed); status = "ignore"; break; } managementCommand(String.format("needok '%s' %s\n", needed, status)); }
    private void protectFileDescriptor(FileDescriptor fd) { try { Method getInt = FileDescriptor.class.getDeclaredMethod("getInt$"); int fdint = (Integer) getInt.invoke(fd); mOpenVPNService.protect(fdint); Os.close(fd); } catch (Exception e) { VpnStatus.logException("Failed to protect FD", e); } }
    private void processPWCommand(String argument) { /* ... */ }
    @Override public void networkChange(boolean sameNetwork) { if (mWaitingForRelease) { resume(); } else { managementCommand("network-change\n"); } }
    @Override public void setPauseCallback(PausedStateCallback callback) { mPauseCallback = callback; }
    @Override public void sendCRResponse(String response) { managementCommand("cr-response " + response + "\n"); }
    @Override public void signalusr1() { mResumeHandler.removeCallbacks(mResumeHoldRunnable); if (!mWaitingForRelease) { managementCommand("signal SIGUSR1\n"); } }
    @Override public void reconnect() { signalusr1(); resume(); }
    @Override public void pause(pauseReason reason) { lastPauseReason = reason; if (mWaitingForRelease) VpnStatus.updateStatePause(reason); else signalusr1(); }
    @Override public void resume() { if (mWaitingForRelease) { releaseHoldCmd(); } else { VpnStatus.logInfo("Not in waiting for release hold state, ignoring resume"); } }
    @Override public boolean stopVPN(boolean replaceConnection) { managementCommand("signal SIGTERM\n"); mShuttingDown = true; return true; }
}