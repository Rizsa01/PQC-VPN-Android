#include <jni.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "jnicommon.h"

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

    // Construct the full path to our executable.
    char executable_path[1024];
    snprintf(executable_path, sizeof(executable_path), "%s/openvpn", ovpn_get_native_lib_path());

    // Replace this JNI process with the openvpn executable.
    // This is the core of how ics-openvpn works.
    execv(executable_path, argv_c);

    // If execv returns, it means it failed. The process was not replaced.
    // We should exit to signal a failure.
    exit(127);
}