package de.blinkt.openvpn.core;

import android.util.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

/**
 * A simple thread that captures and logs the stdout/stderr of the native OpenVPN process.
 * Its only purpose is to provide diagnostic visibility.
 */
public class OpenVPNProcessThread implements Runnable {

    private static final String TAG = "PQC_VPN_NATIVE";
    private final Process mProcess;
    private final OpenVPNService mService;

    public OpenVPNProcessThread(Process process, OpenVPNService service) {
        mProcess = process;
        mService = service;
    }

    @Override
    public void run() {
        Log.i(TAG, "Native process monitoring thread started.");
        try {
            // It's crucial to read from the process's input stream.
            // This is the pipe that receives the native process's stdout and stderr.
            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {

                String line;
                while ((line = br.readLine()) != null) {
                    // Log every line from the native process to Logcat.
                    // This will reveal the true error message.
                    Log.i(TAG, line);
                }
            }

            int exitValue = mProcess.waitFor();
            Log.w(TAG, "Native process exited with value: " + exitValue);

        } catch (InterruptedException | IOException e) {
            Log.e(TAG, "Exception in process monitoring thread.", e);
        } finally {
            // When the process dies, ensure the VPN service is stopped cleanly.
            mService.stopVpn();
            Log.i(TAG, "Native process monitoring thread finished.");
        }
    }
}