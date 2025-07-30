// Please replace the entire contents of your OpenVPNService.java with this code.

package de.blinkt.openvpn.core;

import static de.blinkt.openvpn.core.VpnProfile.EXTRA_PROFILEUUID;

import android.app.Notification;
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
    public static final String EXTRA_DO_NOT_REPLACE_RUNNING_VPN = "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN";
    public static final String EXTRA_START_REASON = "de.blinkt.openvpn.startReason";
    public static final String DISCONNECT_VPN = "de.blinkt.openvpn.DISCONNECT_VPN";
    public static final String NOTIFICATION_CHANNEL_ID = "openvpn_status";
    private static final String PQC_VPN_LOG_TAG = "PQC_VPN_Service";
    public static final String EXTRA_VPN_PROFILE_OBJECT = "de.blinkt.openvpn.VPN_PROFILE_OBJECT";

    private Handler mCommandHandler;
    private HandlerThread mCommandHandlerThread;
    private VpnProfile mProfile;
    private Thread mProcessThread;
    private VpnService.Builder mBuilder;
    private ParcelFileDescriptor mTunFd;
    private boolean mPersistTun = false;
    private OpenVpnManagementThread mManagementThread;
    private String mManagementSocketPath;

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
            Log.e(PQC_VPN_LOG_TAG, "FATAL: VpnProfile is null, cannot start VPN.");
            stopSelf();
            return;
        }

        VpnStatus.logInfo("Starting PQC VPN service for profile: " + mProfile.getName());

        try {
            // 1. Establish the TUN interface FIRST to get the file descriptor
            mBuilder = new Builder();
            mProfile.addProfileToBuilder(mBuilder, this);
            mTunFd = mBuilder.establish();
            if (mTunFd == null) {
                VpnStatus.logError("Android VpnService rejected the configuration.");
                stopVpn();
                return;
            }
            Log.i(PQC_VPN_LOG_TAG, "TUN interface established successfully.");

            // 2. Get the integer value of the file descriptor
            final int tunFd = mTunFd.getFd();

            // 3. Build the command line, now including --dev-fd
            String nativeLibraryDir = getApplicationInfo().nativeLibraryDir;
            String tmpDir = getCacheDir().getPath();
            File openvpnFile = new File(nativeLibraryDir, "libopenvpn.so");
            File openSslConfigFile = VpnConfigManager.copyAndGetConfigFile(this);

            ArrayList<String> argv = new ArrayList<>();
            argv.add(openvpnFile.getAbsolutePath());
            argv.add("--config");
            argv.add("stdin");
            argv.add("--verb");
            argv.add("4");
            argv.add("--management");
            argv.add(mManagementSocketPath);
            argv.add("unix");
            argv.add("--management-hold");
            argv.add("--management-query-passwords");
            argv.add("--ifconfig-noexec");
            argv.add("--route-noexec");


            String commandToLog = TextUtils.join(" ", argv);
            Log.i(PQC_VPN_LOG_TAG, "--- EXECUTING NATIVE COMMAND ---");
            Log.i(PQC_VPN_LOG_TAG, commandToLog);
            Log.i(PQC_VPN_LOG_TAG, "---------------------------------");

            // 3. Start the native process
            ProcessBuilder pb = new ProcessBuilder(argv);
            pb.directory(new File(tmpDir));
            Map<String, String> env = pb.environment();
            env.put("LD_LIBRARY_PATH", nativeLibraryDir);
            env.put("OPENSSL_MODULES", nativeLibraryDir);
            env.put("OPENSSL_CONF", openSslConfigFile.getAbsolutePath());
            env.put("TMPDIR", tmpDir);

            Process process = pb.start();
            Log.i(PQC_VPN_LOG_TAG, "Native OpenVPN process started.");

            // 4. Write the config to the process's stdin
            OutputStream stdin = process.getOutputStream();
            new Thread(() -> {
                try {
                    writeProfileToStdIn(stdin);
                } catch (IOException e) {
                    PqcVpnLog.e("Error writing config to stdin", e);
                } finally {
                    try {
                        stdin.close();
                    } catch (IOException e) { /* ignore */ }
                }
            }, "OpenVPNConfigWriter").start();


            // 5. Establish the TUN interface
            mBuilder = new Builder();
            mProfile.addProfileToBuilder(mBuilder, this);
            mTunFd = mBuilder.establish();
            if (mTunFd == null) {
                VpnStatus.logError("Android VpnService rejected the configuration.");
                process.destroy();
                stopVpn();
                return;
            }
            Log.i(PQC_VPN_LOG_TAG, "TUN interface established successfully.");

            // 6. Start the management thread to control the native process
            mManagementThread = new OpenVpnManagementThread(mProfile, this, mManagementSocketPath, mTunFd);
            Thread management = new Thread(mManagementThread, "OpenVPNManagementThread");
            management.start();
            Log.i(PQC_VPN_LOG_TAG, "OpenVPN Management Thread started.");

            mProcessThread = new Thread(new OpenVPNProcessThread(process, this), "OpenVPNProcessThread");
            mProcessThread.start();
            Log.i(PQC_VPN_LOG_TAG, "OpenVPN Process Monitoring Thread started.");


        } catch (Exception e) {
            VpnStatus.logException("Fatal error during OpenVPN startup sequence", e);
            stopVpn();
        }
    }

    boolean stopVpn() {
        Log.i(PQC_VPN_LOG_TAG, "Stopping VPN...");
        if (mManagementThread != null) {
            // This will signal SIGTERM to the native process via the management socket
            mManagementThread.stopVPN(false);
        } else if (mProcessThread != null) {
            // Fallback if management thread isn't running
            mProcessThread.interrupt();
        }
        endVpnService();
        return true;
    }

    private void endVpnService() {
        mCommandHandler.post(() -> {
            mProcessThread = null;
            mManagementThread = null;
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

    @Override public void onDestroy() { super.onDestroy(); stopVpn(); if (mCommandHandlerThread != null) { mCommandHandlerThread.quit(); } }
    @Override public IBinder onBind(Intent intent) { return mBinder; }
    @Override
    public void onRevoke() {
        VpnStatus.logError("VPN permission revoked by system!");
        stopVpn();
    }
    @Override public void updateState(String state, String logmessage, int resid, ConnectionStatus level, Intent intent) { showNotification(VpnStatus.getLastCleanLogMessage(this), level); }
    private void showNotification(String message, ConnectionStatus level) {
        Intent mainActivity = new Intent(this, PqcVpnActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, mainActivity, PendingIntent.FLAG_IMMUTABLE);

        NotificationCompat.Builder nbuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setContentTitle(getString(R.string.app))
                .setContentText(message)
                .setOnlyAlertOnce(true)
                .setOngoing(true)
                .setSmallIcon(R.drawable.ic_notification)
                .setContentIntent(pendingIntent);

        if (level == ConnectionStatus.LEVEL_CONNECTED) {
            nbuilder.setSmallIcon(R.drawable.ic_notification_connected);
        }

        Notification notification = nbuilder.build();
        startForeground(1, notification);
    }
    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel serviceChannel = new NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    "OpenVPN Status",
                    NotificationManager.IMPORTANCE_DEFAULT
            );
            NotificationManager manager = getSystemService(NotificationManager.class);
            manager.createNotificationChannel(serviceChannel);
        }
    }
    @Override public void setConnectedVPN(String uuid) {}
    public OpenVPNManagement getManagement() { return mManagementThread; }
}