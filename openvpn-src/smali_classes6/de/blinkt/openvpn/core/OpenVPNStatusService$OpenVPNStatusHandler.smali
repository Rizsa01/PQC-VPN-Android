.class Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;
.super Landroid/os/Handler;
.source "OpenVPNStatusService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNStatusService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OpenVPNStatusHandler"
.end annotation


# instance fields
.field service:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lde/blinkt/openvpn/core/OpenVPNStatusService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$msetService(Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;Lde/blinkt/openvpn/core/OpenVPNStatusService;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->setService(Lde/blinkt/openvpn/core/OpenVPNStatusService;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 194
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->service:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lde/blinkt/openvpn/core/OpenVPNStatusService-IA;)V
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;-><init>()V

    return-void
.end method

.method private setService(Lde/blinkt/openvpn/core/OpenVPNStatusService;)V
    .locals 1
    .param p1, "statusService"    # Lde/blinkt/openvpn/core/OpenVPNStatusService;

    .line 198
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->service:Ljava/lang/ref/WeakReference;

    .line 199
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .line 205
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->service:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->service:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_3

    .line 207
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->service:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;

    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mCallbacks:Landroid/os/RemoteCallbackList;

    .line 209
    .local v0, "callbacks":Landroid/os/RemoteCallbackList;, "Landroid/os/RemoteCallbackList<Lde/blinkt/openvpn/core/IStatusCallbacks;>;"
    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v1

    .line 210
    .local v1, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 212
    :try_start_0
    invoke-virtual {v0, v2}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v3

    check-cast v3, Lde/blinkt/openvpn/core/IStatusCallbacks;

    .line 214
    .local v3, "broadcastItem":Lde/blinkt/openvpn/core/IStatusCallbacks;
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    goto :goto_1

    .line 231
    :pswitch_0
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/util/Pair;

    .line 232
    .local v4, "profileupdate":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;"
    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v6, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v3, v5, v6}, Lde/blinkt/openvpn/core/IStatusCallbacks;->notifyProfileVersionChanged(Ljava/lang/String;I)V

    goto :goto_1

    .line 227
    .end local v4    # "profileupdate":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;"
    :pswitch_1
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3, v4}, Lde/blinkt/openvpn/core/IStatusCallbacks;->connectedVPN(Ljava/lang/String;)V

    .line 228
    goto :goto_1

    .line 219
    :pswitch_2
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/util/Pair;

    .line 220
    .local v4, "inout":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    iget-object v7, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v3, v5, v6, v7, v8}, Lde/blinkt/openvpn/core/IStatusCallbacks;->updateByteCount(JJ)V

    .line 221
    goto :goto_1

    .line 223
    .end local v4    # "inout":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    :pswitch_3
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    invoke-static {v3, v4}, Lde/blinkt/openvpn/core/OpenVPNStatusService;->-$$Nest$smsendUpdate(Lde/blinkt/openvpn/core/IStatusCallbacks;Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;)V

    .line 224
    goto :goto_1

    .line 216
    :pswitch_4
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lde/blinkt/openvpn/core/LogItem;

    invoke-interface {v3, v4}, Lde/blinkt/openvpn/core/IStatusCallbacks;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    nop

    .line 237
    .end local v3    # "broadcastItem":Lde/blinkt/openvpn/core/IStatusCallbacks;
    :goto_1
    goto :goto_2

    .line 234
    :catch_0
    move-exception v3

    .line 210
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 239
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 240
    return-void

    .line 206
    .end local v0    # "callbacks":Landroid/os/RemoteCallbackList;, "Landroid/os/RemoteCallbackList<Lde/blinkt/openvpn/core/IStatusCallbacks;>;"
    .end local v1    # "N":I
    :cond_2
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
