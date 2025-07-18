package de.blinkt.openvpn.core;

import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedList;
import java.util.Map;
import java.util.Collections;
import de.blinkt.openvpn.R;

public class OpenVPNThread implements Runnable {
    private static final String TAG = "PQC_VPN_Thread";
    private Process mProcess;
    private final String[] mArgv;
    private final String mNativeDir;
    private final String mTmpDir;
    private final OpenVPNService mService;




    public OpenVPNThread(OpenVPNService service, String[] argv, String nativelibdir, String tmpdir) {
        this.mService = service;
        this.mArgv = argv;
        this.mNativeDir = nativelibdir;
        this.mTmpDir = tmpdir;
    }

    @Override
    public void run() {
        try {
            startOpenVPN();
        } catch (Exception e) {
            Log.e(TAG, "!!!!!!!!!! NATIVE PROCESS FAILED TO START !!!!!!!!!!", e);
            VpnStatus.logException("FATAL: OpenVPNThread crashed.", e);
        } finally {
            Log.i(TAG, "OpenVPN Thread shutting down.");
            if (mProcess != null) {
                mProcess.destroy();
            }
            VpnStatus.updateStateString("NOPROCESS", "", R.string.state_noprocess, ConnectionStatus.LEVEL_NOTCONNECTED);
        }
    }

    private void startOpenVPN() throws IOException {
        LinkedList<String> argvlist = new LinkedList<>();
        Collections.addAll(argvlist, mArgv);

        ProcessBuilder pb = new ProcessBuilder(argvlist);

        // THIS IS THE MOST IMPORTANT PART
        Map<String, String> env = pb.environment();

        // This tells the executable where to find liboqs.so, libpqccrypto.so, etc.
        env.put("LD_LIBRARY_PATH", mNativeDir);

        // This tells OpenSSL where to find the config file that loads the PQC provider.
        //String openSslConfigPath = new File(mService.getCacheDir(), "openssl.cnf").getAbsolutePath();
        //env.put("OPENSSL_CONF", openSslConfigPath);
        env.put("OPENSSL_MODULES", mNativeDir);
        env.put("TMPDIR", mTmpDir);
        pb.redirectErrorStream(true);

        Log.i(TAG, "Starting process with command: " + argvlist);
        Log.i(TAG, "Setting LD_LIBRARY_PATH=" + mNativeDir);
        //Log.i(TAG, "Setting OPENSSL_CONF=" + openSslConfigPath);

        try {
            mProcess = pb.start();

            // This part for writing the config to stdin is correct and remains.
            final OutputStream stdin = mProcess.getOutputStream();
            new Thread(() -> {
                try {
                    mService.writeProfileToStdIn(stdin);
                } catch (IOException e) {
                    VpnStatus.logException("Error writing config to stdin", e);
                } finally {
                    try { stdin.close(); } catch (IOException e) { /* ignore */ }
                }
            }, "OpenVPNConfigWriter").start();

            // This part for reading logs is correct and remains.
            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
                    Log.i(TAG, "NATIVE_LOG: " + line); // Use INFO level to distinguish from errors
                    VpnStatus.logInfo("P: " + line);
                }
            }

            // This part for waiting for exit is correct and remains.
            int exitValue = mProcess.waitFor();
            Log.e(TAG, "Native process exited with value: " + exitValue);

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public void stopProcess() {
        if (mProcess != null) {
            mProcess.destroy();
        }
    }
}