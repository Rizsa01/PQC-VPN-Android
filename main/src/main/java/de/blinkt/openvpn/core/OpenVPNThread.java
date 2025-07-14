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
        pb.directory(new File(mTmpDir));

        Map<String, String> env = pb.environment();
        env.put("LD_LIBRARY_PATH", mNativeDir);
        env.put("OPENSSL_CONF", mNativeDir + "/openssl.cnf");
        env.put("OPENSSL_MODULES", mNativeDir + "/ossl-modules");
        env.put("TMPDIR", mTmpDir);

        // ### THIS IS THE KEY ###
        // We will redirect the process's error stream to its output stream.
        // This means any errors (like "provider failed to load") will be captured
        // by the same reader that is listening for normal status messages.
        pb.redirectErrorStream(true);

        Log.i(TAG, "Starting process with command: " + argvlist);
        Log.i(TAG, "Working directory: " + mTmpDir);

        try {
            mProcess = pb.start();

            // Start a thread to write the config to stdin
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


            // Read combined stdout and stderr and log everything
            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {

                String line;
                while ((line = br.readLine()) != null) {
                    // We will now see EVERY line of output from the native process,
                    // including startup errors.
                    Log.e(TAG, "NATIVE_LOG: " + line);
                    VpnStatus.logInfo("P: " + line);
                }
            }

            // Wait for the process to exit and log its code.
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