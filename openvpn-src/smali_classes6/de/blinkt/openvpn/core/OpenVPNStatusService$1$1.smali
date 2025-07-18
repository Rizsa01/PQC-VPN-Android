.class Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;
.super Ljava/lang/Thread;
.source "OpenVPNStatusService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/core/OpenVPNStatusService$1;->registerStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)Landroid/os/ParcelFileDescriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lde/blinkt/openvpn/core/OpenVPNStatusService$1;

.field final synthetic val$logbuffer:[Lde/blinkt/openvpn/core/LogItem;

.field final synthetic val$pipe:[Landroid/os/ParcelFileDescriptor;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/OpenVPNStatusService$1;Ljava/lang/String;[Landroid/os/ParcelFileDescriptor;[Lde/blinkt/openvpn/core/LogItem;)V
    .locals 0
    .param p1, "this$1"    # Lde/blinkt/openvpn/core/OpenVPNStatusService$1;
    .param p2, "arg0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 71
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->this$1:Lde/blinkt/openvpn/core/OpenVPNStatusService$1;

    iput-object p3, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->val$pipe:[Landroid/os/ParcelFileDescriptor;

    iput-object p4, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->val$logbuffer:[Lde/blinkt/openvpn/core/LogItem;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 74
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v1, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->val$pipe:[Landroid/os/ParcelFileDescriptor;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-direct {v1, v2}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 76
    .local v0, "fd":Ljava/io/DataOutputStream;
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :try_start_1
    sget-boolean v2, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    if-nez v2, :cond_0

    .line 78
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    .line 80
    :cond_0
    monitor-exit v1

    .line 83
    goto :goto_0

    .line 80
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "fd":Ljava/io/DataOutputStream;
    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 81
    .restart local v0    # "fd":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v1

    .line 82
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 86
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :goto_0
    :try_start_3
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->val$logbuffer:[Lde/blinkt/openvpn/core/LogItem;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 87
    .local v4, "logItem":Lde/blinkt/openvpn/core/LogItem;
    invoke-virtual {v4}, Lde/blinkt/openvpn/core/LogItem;->getMarschaledBytes()[B

    move-result-object v5

    .line 88
    .local v5, "bytes":[B
    array-length v6, v5

    invoke-virtual {v0, v6}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 89
    invoke-virtual {v0, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 86
    .end local v4    # "logItem":Lde/blinkt/openvpn/core/LogItem;
    .end local v5    # "bytes":[B
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 92
    :cond_1
    const/16 v1, 0x7fff

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 93
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 96
    goto :goto_2

    .line 94
    :catch_1
    move-exception v1

    .line 95
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 98
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method
