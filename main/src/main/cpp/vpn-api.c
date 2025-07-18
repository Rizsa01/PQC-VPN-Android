#include <jni.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

// You MUST add this include for logging
#include <android/log.h>

#include "jnicommon.h"

// Define a logging tag
#define PQC_LOG_TAG "PQC_VPN_JNI"

// This is the JNI function that VPNThread.java calls to start the process.
JNIEXPORT void JNICALL
Java_de_blinkt_openvpn_core_VPNThread_run(JNIEnv *env, jclass clazz, jobjectArray argv) {
    // Get the number of arguments from the Java array
    jsize argc = (*env)->GetArrayLength(env, argv);

    // Allocate memory for a C-style argument array (argc + 1 for the NULL terminator)
    char **argv_c = (char **) malloc(sizeof(char *) * (argc + 1));
    if (argv_c == NULL) return; // Allocation failed

    // Copy arguments from Java String[] to C char**
    for (int i = 0; i < argc; ++i) {
        jstring str = (jstring) (*env)->GetObjectArrayElement(env, argv, i);
        const char *my_string = (*env)->GetStringUTFChars(env, str, 0);
        argv_c[i] = strdup(my_string);
        (*env)->ReleaseStringUTFChars(env, str, my_string);
    }
    // The last element of argv in C must be NULL.
    argv_c[argc] = NULL;

    // ##################################################################
    // ### BEGIN DEFINITIVE FIX: SET OPENSSL ENVIRONMENT VARIABLES    ###
    // ##################################################################

    // Get the absolute path to our native libraries directory, passed from Java
    const char* native_dir = ovpn_get_native_lib_path();

    // Set the environment variable for OpenSSL to find our PQC provider.
    // The '1' means to overwrite the variable if it already exists.
    // The embedded openssl.cnf tells OpenSSL to load "oqsprovider.so", and
    // this variable tells it WHERE to look for that file.
    if (native_dir != NULL && strlen(native_dir) > 0) {
        setenv("OPENSSL_MODULES", native_dir, 1);

        // Log the path to confirm it is correct. You can view this in Logcat.
        __android_log_print(ANDROID_LOG_INFO, PQC_LOG_TAG, "Set OPENSSL_MODULES=%s", native_dir);
    } else {
        __android_log_print(ANDROID_LOG_ERROR, PQC_LOG_TAG, "Native library path is NULL or empty, cannot set OPENSSL_MODULES.");
    }

    // ##################################################################
    // ### END DEFINITIVE FIX                                         ###
    // ##################################################################


    // This part is already correct in your file, it constructs the full path
    // to the executable using the first argument passed from Java.
    const char* executable_path = argv_c[0];

    // Log the command we are about to execute
    __android_log_print(ANDROID_LOG_INFO, PQC_LOG_TAG, "Executing: %s", executable_path);

    // Replace this JNI process with the openvpn executable.
    // It will now inherit the correct environment variables.
    execv(executable_path, argv_c);

    // If execv returns, it means it failed. Log the error.
    __android_log_print(ANDROID_LOG_ERROR, PQC_LOG_TAG, "execv failed to run openvpn");
    exit(127);
}