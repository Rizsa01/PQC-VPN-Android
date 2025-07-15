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
    // ### BEGIN PQC FIX: SET OPENSSL ENVIRONMENT VARIABLES           ###
    // ##################################################################

    // Get the absolute path to our native libraries directory
    const char* native_dir = ovpn_get_native_lib_path();

    // Define buffers for our new environment variable paths
    char ssl_conf_path[1024];
    char ssl_modules_path[1024];

    // Construct the full, absolute path to openssl.cnf
    snprintf(ssl_conf_path, sizeof(ssl_conf_path), "%s/openssl.cnf", native_dir);

    // Construct the full, absolute path to the directory containing our provider
    snprintf(ssl_modules_path, sizeof(ssl_modules_path), "%s/ossl-modules", native_dir);

    // Set the environment variables. The '1' means to overwrite them if they already exist.
    setenv("OPENSSL_CONF", ssl_conf_path, 1);
    setenv("OPENSSL_MODULES", ssl_modules_path, 1);

    // Log the paths to confirm they are correct. You can view these in Logcat.
    __android_log_print(ANDROID_LOG_INFO, PQC_LOG_TAG, "Set OPENSSL_CONF=%s", ssl_conf_path);
    __android_log_print(ANDROID_LOG_INFO, PQC_LOG_TAG, "Set OPENSSL_MODULES=%s", ssl_modules_path);

    // ##################################################################
    // ### END PQC FIX                                                ###
    // ##################################################################


    // Construct the full path to our executable.
    char executable_path[1024];
    snprintf(executable_path, sizeof(executable_path), "%s/openvpn", native_dir);

    // Log the command we are about to execute
    __android_log_print(ANDROID_LOG_INFO, PQC_LOG_TAG, "Executing: %s", executable_path);


    // Replace this JNI process with the openvpn executable.
    // It will now inherit the correct environment variables.
    execv(executable_path, argv_c);

    // If execv returns, it means it failed. Log the error.
    __android_log_print(ANDROID_LOG_ERROR, PQC_LOG_TAG, "execv failed to run openvpn");
    exit(127);
}