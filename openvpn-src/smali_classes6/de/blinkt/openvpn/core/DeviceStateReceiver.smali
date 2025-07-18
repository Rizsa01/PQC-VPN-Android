.class public Lde/blinkt/openvpn/core/DeviceStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DeviceStateReceiver.java"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
.implements Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;,
        Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;
    }
.end annotation


# instance fields
.field private final DISCONNECT_WAIT:I

.field private final TRAFFIC_LIMIT:J

.field private final TRAFFIC_WINDOW:I

.field private lastConnectedNetwork:Landroid/net/NetworkInfo;

.field private lastNetwork:I

.field private lastStateMsg:Ljava/lang/String;

.field private final mDelayDisconnectRunnable:Ljava/lang/Runnable;

.field private final mDisconnectHandler:Landroid/os/Handler;

.field private mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

.field network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

.field screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

.field private final trafficdata:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;",
            ">;"
        }
    .end annotation
.end field

.field userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;


# direct methods
.method static bridge synthetic -$$Nest$fgetmManagement(Lde/blinkt/openvpn/core/DeviceStateReceiver;)Lde/blinkt/openvpn/core/OpenVPNManagement;
    .locals 0

    iget-object p0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetPauseReason(Lde/blinkt/openvpn/core/DeviceStateReceiver;)Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/OpenVPNManagement;)V
    .locals 2
    .param p1, "management"    # Lde/blinkt/openvpn/core/OpenVPNManagement;

    .line 127
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastNetwork:I

    .line 31
    const/16 v0, 0x3c

    iput v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->TRAFFIC_WINDOW:I

    .line 33
    const-wide/32 v0, 0x10000

    iput-wide v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->TRAFFIC_LIMIT:J

    .line 36
    const/16 v0, 0x14

    iput v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->DISCONNECT_WAIT:I

    .line 38
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 39
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 40
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastStateMsg:Ljava/lang/String;

    .line 43
    new-instance v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;-><init>(Lde/blinkt/openvpn/core/DeviceStateReceiver;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDelayDisconnectRunnable:Ljava/lang/Runnable;

    .line 81
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    .line 128
    iput-object p1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    .line 129
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v0, p0}, Lde/blinkt/openvpn/core/OpenVPNManagement;->setPauseCallback(Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;)V

    .line 130
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDisconnectHandler:Landroid/os/Handler;

    .line 131
    return-void
.end method

.method public static equalsObj(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .line 175
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method private fillTrafficData()V
    .locals 7

    .line 171
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    new-instance v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x10000

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;-><init>(JJLde/blinkt/openvpn/core/DeviceStateReceiver-IA;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 172
    return-void
.end method

.method private getCurrentNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 295
    nop

    .line 296
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 298
    .local v0, "conn":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    return-object v1
.end method

.method private getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
    .locals 2

    .line 282
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_0

    .line 283
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0

    .line 285
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_1

    .line 286
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->screenOff:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0

    .line 288
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_2

    .line 289
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0

    .line 291
    :cond_2
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0
.end method

.method private shouldBeConnected()Z
    .locals 2

    .line 277
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public isUserPaused()Z
    .locals 2

    .line 273
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public networkStateChange(Landroid/content/Context;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .line 179
    invoke-static {p1}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 180
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "ignorenetstate"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 181
    .local v1, "ignoreNetworkState":Z
    if-eqz v1, :cond_0

    .line 182
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 183
    return-void

    .line 186
    :cond_0
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getCurrentNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 187
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    const-string v4, "netchangereconnect"

    const/4 v5, 0x1

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 190
    .local v4, "sendusr1":Z
    if-nez v3, :cond_1

    .line 191
    const-string v6, "not connected"

    .local v6, "netstatestring":Ljava/lang/String;
    goto :goto_0

    .line 193
    .end local v6    # "netstatestring":Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v6

    .line 194
    .local v6, "subtype":Ljava/lang/String;
    if-nez v6, :cond_2

    .line 195
    const-string v6, ""

    .line 196
    :cond_2
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v7

    .line 197
    .local v7, "extrainfo":Ljava/lang/String;
    if-nez v7, :cond_3

    .line 198
    const-string v7, ""

    .line 210
    :cond_3
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v8

    .line 211
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v9

    filled-new-array {v8, v9, v7, v6}, [Ljava/lang/Object;

    move-result-object v8

    .line 210
    const-string v9, "%2$s %4$s to %1$s %3$s"

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-object v6, v8

    .line 214
    .end local v7    # "extrainfo":Ljava/lang/String;
    .local v6, "netstatestring":Ljava/lang/String;
    :goto_0
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v7

    sget-object v8, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v7, v8, :cond_c

    .line 215
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    .line 217
    .local v7, "newnet":I
    iget-object v8, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v9, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v8, v9, :cond_4

    move v2, v5

    .line 218
    .local v2, "pendingDisconnect":Z
    :cond_4
    sget-object v8, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v8, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 221
    iget-object v8, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastConnectedNetwork:Landroid/net/NetworkInfo;

    if-eqz v8, :cond_6

    iget-object v8, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastConnectedNetwork:Landroid/net/NetworkInfo;

    .line 222
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getType()I

    move-result v8

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v9

    if-ne v8, v9, :cond_6

    iget-object v8, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastConnectedNetwork:Landroid/net/NetworkInfo;

    .line 223
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->equalsObj(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    goto :goto_1

    .line 227
    :cond_5
    const/4 v8, 0x1

    .local v8, "sameNetwork":Z
    goto :goto_2

    .line 225
    .end local v8    # "sameNetwork":Z
    :cond_6
    :goto_1
    const/4 v8, 0x0

    .line 230
    .restart local v8    # "sameNetwork":Z
    :goto_2
    if-eqz v2, :cond_7

    if-eqz v8, :cond_7

    .line 231
    iget-object v9, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDisconnectHandler:Landroid/os/Handler;

    iget-object v10, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDelayDisconnectRunnable:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 233
    iget-object v9, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v9, v5}, Lde/blinkt/openvpn/core/OpenVPNManagement;->networkChange(Z)V

    goto :goto_5

    .line 237
    :cond_7
    iget-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v9, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v5, v9, :cond_8

    .line 238
    sget-object v5, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 240
    :cond_8
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 241
    iget-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDisconnectHandler:Landroid/os/Handler;

    iget-object v9, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDelayDisconnectRunnable:Ljava/lang/Runnable;

    invoke-virtual {v5, v9}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 243
    if-nez v2, :cond_a

    if-nez v8, :cond_9

    goto :goto_3

    .line 246
    :cond_9
    iget-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v5}, Lde/blinkt/openvpn/core/OpenVPNManagement;->resume()V

    goto :goto_4

    .line 244
    :cond_a
    :goto_3
    iget-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v5, v8}, Lde/blinkt/openvpn/core/OpenVPNManagement;->networkChange(Z)V

    .line 249
    :cond_b
    :goto_4
    iput v7, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastNetwork:I

    .line 250
    iput-object v3, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastConnectedNetwork:Landroid/net/NetworkInfo;

    goto :goto_5

    .line 252
    .end local v2    # "pendingDisconnect":Z
    .end local v7    # "newnet":I
    .end local v8    # "sameNetwork":Z
    :cond_c
    if-nez v3, :cond_d

    .line 254
    const/4 v2, -0x1

    iput v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastNetwork:I

    .line 255
    if-eqz v4, :cond_e

    .line 256
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 257
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDisconnectHandler:Landroid/os/Handler;

    iget-object v5, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDelayDisconnectRunnable:Ljava/lang/Runnable;

    const-wide/16 v7, 0x4e20

    invoke-virtual {v2, v5, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_6

    .line 252
    :cond_d
    :goto_5
    nop

    .line 263
    :cond_e
    :goto_6
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastStateMsg:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 264
    const v2, 0x7f1101ed

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v2, v5}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(I[Ljava/lang/Object;)V

    .line 265
    :cond_f
    nop

    .line 266
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v2

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget-object v7, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    filled-new-array {v6, v2, v5, v7}, [Ljava/lang/Object;

    move-result-object v2

    .line 265
    const-string v5, "Debug state info: %s, pause: %s, shouldbeconnected: %s, network: %s "

    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 267
    iput-object v6, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->lastStateMsg:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 136
    invoke-static {p1}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 139
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 140
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->networkStateChange(Landroid/content/Context;)V

    goto/16 :goto_1

    .line 141
    :cond_0
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 142
    const-string v1, "screenoff"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 144
    .local v1, "screenOffPause":Z
    if-eqz v1, :cond_5

    .line 145
    invoke-static {}, Lde/blinkt/openvpn/core/ProfileManager;->getLastConnectedVpn()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {}, Lde/blinkt/openvpn/core/ProfileManager;->getLastConnectedVpn()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v2

    iget-boolean v2, v2, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    if-nez v2, :cond_1

    .line 146
    const v2, 0x7f110267

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I)V

    .line 148
    :cond_1
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 149
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->fillTrafficData()V

    .line 150
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v3, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v3, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v2, v3, :cond_5

    .line 151
    :cond_2
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    goto :goto_0

    .line 153
    .end local v1    # "screenOffPause":Z
    :cond_3
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 155
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v1

    .line 156
    .local v1, "connected":Z
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 159
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDisconnectHandler:Landroid/os/Handler;

    iget-object v3, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mDelayDisconnectRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 161
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v2

    if-eq v2, v1, :cond_4

    .line 162
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v2}, Lde/blinkt/openvpn/core/OpenVPNManagement;->resume()V

    goto :goto_1

    .line 163
    :cond_4
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v2

    if-nez v2, :cond_6

    .line 165
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v3

    invoke-interface {v2, v3}, Lde/blinkt/openvpn/core/OpenVPNManagement;->pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    goto :goto_1

    .line 153
    .end local v1    # "connected":Z
    :cond_5
    :goto_0
    nop

    .line 168
    :cond_6
    :goto_1
    return-void
.end method

.method public shouldBeRunning()Z
    .locals 1

    .line 62
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v0

    return v0
.end method

.method public updateByteCount(JJJJ)V
    .locals 9
    .param p1, "in"    # J
    .param p3, "out"    # J
    .param p5, "diffIn"    # J
    .param p7, "diffOut"    # J

    .line 86
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-eq v0, v1, :cond_0

    .line 87
    return-void

    .line 89
    :cond_0
    add-long v5, p5, p7

    .line 90
    .local v5, "total":J
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    new-instance v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;-><init>(JJLde/blinkt/openvpn/core/DeviceStateReceiver-IA;)V

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 92
    :goto_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;

    iget-wide v0, v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;->timestamp:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v7, 0xea60

    sub-long/2addr v2, v7

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 93
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_0

    .line 96
    :cond_1
    const-wide/16 v0, 0x0

    .line 97
    .local v0, "windowtraffic":J
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->trafficdata:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;

    .line 98
    .local v3, "dp":Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;
    iget-wide v7, v3, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;->data:J

    add-long/2addr v0, v7

    .end local v3    # "dp":Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;
    goto :goto_1

    .line 100
    :cond_2
    const-wide/32 v2, 0x10000

    cmp-long v2, v0, v2

    if-gez v2, :cond_3

    .line 101
    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 102
    nop

    .line 103
    const/16 v2, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "64 kB"

    filled-new-array {v3, v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 102
    const v3, 0x7f110268

    invoke-static {v3, v2}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(I[Ljava/lang/Object;)V

    .line 105
    iget-object v2, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v3

    invoke-interface {v2, v3}, Lde/blinkt/openvpn/core/OpenVPNManagement;->pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    .line 107
    :cond_3
    return-void
.end method

.method public userPause(Z)V
    .locals 3
    .param p1, "pause"    # Z

    .line 111
    if-eqz p1, :cond_0

    .line 112
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 114
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v1

    invoke-interface {v0, v1}, Lde/blinkt/openvpn/core/OpenVPNManagement;->pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    goto :goto_0

    .line 116
    :cond_0
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v0

    .line 117
    .local v0, "wereConnected":Z
    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->userpause:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 118
    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->shouldBeConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    .line 119
    iget-object v1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-interface {v1}, Lde/blinkt/openvpn/core/OpenVPNManagement;->resume()V

    goto :goto_0

    .line 122
    :cond_1
    iget-object v1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->mManagement:Lde/blinkt/openvpn/core/OpenVPNManagement;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->getPauseReason()Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v2

    invoke-interface {v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement;->pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    .line 124
    .end local v0    # "wereConnected":Z
    :goto_0
    return-void
.end method
