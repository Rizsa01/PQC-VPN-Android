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
    public static final String EXTRA_VPN_PROFILE_OBJECT = "de.blinkt.openvpn.VPN_PROFILE_OBJECT";

    private Handler mCommandHandler;
    private HandlerThread mCommandHandlerThread;
    private VpnProfile mProfile;
    private Thread mProcessThread;
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
            Log.e(PQC_VPN_LOG_TAG, "Service started with a null intent. Aborting.");
            return;
        }

        // 1. Load the VpnProfile from the intent
        if (intent.hasExtra(EXTRA_VPN_PROFILE_OBJECT)) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                mProfile = intent.getParcelableExtra(EXTRA_VPN_PROFILE_OBJECT, VpnProfile.class);
            } else {
                @SuppressWarnings("deprecation")
                VpnProfile profile = intent.getParcelableExtra(EXTRA_VPN_PROFILE_OBJECT);
                mProfile = profile;
            }
        } else {
            String profileUUID = intent.getStringExtra(EXTRA_PROFILEUUID);
            if (profileUUID != null) {
                mProfile = ProfileManager.get(this, profileUUID);
            }
        }

        if (mProfile == null) {
            Log.e(PQC_VPN_LOG_TAG, "FATAL: VpnProfile is null, cannot start VPN connection.");
            stopSelf();
            return;
        }

        Log.i(PQC_VPN_LOG_TAG, "Profile loaded. Starting native process directly for profile: " + mProfile.getName());

        // 2. Initialize the VpnService.Builder
        mBuilder = new Builder();

        try {
            // Get the path to the native lib directory, which is where your
            // executable is successfully being run from.
            String nativeLibraryDir = getApplicationInfo().nativeLibraryDir;
            String executablePath = nativeLibraryDir + "/" + OPENVPN_EXECUTABLE_NAME;

            // Define the temp directory path.
            String tmpDir = getCacheDir().getPath();

            // VVVVVVVVVVVVVVVVVVVV THIS IS THE ONLY FIX VVVVVVVVVVVVVVVVVVVV
            //
            // Build the command-line arguments. We ONLY pass the executable,
            // the config flag, and the verbosity. The path to openssl.cnf
            // is handled EXCLUSIVELY by the environment variable.
            ArrayList<String> argv = new ArrayList<>(Arrays.asList(
                    executablePath,
                    "--config", "stdin",
                    "--verb", "5"
            ));
            // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

            // This part is correct and remains unchanged.
            Runnable process = new OpenVPNThread(this, argv.toArray(new String[0]), nativeLibraryDir, tmpDir);
            mProcessThread = new Thread(process, "OpenVPNProcessThread");
            mProcessThread.start();
            Log.i(PQC_VPN_LOG_TAG, "OpenVPNProcessThread has been started.");

        } catch (Exception e) {
            VpnStatus.logException("Fatal error during OpenVPN startup sequence", e);
            stopVpn();
        }
    }

    private boolean stopVpn() {
        Log.i(PQC_VPN_LOG_TAG, "Stopping VPN...");
        if (mProcessThread != null) {
            mProcessThread.interrupt();
        }
        endVpnService();
        return true;
    }

    // ... other methods ...
    private void endVpnService() { mCommandHandler.post(() -> { mProcessThread = null; ProfileManager.setConntectedVpnProfileDisconnected(this); VpnStatus.removeStateListener(this); try { if (mTunFd != null && !mPersistTun) { mTunFd.close(); mTunFd = null; } } catch (IOException e) { VpnStatus.logException("Error closing TunFd", e); } stopForeground(true); stopSelf(); }); }
    @Override public void onDestroy() { super.onDestroy(); stopVpn(); if (mCommandHandlerThread != null) { mCommandHandlerThread.quit(); } }
    @Override public IBinder onBind(Intent intent) { return mBinder; }
    @Override public void onRevoke() { stopVpn(); }
    @Override public void updateState(String state, String logmessage, int resid, ConnectionStatus level, Intent intent) { showNotification(VpnStatus.getLastCleanLogMessage(this), level); }
    private void showNotification(String message, ConnectionStatus level) { /* ... same as before ... */ }
    private void createNotificationChannel() { /* ... same as before ... */ }
    @Override public void setConnectedVPN(String uuid) {}

    public ParcelFileDescriptor openTun() {
        try {
            if (mTunFd == null) {
                // Call the new method on the profile to configure the builder
                mProfile.addProfileToBuilder(mBuilder, this);
                mTunFd = mBuilder.establish();
            }
            return mTunFd;
        } catch (Exception e) {
            VpnStatus.logException("Failed to establish TUN interface", e);
            return null;
        }
    }

    public void addDNS(String dns) { try { if(mBuilder!=null) mBuilder.addDnsServer(dns.trim()); } catch (Exception e) { VpnStatus.logError("Error adding DNS: " + dns); } }
    public void addSearchDomain(String domain) { try { if(mBuilder!=null) mBuilder.addSearchDomain(domain.trim()); } catch (Exception e) { VpnStatus.logError("Error adding search domain: " + domain); } }
    public void addRoute(String dest, String mask, String gateway, String device) { try { if(mBuilder!=null) {CIDRIP route = new CIDRIP(dest, mask); mBuilder.addRoute(route.mIp, route.len);} } catch (Exception e) { VpnStatus.logError("Error adding route: " + dest + "/" + mask); } }
    public void addRoutev6(String network, String device) { try { if(mBuilder!=null) {String[] parts = network.split("/"); mBuilder.addRoute(parts[0], Integer.parseInt(parts[1]));} } catch (Exception e) { VpnStatus.logError("Error adding IPv6 route: " + network); } }
    public void setLocalIP(String local, String netmask, int mtu, String mode) { try { if(mBuilder!=null) {CIDRIP localip = new CIDRIP(local, netmask); mBuilder.addAddress(localip.mIp, localip.len); if (mtu > 0) { mBuilder.setMtu(mtu); }} } catch (Exception e) { VpnStatus.logError("Error setting local IP: " + local + "/" + netmask); } }
    public void setLocalIPv6(String ipv6addr) { try { if(mBuilder!=null) {String[] parts = ipv6addr.split("/"); mBuilder.addAddress(parts[0], Integer.parseInt(parts[1]));} } catch (Exception e) { VpnStatus.logError("Error setting local IPv6 address: " + ipv6addr); } }
    public String getTunReopenStatus() { mPersistTun = true; return "ok"; }
    public OpenVPNManagement getManagement() { return null; }
}