/*
 * Copyright (c) 2012-2022 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import static android.content.Intent.FLAG_ACTIVITY_NEW_TASK;
import static de.blinkt.openvpn.core.VpnProfile.EXTRA_PROFILEUUID;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.VpnService;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.util.Log;

import androidx.core.app.NotificationCompat;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.ExecutionException;

import de.blinkt.openvpn.R;
import de.blinkt.openvpn.activities.PqcVpnActivity;
import de.blinkt.openvpn.core.VpnStatus.StateListener;

public class    OpenVPNService extends VpnService implements StateListener {

    public static final String START_SERVICE = "de.blinkt.openvpn.START_SERVICE";
    public static final String DISCONNECT_VPN = "de.blinkt.openvpn.DISCONNECT_VPN";
    public static final String NOTIFICATION_CHANNEL_ID = "openvpn_status";
    private static final String PQC_VPN_LOG_TAG = "PQC_VPN_Service";

    public static final String EXTRA_DO_NOT_REPLACE_RUNNING_VPN = "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN";
    public static final String EXTRA_START_REASON = "de.blinkt.openvpn.startReason";

    private Handler mCommandHandler;
    private HandlerThread mCommandHandlerThread;
    private VpnProfile mProfile;
    private Thread mProcessThread;
    private OpenVPNManagement mManagement;

    private final IBinder mBinder = new IOpenVPNServiceInternal.Stub() {
        @Override
        public boolean protect(int fd) {
            return OpenVPNService.this.protect(fd);
        }

        @Override public void userPause(boolean shouldbePaused) {}
        @Override public boolean stopVPN(boolean replace) { return OpenVPNService.this.stopVpn(); }
        @Override public void addAllowedExternalApp(String packagename) {}
        @Override public boolean isAllowedExternalApp(String packagename) { return false; }
        @Override public void challengeResponse(String response) {}
    };


    @Override
    public void onCreate() {
        super.onCreate();
        mCommandHandlerThread = new HandlerThread("OpenVPNServiceCommand");
        mCommandHandlerThread.start();
        mCommandHandler = new Handler(mCommandHandlerThread.getLooper());
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null && DISCONNECT_VPN.equals(intent.getAction())) {
            stopVpn();
            return START_NOT_STICKY;
        }

        VpnStatus.addStateListener(this);
        mCommandHandler.post(() -> startVpn(intent));
        return START_STICKY;
    }

    private void startVpn(Intent intent) {
        if (intent == null) {
            Log.e(PQC_VPN_LOG_TAG, "startVpn called with null intent.");
            stopSelf();
            return;
        }
        String profileUUID = intent.getStringExtra(EXTRA_PROFILEUUID);
        mProfile = ProfileManager.get(this, profileUUID);

        if (mProfile == null) {
            Log.e(PQC_VPN_LOG_TAG, "Profile not found for UUID: " + profileUUID);
            stopSelf();
            return;
        }

        if (VpnService.prepare(this) != null) {
            VpnStatus.logError(R.string.permission_requested);
            return;
        }

        ApplicationInfo appInfo = getApplicationInfo();
        String nativeLibraryDir = appInfo.nativeLibraryDir;
        String tmpDir = getCacheDir().getPath();

        ArrayList<String> argv = new ArrayList<>(Arrays.asList(VPNLaunchHelper.buildOpenvpnArgv(this)));
        argv.set(0, nativeLibraryDir + "/openvpn");

        Runnable process = new OpenVPNThread(this, argv.toArray(new String[0]), nativeLibraryDir, tmpDir);
        synchronized (this) {
            mProcessThread = new Thread(process, "OpenVPNProcessThread");
            mProcessThread.start();
        }

        mManagement = new OpenVpnManagementThread(mProfile, this);
        if (((OpenVpnManagementThread) mManagement).openManagementInterface(this)) {
            Thread mgmtThread = new Thread((Runnable) mManagement, "OpenVPNManagementThread");
            mgmtThread.start();
        } else {
            stopVpn();
            return;
        }

        try {
            OutputStream stdin = ((OpenVPNThread) process).getOpenVPNStdin();
            mProfile.writeConfigFileOutput(this, stdin);
        } catch (IOException | ExecutionException | InterruptedException e) {
            Log.e(PQC_VPN_LOG_TAG, "Error writing config to OpenVPN stdin", e);
            stopVpn();
        }
    }

    // FIX: A single, unambiguous stopVpn method
    private boolean stopVpn() {
        boolean stopped = false;
        if (mManagement != null) {
            stopped = mManagement.stopVPN(false);
        }
        endVpnService();
        return stopped;
    }

    private void endVpnService() {
        synchronized (this) {
            mProcessThread = null;
        }
        ProfileManager.setConntectedVpnProfileDisconnected(this);
        VpnStatus.removeStateListener(this);
        stopForeground(true);
        stopSelf();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        stopVpn();
        if (mCommandHandlerThread != null) {
            mCommandHandlerThread.quit();
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }

    @Override
    public void onRevoke() {
        VpnStatus.logError(R.string.permission_revoked);
        stopVpn();
    }

    private int getIconByConnectionStatus(ConnectionStatus level) {
        switch (level) {
            case LEVEL_CONNECTED:
                return android.R.drawable.ic_secure;
            case LEVEL_WAITING_FOR_USER_INPUT:
                return android.R.drawable.ic_dialog_alert;
            default:
                return android.R.drawable.ic_dialog_info;
        }
    }

    private void showNotification(String message, ConnectionStatus status) {
        createNotificationChannel();
        int icon = getIconByConnectionStatus(status);
        String profileName = (mProfile != null) ? mProfile.getName() : getString(R.string.not_connected);

        Intent mainIntent = new Intent(this, PqcVpnActivity.class);
        PendingIntent pIntent = PendingIntent.getActivity(this, 0, mainIntent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);

        NotificationCompat.Builder nbuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setContentTitle(getString(R.string.notifcation_title, profileName))
                .setContentText(message)
                .setSmallIcon(icon)
                .setContentIntent(pIntent)
                .setOngoing(true);

        Intent disconnectIntent = new Intent(this, OpenVPNService.class);
        disconnectIntent.setAction(DISCONNECT_VPN);
        PendingIntent disconnectPendingIntent = PendingIntent.getService(this, 0, disconnectIntent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        nbuilder.addAction(android.R.drawable.ic_menu_close_clear_cancel, getString(R.string.cancel_connection), disconnectPendingIntent);

        startForeground(1, nbuilder.build());
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager nm = getSystemService(NotificationManager.class);
            if (nm != null) {
                NotificationChannel channel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, "OpenVPN Status", NotificationManager.IMPORTANCE_DEFAULT);
                nm.createNotificationChannel(channel);
            }
        }
    }

    @Override
    public void updateState(String state, String logmessage, int resid, ConnectionStatus level, Intent intent) {
        showNotification(VpnStatus.getLastCleanLogMessage(this), level);
    }

    @Override
    public void setConnectedVPN(String uuid) {
        // Not needed for our simple implementation
    }

    // Stubbed out methods that are part of interfaces but we don't need
    public ParcelFileDescriptor openTun() { return null; }
    public void addDNS(String dns) {}
    public void addRoute(String dest, String mask, String gateway, String device) {}
    public void addRoutev6(String network, String device) {}
    public void setMtu(int mtu) {}
    public void setLocalIP(String local, String netmask, int mtu, String mode) {}
    public void setLocalIPv6(String ipv6addr) {}
    public OpenVPNManagement getManagement() { return mManagement; }
}