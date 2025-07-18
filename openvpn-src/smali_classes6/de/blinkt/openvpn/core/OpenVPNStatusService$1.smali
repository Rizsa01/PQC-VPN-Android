.class Lde/blinkt/openvpn/core/OpenVPNStatusService$1;
.super Lde/blinkt/openvpn/core/IServiceStatus$Stub;
.source "OpenVPNStatusService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNStatusService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/core/OpenVPNStatusService;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/OpenVPNStatusService;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/core/OpenVPNStatusService;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1;->this$0:Lde/blinkt/openvpn/core/OpenVPNStatusService;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public getLastConnectedVPN()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 114
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->getLastConnectedVPNProfile()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTrafficHistory()Lde/blinkt/openvpn/core/TrafficHistory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 124
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;

    return-object v0
.end method

.method public notifyProfileVersionChanged(Ljava/lang/String;I)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "version"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1;->this$0:Lde/blinkt/openvpn/core/OpenVPNStatusService;

    invoke-static {v0, p1, p2}, Lde/blinkt/openvpn/core/ProfileManager;->notifyProfileVersionChanged(Landroid/content/Context;Ljava/lang/String;I)V

    .line 130
    return-void
.end method

.method public registerStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)Landroid/os/ParcelFileDescriptor;
    .locals 4
    .param p1, "cb"    # Lde/blinkt/openvpn/core/IStatusCallbacks;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 64
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->getlogbuffer()[Lde/blinkt/openvpn/core/LogItem;

    move-result-object v0

    .line 65
    .local v0, "logbuffer":[Lde/blinkt/openvpn/core/LogItem;
    sget-object v1, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mLastUpdateMessage:Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    if-eqz v1, :cond_0

    .line 66
    sget-object v1, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mLastUpdateMessage:Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    invoke-static {p1, v1}, Lde/blinkt/openvpn/core/OpenVPNStatusService;->-$$Nest$smsendUpdate(Lde/blinkt/openvpn/core/IStatusCallbacks;Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;)V

    .line 68
    :cond_0
    sget-object v1, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mCallbacks:Landroid/os/RemoteCallbackList;

    invoke-virtual {v1, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 70
    :try_start_0
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .line 71
    .local v1, "pipe":[Landroid/os/ParcelFileDescriptor;
    new-instance v2, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;

    const-string v3, "pushLogs"

    invoke-direct {v2, p0, v3, v1, v0}, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;-><init>(Lde/blinkt/openvpn/core/OpenVPNStatusService$1;Ljava/lang/String;[Landroid/os/ParcelFileDescriptor;[Lde/blinkt/openvpn/core/LogItem;)V

    .line 99
    invoke-virtual {v2}, Lde/blinkt/openvpn/core/OpenVPNStatusService$1$1;->start()V

    .line 100
    const/4 v2, 0x0

    aget-object v2, v1, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 101
    .end local v1    # "pipe":[Landroid/os/ParcelFileDescriptor;
    :catch_0
    move-exception v1

    .line 102
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 103
    new-instance v2, Landroid/os/RemoteException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/RemoteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setCachedPassword(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "password"    # Ljava/lang/String;

    .line 119
    invoke-static {p1, p2, p3}, Lde/blinkt/openvpn/core/PasswordCache;->setCachedPassword(Ljava/lang/String;ILjava/lang/String;)V

    .line 120
    return-void
.end method

.method public unregisterStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)V
    .locals 1
    .param p1, "cb"    # Lde/blinkt/openvpn/core/IStatusCallbacks;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 109
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mCallbacks:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    .line 110
    return-void
.end method
