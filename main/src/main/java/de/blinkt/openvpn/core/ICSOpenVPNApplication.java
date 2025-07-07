/*
 * Copyright (c) 2012-2022 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;

import de.blinkt.openvpn.BuildConfig;

public class ICSOpenVPNApplication extends Application {
    private StatusListener mStatus;

    @Override
    public void onCreate() {
        super.onCreate();

        // This is still useful for debugging if you need it.
        if (BuildConfig.BUILD_TYPE.equals("debug")) {
            // Optional: Enable strict modes if needed for advanced debugging.
            // enableStrictModes();
        }

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