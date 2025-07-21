package de.blinkt.openvpn.core

import android.util.Log

object PqcVpnLog {
    private const val TAG = "PQC_VPN_DEBUG"

    @JvmStatic // <-- THE FIX: Makes this method truly static for Java
    fun d(message: String) {
        Log.d(TAG, message)
    }

    @JvmStatic // <-- THE FIX: Makes this method truly static for Java
    fun i(message: String) {
        Log.i(TAG, message)
    }

    @JvmStatic // <-- THE FIX: Makes this method truly static for Java
    fun w(message: String) {
        Log.w(TAG, message)
    }

    @JvmStatic // <-- THE FIX: Makes this method truly static for Java
    fun e(message: String, throwable: Throwable? = null) {
        if (throwable != null) {
            Log.e(TAG, message, throwable)
        } else {
            Log.e(TAG, message)
        }
    }
}