package de.blinkt.openvpn.core;

import android.content.Context;
import android.content.Intent;
import android.os.Build;

public class VPNLaunchHelper {

    /**
     * This is the original, correct method signature that other parts of the app use.
     */
    public static void startOpenVpn(VpnProfile startprofile, Context context, String startReason, boolean replace_running_vpn) {
        // =======================================================================================
        // ### BEGIN DEFINITIVE CORRECTION ###
        // The error is here. The getStartServiceIntent method in VpnProfile requires
        // all three parameters to be passed along. My previous fix was wrong.
        Intent startVPN = startprofile.getStartServiceIntent(context, startReason, replace_running_vpn);
        // ### END DEFINITIVE CORRECTION ###
        // =======================================================================================

        if (startVPN != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(startVPN);
            } else {
                context.startService(startVPN);
            }
        }
    }

    /**
     * This helper method builds the initial command-line arguments.
     * It is used by OpenVPNService to construct the command.
     */
    static String[] buildOpenvpnArgv(Context c) {
        // ==================================================================
        // ### THE DEFINITIVE, FINAL FIX ###
        // The OpenVPNThread architecture requires that all flags are passed
        // via this helper. We add the no-exec flags here to prevent the
        // native process from attempting privileged operations.
        return new String[] {
                "--config", "stdin",
                "--ifconfig-noexec",
                "--route-noexec"
        };
        // ==================================================================
    }
}