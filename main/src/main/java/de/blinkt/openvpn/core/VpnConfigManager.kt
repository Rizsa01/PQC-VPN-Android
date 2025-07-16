package de.blinkt.openvpn.activities

import android.content.Context
import android.util.Log
import de.blinkt.openvpn.R // Import your app's R file
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream

object VpnConfigManager {

    private const val TAG = "PQC_VPN_CONFIG"

    fun copyAndGetConfigFile(context: Context): File? {
        // The destination file in the app's private, writable cache directory.
        val configFile = File(context.cacheDir, "openssl.cnf")

        try {
            // Open the resource from res/raw/openssl.cnf
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