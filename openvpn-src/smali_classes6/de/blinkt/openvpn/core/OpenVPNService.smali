.class public Lde/blinkt/openvpn/core/OpenVPNService;
.super Landroid/net/VpnService;
.source "OpenVPNService.java"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$StateListener;


# static fields
.field public static final DISCONNECT_VPN:Ljava/lang/String; = "de.blinkt.openvpn.DISCONNECT_VPN"

.field public static final EXTRA_DO_NOT_REPLACE_RUNNING_VPN:Ljava/lang/String; = "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN"

.field public static final EXTRA_START_REASON:Ljava/lang/String; = "de.blinkt.openvpn.startReason"

.field public static final EXTRA_VPN_PROFILE_OBJECT:Ljava/lang/String; = "de.blinkt.openvpn.VPN_PROFILE_OBJECT"

.field public static final NOTIFICATION_CHANNEL_ID:Ljava/lang/String; = "openvpn_status"

.field private static final OPENVPN_EXECUTABLE_NAME:Ljava/lang/String; = "openvpn"

.field private static final PQC_VPN_LOG_TAG:Ljava/lang/String; = "PQC_VPN_Service"

.field public static final START_SERVICE:Ljava/lang/String; = "de.blinkt.openvpn.START_SERVICE"


# instance fields
.field private final mBinder:Landroid/os/IBinder;

.field private mBuilder:Landroid/net/VpnService$Builder;

.field private mCommandHandler:Landroid/os/Handler;

.field private mCommandHandlerThread:Landroid/os/HandlerThread;

.field private mPersistTun:Z

.field private mProcessThread:Ljava/lang/Thread;

.field private mProfile:Lde/blinkt/openvpn/core/VpnProfile;

.field private mTunFd:Landroid/os/ParcelFileDescriptor;


# direct methods
.method public static synthetic $r8$lambda$IIVoYZlPv3MJjHU9yhMDf6EmOAI(Lde/blinkt/openvpn/core/OpenVPNService;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/OpenVPNService;->lambda$onStartCommand$0(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic $r8$lambda$YZX_Kw8_kQ3aUwBJyYvzKBdsZkQ(Lde/blinkt/openvpn/core/OpenVPNService;)Z
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopVpn()Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$mnRYvCg-B3VeqVivQ7KNauRXb0Y(Lde/blinkt/openvpn/core/OpenVPNService;)V
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->lambda$endVpnService$1()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstopVpn(Lde/blinkt/openvpn/core/OpenVPNService;)Z
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopVpn()Z

    move-result p0

    return p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroid/net/VpnService;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mPersistTun:Z

    .line 44
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNService$1;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/OpenVPNService$1;-><init>(Lde/blinkt/openvpn/core/OpenVPNService;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBinder:Landroid/os/IBinder;

    return-void
.end method

.method private createNotificationChannel()V
    .locals 0

    .line 160
    return-void
.end method

.method private endVpnService()V
    .locals 2

    .line 154
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandler:Landroid/os/Handler;

    new-instance v1, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda0;-><init>(Lde/blinkt/openvpn/core/OpenVPNService;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private synthetic lambda$endVpnService$1()V
    .locals 2

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProcessThread:Ljava/lang/Thread;

    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileManager;->setConntectedVpnProfileDisconnected(Landroid/content/Context;)V

    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    :try_start_0
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mPersistTun:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v1, "Error closing TunFd"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopForeground(Z)V

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopSelf()V

    return-void
.end method

.method private synthetic lambda$onStartCommand$0(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .line 65
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/OpenVPNService;->startVpn(Landroid/content/Intent;)V

    return-void
.end method

.method private showNotification(Ljava/lang/String;Lde/blinkt/openvpn/core/ConnectionStatus;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 159
    return-void
.end method

.method private startVpn(Landroid/content/Intent;)V
    .locals 10
    .param p1, "intent"    # Landroid/content/Intent;

    .line 81
    const-string v0, "PQC_VPN_Service"

    if-nez p1, :cond_0

    .line 82
    const-string v1, "Service started with a null intent. Aborting."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    return-void

    .line 87
    :cond_0
    const-string v1, "de.blinkt.openvpn.VPN_PROFILE_OBJECT"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 88
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_1

    .line 89
    const-class v2, Lde/blinkt/openvpn/core/VpnProfile;

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/blinkt/openvpn/core/VpnProfile;

    iput-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lde/blinkt/openvpn/core/VpnProfile;

    .line 93
    .local v1, "profile":Lde/blinkt/openvpn/core/VpnProfile;
    iput-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    .line 94
    .end local v1    # "profile":Lde/blinkt/openvpn/core/VpnProfile;
    goto :goto_0

    .line 96
    :cond_2
    const-string v1, "de.blinkt.openvpn.profileUUID"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "profileUUID":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 98
    invoke-static {p0, v1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Landroid/content/Context;Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    .line 102
    .end local v1    # "profileUUID":Ljava/lang/String;
    :cond_3
    :goto_0
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    if-nez v1, :cond_4

    .line 103
    const-string v1, "FATAL: VpnProfile is null, cannot start VPN connection."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopSelf()V

    .line 105
    return-void

    .line 108
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Profile loaded. Starting native process directly for profile: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    new-instance v1, Landroid/net/VpnService$Builder;

    invoke-direct {v1, p0}, Landroid/net/VpnService$Builder;-><init>(Landroid/net/VpnService;)V

    iput-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    .line 115
    :try_start_0
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 116
    .local v1, "nativeLibraryDir":Ljava/lang/String;
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "tmpDir":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "openvpn"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "executablePath":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->getCacheDir()Ljava/io/File;

    move-result-object v5


    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "openSslConfigPath":Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x7

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const-string v8, "--config"

    const/4 v9, 0x1

    aput-object v8, v6, v9

    const-string v8, "stdin"

    const/4 v9, 0x2

    aput-object v8, v6, v9

    const-string v8, "--verb"

    const/4 v9, 0x3

    aput-object v8, v6, v9

    const-string v8, "5"

    const/4 v9, 0x4

    aput-object v8, v6, v9



    const/4 v9, 0x5

    aput-object v8, v6, v9

    const/4 v8, 0x6

    aput-object v4, v6, v8

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 133
    .local v5, "argv":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Lde/blinkt/openvpn/core/OpenVPNThread;

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-direct {v6, p0, v7, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNThread;-><init>(Lde/blinkt/openvpn/core/OpenVPNService;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .local v6, "process":Ljava/lang/Runnable;
    new-instance v7, Ljava/lang/Thread;

    const-string v8, "OpenVPNProcessThread"

    invoke-direct {v7, v6, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v7, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProcessThread:Ljava/lang/Thread;

    .line 135
    iget-object v7, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProcessThread:Ljava/lang/Thread;

    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 136
    const-string v7, "OpenVPNProcessThread has been started. It will now connect automatically."

    invoke-static {v0, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    nop

    .end local v1    # "nativeLibraryDir":Ljava/lang/String;
    .end local v2    # "tmpDir":Ljava/lang/String;
    .end local v3    # "executablePath":Ljava/lang/String;
    .end local v4    # "openSslConfigPath":Ljava/lang/String;
    .end local v5    # "argv":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "process":Ljava/lang/Runnable;
    goto :goto_1

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Fatal error during OpenVPN startup sequence"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopVpn()Z

    .line 142
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private stopVpn()Z
    .locals 2

    .line 145
    const-string v0, "PQC_VPN_Service"

    const-string v1, "Stopping VPN..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProcessThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProcessThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 149
    :cond_0
    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->endVpnService()V

    .line 150
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public addDNS(Ljava/lang/String;)V
    .locals 3
    .param p1, "dns"    # Ljava/lang/String;

    .line 177
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/VpnService$Builder;->addDnsServer(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error adding DNS: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public addRoute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "dest"    # Ljava/lang/String;
    .param p2, "mask"    # Ljava/lang/String;
    .param p3, "gateway"    # Ljava/lang/String;
    .param p4, "device"    # Ljava/lang/String;

    .line 179
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    new-instance v0, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-direct {v0, p1, p2}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .local v0, "route":Lde/blinkt/openvpn/core/CIDRIP;
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    iget-object v2, v0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    iget v3, v0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "route":Lde/blinkt/openvpn/core/CIDRIP;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error adding route: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public addRoutev6(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "network"    # Ljava/lang/String;
    .param p2, "device"    # Ljava/lang/String;

    .line 180
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "parts":[Ljava/lang/String;
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "parts":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error adding IPv6 route: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public addSearchDomain(Ljava/lang/String;)V
    .locals 3
    .param p1, "domain"    # Ljava/lang/String;

    .line 178
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/VpnService$Builder;->addSearchDomain(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error adding search domain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public getManagement()Lde/blinkt/openvpn/core/OpenVPNManagement;
    .locals 1

    .line 184
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTunReopenStatus()Ljava/lang/String;
    .locals 1

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mPersistTun:Z

    const-string v0, "ok"

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 156
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .line 55
    invoke-super {p0}, Landroid/net/VpnService;->onCreate()V

    .line 56
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "OpenVPNServiceCommand"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandlerThread:Landroid/os/HandlerThread;

    .line 57
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 58
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandler:Landroid/os/Handler;

    .line 59
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 60
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 155
    invoke-super {p0}, Landroid/net/VpnService;->onDestroy()V

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopVpn()Z

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandlerThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_0
    return-void
.end method

.method public onRevoke()V
    .locals 0

    .line 157
    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNService;->stopVpn()Z

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .line 64
    if-eqz p1, :cond_0

    const-string v0, "de.blinkt.openvpn.START_SERVICE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandler:Landroid/os/Handler;

    new-instance v1, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;-><init>(Lde/blinkt/openvpn/core/OpenVPNService;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 66
    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "de.blinkt.openvpn.DISCONNECT_VPN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 67
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mCommandHandler:Landroid/os/Handler;

    new-instance v1, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda2;-><init>(Lde/blinkt/openvpn/core/OpenVPNService;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 69
    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public openTun()Landroid/os/ParcelFileDescriptor;
    .locals 2

    .line 165
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;

    if-nez v0, :cond_0

    .line 167
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    invoke-virtual {v0, v1, p0}, Lde/blinkt/openvpn/core/VpnProfile;->addProfileToBuilder(Landroid/net/VpnService$Builder;Landroid/content/Context;)V

    .line 168
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    invoke-virtual {v0}, Landroid/net/VpnService$Builder;->establish()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;

    .line 170
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mTunFd:Landroid/os/ParcelFileDescriptor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Failed to establish TUN interface"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 173
    const/4 v1, 0x0

    return-object v1
.end method

.method public setConnectedVPN(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setLocalIP(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p1, "local"    # Ljava/lang/String;
    .param p2, "netmask"    # Ljava/lang/String;
    .param p3, "mtu"    # I
    .param p4, "mode"    # Ljava/lang/String;

    .line 181
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    new-instance v0, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-direct {v0, p1, p2}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .local v0, "localip":Lde/blinkt/openvpn/core/CIDRIP;
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    iget-object v2, v0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    iget v3, v0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    if-lez p3, :cond_0

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    invoke-virtual {v1, p3}, Landroid/net/VpnService$Builder;->setMtu(I)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "localip":Lde/blinkt/openvpn/core/CIDRIP;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error setting local IP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public setLocalIPv6(Ljava/lang/String;)V
    .locals 4
    .param p1, "ipv6addr"    # Ljava/lang/String;

    .line 182
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    if-eqz v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "parts":[Ljava/lang/String;
    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mBuilder:Landroid/net/VpnService$Builder;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "parts":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error setting local IPv6 address: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 1
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "logmessage"    # Ljava/lang/String;
    .param p3, "resid"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;

    .line 158
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->getLastCleanLogMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p4}, Lde/blinkt/openvpn/core/OpenVPNService;->showNotification(Ljava/lang/String;Lde/blinkt/openvpn/core/ConnectionStatus;)V

    return-void
.end method

.method public writeProfileToStdIn(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "stdin"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    if-eqz v0, :cond_0

    .line 74
    const-string v0, "Writing config to STDIN"

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    invoke-virtual {v0, p0, p1}, Lde/blinkt/openvpn/core/VpnProfile;->writeConfigFileOutput(Landroid/content/Context;Ljava/io/OutputStream;)V

    .line 76
    const-string v0, "PQC_VPN_Service"

    const-string v1, "Config file written to process stdin."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    :cond_0
    return-void
.end method
