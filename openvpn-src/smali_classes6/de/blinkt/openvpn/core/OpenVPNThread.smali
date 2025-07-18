.class public Lde/blinkt/openvpn/core/OpenVPNThread;
.super Ljava/lang/Object;
.source "OpenVPNThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "PQC_VPN_Thread"


# instance fields
.field private final mArgv:[Ljava/lang/String;

.field private final mNativeDir:Ljava/lang/String;

.field private mProcess:Ljava/lang/Process;

.field private final mService:Lde/blinkt/openvpn/core/OpenVPNService;

.field private final mTmpDir:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$rc7uGbtcgDB58k_aCpEHPkea9Qs(Lde/blinkt/openvpn/core/OpenVPNThread;Ljava/io/OutputStream;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/OpenVPNThread;->lambda$startOpenVPN$0(Ljava/io/OutputStream;)V

    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/OpenVPNService;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "service"    # Lde/blinkt/openvpn/core/OpenVPNService;
    .param p2, "argv"    # [Ljava/lang/String;
    .param p3, "nativelibdir"    # Ljava/lang/String;
    .param p4, "tmpdir"    # Ljava/lang/String;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mService:Lde/blinkt/openvpn/core/OpenVPNService;

    .line 28
    iput-object p2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mArgv:[Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mNativeDir:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mTmpDir:Ljava/lang/String;

    .line 31
    return-void
.end method

.method private synthetic lambda$startOpenVPN$0(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "stdin"    # Ljava/io/OutputStream;

    .line 76
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0, p1}, Lde/blinkt/openvpn/core/OpenVPNService;->writeProfileToStdIn(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :try_start_1
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 81
    goto :goto_0

    .line 80
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 77
    :catch_1
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    const-string v1, "Error writing config to stdin"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    .end local v0    # "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 82
    :goto_0
    return-void

    .line 80
    :goto_1
    :try_start_4
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 81
    :goto_2
    throw v0
.end method

.method private startOpenVPN()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 51
    .local v0, "argvlist":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mArgv:[Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 53
    new-instance v1, Ljava/lang/ProcessBuilder;

    invoke-direct {v1, v0}, Ljava/lang/ProcessBuilder;-><init>(Ljava/util/List;)V

    .line 54
    .local v1, "pb":Ljava/lang/ProcessBuilder;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mNativeDir:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;
     # --- inject OPENSSL_CONF into the env ---
    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;
    move-result-object v5            # v5 now holds the Map

    const-string       v6, "OPENSSL_CONF"                         # v6 = key
    const-string       v7, "/data/user/0/de.blinkt.openvpn/cache/openssl.cnf"  # v7 = value

    invoke-interface   {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    # --- end injection ---



    .line 56

    move-result-object v2

    .line 57
    .local v2, "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "LD_LIBRARY_PATH"

    iget-object v4, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mNativeDir:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v3, "TMPDIR"

    iget-object v4, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mTmpDir:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Starting process with command: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PQC_VPN_Thread"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Working directory: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mTmpDir:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    iput-object v3, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    .line 73
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 74
    .local v3, "stdin":Ljava/io/OutputStream;
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0, v3}, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;-><init>(Lde/blinkt/openvpn/core/OpenVPNThread;Ljava/io/OutputStream;)V

    const-string v7, "OpenVPNConfigWriter"

    invoke-direct {v5, v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 82
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 86
    iget-object v5, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .local v5, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v7, v5, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 90
    .local v6, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    .local v8, "line":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 93
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "NATIVE_LOG: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "P: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 96
    .end local v8    # "line":Ljava/lang/String;
    :cond_0
    :try_start_3
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .end local v6    # "br":Ljava/io/BufferedReader;
    if-eqz v5, :cond_1

    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 99
    .end local v5    # "in":Ljava/io/InputStream;
    :cond_1
    iget-object v5, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    move-result v5

    .line 100
    .local v5, "exitValue":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Native process exited with value: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 104
    nop

    .end local v3    # "stdin":Ljava/io/OutputStream;
    .end local v5    # "exitValue":I
    goto :goto_3

    .line 86
    .restart local v3    # "stdin":Ljava/io/OutputStream;
    .local v5, "in":Ljava/io/InputStream;
    .restart local v6    # "br":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v4

    :try_start_5
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v7

    :try_start_6
    invoke-virtual {v4, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "argvlist":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v1    # "pb":Ljava/lang/ProcessBuilder;
    .end local v2    # "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "stdin":Ljava/io/OutputStream;
    .end local v5    # "in":Ljava/io/InputStream;
    :goto_1
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .end local v6    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "argvlist":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .restart local v1    # "pb":Ljava/lang/ProcessBuilder;
    .restart local v2    # "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "stdin":Ljava/io/OutputStream;
    .restart local v5    # "in":Ljava/io/InputStream;
    :catchall_2
    move-exception v4

    if-eqz v5, :cond_2

    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v6

    :try_start_8
    invoke-virtual {v4, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "argvlist":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v1    # "pb":Ljava/lang/ProcessBuilder;
    .end local v2    # "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :goto_2
    throw v4
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_0

    .line 102
    .end local v3    # "stdin":Ljava/io/OutputStream;
    .end local v5    # "in":Ljava/io/InputStream;
    .restart local v0    # "argvlist":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .restart local v1    # "pb":Ljava/lang/ProcessBuilder;
    .restart local v2    # "env":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    .line 103
    .local v3, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 105
    .end local v3    # "e":Ljava/lang/InterruptedException;
    :goto_3
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 36
    const-string v0, ""

    const-string v1, "NOPROCESS"

    const-string v2, "OpenVPN Thread shutting down."

    const-string v3, "PQC_VPN_Thread"

    const v4, 0x7f110299

    :try_start_0
    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNThread;->startOpenVPN()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    if-eqz v2, :cond_0

    .line 43
    :goto_0
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 45
    :cond_0
    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-static {v1, v0, v4, v2}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    .line 46
    goto :goto_1

    .line 41
    :catchall_0
    move-exception v5

    goto :goto_2

    .line 37
    :catch_0
    move-exception v5

    .line 38
    .local v5, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v6, "!!!!!!!!!! NATIVE PROCESS FAILED TO START !!!!!!!!!!"

    invoke-static {v3, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 39
    const-string v6, "FATAL: OpenVPNThread crashed."

    invoke-static {v6, v5}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .end local v5    # "e":Ljava/lang/Exception;
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    if-eqz v2, :cond_0

    .line 43
    goto :goto_0

    .line 47
    :goto_1
    return-void

    .line 41
    :goto_2
    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    if-eqz v2, :cond_1

    .line 43
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V

    .line 45
    :cond_1
    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-static {v1, v0, v4, v2}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    .line 46
    throw v5
.end method

.method public stopProcess()V
    .locals 1

    .line 108
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNThread;->mProcess:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 111
    :cond_0
    return-void
.end method
