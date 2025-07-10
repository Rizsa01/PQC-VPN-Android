package de.blinkt.openvpn.core;

import static de.blinkt.openvpn.core.VpnProfile.EXTRA_PROFILEUUID;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.net.VpnService;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import androidx.core.app.NotificationCompat;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import de.blinkt.openvpn.R;
import de.blinkt.openvpn.activities.PqcVpnActivity;

public class OpenVPNService extends VpnService implements VpnStatus.StateListener {

    public static final String START_SERVICE = "de.blinkt.openvpn.START_SERVICE";
    public static final String EXTRA_DO_NOT_REPLACE_RUNNING_VPN = "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN";
    public static final String EXTRA_START_REASON = "de.blinkt.openvpn.startReason";
    public static final String DISCONNECT_VPN = "de.blinkt.openvpn.DISCONNECT_VPN";
    public static final String NOTIFICATION_CHANNEL_ID = "openvpn_status";
    private static final String PQC_VPN_LOG_TAG = "PQC_VPN_Service";
    private static final String OPENVPN_EXECUTABLE_NAME = "openvpn";

    private Handler mCommandHandler;
    private HandlerThread mCommandHandlerThread;
    private VpnProfile mProfile;
    private Thread mProcessThread;
    private OpenVPNManagement mManagement;
    private VpnService.Builder mBuilder;
    private ParcelFileDescriptor mTunFd;
    private boolean mPersistTun = false;

    private final IBinder mBinder = new IOpenVPNServiceInternal.Stub() {
        @Override public boolean protect(int fd) { return OpenVPNService.this.protect(fd); }
        @Override public void userPause(boolean shouldbePaused) {}
        @Override public boolean stopVPN(boolean replace) { return stopVpn(); }
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
        VpnStatus.addStateListener(this);
        mBuilder = new VpnService.Builder();
        createNotificationChannel();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null && START_SERVICE.equals(intent.getAction())) {
            mCommandHandler.post(() -> startVpn(intent));
        } else if (intent != null && DISCONNECT_VPN.equals(intent.getAction())) {
            mCommandHandler.post(this::stopVpn);
        }
        return START_STICKY;
    }

    public void writeProfileToStdIn(OutputStream stdin) throws IOException {
        if (mProfile != null) {
            VpnStatus.logInfo("Writing config to STDIN");
            mProfile.writeConfigFileOutput(this, stdin);
            Log.i(PQC_VPN_LOG_TAG, "Config file written to process stdin.");
        }
    }

    private void startVpn(Intent intent) {
        if (intent == null) {
            stopSelf();
            return;
        }

        String profileUUID = intent.getStringExtra(EXTRA_PROFILEUUID);
        mProfile = ProfileManager.get(this, profileUUID);

        if (mProfile == null) {
            Log.e(PQC_VPN_LOG_TAG, "Cannot start VPN, profile not found for UUID: " + profileUUID);
            stopSelf();
            return;
        }

        if (VpnService.prepare(this) != null) {
            VpnStatus.logError(R.string.permission_revoked);
            return;
        }

        try {
            String nativeLibraryDir = getApplicationInfo().nativeLibraryDir;
            String executablePath = nativeLibraryDir + "/" + OPENVPN_EXECUTABLE_NAME;
            String tmpDir = getCacheDir().getPath();

            File openvpnFile = new File(executablePath);
            if (!openvpnFile.exists()) {
                throw new IOException("FATAL: openvpn executable does not exist at " + executablePath);
            }
            openvpnFile.setExecutable(true, false);

            String managementSocketPath = tmpDir + "/mgmtsocket";

            ArrayList<String> argv = new ArrayList<>(Arrays.asList(
                    executablePath,
                    "--config", "stdin",
                    "--management", managementSocketPath, "unix",
                    "--management-query-passwords",
                    "--management-hold",
                    "--persist-tun"
            ));

            Runnable process = new OpenVPNThread(this, argv.toArray(new String[0]), nativeLibraryDir, tmpDir);
            mProcessThread = new Thread(process, "OpenVPNProcessThread");
            mProcessThread.start();

            mManagement = new OpenVpnManagementThread(mProfile, this, managementSocketPath);
            if (!((OpenVpnManagementThread) mManagement).openManagementInterface(this)) {
                throw new IOException("Failed to open OpenVPN management interface.");
            }
            Thread mgmtThread = new Thread((Runnable) mManagement, "OpenVPNManagementThread");
            mgmtThread.start();

            //showNotification(getString(R.string.vpn_connecting), ConnectionStatus.LEVEL_CONNECTING_NO_SERVER_REPLY_YET);

        } catch (Exception e) {
            VpnStatus.logException("Fatal error starting OpenVPN", e);
            stopVpn();
        }
    }

    private boolean stopVpn() {
        Log.i(PQC_VPN_LOG_TAG, "Stopping VPN...");
        boolean stopped = false;
        if (mManagement != null) {
            stopped = mManagement.stopVPN(true);
        }
        if (mProcessThread != null) {
            mProcessThread.interrupt();
        }
        endVpnService();
        return stopped;
    }

    private void endVpnService() {
        mCommandHandler.post(() -> {
            mProcessThread = null;
            ProfileManager.setConntectedVpnProfileDisconnected(this);
            VpnStatus.removeStateListener(this);
            try {
                if (mTunFd != null && !mPersistTun) {
                    mTunFd.close();
                    mTunFd = null;
                }
            } catch (IOException e) {
                VpnStatus.logException("Error closing TunFd", e);
            }
            stopForeground(true);
            stopSelf();
        });
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
        stopVpn();
    }

    @Override
    public void updateState(String state, String logmessage, int resid, ConnectionStatus level, Intent intent) {
        showNotification(VpnStatus.getLastCleanLogMessage(this), level);
    }

    private void showNotification(String message, ConnectionStatus level) {
        int icon = R.drawable.ic_stat_vpn;
        if (level == ConnectionStatus.LEVEL_CONNECTED) {
            //icon = R.drawable.ic_stat_vpn_connected;
        }

        String profileName = (mProfile != null) ? mProfile.getName() : getString(R.string.not_connected);

        Intent mainIntent = new Intent(this, PqcVpnActivity.class);
        PendingIntent pIntent = PendingIntent.getActivity(this, 0, mainIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);

        NotificationCompat.Builder nbuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setContentTitle(getString(R.string.notifcation_title, profileName))
                .setContentText(message)
                .setSmallIcon(icon)
                .setContentIntent(pIntent)
                .setOngoing(true);

        Intent disconnectIntent = new Intent(this, OpenVPNService.class);
        disconnectIntent.setAction(DISCONNECT_VPN);
        PendingIntent disconnectPendingIntent = PendingIntent.getService(this, 0, disconnectIntent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);

        nbuilder.addAction(android.R.drawable.ic_menu_close_clear_cancel,
                getString(R.string.cancel_connection), disconnectPendingIntent);

        startForeground(1, nbuilder.build());
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    "OpenVPN Status",
                    NotificationManager.IMPORTANCE_LOW
            );
            channel.setDescription("VPN connection status notifications");
            NotificationManager nm = getSystemService(NotificationManager.class);
            nm.createNotificationChannel(channel);
        }
    }

    @Override
    public void setConnectedVPN(String uuid) {}

    // ====== VPN Configuration Methods ======

    public ParcelFileDescriptor openTun() {
        try {
            if (mTunFd == null) {
                mTunFd = mBuilder.establish();
            }
            return mTunFd;
        } catch (Exception e) {
            VpnStatus.logException("Failed to establish TUN interface", e);
            return null;
        }
    }

    public void addDNS(String dns) {
        try {
            mBuilder.addDnsServer(dns.trim());
        } catch (Exception e) {
            VpnStatus.logError("Error adding DNS: " + dns);
        }
    }

    public void addSearchDomain(String domain) {
        try {
            mBuilder.addSearchDomain(domain.trim());
        } catch (Exception e) {
            VpnStatus.logError("Error adding search domain: " + domain);
        }
    }

    public void addRoute(String dest, String mask, String gateway, String device) {
        try {
            CIDRIP route = new CIDRIP(dest, mask);
            mBuilder.addRoute(route.mIp, route.len);
        } catch (Exception e) {
            VpnStatus.logError("Error adding route: " + dest + "/" + mask);
        }
    }

    public void addRoutev6(String network, String device) {
        try {
            String[] parts = network.split("/");
            mBuilder.addRoute(parts[0], Integer.parseInt(parts[1]));
        } catch (Exception e) {
            VpnStatus.logError("Error adding IPv6 route: " + network);
        }
    }

    public void setLocalIP(String local, String netmask, int mtu, String mode) {
        try {
            CIDRIP localip = new CIDRIP(local, netmask);
            mBuilder.addAddress(localip.mIp, localip.len);
            if (mtu > 0) {
                mBuilder.setMtu(mtu);
            }
        } catch (Exception e) {
            VpnStatus.logError("Error setting local IP: " + local + "/" + netmask);
        }
    }

    public void setLocalIPv6(String ipv6addr) {
        try {
            String[] parts = ipv6addr.split("/");
            mBuilder.addAddress(parts[0], Integer.parseInt(parts[1]));
        } catch (Exception e) {
            VpnStatus.logError("Error setting local IPv6 address: " + ipv6addr);
        }
    }

    public String getTunReopenStatus() {
        // Return "ok" to keep tun open during reconnects, "cancel" to close it
        mPersistTun = true;
        return "ok";
    }

    public OpenVPNManagement getManagement() {
        return mManagement;
    }
}