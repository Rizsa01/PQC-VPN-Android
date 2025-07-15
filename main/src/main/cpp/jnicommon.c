#include <jni.h>
#include <string.h>
#include "jnicommon.h"

// A global variable to store the path passed from Java.
static char native_lib_path[1024];

// This is the JNI function that VpnManage.java will call to set the library path.
JNIEXPORT void JNICALL
Java_de_blinkt_openvpn_core_VpnManage_setNativeLibPath(JNIEnv *env, jclass clazz, jstring path) {
    const char *native_path = (*env)->GetStringUTFChars(env, path, 0);
    strncpy(native_lib_path, native_path, sizeof(native_lib_path) - 1);
    native_lib_path[sizeof(native_lib_path) - 1] = '\0';
    (*env)->ReleaseStringUTFChars(env, path, native_path);
}

// A helper function to retrieve the stored path.
const char* ovpn_get_native_lib_path(void) {
    return native_lib_path;
}