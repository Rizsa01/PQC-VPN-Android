.class Lde/blinkt/openvpn/OpenVPNTileService$1;
.super Ljava/lang/Object;
.source "OpenVPNTileService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/OpenVPNTileService;->onClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/OpenVPNTileService;

.field final synthetic val$bootProfile:Lde/blinkt/openvpn/core/VpnProfile;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/OpenVPNTileService;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/OpenVPNTileService;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 47
    iput-object p1, p0, Lde/blinkt/openvpn/OpenVPNTileService$1;->this$0:Lde/blinkt/openvpn/OpenVPNTileService;

    iput-object p2, p0, Lde/blinkt/openvpn/OpenVPNTileService$1;->val$bootProfile:Lde/blinkt/openvpn/core/VpnProfile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 50
    iget-object v0, p0, Lde/blinkt/openvpn/OpenVPNTileService$1;->this$0:Lde/blinkt/openvpn/OpenVPNTileService;

    iget-object v1, p0, Lde/blinkt/openvpn/OpenVPNTileService$1;->val$bootProfile:Lde/blinkt/openvpn/core/VpnProfile;

    invoke-static {v0, v1}, Lde/blinkt/openvpn/OpenVPNTileService;->-$$Nest$mclickAction(Lde/blinkt/openvpn/OpenVPNTileService;Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 51
    return-void
.end method
