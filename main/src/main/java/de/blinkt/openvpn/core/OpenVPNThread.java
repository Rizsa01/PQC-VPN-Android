/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core; // Assuming this is the correct package

import android.annotation.SuppressLint;
import android.content.Context; // Added for getApplicationInfo
import android.content.pm.ApplicationInfo; // Added for getApplicationInfo
import android.text.TextUtils; // Added for TextUtils.join
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Arrays; // Added for Arrays.asList
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map; // Added for Environment Map
import java.util.concurrent.Callable;
// import java.util.concurrent.CompletableFuture; // Not used in provided code
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future; // Not used, but FutureTask is
import java.util.concurrent.FutureTask;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import de.blinkt.openvpn.R; // Assuming R is in de.blinkt.openvpn package

public class OpenVPNThread implements Runnable {
    private static final String DUMP_PATH_STRING = "Dump path: ";
    @SuppressLint("SdCardPath") // This might be problematic if not writing to app-specific dirs
    private static final String TAG = "OpenVPN"; // Standard log tag
    private static final String PQC_VPN_LOG_TAG = "PQC_VPN_Thread"; // Our specific log tag

    private Process mProcess;

    // 1380308330.240114 18000002 Send to HTTP proxy: 'X-Online-Host: bla.blabla.com'
    private static final Pattern LOG_PATTERN = Pattern.compile("(\\d+).(\\d+) ([0-9a-fA-F])+ (.*)"); // Allow uppercase hex
    public static final int M_FATAL = (1 << 4);
    public static final int M_NONFATAL = (1 << 5);
    public static final int M_WARN = (1 << 6);
    public static final int M_DEBUG = (1 << 7);
    private final FutureTask<OutputStream> mStreamFuture;
    private OutputStream mOutputStream;

    private String[] mArgv; // This contains the command and arguments
    private String mNativeDir; // Path to native libraries, should be app's native lib dir
    private String mTmpDir;
    private OpenVPNService mService;
    private String mDumpPath;
    private boolean mNoProcessExitStatus = false;

    public OpenVPNThread(OpenVPNService service, String[] argv, String nativelibdir, String tmpdir) {
        mArgv = argv;
        mNativeDir = nativelibdir; // This should be context.getApplicationInfo().nativeLibraryDir
        mTmpDir = tmpdir;
        mService = service;
        mStreamFuture = new FutureTask<>(() -> mOutputStream);

        // Log the executable being used (mArgv[0])
        if (mArgv != null && mArgv.length > 0) {
            Log.d(PQC_VPN_LOG_TAG, "OpenVPNThread created. Executable: " + mArgv[0]);
            Log.d(PQC_VPN_LOG_TAG, "mNativeDir provided to OpenVPNThread: " + mNativeDir);
        } else {
            Log.e(PQC_VPN_LOG_TAG, "OpenVPNThread created with null or empty argv!");
        }
    }

    public void stopProcess() {
        if (mProcess != null) {
            Log.d(PQC_VPN_LOG_TAG, "destroy() called on mProcess");
            mProcess.destroy();
        } else {
            Log.w(PQC_VPN_LOG_TAG, "stopProcess called but mProcess is null.");
        }
    }

    void setReplaceConnection() {
        mNoProcessExitStatus = true;
    }

    @Override
    public void run() {
        try {
            Log.i(PQC_VPN_LOG_TAG, "Starting OpenVPN process with args: " + Arrays.toString(mArgv));
            startOpenVPNThreadArgs(mArgv); // mArgv should already have the corrected executable path
            Log.i(PQC_VPN_LOG_TAG, "OpenVPN process exited.");
        } catch (Exception e) {
            VpnStatus.logException("Starting OpenVPN Thread", e);
            Log.e(PQC_VPN_LOG_TAG, "OpenVPNThread Got Exception " + e.toString(), e);
        } finally {
            int exitvalue = 0;
            try {
                if (mProcess != null)
                    exitvalue = mProcess.waitFor();
                else
                    Log.w(PQC_VPN_LOG_TAG, "mProcess was null in finally block, cannot call waitFor().");
            } catch (IllegalThreadStateException ite) {
                VpnStatus.logError("Illegal Thread state in OpenVPNThread: " + ite.getLocalizedMessage());
                Log.e(PQC_VPN_LOG_TAG, "IllegalThreadStateException in finally", ite);
            } catch (InterruptedException ie) {
                VpnStatus.logError("InterruptedException in OpenVPNThread: " + ie.getLocalizedMessage());
                Log.w(PQC_VPN_LOG_TAG, "InterruptedException in finally", ie);
                Thread.currentThread().interrupt(); // Restore interrupted status
            }

            if (exitvalue != 0) {
                VpnStatus.logError("Process exited with exit value " + exitvalue);
                Log.e(PQC_VPN_LOG_TAG, "OpenVPN Process exited with non-zero value: " + exitvalue);
            }

            if (!mNoProcessExitStatus) {
                VpnStatus.updateStateString("NOPROCESS", "No process running.", R.string.state_noprocess, ConnectionStatus.LEVEL_NOTCONNECTED);
            }

            if (mDumpPath != null) {
                Log.d(PQC_VPN_LOG_TAG, "Minidump path found: " + mDumpPath + ". Writing log.");
                try {
                    BufferedWriter logout = new BufferedWriter(new FileWriter(mDumpPath + ".log"));
                    // Locale.US is generally safer for formatting that might be machine parsed
                    SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
                    for (LogItem li : VpnStatus.getlogbuffer()) {
                        String time = timeformat.format(new Date(li.getLogtime()));
                        logout.write(time + " " + li.getString(mService) + "\n");
                    }
                    logout.close();
                    VpnStatus.logError(R.string.minidump_generated);
                } catch (IOException e) {
                    VpnStatus.logError("Writing minidump log failed: " + e.getLocalizedMessage());
                    Log.e(PQC_VPN_LOG_TAG, "IOException writing minidump log", e);
                }
            }

            if (!mNoProcessExitStatus) {
                if (mService != null) { // Add null check for mService
                    //mService.openvpnStopped();
                } else {
                    Log.e(PQC_VPN_LOG_TAG, "mService is null in finally, cannot call openvpnStopped().");
                }
            }
            Log.i(PQC_VPN_LOG_TAG, "OpenVPNThread finished.");
        }
    }

    private void startOpenVPNThreadArgs(String[] argv) { // argv already contains the executable path as first element
        LinkedList<String> argvlist = new LinkedList<>();
        Collections.addAll(argvlist, argv);

        ProcessBuilder pb = new ProcessBuilder(argvlist);

        // Get the application's native library directory for environment variables
        // mNativeDir passed to constructor should be this value. Let's verify or use it.
        String effectiveNativeDir = mNativeDir;
        if (mService != null) { // mService can be null if thread is detached quickly
            ApplicationInfo appInfo = mService.getApplicationInfo();
            if (appInfo != null && appInfo.nativeLibraryDir != null) {
                effectiveNativeDir = appInfo.nativeLibraryDir;
            } else {
                Log.w(PQC_VPN_LOG_TAG, "Could not get nativeLibraryDir from service context, using mNativeDir: " + mNativeDir);
            }
        } else {
            Log.w(PQC_VPN_LOG_TAG, "mService is null, cannot reliably get nativeLibraryDir, using mNativeDir: " + mNativeDir);
        }

        if (TextUtils.isEmpty(effectiveNativeDir)) {
            Log.e(PQC_VPN_LOG_TAG, "FATAL: effectiveNativeDir is empty or null. Cannot set environment variables for OpenSSL.");
            // This would likely cause OpenVPN to fail to find its PQC dependencies.
            // Consider throwing an exception or stopping if this is critical.
            VpnStatus.logError("Native library directory not found, PQC OpenSSL might fail.");
        }


        // --- PQC MODIFICATION: Set Environment Variables ---
        Map<String, String> env = pb.environment();

        if (!TextUtils.isEmpty(effectiveNativeDir)) {
            String openSslConfPath = effectiveNativeDir + "/openssl.cnf";
            env.put("OPENSSL_CONF", openSslConfPath);
            Log.d(PQC_VPN_LOG_TAG, "Set OPENSSL_CONF=" + openSslConfPath);

            String openSslModulesPath = effectiveNativeDir + "/ossl-modules";
            env.put("OPENSSL_MODULES", openSslModulesPath);
            Log.d(PQC_VPN_LOG_TAG, "Set OPENSSL_MODULES=" + openSslModulesPath);
        }
        // --- END PQC MODIFICATION ---

        // Original LD_LIBRARY_PATH logic (genLibraryPath is complex, keep it but ensure our libs are found via RPATH)
        // The RPATH=$ORIGIN in your openvpn executable should handle finding libpqc_crypto.so etc.
        // The LD_LIBRARY_PATH set here by genLibraryPath might be for other NDK libraries ics-openvpn uses.
        String lbpath = genLibraryPath(argv, pb); // argv here is the original String[] mArgv
        env.put("LD_LIBRARY_PATH", lbpath);
        Log.d(PQC_VPN_LOG_TAG, "Setting LD_LIBRARY_PATH (from genLibraryPath) to: " + lbpath);

        if (!TextUtils.isEmpty(mTmpDir)) { // Add null/empty check for mTmpDir
            env.put("TMPDIR", mTmpDir);
            Log.d(PQC_VPN_LOG_TAG, "Setting TMPDIR=" + mTmpDir);
        } else {
            Log.w(PQC_VPN_LOG_TAG, "mTmpDir is empty, TMPDIR environment variable not set.");
        }


        pb.redirectErrorStream(true);
        Log.i(PQC_VPN_LOG_TAG, "Preparing to start OpenVPN process. Command: " + TextUtils.join(" ", argvlist));
        Log.i(PQC_VPN_LOG_TAG, "Process environment: " + pb.environment().toString());


        try {
            mProcess = pb.start();
            Log.i(PQC_VPN_LOG_TAG, "OpenVPN process started successfully.");

            // Close the output stream, since we don't need it (OpenVPN reads config, then uses management interface)
            // However, OpenVPN might write to stdin for password prompts if management-query-passwords is used
            // and password is not cached. mOutputStream handles this.
            OutputStream processStdin = mProcess.getOutputStream(); // This is stdin for the OpenVPN process
            mOutputStream = processStdin; // Make it available via getOpenVPNStdin()
            mStreamFuture.run(); // Completes the FutureTask so getOpenVPNStdin() can return it.


            InputStream processStdout = mProcess.getInputStream(); // This is stdout/stderr of OpenVPN process
            BufferedReader br = new BufferedReader(new InputStreamReader(processStdout, StandardCharsets.UTF_8));

            Log.d(PQC_VPN_LOG_TAG, "Reading OpenVPN process output...");
            String logline;
            while ((logline = br.readLine()) != null) { // Check for null to detect EOF
                if (logline.startsWith(DUMP_PATH_STRING)) {
                    mDumpPath = logline.substring(DUMP_PATH_STRING.length());
                    Log.d(PQC_VPN_LOG_TAG, "Minidump path received: " + mDumpPath);
                }

                // Log parsing logic (keep as is)
                Matcher m = LOG_PATTERN.matcher(logline);
                if (m.matches()) {
                    // int flags = Integer.parseInt(m.group(3), 16); // Original
                    long flagsLong = Long.parseLong(m.group(3), 16); // Use long for safety if hex is large
                    int flags = (int) flagsLong;

                    String msg = m.group(4);
                    int logLevel = flags & 0x0F; // Lower 4 bits for level

                    VpnStatus.LogLevel currentLogLevel = VpnStatus.LogLevel.INFO; // Default

                    if ((flags & M_FATAL) != 0)
                        currentLogLevel = VpnStatus.LogLevel.ERROR;
                    else if ((flags & M_NONFATAL) != 0)
                        currentLogLevel = VpnStatus.LogLevel.WARNING; // NonFatal often implies Warning
                    else if ((flags & M_WARN) != 0)
                        currentLogLevel = VpnStatus.LogLevel.WARNING;
                    else if ((flags & M_DEBUG) != 0)
                        currentLogLevel = VpnStatus.LogLevel.VERBOSE;

                    // Demote noisy management messages unless actual log level is high
                    if (msg.startsWith("MANAGEMENT: CMD"))
                        logLevel = Math.max(VpnStatus.LogLevel.VERBOSE.getInt(), logLevel);


                    VpnStatus.logMessageOpenVPN(currentLogLevel, logLevel, msg);
                    VpnStatus.addExtraHints(msg); // For specific status updates based on log messages
                } else {
                    // Non-standard log line, log as info
                    VpnStatus.logInfo("P:" + logline); // "P:" prefix indicates raw process output
                }

                if (Thread.interrupted()) {
                    Log.w(PQC_VPN_LOG_TAG, "OpenVPNThread interrupted, stopping process.");
                    throw new InterruptedException("OpenVPN process thread was interrupted.");
                }
            }
            Log.d(PQC_VPN_LOG_TAG, "OpenVPN process output stream finished (readLine returned null).");

        } catch (InterruptedException e) {
            Log.w(PQC_VPN_LOG_TAG, "OpenVPNThread run interrupted.", e);
            if (mStreamFuture != null) mStreamFuture.cancel(true);
            stopProcess(); // Ensure process is killed if thread is interrupted
            Thread.currentThread().interrupt(); // Preserve interrupt status
        } catch (IOException e) {
            VpnStatus.logException("IOException in OpenVPNThread run loop", e);
            Log.e(PQC_VPN_LOG_TAG, "IOException in OpenVPNThread run loop", e);
            if (mStreamFuture != null) mStreamFuture.cancel(true);
            stopProcess(); // Ensure process is killed on IO exception
        }
    }

    // genLibraryPath: This function attempts to construct LD_LIBRARY_PATH.
    // With RPATH=$ORIGIN in your 'openvpn' executable and all .so files in the same
    // nativeLibraryDir, this LD_LIBRARY_PATH manipulation might be less critical for
    // your custom libs, but ics-openvpn might use it for other NDK libs it bundles.
    // Keep its logic, but our primary mechanism for PQC libs is RPATH.
    private String genLibraryPath(String[] argv, ProcessBuilder pb) {
        // argv[0] is the full path to the executable, e.g., /data/app/.../cache/pie_openvpn...
        // or /data/app/.../lib/arm64/openvpn (our new case).
        // The logic tries to find the corresponding /lib directory.
        String applibpath = argv[0].replaceFirst("/cache/.*$", "/lib"); // Original logic
        if (!applibpath.endsWith("/lib")) { // If argv[0] was already in /lib (our case)
            File exeFile = new File(argv[0]);
            if (exeFile.getParent() != null) {
                applibpath = exeFile.getParent(); // Should be nativeLibraryDir
            } else {
                applibpath = mNativeDir; // Fallback to mNativeDir if parent is null
            }
        }
        Log.d(PQC_VPN_LOG_TAG, "genLibraryPath: applibpath derived as: " + applibpath);


        String lbpath = pb.environment().get("LD_LIBRARY_PATH");
        if (lbpath == null)
            lbpath = applibpath;
        else
            lbpath = applibpath + ":" + lbpath;

        // mNativeDir should be the app's nativeLibraryDir. If applibpath is already that,
        // adding mNativeDir again is redundant but harmless if paths are deduplicated.
        // This ensures mNativeDir is definitely in the path.
        if (mNativeDir != null && !mNativeDir.equals(applibpath)) {
            lbpath = mNativeDir + ":" + lbpath;
        }

        // Deduplicate paths in lbpath (simple approach)
        if (lbpath != null) {
            String[] paths = lbpath.split(":");
            LinkedList<String> uniquePaths = new LinkedList<>();
            for (String p : paths) {
                if (!TextUtils.isEmpty(p) && !uniquePaths.contains(p)) {
                    uniquePaths.add(p);
                }
            }
            lbpath = TextUtils.join(":", uniquePaths);
        }

        Log.d(PQC_VPN_LOG_TAG, "genLibraryPath: final LD_LIBRARY_PATH: " + lbpath);
        return lbpath;
    }

    public OutputStream getOpenVPNStdin() throws ExecutionException, InterruptedException {
        // This allows OpenVPNManagement to write to the OpenVPN process's stdin,
        // typically for passwords if management-query-passwords is used.
        if (mStreamFuture == null) {
            Log.e(PQC_VPN_LOG_TAG, "getOpenVPNStdin: mStreamFuture is null!");
            return null; // Or throw exception
        }
        return mStreamFuture.get(); // Waits for mOutputStream to be set
    }
}