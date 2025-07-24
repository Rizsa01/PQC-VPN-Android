package de.blinkt.openvpn.core;

import android.text.TextUtils;
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
import java.util.Map;
public class OpenVPNThread implements Runnable {
    // NOTE: This MUST match the name of your executable in jniLibs
    private static final String OPENVPN_EXECUTABLE_NAME = "libopenvpn.so";
    private final String[] mArgv;
    private final String mTmpDir;
    private final OpenVPNService mService;
    private Process mProcess;
    private final String mOpenSSLConfigPath;

    public OpenVPNThread(OpenVPNService service, String[] argv, String tmpdir , String openSSLConfigPath) {
        this.mService = service;
        this.mArgv = argv;
        this.mTmpDir = tmpdir;
        this.mOpenSSLConfigPath = openSSLConfigPath;
    }

    @Override
    public void run() {
        try {
            startOpenVPN();
        } catch (Exception e) {
            PqcVpnLog.e("!!!!!!!!!! NATIVE PROCESS FAILED TO START !!!!!!!!!!", e);
            VpnStatus.logException("FATAL: OpenVPNThread crashed.", e);
        } finally {
            PqcVpnLog.w("OpenVPN Thread is shutting down.");
            if (mProcess != null) {
                mProcess.destroy();
            }
            VpnStatus.updateStateString("NOPROCESS", "", R.string.state_noprocess, ConnectionStatus.LEVEL_NOTCONNECTED);
        }
    }

    private void startOpenVPN() throws IOException {
        PqcVpnLog.i("OpenVPNThread: startOpenVPN() entered.");

        String nativeLibraryDir = mService.getApplicationInfo().nativeLibraryDir;
        File openvpnFile = new File(nativeLibraryDir, OPENVPN_EXECUTABLE_NAME);
        PqcVpnLog.d("Executable path set to: " + openvpnFile.getAbsolutePath());

        if (!openvpnFile.exists()) {
            PqcVpnLog.e("FATAL: EXECUTABLE DOES NOT EXIST at path. Check jniLibs packaging.", null);
            return;
        }
        PqcVpnLog.i("Executable file exists.");

        // We do not call setExecutable(true). The system installer does this for us.
        if (!openvpnFile.canExecute()) {
            PqcVpnLog.e("FATAL: EXECUTABLE IS NOT EXECUTABLE. Check APK packaging, extractNativeLibs=true in manifest.", null);
            return;
        }
        PqcVpnLog.i("Executable has execute permission.");

        LinkedList<String> argvlist = new LinkedList<>();
        argvlist.add(openvpnFile.getAbsolutePath());
        Collections.addAll(argvlist, mArgv);

        PqcVpnLog.i("Final command to be executed: " + TextUtils.join(" ", argvlist));

        ProcessBuilder pb = new ProcessBuilder(argvlist);
        pb.directory(new File(mTmpDir));
        PqcVpnLog.d("Working directory set to: " + mTmpDir);

        Map<String, String> env = pb.environment();
        env.put("LD_LIBRARY_PATH", nativeLibraryDir);
        env.put("OPENSSL_MODULES", nativeLibraryDir);
        // This tells OpenSSL where to find its configuration file, which activates the provider
        env.put("OPENSSL_CONF", mOpenSSLConfigPath);
        env.put("TMPDIR", mTmpDir);

        PqcVpnLog.d("Environment: LD_LIBRARY_PATH=" + env.get("LD_LIBRARY_PATH"));
        PqcVpnLog.d("Environment: OPENSSL_MODULES=" + env.get("OPENSSL_MODULES"));

        pb.redirectErrorStream(true);

        try {
            PqcVpnLog.i("Starting native process...");
            mProcess = pb.start();
            PqcVpnLog.i("Process started successfully.");

            final OutputStream stdin = mProcess.getOutputStream();
            new Thread(() -> {
                try {
                    mService.writeProfileToStdIn(stdin);
                } catch (IOException e) {
                    PqcVpnLog.e("Error writing config to stdin", e);
                } finally {
                    try {
                        stdin.close();
                    } catch (IOException e) { /* ignore */ }
                }
            }, "OpenVPNConfigWriter").start();

            try (InputStream in = mProcess.getInputStream();
                 BufferedReader br = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {

                PqcVpnLog.i("Waiting for native log output...");
                String line;
                while ((line = br.readLine()) != null) {
                    PqcVpnLog.d("NATIVE: " + line);
                    VpnStatus.logInfo("P: " + line);
                }
            }

            int exitValue = mProcess.waitFor();
            PqcVpnLog.e("Native process exited with value: " + exitValue, null);

        } catch (Exception e) {
            PqcVpnLog.e("An exception occurred while starting or monitoring the process.", e);
            VpnStatus.logException("FATAL: OpenVPNThread crashed.", e);
        }
    }

    public void stopProcess() {
        if (mProcess != null) {
            mProcess.destroy();
        }
    }
}