.class public Lde/blinkt/openvpn/core/OpenVPNStatusService;
.super Landroid/app/Service;
.source "OpenVPNStatusService.java"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$LogListener;
.implements Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
.implements Lde/blinkt/openvpn/core/VpnStatus$StateListener;
.implements Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;,
        Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;
    }
.end annotation


# static fields
.field private static final SEND_NEW_BYTECOUNT:I = 0x66

.field private static final SEND_NEW_CONNECTED_VPN:I = 0x67

.field private static final SEND_NEW_LOGITEM:I = 0x64

.field private static final SEND_NEW_PROFILE_VERSION:I = 0x68

.field private static final SEND_NEW_STATE:I = 0x65

.field static final mCallbacks:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList<",
            "Lde/blinkt/openvpn/core/IStatusCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private static final mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

.field static mLastUpdateMessage:Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;


# instance fields
.field private final mBinder:Lde/blinkt/openvpn/core/IServiceStatus$Stub;


# direct methods
.method static bridge synthetic -$$Nest$smsendUpdate(Lde/blinkt/openvpn/core/IStatusCallbacks;Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/core/OpenVPNStatusService;->sendUpdate(Lde/blinkt/openvpn/core/IStatusCallbacks;Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Landroid/os/RemoteCallbackList;

    invoke-direct {v0}, Landroid/os/RemoteCallbackList;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mCallbacks:Landroid/os/RemoteCallbackList;

    .line 186
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;-><init>(Lde/blinkt/openvpn/core/OpenVPNStatusService-IA;)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 60
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNStatusService$1;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/OpenVPNStatusService$1;-><init>(Lde/blinkt/openvpn/core/OpenVPNStatusService;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mBinder:Lde/blinkt/openvpn/core/IServiceStatus$Stub;

    return-void
.end method

.method private static sendUpdate(Lde/blinkt/openvpn/core/IStatusCallbacks;Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;)V
    .locals 6
    .param p0, "broadcastItem"    # Lde/blinkt/openvpn/core/IStatusCallbacks;
    .param p1, "um"    # Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 245
    iget-object v1, p1, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->state:Ljava/lang/String;

    iget-object v2, p1, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->logmessage:Ljava/lang/String;

    iget v3, p1, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->resId:I

    iget-object v4, p1, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->level:Lde/blinkt/openvpn/core/ConnectionStatus;

    iget-object v5, p1, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->intent:Landroid/content/Intent;

    move-object v0, p0

    .end local p0    # "broadcastItem":Lde/blinkt/openvpn/core/IStatusCallbacks;
    .local v0, "broadcastItem":Lde/blinkt/openvpn/core/IStatusCallbacks;
    invoke-interface/range {v0 .. v5}, Lde/blinkt/openvpn/core/IStatusCallbacks;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V

    .line 246
    return-void
.end method


# virtual methods
.method public newLog(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 2
    .param p1, "logItem"    # Lde/blinkt/openvpn/core/LogItem;

    .line 136
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1, p1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 137
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 138
    return-void
.end method

.method public notifyProfileVersionChanged(Ljava/lang/String;IZ)V
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "version"    # I
    .param p3, "changedInThisProcess"    # Z

    .line 182
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    const/16 v2, 0x68

    invoke-virtual {v0, v2, v1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 183
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 184
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 31
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mBinder:Lde/blinkt/openvpn/core/IServiceStatus$Stub;

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .line 40
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 41
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V

    .line 42
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addByteCountListener(Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;)V

    .line 43
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 44
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V

    .line 45
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    invoke-static {v0, p0}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->-$$Nest$msetService(Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;Lde/blinkt/openvpn/core/OpenVPNStatusService;)V

    .line 46
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 50
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 52
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V

    .line 53
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeByteCountListener(Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;)V

    .line 54
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 55
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V

    .line 56
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mCallbacks:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->kill()V

    .line 58
    return-void
.end method

.method public setConnectedVPN(Ljava/lang/String;)V
    .locals 2
    .param p1, "uuid"    # Ljava/lang/String;

    .line 175
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    const/16 v1, 0x67

    invoke-virtual {v0, v1, p1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 176
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 177
    return-void
.end method

.method public updateByteCount(JJJJ)V
    .locals 3
    .param p1, "in"    # J
    .param p3, "out"    # J
    .param p5, "diffIn"    # J
    .param p7, "diffOut"    # J

    .line 142
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    const/16 v2, 0x66

    invoke-virtual {v0, v2, v1}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 143
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 144
    return-void
.end method

.method public updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 6
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "logmessage"    # Ljava/lang/String;
    .param p3, "localizedResId"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;

    .line 168
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p1    # "state":Ljava/lang/String;
    .end local p2    # "logmessage":Ljava/lang/String;
    .end local p3    # "localizedResId":I
    .end local p4    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .end local p5    # "intent":Landroid/content/Intent;
    .local v1, "state":Ljava/lang/String;
    .local v2, "logmessage":Ljava/lang/String;
    .local v3, "localizedResId":I
    .local v4, "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .local v5, "intent":Landroid/content/Intent;
    invoke-direct/range {v0 .. v5}, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;-><init>(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mLastUpdateMessage:Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    .line 169
    sget-object p1, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mHandler:Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;

    const/16 p2, 0x65

    sget-object p3, Lde/blinkt/openvpn/core/OpenVPNStatusService;->mLastUpdateMessage:Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;

    invoke-virtual {p1, p2, p3}, Lde/blinkt/openvpn/core/OpenVPNStatusService$OpenVPNStatusHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 170
    .local p1, "msg":Landroid/os/Message;
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 171
    return-void
.end method
