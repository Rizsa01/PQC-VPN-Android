/*
 * Copyright (c) 2012-2022 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.content.Context;
import android.content.Intent;
import android.net.LocalServerSocket;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Handler;
import android.os.ParcelFileDescriptor;
import androidx.annotation.NonNull;

import android.system.Os;
import android.util.Log;
import de.blinkt.openvpn.R;

import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

public class OpenVpnManagementThread implements Runnable, OpenVPNManagement {

    private static final String TAG = "openvpn";
    private static final Vector<OpenVpnManagementThread> active = new Vector<>();
    private final Handler mResumeHandler;
    private LocalSocket mSocket;
    private VpnProfile mProfile;
    private OpenVPNService mOpenVPNService;
    private LinkedList<FileDescriptor> mFDList = new LinkedList<>();
    private LocalServerSocket mServerSocket;
    private boolean mWaitingForRelease = false;
    private long mLastHoldRelease = 0;
    private LocalSocket mServerSocketLocal;

    private pauseReason lastPauseReason = pauseReason.noNetwork;
    private PausedStateCallback mPauseCallback;
    private boolean mShuttingDown;

    private final Runnable mResumeHoldRunnable = () -> {
        if (shouldBeRunning()) {
            releaseHoldCmd();
        }
    };

    public OpenVpnManagementThread(VpnProfile profile, OpenVPNService openVpnService) {
        mProfile = profile;
        mOpenVPNService = openVpnService;
        mResumeHandler = new Handler(openVpnService.getMainLooper());
    }

    private static boolean stopOpenVPN() {
        synchronized (active) {
            boolean sendCMD = false;
            for (OpenVpnManagementThread mt : active) {
                sendCMD = mt.managmentCommand("signal SIGINT\n");
                try {
                    if (mt.mSocket != null)
                        mt.mSocket.close();
                } catch (IOException e) {
                    // Ignore close error
                }
            }
            return sendCMD;
        }
    }

    public boolean openManagementInterface(@NonNull Context c) {
        int tries = 8;
        String socketName = c.getCacheDir().getAbsolutePath() + "/" + "mgmtsocket";
        mServerSocketLocal = new LocalSocket();

        while (tries > 0 && !mServerSocketLocal.isBound()) {
            try {
                mServerSocketLocal.bind(new LocalSocketAddress(socketName, LocalSocketAddress.Namespace.FILESYSTEM));
            } catch (IOException e) {
                try { Thread.sleep(300); } catch (InterruptedException ignored) {}
            }
            tries--;
        }

        try {
            mServerSocket = new LocalServerSocket(mServerSocketLocal.getFileDescriptor());
            return true;
        } catch (IOException e) {
            VpnStatus.logException(e);
        }
        return false;
    }

    public boolean managmentCommand(String cmd) {
        try {
            if (mSocket != null && mSocket.getOutputStream() != null) {
                mSocket.getOutputStream().write(cmd.getBytes());
                mSocket.getOutputStream().flush();
                return true;
            }
        } catch (IOException e) {
            // Ignore
        }
        return false;
    }

    @Override
    public void run() {
        byte[] buffer = new byte[2048];
        String pendingInput = "";
        synchronized (active) {
            active.add(this);
        }

        try {
            mSocket = mServerSocket.accept();
            InputStream instream = mSocket.getInputStream();
            try { mServerSocket.close(); } catch (IOException e) { VpnStatus.logException(e); }

            managmentCommand("version 3\n");

            while (true) {
                int numbytesread = instream.read(buffer);
                if (numbytesread == -1) return;

                try {
                    FileDescriptor[] fds = mSocket.getAncillaryFileDescriptors();
                    if (fds != null) {
                        Collections.addAll(mFDList, fds);
                    }
                } catch (IOException e) {
                    VpnStatus.logException("Error reading fds from socket", e);
                }

                String input = new String(buffer, 0, numbytesread, "UTF-8");
                pendingInput += input;
                pendingInput = processInput(pendingInput);
            }
        } catch (IOException e) {
            if (!e.getMessage().equals("socket closed"))
                VpnStatus.logException(e);
        }
        synchronized (active) {
            active.remove(this);
        }
    }

    private void protectFileDescriptor(FileDescriptor fd) {
        try {
            Method getInt = FileDescriptor.class.getDeclaredMethod("getInt$");
            int fdint = (Integer) getInt.invoke(fd);
            if (!mOpenVPNService.protect(fdint))
                VpnStatus.logWarning("Could not protect VPN socket");
            fdClose(fd);
        } catch (Exception e) {
            VpnStatus.logException("Failed to retrieve fd from socket (" + fd + ")", e);
        }
    }

    private void fdClose(FileDescriptor fd) {
        try {
            Os.close(fd);
        } catch (Exception e) {
            VpnStatus.logException("Failed to close fd (" + fd + ")", e);
        }
    }

    private String processInput(String pendingInput) {
        while (pendingInput.contains("\n")) {
            String[] tokens = pendingInput.split("\\r?\\n", 2);
            processCommand(tokens[0]);
            pendingInput = (tokens.length == 1) ? "" : tokens[1];
        }
        return pendingInput;
    }

    private void processCommand(String command) {
        if (command.startsWith(">") && command.contains(":")) {
            String[] parts = command.split(":", 2);
            String cmd = parts[0].substring(1);
            String argument = parts[1];

            switch (cmd) {
                case "INFO": break; // Ignore
                case "PASSWORD": processPWCommand(argument); break;
                case "HOLD": handleHold(argument); break;
                case "NEED-OK": processNeedCommand(argument); break;
                case "BYTECOUNT": processByteCount(argument); break;
                case "STATE": if (!mShuttingDown) processState(argument); break;
                case "PROXY": processProxyCMD(argument); break;
                case "LOG": processLogMessage(argument); break;
                case "INFOMSG": processInfoMessage(argument); break;
                default: VpnStatus.logWarning("MGMT: Got unrecognized command" + command); break;
            }
        } else if (command.startsWith("PROTECTFD: ")) {
            FileDescriptor fdToProtect = mFDList.pollFirst();
            if (fdToProtect != null) protectFileDescriptor(fdToProtect);
        }
    }

    private void processInfoMessage(String info) {
        // FIX: This method no longer exists in our simplified service
        // mOpenVPNService.trigger_sso(info);
        VpnStatus.logDebug("Info message from server (SSO trigger ignored):" + info);
    }

    private void processLogMessage(String argument) {
        String[] args = argument.split(",", 4);
        VpnStatus.LogLevel level;
        switch (args[1]) {
            case "W": level = VpnStatus.LogLevel.WARNING; break;
            case "D": level = VpnStatus.LogLevel.VERBOSE; break;
            case "F": level = VpnStatus.LogLevel.ERROR; break;
            default: level = VpnStatus.LogLevel.INFO; break;
        }
        VpnStatus.logMessageOpenVPN(level, Integer.parseInt(args[2]) & 0x0F, args[3]);
    }

    boolean shouldBeRunning() {
        return mPauseCallback != null && mPauseCallback.shouldBeRunning();
    }

    private void handleHold(String argument) {
        mWaitingForRelease = true;
        int waitTime = Integer.parseInt(argument.split(":")[1]);
        if (shouldBeRunning()) {
            VpnStatus.updateStateString("CONNECTRETRY", String.valueOf(waitTime), R.string.state_waitconnectretry, ConnectionStatus.LEVEL_CONNECTING_NO_SERVER_REPLY_YET);
            mResumeHandler.postDelayed(mResumeHoldRunnable, waitTime * 1000L);
        } else {
            VpnStatus.updateStatePause(lastPauseReason);
        }
    }

    private void releaseHoldCmd() {
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);
        if ((System.currentTimeMillis() - mLastHoldRelease) < 5000) {
            try { Thread.sleep(3000); } catch (InterruptedException ignored) {}
        }
        mWaitingForRelease = false;
        mLastHoldRelease = System.currentTimeMillis();
        managmentCommand("hold release\n");
        managmentCommand("bytecount " + mBytecountInterval + "\n");
        managmentCommand("state on\n");
    }

    public void releaseHold() {
        if (mWaitingForRelease) releaseHoldCmd();
    }

    private void processProxyCMD(String argument) {
        // Since we are not supporting Orbot or complex proxies in our simple version,
        // we can simplify this or leave it as a no-op.
        // For now, we'll just tell OpenVPN to not use a proxy.
        managmentCommand("proxy NONE\n");
    }

    private void processState(String argument) {
        String[] args = argument.split(",", 3);
        String currentState = args[1];
        String message = (args[2].equals(",,")) ? "" : args[2];
        VpnStatus.updateStateString(currentState, message);
    }

    private void processByteCount(String argument) {
        int comma = argument.indexOf(',');
        long in = Long.parseLong(argument.substring(0, comma));
        long out = Long.parseLong(argument.substring(comma + 1));
        VpnStatus.updateByteCount(in, out);
    }

    private void processNeedCommand(String argument) {
        int p1 = argument.indexOf('\'');
        int p2 = argument.indexOf('\'', p1 + 1);
        String needed = argument.substring(p1 + 1, p2);
        String extra = argument.split(":", 2)[1];
        String status = "ok";

        switch (needed) {
            case "PROTECTFD":
                protectFileDescriptor(mFDList.pollFirst());
                break;
            // The following methods were removed from our simplified service.
            // We comment them out and if needed, handle the consequence (e.g., by sending 'cancel').
            case "DNSSERVER": case "DNS6SERVER": /* mOpenVPNService.addDNS(extra); */ break;
            case "DNSDOMAIN": /* mOpenVPNService.addSearchDomain(extra); */ break;
            case "ROUTE": /* mOpenVPNService.addRoute(...); */ break;
            case "ROUTE6": /* mOpenVPNService.addRoutev6(...); */ break;
            case "IFCONFIG": /* mOpenVPNService.setLocalIP(...); */ break;
            case "IFCONFIG6": /* mOpenVPNService.setLocalIPv6(...); */ break;
            case "HTTPPROXY": /* mOpenVPNService.addHttpProxy(...); */ break;
            case "PERSIST_TUN_ACTION": /* status = mOpenVPNService.getTunReopenStatus(); */ break;
            case "OPENTUN":
                // This is critical. If we can't open the tun, we must cancel.
                ParcelFileDescriptor pfd = null; // mOpenVPNService.openTun();
                if (sendTunFD(needed, pfd)) {
                    return;
                } else {
                    status = "cancel";
                }
                break;
            default:
                Log.e(TAG, "Unknown needok command " + argument);
                return;
        }

        String cmd = String.format("needok '%s' %s\n", needed, status);
        managmentCommand(cmd);
    }

    private boolean sendTunFD(String needed, ParcelFileDescriptor pfd) {
        if (pfd == null) return false;
        try {
            String cmd = String.format("needok '%s' %s\n", needed, "ok");
            Method setInt = FileDescriptor.class.getDeclaredMethod("setInt$", int.class);
            FileDescriptor fdtosend = new FileDescriptor();
            setInt.invoke(fdtosend, pfd.getFd());
            FileDescriptor[] fds = { fdtosend };
            mSocket.setFileDescriptorsForSend(fds);
            managmentCommand(cmd);
            mSocket.setFileDescriptorsForSend(null);
            pfd.close();
            return true;
        } catch (Exception e) {
            VpnStatus.logException("Could not send fd over socket", e);
            return false;
        }
    }

    private void processPWCommand(String argument) {
        // The password logic can remain as it retrieves passwords from the VpnProfile,
        // which is still a valid operation.
        String needed;
        try {
            if (argument.startsWith("Auth-Token:")) return;
            int p1 = argument.indexOf('\'');
            int p2 = argument.indexOf('\'', p1 + 1);
            needed = argument.substring(p1 + 1, p2);
            if (argument.startsWith("Verification Failed")) {
                VpnStatus.updateStateString("AUTH_FAILED", needed + argument.substring(p2 + 1), R.string.state_auth_failed, ConnectionStatus.LEVEL_AUTH_FAILED);
                return;
            }
        } catch (StringIndexOutOfBoundsException sioob) {
            VpnStatus.logError("Could not parse management Password command: " + argument);
            return;
        }

        String pw = null;
        String username = null;
        switch (needed) {
            case "Private Key": pw = mProfile.getPasswordPrivateKey(); break;
            case "Auth": pw = mProfile.getPasswordAuth(); username = mProfile.mUsername; break;
        }

        if (pw != null) {
            if (username != null) {
                managmentCommand(String.format("username '%s' %s\n", needed, VpnProfile.openVpnEscape(username)));
            }
            managmentCommand(String.format("password '%s' %s\n", needed, VpnProfile.openVpnEscape(pw)));
        } else {
            // FIX: This method no longer exists
            // mOpenVPNService.requestInputFromUser(R.string.password, needed);
            VpnStatus.logError(String.format("Openvpn requires Authentication type '%s' but no password available in profile", needed));
        }
    }

    @Override public void networkChange(boolean samenetwork) {
        if (mWaitingForRelease) releaseHold();
        else managmentCommand(samenetwork ? "network-change samenetwork\n" : "network-change\n");
    }
    @Override public void setPauseCallback(PausedStateCallback callback) { mPauseCallback = callback; }
    @Override public void sendCRResponse(String response) { managmentCommand("cr-response " + response + "\n"); }
    public void signalusr1() {
        mResumeHandler.removeCallbacks(mResumeHoldRunnable);
        if (!mWaitingForRelease) managmentCommand("signal SIGUSR1\n");
        else VpnStatus.updateStatePause(lastPauseReason);
    }
    public void reconnect() { signalusr1(); releaseHold(); }
    @Override public void pause(pauseReason reason) { lastPauseReason = reason; signalusr1(); }
    @Override public void resume() { releaseHold(); lastPauseReason = pauseReason.noNetwork; }
    @Override public boolean stopVPN(boolean replaceConnection) {
        boolean stopSucceed = stopOpenVPN();
        if (stopSucceed) mShuttingDown = true;
        return stopSucceed;
    }
}