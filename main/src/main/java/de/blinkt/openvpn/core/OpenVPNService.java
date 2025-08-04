package de.blinkt.openvpn.core;

import static de.blinkt.openvpn.core.VpnProfile.EXTRA_PROFILEUUID;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.VpnService;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.util.Log;
import androidx.core.app.NotificationCompat;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Map;

import de.blinkt.openvpn.R;
import de.blinkt.openvpn.activities.PqcVpnActivity;
import de.blinkt.openvpn.activities.VpnConfigManager;

public class OpenVPNService extends VpnService implements VpnStatus.StateListener {
    public static final String START_SERVICE = "de.blinkt.openvpn.START_SERVICE";
    public static final String EXTRA_VPN_PROFILE_OBJECT = "de.blinkt.openvpn.VPN_PROFILE_OBJECT";
    public static final String DISCONNECT_VPN = "de.blinkt.openvpn.DISCONNECT_VPN";
    public static final String NOTIFICATION_CHANNEL_ID = "openvpn_status";
    private static final String TAG = "PQC_VPN_Service";

    public static final String EXTRA_DO_NOT_REPLACE_RUNNING_VPN = "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN";
    public static final String EXTRA_START_REASON = "de.blinkt.openvpn.startReason";

    private Builder              mBuilder;
    private ParcelFileDescriptor mTunFd;
    private String               mManagementSocketPath;
    private Handler              mCommandHandler;
    private HandlerThread        mCommandHandlerThread;
    private VpnProfile           mProfile;
    private Thread               mProcessThread;
    private OpenVPNManagement    mManagement;
    private OpenVPNThread        mVPNThread;
    private OpenVpnManagementThread mManagementThread;


    private final IBinder mBinder = new IOpenVPNServiceInternal.Stub() {
        @Override public boolean protect(int fd)                     { return OpenVPNService.this.protect(fd); }
        @Override public void    userPause(boolean shouldbePaused)   {}
        @Override public boolean stopVPN(boolean replaceConnection)  { return stopVpn(); }
        @Override public void    addAllowedExternalApp(String pkg)   {}
        @Override public boolean isAllowedExternalApp(String pkg)    { return false; }
        @Override public void    challengeResponse(String response)  {}
    };

    @Override
    public void onCreate() {
        super.onCreate();
        mCommandHandlerThread = new HandlerThread("OpenVPNServiceCommand");
        mCommandHandlerThread.start();
        mCommandHandler = new Handler(mCommandHandlerThread.getLooper());
        VpnStatus.addStateListener(this);
        createNotificationChannel();
    }



    /** Called by the management thread after establish() succeeds */
    public void setTunFd(ParcelFileDescriptor fd) {
        this.mTunFd = fd;
    }

    /** Expose your Builder so the management thread can call establish() */
    public Builder getVpnBuilder() {
        return mBuilder;
    }

    /** Expose your profile so the management thread can populate routes, DNS, etc. */
    public VpnProfile getVpnProfile() {
        return mProfile;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null && START_SERVICE.equals(intent.getAction())) {
            mCommandHandler.post(() -> startVpn(intent));
        } else if (intent != null && DISCONNECT_VPN.equals(intent.getAction())) {
            Log.i(TAG, "Received DISCONNECT_VPN intent.");
            mCommandHandler.post(this::stopVpn);
        }
        return START_STICKY;
    }

    public void writeProfileToStdIn(OutputStream stdin) throws IOException {
        if (mProfile != null) {
            Log.i(TAG, "Writing OpenVPN config to stdin.");
            mProfile.writeConfigFileOutput(this, stdin);
        }
    }

    private void startVpn(Intent intent) {
        PqcVpnLog.i("================== VPN START SEQUENCE INITIATED ==================");
        if (intent.hasExtra(EXTRA_VPN_PROFILE_OBJECT)) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                mProfile = intent.getParcelableExtra(EXTRA_VPN_PROFILE_OBJECT, VpnProfile.class);
            } else {
                mProfile = intent.getParcelableExtra(EXTRA_VPN_PROFILE_OBJECT);
            }
        } else {
            mProfile = ProfileManager.get(this, intent.getStringExtra(EXTRA_PROFILEUUID));
        }

        if (mProfile == null) {
            PqcVpnLog.e("FATAL: VpnProfile is null. Cannot start VPN.", null);
            stopSelf();
            return;
        }
        PqcVpnLog.i("Step 1: Profile '" + mProfile.getName() + "' loaded successfully.");

        try {
            PqcVpnLog.d("[DEBUG_SERVICE] START: VpnService startup sequence initiated.");

            mBuilder = new Builder();
            PqcVpnLog.d("[DEBUG_SERVICE] Builder created.");

            ConnectivityManager cm = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
            Network activeNetwork = cm.getActiveNetwork();
            if (activeNetwork != null) {
                mBuilder.setUnderlyingNetworks(new Network[]{activeNetwork});
                PqcVpnLog.i("[DEBUG_SERVICE] Successfully bound VpnService to active network: " + activeNetwork);
            } else {
                PqcVpnLog.e("[DEBUG_SERVICE] FATAL: No active network found. Cannot start VPN.", null);
                VpnStatus.logError("No active network connection available.");
                stopVpn();
                return;
            }

            mProfile.addProfileToBuilder(mBuilder, this);
            PqcVpnLog.d("[DEBUG_SERVICE] Builder statically configured from profile.");

            mTunFd = mBuilder.establish();
            if (mTunFd == null) {
                VpnStatus.logError("Android VpnService.Builder.establish() returned null.");
                stopVpn();
                return;
            }
            PqcVpnLog.d("[DEBUG_SERVICE] Temporary TUN interface established with FD: " + mTunFd.getFd());

            File mgtSocketFile = new File(getCacheDir(), "mgmtsocket");
            mManagementSocketPath = mgtSocketFile.getAbsolutePath();
            String nativeLibraryDir = getApplicationInfo().nativeLibraryDir;
            String tmpDir = getCacheDir().getPath();
            File openvpnExecutable = new File(nativeLibraryDir, "libopenvpn.so");
            File openSslConfigFile = VpnConfigManager.copyAndGetConfigFile(this);
            PqcVpnLog.d("[DEBUG_SERVICE] Paths prepared.");

            ArrayList<String> argv = new ArrayList<>();
            argv.add(openvpnExecutable.getAbsolutePath());
            argv.add("--dev"); argv.add("tun");
            argv.add("--config"); argv.add("stdin");
            argv.add("--verb"); argv.add("4");
            argv.add("--management"); argv.add(mManagementSocketPath); argv.add("unix");
            argv.add("--management-hold");
            argv.add("--management-query-passwords");
            argv.add("--ifconfig-noexec");
            argv.add("--route-noexec");
            PqcVpnLog.d("[DEBUG_SERVICE] Command line constructed: " + TextUtils.join(" ", argv));

            ProcessBuilder pb = new ProcessBuilder(argv);
            Map<String, String> env = pb.environment();
            env.put("LD_LIBRARY_PATH", nativeLibraryDir);
            env.put("OPENSSL_MODULES", nativeLibraryDir);
            if (openSslConfigFile != null) env.put("OPENSSL_CONF", openSslConfigFile.getAbsolutePath());
            env.put("TMPDIR", tmpDir);
            pb.redirectErrorStream(true);
            PqcVpnLog.d("[DEBUG_SERVICE] Environment configured.");

            Process process = pb.start();
            PqcVpnLog.d("[DEBUG_SERVICE] Native process object created.");

            final OutputStream stdin = process.getOutputStream();
            new Thread(() -> {
                try {
                    writeProfileToStdIn(stdin);
                } catch (IOException e) {
                    PqcVpnLog.e("ConfigWriterThread: Error writing config to stdin", e);
                } finally {
                    try { stdin.close(); } catch (IOException e) { /* ignore */ }
                }
            }, "OpenVPNConfigWriter").start();

            mManagementThread = new OpenVpnManagementThread(mProfile, this, mManagementSocketPath, mTunFd, mBuilder);
            new Thread(mManagementThread, "OpenVPNManagementThread").start();
            PqcVpnLog.d("[DEBUG_SERVICE] Management thread started.");

            mProcessThread = new Thread(new OpenVPNProcessThread(process, this), "OpenVPNProcessThread");
            mProcessThread.start();
            PqcVpnLog.d("[DEBUG_SERVICE] Process monitoring thread started. Startup sequence complete.");

        } catch (Exception e) {
            PqcVpnLog.e("[DEBUG_SERVICE] FATAL EXCEPTION in startVpn()", e);
            VpnStatus.logException("Fatal error during OpenVPN startup sequence", e);
            stopVpn();
        }
    }

    boolean stopVpn() {
        Log.w(TAG, "stopVpn() called.");
        if (mVPNThread != null) {
            Log.w(TAG, "Stopping native process.");
            mVPNThread.stopProcess();
        }
        endVpnService();
        return true;
    }

    private void endVpnService() {
        mCommandHandler.post(() -> {
            mProcessThread = null;
            mManagement    = null;
            ProfileManager.setConntectedVpnProfileDisconnected(this);
            VpnStatus.removeStateListener(this);
            stopForeground(true);
            stopSelf();
        });
    }

    @Override public void onDestroy() {
        super.onDestroy();
        stopVpn();
        if (mCommandHandlerThread != null) mCommandHandlerThread.quit();
    }

    @Override public IBinder onBind(Intent intent) {
        return mBinder;
    }

    @Override public void onRevoke() {
        VpnStatus.logError("VPN permission revoked by system!");
        stopVpn();
    }

    @Override
    public void updateState(String state, String logmessage, int resid,
                            ConnectionStatus level, Intent intent) {
        showNotification(VpnStatus.getLastCleanLogMessage(this), level);
    }

    private void showNotification(String message, ConnectionStatus level) {
        Intent main = new Intent(this, PqcVpnActivity.class);
        PendingIntent pi = PendingIntent.getActivity(
                this, 0, main, PendingIntent.FLAG_IMMUTABLE
        );

        NotificationCompat.Builder nb = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setContentTitle(getString(R.string.app))
                .setContentText(message)
                .setOnlyAlertOnce(true)
                .setOngoing(true)
                .setSmallIcon(R.drawable.ic_notification)
                .setContentIntent(pi);

        if (level == ConnectionStatus.LEVEL_CONNECTED) {
            nb.setSmallIcon(R.drawable.ic_notification_connected);
        }

        Notification n = nb.build();
        startForeground(1, n);
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel ch = new NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    "OpenVPN Status",
                    NotificationManager.IMPORTANCE_DEFAULT
            );
            getSystemService(NotificationManager.class).createNotificationChannel(ch);
        }
    }

    @Override public void setConnectedVPN(String uuid) {}
    public OpenVPNManagement getManagement() { return mManagement; }
    public Builder getBuilder() { return mBuilder; }
}
