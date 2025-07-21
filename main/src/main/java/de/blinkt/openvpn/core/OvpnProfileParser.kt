package de.blinkt.openvpn.core

import android.content.Context
import android.net.Uri
import android.provider.OpenableColumns
import java.io.BufferedReader
import java.io.InputStreamReader
import java.lang.Exception

object OvpnProfileParser {

    private enum class ParseState { NONE, CA, CERT, KEY }

    fun parse(context: Context, uri: Uri): VpnProfile? {
        val baseConfig = StringBuilder()
        val ca = StringBuilder()
        val cert = StringBuilder()
        val key = StringBuilder()
        var currentSection = ParseState.NONE

        try {
            context.contentResolver.openInputStream(uri)?.use { inputStream ->
                BufferedReader(InputStreamReader(inputStream)).forEachLine { line ->
                    when {
                        line.trim().equals("<ca>", ignoreCase = true) -> currentSection = ParseState.CA
                        line.trim().equals("</ca>", ignoreCase = true) -> currentSection = ParseState.NONE
                        line.trim().equals("<cert>", ignoreCase = true) -> currentSection = ParseState.CERT
                        line.trim().equals("</cert>", ignoreCase = true) -> currentSection = ParseState.NONE
                        line.trim().equals("<key>", ignoreCase = true) -> currentSection = ParseState.KEY
                        line.trim().equals("</key>", ignoreCase = true) -> currentSection = ParseState.NONE
                        else -> {
                            when (currentSection) {
                                ParseState.NONE -> baseConfig.append(line).append("\n")
                                ParseState.CA -> ca.append(line).append("\n")
                                ParseState.CERT -> cert.append(line).append("\n")
                                ParseState.KEY -> key.append(line).append("\n")
                            }
                        }
                    }
                }
            }

            // The parser is now "dumb". It just moves text around.
            val profileName = getFileName(context, uri) ?: "Imported Profile"
            val profile = VpnProfile(profileName).apply {
                mUseCustomConfig = true
                mCustomConfigOptions = baseConfig.toString().trim() // This contains all directives
                mCaFilename = VpnProfile.INLINE_TAG + ca.toString().trim()
                mClientCertFilename = VpnProfile.INLINE_TAG + cert.toString().trim()
                mClientKeyFilename = VpnProfile.INLINE_TAG + key.toString().trim()
                // NO MORE HARDCODED mPqcKEMs !!!
            }
            return profile

        } catch (e: Exception) {
            VpnStatus.logException("Failed to parse OVPN profile", e)
            return null
        }
    }

    private fun getFileName(context: Context, uri: Uri): String? {
        var result: String? = null
        if (uri.scheme == "content") {
            context.contentResolver.query(uri, null, null, null, null)?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val columnIndex = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                    if (columnIndex != -1) {
                        result = cursor.getString(columnIndex)
                    }
                }
            }
        }
        if (result == null) {
            result = uri.path
            val cut = result?.lastIndexOf('/')
            if (cut != -1) {
                result = result?.substring(cut!! + 1)
            }
        }
        return result
    }
}