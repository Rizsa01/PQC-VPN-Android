.class Lde/blinkt/openvpn/core/OpenVPNService$1;
.super Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;
.source "OpenVPNService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/core/OpenVPNService;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/OpenVPNService;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/core/OpenVPNService;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNService$1;->this$0:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllowedExternalApp(Ljava/lang/String;)V
    .locals 0
    .param p1, "packagename"    # Ljava/lang/String;

    .line 48
    return-void
.end method

.method public challengeResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .line 50
    return-void
.end method

.method public isAllowedExternalApp(Ljava/lang/String;)Z
    .locals 1
    .param p1, "packagename"    # Ljava/lang/String;

    .line 49
    const/4 v0, 0x0

    return v0
.end method

.method public protect(I)Z
    .locals 1
    .param p1, "fd"    # I

    .line 45
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService$1;->this$0:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0, p1}, Lde/blinkt/openvpn/core/OpenVPNService;->protect(I)Z

    move-result v0

    return v0
.end method

.method public stopVPN(Z)Z
    .locals 1
    .param p1, "replace"    # Z

    .line 47
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService$1;->this$0:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-static {v0}, Lde/blinkt/openvpn/core/OpenVPNService;->-$$Nest$mstopVpn(Lde/blinkt/openvpn/core/OpenVPNService;)Z

    move-result v0

    return v0
.end method

.method public userPause(Z)V
    .locals 0
    .param p1, "shouldbePaused"    # Z

    .line 46
    return-void
.end method
