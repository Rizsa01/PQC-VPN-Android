/*
 * Copyright (c) 2012-2020 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import androidx.browser.customtabs.CustomTabsIntent;

import java.util.List;

public class VariantConfig {
    static Intent getOpenUrlIntent(Context c, boolean external) {
        return new Intent(Intent.ACTION_VIEW);
    }

    /**
     * @return true if there is at least one Custom Tabs provider on the device.
     */
    public static boolean isCustomTabSupported(Context ctx) {
        Intent serviceIntent = new Intent("android.support.customtabs.action.CustomTabsService");
        // You can restrict to Chrome by setting .setPackage("com.android.chrome") if you like
        List<ResolveInfo> resolved = ctx.getPackageManager()
                .queryIntentServices(serviceIntent, PackageManager.MATCH_DEFAULT_ONLY);
        return resolved != null && !resolved.isEmpty();
    }

    /**
     * Build a Custom Tabs Intent pointing at the given URI.
     */
    public static Intent getCustomTabIntent(Context ctx, Uri uri) {
        CustomTabsIntent.Builder builder = new CustomTabsIntent.Builder();
        // Optionally customize toolbar color, enter/exit animations, etc:
        // builder.setToolbarColor(...);
        CustomTabsIntent customTabsIntent = builder.build();
        customTabsIntent.intent.setData(uri);
        return customTabsIntent.intent;
    }

}
