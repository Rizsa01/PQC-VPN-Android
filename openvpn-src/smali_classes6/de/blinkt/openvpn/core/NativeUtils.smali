.class public Lde/blinkt/openvpn/core/NativeUtils;
.super Ljava/lang/Object;
.source "NativeUtils.java"


# static fields
.field public static final openSSLlengths:[I

.field static osslutilloaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 20
    const-string v0, "PQC_NATIVE_LOAD"

    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->isRoboUnitTest()Z

    move-result v1

    if-nez v1, :cond_1

    .line 23
    :try_start_0
    const-string v1, "Loading dependency: liboqs.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    const-string v1, "oqs"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    const-string v1, "Loading dependency: libpqccrypto.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    const-string v1, "pqccrypto"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 29
    const-string v1, "Loading dependency: libpqcssl.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    const-string v1, "pqcssl"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 34
    const-string v1, "Loading main library: libopenvpn.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    const-string v1, "openvpn"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 39
    const-string v1, "skeletonOvpn2"

    const-string v2, "skeleton"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v1, :cond_0

    .line 41
    :try_start_1
    const-string v1, "Attempting to load optional library: osslspeedtest"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const-string v1, "osslspeedtest"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    goto :goto_0

    .line 43
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Ljava/lang/UnsatisfiedLinkError;
    :try_start_2
    const-string v2, "Optional library \'osslspeedtest\' not found. Continuing."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .end local v1    # "e":Ljava/lang/UnsatisfiedLinkError;
    :cond_0
    :goto_0
    const-string v1, "All required libraries loaded successfully."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_1

    .line 53
    goto :goto_1

    .line 50
    :catch_1
    move-exception v1

    .line 51
    .restart local v1    # "e":Ljava/lang/UnsatisfiedLinkError;
    const-string v2, "!!!!!!!!!! FATAL: NATIVE LIBRARY FAILED TO LOAD !!!!!!!!!!"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    throw v1

    .line 75
    .end local v1    # "e":Ljava/lang/UnsatisfiedLinkError;
    :cond_1
    :goto_1
    const/4 v0, 0x0

    sput-boolean v0, Lde/blinkt/openvpn/core/NativeUtils;->osslutilloaded:Z

    .line 91
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lde/blinkt/openvpn/core/NativeUtils;->openSSLlengths:[I

    return-void

    :array_0
    .array-data 4
        0x10
        0x40
        0x100
        0x400
        0x5dc
        0x2000
        0x4000
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addRssPssPadding(III[B)[B
    .locals 1
    .param p0, "hashtype"    # I
    .param p1, "MSBits"    # I
    .param p2, "rsa_size"    # I
    .param p3, "from"    # [B

    .line 78
    invoke-static {p0, p1, p2, p3}, Lde/blinkt/openvpn/core/NativeUtils;->rsapss(III[B)[B

    move-result-object v0

    return-object v0
.end method

.method private static native getJNIAPI()Ljava/lang/String;
.end method

.method public static getNativeAPI()Ljava/lang/String;
    .locals 1

    .line 66
    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->isRoboUnitTest()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ROBO"

    return-object v0

    :cond_0
    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->getJNIAPI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static native getOpenSSLSpeed(Ljava/lang/String;I)[D
.end method

.method public static getOpenSSLVersion()Ljava/lang/String;
    .locals 1

    .line 73
    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->getOpenSSLVersionString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static native getOpenSSLVersionString()Ljava/lang/String;
.end method

.method public static native getOpenVPN2GitVersion()Ljava/lang/String;
.end method

.method public static native getOpenVPN3GitVersion()Ljava/lang/String;
.end method

.method public static isRoboUnitTest()Z
    .locals 2

    .line 94
    const-string v0, "robolectric"

    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static loadOsslUtil()V
    .locals 3

    .line 81
    sget-boolean v0, Lde/blinkt/openvpn/core/NativeUtils;->osslutilloaded:Z

    if-nez v0, :cond_0

    .line 82
    const/4 v0, 0x1

    sput-boolean v0, Lde/blinkt/openvpn/core/NativeUtils;->osslutilloaded:Z

    .line 84
    :try_start_0
    const-string v0, "osslutil"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    const-string v1, "PQC_NATIVE_LOAD"

    const-string v2, "Optional library \'osslutil\' not found."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .end local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    :cond_0
    :goto_0
    return-void
.end method

.method private static native rsapss(III[B)[B
.end method
