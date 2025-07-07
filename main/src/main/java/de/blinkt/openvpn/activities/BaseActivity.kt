/*
 * Copyright (c) 2012-2022 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */
package de.blinkt.openvpn.activities

import android.app.UiModeManager
import android.content.Context
import android.content.res.Configuration
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import de.blinkt.openvpn.core.LocaleHelper

// This is our new, simplified base class.
abstract class BaseActivity : AppCompatActivity() {

    val isAndroidTV: Boolean
        get() {
            val uiModeManager = getSystemService(UI_MODE_SERVICE) as UiModeManager
            return uiModeManager.currentModeType == Configuration.UI_MODE_TYPE_TELEVISION
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // We no longer call enableEdgeToEdge or setUpEdgeEdgeInsetsListener
    }

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(LocaleHelper.updateResources(base))
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        LocaleHelper.onConfigurationChange(this)
    }
}