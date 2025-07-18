.class final Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;
.super Ljava/lang/Object;
.source "StatusListener.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/StatusListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "StatusServiceConnection"
.end annotation


# instance fields
.field public serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

.field final synthetic this$0:Lde/blinkt/openvpn/core/StatusListener;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/StatusListener;)V
    .locals 1
    .param p1, "this$0"    # Lde/blinkt/openvpn/core/StatusListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 79
    iput-object p1, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 6
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .line 85
    invoke-static {p2}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IServiceStatus;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    .line 88
    :try_start_0
    const-string v0, "de.blinkt.openvpn.core.IServiceStatus"

    invoke-interface {p2, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-nez v0, :cond_1

    .line 90
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    invoke-interface {v0}, Lde/blinkt/openvpn/core/IServiceStatus;->getLastConnectedVPN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->setConnectedVPNProfile(Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    invoke-interface {v0}, Lde/blinkt/openvpn/core/IServiceStatus;->getTrafficHistory()Lde/blinkt/openvpn/core/TrafficHistory;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->setTrafficHistory(Lde/blinkt/openvpn/core/TrafficHistory;)V

    .line 92
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    iget-object v1, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v1}, Lde/blinkt/openvpn/core/StatusListener;->-$$Nest$fgetmCallback(Lde/blinkt/openvpn/core/StatusListener;)Lde/blinkt/openvpn/core/IStatusCallbacks;

    move-result-object v1

    invoke-interface {v0, v1}, Lde/blinkt/openvpn/core/IServiceStatus;->registerStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 93
    .local v0, "pfd":Landroid/os/ParcelFileDescriptor;
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v2, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v2, v0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 96
    .local v1, "fd":Ljava/io/DataInputStream;
    iget-object v2, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus;->addProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V

    .line 98
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readShort()S

    move-result v2

    .line 99
    .local v2, "len":S
    const v3, 0xff38

    new-array v3, v3, [B

    .line 100
    .local v3, "buf":[B
    :goto_0
    const/16 v4, 0x7fff

    if-eq v2, v4, :cond_0

    .line 101
    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 102
    new-instance v5, Lde/blinkt/openvpn/core/LogItem;

    invoke-direct {v5, v3, v2}, Lde/blinkt/openvpn/core/LogItem;-><init>([BI)V

    .line 103
    .local v5, "logitem":Lde/blinkt/openvpn/core/LogItem;
    invoke-static {v5, v4}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;Z)V

    .line 104
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readShort()S

    move-result v4

    move v2, v4

    .line 105
    .end local v5    # "logitem":Lde/blinkt/openvpn/core/LogItem;
    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    .line 107
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 110
    .end local v0    # "pfd":Landroid/os/ParcelFileDescriptor;
    .end local v1    # "fd":Ljava/io/DataInputStream;
    .end local v2    # "len":S
    .end local v3    # "buf":[B
    goto :goto_1

    .line 111
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/StatusListener;->-$$Nest$fgetmCacheDir(Lde/blinkt/openvpn/core/StatusListener;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->initLogCache(Ljava/io/File;)V

    .line 114
    sget-boolean v0, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-nez v0, :cond_2

    const-string v0, "skeletonOvpn2"

    const-string v1, "skeleton"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 115
    :cond_2
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->addLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :cond_3
    :goto_1
    goto :goto_3

    .line 119
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 121
    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 123
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1
    .param p1, "arg0"    # Landroid/content/ComponentName;

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    .line 128
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->removeLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V

    .line 129
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->removeProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V

    .line 130
    return-void
.end method
