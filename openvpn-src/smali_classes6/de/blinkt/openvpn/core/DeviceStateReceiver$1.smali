.class Lde/blinkt/openvpn/core/DeviceStateReceiver$1;
.super Ljava/lang/Object;
.source "DeviceStateReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/DeviceStateReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/DeviceStateReceiver;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/core/DeviceStateReceiver;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 43
    iput-object p1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 46
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    iget-object v0, v0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-eq v0, v1, :cond_0

    .line 47
    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v1, v0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->network:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 52
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    iget-object v0, v0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    if-ne v0, v1, :cond_1

    .line 53
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    iput-object v1, v0, Lde/blinkt/openvpn/core/DeviceStateReceiver;->screen:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 55
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    invoke-static {v0}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->-$$Nest$fgetmManagement(Lde/blinkt/openvpn/core/DeviceStateReceiver;)Lde/blinkt/openvpn/core/OpenVPNManagement;

    move-result-object v0

    iget-object v1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$1;->this$0:Lde/blinkt/openvpn/core/DeviceStateReceiver;

    invoke-static {v1}, Lde/blinkt/openvpn/core/DeviceStateReceiver;->-$$Nest$mgetPauseReason(Lde/blinkt/openvpn/core/DeviceStateReceiver;)Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v1

    invoke-interface {v0, v1}, Lde/blinkt/openvpn/core/OpenVPNManagement;->pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    .line 56
    return-void
.end method
