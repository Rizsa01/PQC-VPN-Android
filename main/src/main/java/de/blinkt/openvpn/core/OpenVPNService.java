/*
 * Copyright (c) 2012-2022 Arne Schwabe & Contributors
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import static de.blinkt.openvpn.core.VpnProfile.EXTRA_PROFILEUUID;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.VpnService;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.util.Log;

import androidx.core.app.NotificationCompat;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.ExecutionException;

import de.blinkt.openvpn.R;
import de.blinkt.openvpn.activities.PqcVpnActivity;
// Correctly import the nested enum
import de.blinkt.openvpn.core.VpnStatus;
import de.blinkt.openvpn.core.VpnStatus.StateListener;

public class OpenVPNService extends VpnService implements StateListener {

    public static final String START_SERVICE = "de.blinkt.openvpn.START_SERVICE";
    public static final String DISCONNECT_VPN = "de.blinkt.openvpn.DISCONNECT_VPN";
    public static final String NOTIFICATION_CHANNEL_ID = "openvpn_status";
    private static final String PQC_VPN_LOG_TAG = "PQC_VPN_Service";
    private static final String OPENVPN_EXECUTABLE_NAME = "openvpn";

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
        // These methods are part of the AIDL interface but not needed for our simple case.
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

    private String installOpenVpn() throws IOException {
        File openvpnFile = new File(getFilesDir(), OPENVPN_EXECUTABLE_NAME);
        if (openvpnFile.exists() && openvpnFile.canExecute()) {
            return openvpnFile.getAbsolutePath();
        }

        String abi = Build.SUPPORTED_ABIS[0];
        String assetPath = "lib/" + abi + "/" + OPENVPN_EXECUTABLE_NAME;

        try (InputStream in = getAssets().open(assetPath);
             FileOutputStream out = new FileOutputStream(openvpnFile)) {
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        }

        if (!openvpnFile.setExecutable(true)) {
            throw new IOException("Failed to set executable permission on " + openvpnFile.getAbsolutePath());
        }
        return openvpnFile.getAbsolutePath();
    }

    private void startVpn(Intent intent) {
        if (intent == null) { stopSelf(); return; }
        String profileUUID = intent.getStringExtra(EXTRA_PROFILEUUID);
        mProfile = ProfileManager.get(this, profileUUID);

        if (mProfile == null) { stopSelf(); return; }

        if (VpnService.prepare(this) != null) {
            VpnStatus.logError(R.string.permission_requested);
            return;
        }

        try {
            String executablePath = installOpenVpn();
            String nativeLibraryDir = getApplicationInfo().nativeLibraryDir;
            String tmpDir = getCacheDir().getPath();

            // This helper class might not exist if you simplified.
            // If it fails, we replace it with a basic command array.
            ArrayList<String> argv;
            try {
                argv = new ArrayList<>(Arrays.asList(VPNLaunchHelper.buildOpenvpnArgv(this)));
            } catch (NoClassDefFoundError e) {
                Log.w(PQC_VPN_LOG_TAG, "VPNLaunchHelper not found, using basic argv.");
                argv = new ArrayList<>();
                argv.add(executablePath); // placeholder, will be replaced
                argv.add("--config");
                argv.add("stdin");
            }
            argv.set(0, executablePath);


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

            OutputStream stdin = ((OpenVPNThread) process).getOpenVPNStdin();
            mProfile.writeConfigFileOutput(this, stdin);

        } catch (Exception e) {
            VpnStatus.logException("Fatal error starting OpenVPN", e);
            stopVpn();
        }
    }

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
        // FIX: Use the correct public method to check status
        if (VpnStatus.isVPNActive()) {
            VpnStatus.removeStateListener(this);
        }
        stopForeground(true);
        stopSelf();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (mProcessThread != null) {
            stopVpn();
        }
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

    // FIX: Using the ConnectionStatus enum as seen in your VpnStatus.java
    private void showNotification(String message, ConnectionStatus level) {
        createNotificationChannel();
        int icon = R.drawable.ic_stat_vpn; // A default icon you must create

        if (level == ConnectionStatus.LEVEL_CONNECTED) {
            // You can use a different icon for connected state if you have one
        }

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
            nm.createNotificationChannel(new NotificationChannel(NOTIFICATION_CHANNEL_ID, "OpenVPN Status", NotificationManager.IMPORTANCE_DEFAULT));
        }
    }

    // FIX: This is the correct signature for the updateState method from your VpnStatus.java
    @Override
    public void updateState(String state, String logmessage, int resid, ConnectionStatus level, Intent intent) {
        showNotification(VpnStatus.getLastCleanLogMessage(this), level);
    }

    @Override
    public void setConnectedVPN(String uuid) {}

    // Stubs for other interface methods
    public ParcelFileDescriptor openTun() { return null; }
    public void addDNS(String dns) {}
    public void addRoute(String dest, String mask, String gateway, String device) {}
    public void addRoutev6(String network, String device) {}
    public void setMtu(int mtu) {}
    public void setLocalIP(String local, String netmask, int mtu, String mode) {}
    public void setLocalIPv6(String ipv6addr) {}
    public OpenVPNManagement getManagement() { return mManagement; }
}