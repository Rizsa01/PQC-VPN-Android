// In file: de/blinkt/openvpn/core/VPNLaunchHelper.java
package de.blinkt.openvpn.core;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.util.Vector;

public class VPNLaunchHelper {

    // This is the correct name of your executable as seen in your screenshot
    private static final String EXECUTABLE_NAME = "libopenvpn.so";

    /**
     * This method finds the absolute path to our executable.
     * The file is in the native library directory with the correct SELinux context.
     */


    static String[] buildOpenvpnArgv(Context c) {
        Vector<String> args = new Vector<>();
        args.add(getOpenVpnExecutablePath(c));
        args.add("--config");
        args.add("stdin");
        return args.toArray(new String[0]);
    }

    public static void startOpenVpn(VpnProfile startprofile, Context context, String startReason, boolean replace_running_vpn) {
        Intent startVPN = startprofile.getStartServiceIntent(context, startReason, replace_running_vpn);
        if (startVPN != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                context.startForegroundService(startVPN);
            else
                context.startService(startVPN);
        }
    }
    private static String getOpenVpnExecutablePath(Context context) {
        String nativeLibraryDir = context.getApplicationInfo().nativeLibraryDir;
        File openvpnFile = new File(nativeLibraryDir, "libopenvpn.so");

        // Set explicit permissions (MUST HAVE)
        if (openvpnFile.exists()) {
            openvpnFile.setReadable(true);
            openvpnFile.setExecutable(true);  // Critical permission
            openvpnFile.setWritable(false);
        }

        return openvpnFile.getAbsolutePath();
    }
}