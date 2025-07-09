/*
 * Copyright (c) 2012-2022 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.util.Log; // Import the Log class

import java.util.concurrent.Executors; // Import the executor

import de.blinkt.openvpn.BuildConfig;

public class ICSOpenVPNApplication extends Application {
    private StatusListener mStatus;

    @Override
    public void onCreate() {
        super.onCreate();

        if (BuildConfig.BUILD_TYPE.equals("debug")) {
            // Optional: Enable strict modes if needed for advanced debugging.
        }

        // =======================================================================================
        // ### BEGIN DEFINITIVE AND ONLY CHANGE ###
        // The startup freeze (ANR) is caused by the slow, blocking initialization
        // of the native libraries. We will trigger this initialization now, on a
        // background thread, so it does not block the main UI thread.

        Executors.newSingleThreadExecutor().execute(() -> {
            try {
                Log.d("PQC_VPN_App", "Starting background native library pre-load.");
                // This is the call that forces the OS to load our JNI wrapper ('libopenvpn.so')
                // and all of its dependencies (libpqccrypto.so, liboqs.so, etc.).
                // This is the slow operation. By doing it here, in the background,
                // we prevent the main thread from freezing at startup.
                System.loadLibrary("openvpn");
                Log.d("PQC_VPN_App", "Background native library pre-load complete.");
            } catch (Throwable t) {
                // Catch any error during loading and log it.
                Log.e("PQC_VPN_App", "Critical error during native library pre-load.", t);
            }
        });
        // ### END DEFINITIVE AND ONLY CHANGE ###
        // =======================================================================================


        // We still want to initialize the status listener
        mStatus = new StatusListener();
        mStatus.init(getApplicationContext());

        // This is harmless and can be kept.
        createFirstLaunchSetting();
    }

    private void createFirstLaunchSetting() {
        SharedPreferences prefs = Preferences.getDefaultSharedPreferences(this);
        if (prefs.getLong("firstStart", 0) == 0) {
            SharedPreferences.Editor pedit = prefs.edit();
            pedit.putLong("firstStart", System.currentTimeMillis());
            pedit.apply();
        }
    }

    // LocaleHelper methods are still needed if you want to support different languages in the future,
    // but they are safe to keep even for an English-only app.
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(LocaleHelper.updateResources(base));
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        LocaleHelper.onConfigurationChange(this);
    }
}