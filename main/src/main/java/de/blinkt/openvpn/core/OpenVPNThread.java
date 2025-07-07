// In file: de/blinkt/openvpn/core/OpenVPNThread.java
package de.blinkt.openvpn.core;

import android.util.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import de.blinkt.openvpn.R;

public class OpenVPNThread implements Runnable {
    private static final String TAG = "PQC_VPN_Thread";
    private Process mProcess;
    private final String[] mArgv;
    private final String mNativeDir;
    private final String mTmpDir;
    private final FutureTask<OutputStream> mStreamFuture;
    private OutputStream mOutputStream;

    public OpenVPNThread(OpenVPNService service, String[] argv, String nativelibdir, String tmpdir) {
        this.mArgv = argv;
        this.mNativeDir = nativelibdir;
        this.mTmpDir = tmpdir;
        this.mStreamFuture = new FutureTask<>(() -> mOutputStream);
    }

    @Override
    public void run() {
        try {
            startOpenVPN();
        } catch (Exception e) {
            VpnStatus.logException("OpenVPNThread Exception", e);
        }
    }

    private void startOpenVPN() throws IOException {
        LinkedList<String> argvlist = new LinkedList<>();
        Collections.addAll(argvlist, mArgv);

        ProcessBuilder pb = new ProcessBuilder(argvlist);
        Map<String, String> env = pb.environment();

        // THE FINAL, CRITICAL FIX:
        // Set the LD_LIBRARY_PATH to our app's native library directory.
        // This tells the dynamic linker where to find libpqcssl.so, liboqs.so, etc.
        env.put("LD_LIBRARY_PATH", mNativeDir);
        Log.i(TAG, "Set LD_LIBRARY_PATH=" + mNativeDir);

        // Also set the OpenSSL config paths for our custom provider
        env.put("OPENSSL_CONF", mNativeDir + "/openssl.cnf");
        env.put("OPENSSL_MODULES", mNativeDir + "/ossl-modules");
        env.put("TMPDIR", mTmpDir);

        pb.redirectErrorStream(true);

        try {
            Log.i(TAG, "Starting process with command: " + argvlist);
            Log.i(TAG, "Starting process with environment: " + env);
            mProcess = pb.start();
            mOutputStream = mProcess.getOutputStream();
            mStreamFuture.run(); // Signal that the stream is ready

            // Read output and log it
            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
                    // Use the VpnStatus logger to see OpenVPN's output in the app's log screen
                    VpnStatus.logInfo("P: " + line);
                }
            }
            mProcess.waitFor();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            Log.e(TAG, "OpenVPN thread interrupted", e);
        } finally {
            if (mProcess != null) {
                mProcess.destroy();
            }
            Log.i(TAG, "OpenVPN Thread finished.");
            VpnStatus.updateStateString("NOPROCESS", "", R.string.state_noprocess, ConnectionStatus.LEVEL_NOTCONNECTED);
        }
    }

    public OutputStream getOpenVPNStdin() throws ExecutionException, InterruptedException {
        return mStreamFuture.get();
    }

    public void stopProcess() {
        if (mProcess != null) {
            mProcess.destroy();
        }
    }
}