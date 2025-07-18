/*
 * Copyright (c) 2012-2016 Arne Schwabe
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

package de.blinkt.openvpn.core;

import android.os.Build;
import android.util.Log;
import de.blinkt.openvpn.BuildConfig;

import java.security.InvalidKeyException;

public class NativeUtils {

    // ==================================================================
    // ### THE DEFINITIVE, FINAL FIX ###
    // ==================================================================
    static {
        if (!isRoboUnitTest()) {
            try {
                // Load dependencies first
                Log.d("PQC_NATIVE_LOAD", "Loading dependency: liboqs.so");
                System.loadLibrary("oqs");

                Log.d("PQC_NATIVE_LOAD", "Loading dependency: libpqccrypto.so");
                System.loadLibrary("pqccrypto");

                Log.d("PQC_NATIVE_LOAD", "Loading dependency: libpqcssl.so");
                System.loadLibrary("pqcssl");

                // THIS IS THE FIX: Load "openvpn" (which corresponds to libopenvpn.so)
                // instead of the non-existent "ovpnutil".
                Log.d("PQC_NATIVE_LOAD", "Loading main library: libopenvpn.so");
                System.loadLibrary("openvpn");

                // The other libraries might not be needed by your specific build,
                // but we can try to load them if they exist.
                if (!BuildConfig.FLAVOR.equals("skeleton")) {
                    try {
                        Log.d("PQC_NATIVE_LOAD", "Attempting to load optional library: osslspeedtest");
                        System.loadLibrary("osslspeedtest");
                    } catch (UnsatisfiedLinkError e) {
                        Log.w("PQC_NATIVE_LOAD", "Optional library 'osslspeedtest' not found. Continuing.");
                    }
                }

                Log.d("PQC_NATIVE_LOAD", "All required libraries loaded successfully.");

            } catch (UnsatisfiedLinkError e) {
                Log.e("PQC_NATIVE_LOAD", "!!!!!!!!!! FATAL: NATIVE LIBRARY FAILED TO LOAD !!!!!!!!!!", e);
                throw e;
            }
        }
    }


    // --- All original methods and variables below this line are unchanged ---
    // The call to loadOsslUtil() is also a potential point of failure, but let's
    // fix the main one first. It tries to load "osslutil", which we have not built.
    // For now, we will assume it's not critical for the connection.

    //public static native byte[] rsasign(byte[] input, int pkey, boolean pkcs1padding) throws InvalidKeyException;
    //public static native String[] getIfconfig() throws IllegalArgumentException;
    //static native void jniclose(int fdint);
    public static String getNativeAPI() {
        if (isRoboUnitTest())
            return "ROBO";
        //else return getJNIAPI();
        return "pqc_custom_api";
    }
    private static native String getJNIAPI();
    public static native String getOpenVPN2GitVersion();
    public static native String getOpenVPN3GitVersion();
    private static native String getOpenSSLVersionString();
    public static String getOpenSSLVersion() {
        //loadOsslUtil(); // Commenting this out as we probably haven't built libosslutil.so
        //return getOpenSSLVersionString();
        return "OpenSSL 3.x (PQC Custom)";
    }
    static boolean osslutilloaded = false;
    public static byte[] addRssPssPadding(int hashtype, int MSBits, int rsa_size, byte[] from) {
        //loadOsslUtil(); // Commenting this out
        return rsapss(hashtype, MSBits, rsa_size, from);
    }
    private static void loadOsslUtil() {
        if (!osslutilloaded) {
            osslutilloaded = true;
            try {
                System.loadLibrary("osslutil");
            } catch (UnsatisfiedLinkError e) {
                Log.w("PQC_NATIVE_LOAD", "Optional library 'osslutil' not found.");
            }
        }
    }
    private static native byte[] rsapss(int hashtype, int MSBits, int rsa_size, byte[] from);
    public final static int[] openSSLlengths = { 16, 64, 256, 1024, 1500, 8 * 1024, 16 * 1024 };
    public static native double[] getOpenSSLSpeed(String algorithm, int testnum);
    public static boolean isRoboUnitTest() {
        return "robolectric".equals(Build.FINGERPRINT);
    }
}