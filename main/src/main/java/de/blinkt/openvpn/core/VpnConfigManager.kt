package de.blinkt.openvpn.activities

import android.content.Context
import android.util.Log
import de.blinkt.openvpn.R
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

object VpnConfigManager {

    private const val TAG = "PQC_VPN_CONFIG"

    // ### DEFINITIVE FIX IS HERE ###
    @JvmStatic
    fun copyAndGetConfigFile(context: Context): File? {
        // The destination file in the app's cache MUST be named "openssl.cnf"
        val configFile = File(context.cacheDir, "openssl.cnf")

        try {
            // Use the correct resource ID that matches your filename.
            context.resources.openRawResource(R.raw.openssl_cnf).use { inputStream ->
                FileOutputStream(configFile).use { outputStream ->
                    inputStream.copyTo(outputStream)
                }
            }
            Log.d(TAG, "Successfully copied OpenSSL config to: ${configFile.absolutePath}")
            return configFile
        } catch (e: IOException) {
            Log.e(TAG, "Failed to copy OpenSSL config resource", e)
            return null
        }
    }
}