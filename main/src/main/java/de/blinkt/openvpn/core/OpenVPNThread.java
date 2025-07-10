/*
 * Copyright (c) 2012-2022 Arne Schwabe & Contributors
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

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
            VpnStatus.logException("OpenVPNThread Exception", e);
        }
    }

    private void startOpenVPN() throws IOException {
        LinkedList<String> argvlist = new LinkedList<>();
        Collections.addAll(argvlist, mArgv);

        ProcessBuilder pb = new ProcessBuilder(argvlist);
        Map<String, String> env = pb.environment();

        // Environment variables must be set correctly for our PQC libraries to work.
        env.put("OPENSSL_CONF", mNativeDir + "/openssl.cnf");
        env.put("OPENSSL_MODULES", mNativeDir + "/ossl-modules");
        env.put("TMPDIR", mTmpDir);

        pb.redirectErrorStream(true);

        try {
            Log.i(TAG, "Starting process with command: " + argvlist);
            Log.i(TAG, "Starting process with environment: " + env);
            mProcess = pb.start();

            // =======================================================================================
            // ### BEGIN DEFINITIVE CORRECTION ###
            // This is the fix for the ANR. We start a new thread whose ONLY job
            // is to write the config file. This prevents the main process thread
            // from blocking on I/O.
            OutputStream stdin = mProcess.getOutputStream();
            new Thread(() -> {
                try {
                    // Call back to the service to get the profile and write it.
                    mService.writeProfileToStdIn(stdin);
                } catch (IOException e) {
                    VpnStatus.logException("Error writing config to stdin", e);
                }
            }, "OpenVPNConfigWriter").start();
            // ### END DEFINITIVE CORRECTION ###
            // =======================================================================================


            // Read output and log it
            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
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

    // This method is no longer needed as the service doesn't need to get the stream.
    // public OutputStream getOpenVPNStdin() ...

    public void stopProcess() {
        if (mProcess != null) {
            mProcess.destroy();
        }
    }
}