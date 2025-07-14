/*
 * Copyright (c) 2012-2022 Arne Schwabe & Contributors
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Map;
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
            //==================================================================
            // ### THE DEFINITIVE DEBUGGING FIX ###
            // This block will now "unwrap" the exception to find the root cause
            // and print it to the log in red. This is the information we need.
            Log.e(TAG, "!!!!!!!!!! NATIVE PROCESS FAILED TO START !!!!!!!!!!");

            Throwable cause = e;
            while (cause.getCause() != null) {
                cause = cause.getCause();
            }

            // Log the root cause of the failure
            Log.e(TAG, "Root cause: " + cause.getMessage());
            // Also print the full stack trace of the root cause for context
            cause.printStackTrace();

            // This original log is still useful
            VpnStatus.logException("FATAL: OpenVPNThread crashed.", e);
            //==================================================================

        } finally {
            Log.i(TAG, "OpenVPN Thread shutting down.");
            if (mProcess != null) {
                mProcess.destroy();
            }
            VpnStatus.updateStateString("NOPROCESS", "", R.string.state_noprocess, ConnectionStatus.LEVEL_NOTCONNECTED);
        }
    }

    // The rest of the file remains the same. The only change is adding the Log.e line above.
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
        pb.redirectErrorStream(false);
        try {
            Log.i(TAG, "Starting process with command: " + argvlist);
            Log.i(TAG, "Working directory: " + mTmpDir);
            Log.i(TAG, "Starting process with environment: " + env);
            mProcess = pb.start();
            final OutputStream stdin = mProcess.getOutputStream();
            new Thread(() -> {
                try {
                    mService.writeProfileToStdIn(stdin);
                } catch (IOException ex) {
                    VpnStatus.logException("Error writing config to stdin", ex);
                } finally {
                    try { stdin.close(); } catch (IOException ex) { /* ignore */ }
                }
            }, "OpenVPNConfigWriter").start();
            final InputStream stderr = mProcess.getErrorStream();
            new Thread(() -> {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(stderr))) {
                    String line;
                    while ((line = br.readLine()) != null) {
                        VpnStatus.logError("E: " + line);
                    }
                } catch (IOException ex) { /* process died */ }
            }, "OpenVPNErrorReader").start();
            try (InputStream stdout = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(stdout, StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
                    VpnStatus.logInfo("P: " + line);
                }
            }
            int exitValue = mProcess.waitFor();
            if (exitValue != 0) {
                VpnStatus.logError("OpenVPN process exited with non-zero exit value: " + exitValue);
            }
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