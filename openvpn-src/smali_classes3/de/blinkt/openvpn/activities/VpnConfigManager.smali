.class public final Lde/blinkt/openvpn/activities/VpnConfigManager;
.super Ljava/lang/Object;
.source "VpnConfigManager.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lde/blinkt/openvpn/activities/VpnConfigManager;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "copyAndGetConfigFile",
        "Ljava/io/File;",
        "context",
        "Landroid/content/Context;",
        "main_skeletonOvpn2Debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lde/blinkt/openvpn/activities/VpnConfigManager;

.field private static final TAG:Ljava/lang/String; = "PQC_VPN_CONFIG"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lde/blinkt/openvpn/activities/VpnConfigManager;

    invoke-direct {v0}, Lde/blinkt/openvpn/activities/VpnConfigManager;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/activities/VpnConfigManager;->INSTANCE:Lde/blinkt/openvpn/activities/VpnConfigManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final copyAndGetConfigFile(Landroid/content/Context;)Ljava/io/File;
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "PQC_VPN_CONFIG"

    const-string v1, "context"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "openssl.cnf"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    .local v1, "configFile":Ljava/io/File;
    nop

    .line 21
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f100000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    check-cast v3, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v4, v3

    check-cast v4, Ljava/io/InputStream;

    .local v4, "inputStream\\1":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 22
    .local v5, "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v6, Ljava/io/Closeable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    move-object v7, v6

    check-cast v7, Ljava/io/FileOutputStream;

    .local v7, "outputStream\\2":Ljava/io/FileOutputStream;
    const/4 v8, 0x0

    .line 23
    .local v8, "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1$1\\2\\22\\1":I
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v9, v7

    check-cast v9, Ljava/io/OutputStream;

    const/4 v10, 0x0

    const/4 v11, 0x2

    invoke-static {v4, v9, v10, v11, v2}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 22
    .end local v7    # "outputStream\\2":Ljava/io/FileOutputStream;
    .end local v8    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1$1\\2\\22\\1":I
    :try_start_3
    invoke-static {v6, v2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 24
    nop

    .line 21
    .end local v4    # "inputStream\\1":Ljava/io/InputStream;
    .end local v5    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    :try_start_4
    invoke-static {v3, v2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 26
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Successfully copied OpenSSL config to: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 27
    return-object v1

    .line 22
    .restart local v4    # "inputStream\\1":Ljava/io/InputStream;
    .restart local v5    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    :catchall_0
    move-exception v7

    .end local v1    # "configFile":Ljava/io/File;
    .end local v4    # "inputStream\\1":Ljava/io/InputStream;
    .end local v5    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    .end local p1    # "context":Landroid/content/Context;
    :try_start_5
    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .restart local v1    # "configFile":Ljava/io/File;
    .restart local v4    # "inputStream\\1":Ljava/io/InputStream;
    .restart local v5    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    .restart local p1    # "context":Landroid/content/Context;
    :catchall_1
    move-exception v8

    :try_start_6
    invoke-static {v6, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v1    # "configFile":Ljava/io/File;
    .end local p1    # "context":Landroid/content/Context;
    throw v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 21
    .end local v4    # "inputStream\\1":Ljava/io/InputStream;
    .end local v5    # "$i$a$-use-VpnConfigManager$copyAndGetConfigFile$1\\1\\21\\0":I
    .restart local v1    # "configFile":Ljava/io/File;
    .restart local p1    # "context":Landroid/content/Context;
    :catchall_2
    move-exception v4

    .end local v1    # "configFile":Ljava/io/File;
    .end local p1    # "context":Landroid/content/Context;
    :try_start_7
    throw v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .restart local v1    # "configFile":Ljava/io/File;
    .restart local p1    # "context":Landroid/content/Context;
    :catchall_3
    move-exception v5

    :try_start_8
    invoke-static {v3, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v1    # "configFile":Ljava/io/File;
    .end local p1    # "context":Landroid/content/Context;
    throw v5
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 28
    .restart local v1    # "configFile":Ljava/io/File;
    .restart local p1    # "context":Landroid/content/Context;
    :catch_0
    move-exception v3

    .line 29
    .local v3, "e":Ljava/io/IOException;
    const-string v4, "Failed to copy OpenSSL config resource"

    move-object v5, v3

    check-cast v5, Ljava/lang/Throwable;

    invoke-static {v0, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    return-object v2
.end method
