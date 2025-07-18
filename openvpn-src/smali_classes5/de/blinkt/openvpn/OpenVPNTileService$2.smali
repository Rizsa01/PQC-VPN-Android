.class Lde/blinkt/openvpn/OpenVPNTileService$2;
.super Ljava/lang/Object;
.source "OpenVPNTileService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/OpenVPNTileService;->clickAction(Lde/blinkt/openvpn/core/VpnProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/OpenVPNTileService;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/OpenVPNTileService;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/OpenVPNTileService;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lde/blinkt/openvpn/OpenVPNTileService$2;->this$0:Lde/blinkt/openvpn/OpenVPNTileService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "componentName"    # Landroid/content/ComponentName;
    .param p2, "binder"    # Landroid/os/IBinder;

    .line 63
    invoke-static {p2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;

    move-result-object v0

    .line 65
    .local v0, "service":Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;
    if-eqz v0, :cond_0

    .line 67
    const/4 v1, 0x0

    :try_start_0
    invoke-interface {v0, v1}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;->stopVPN(Z)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    goto :goto_0

    .line 68
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Landroid/os/RemoteException;
    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 72
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    iget-object v1, p0, Lde/blinkt/openvpn/OpenVPNTileService$2;->this$0:Lde/blinkt/openvpn/OpenVPNTileService;

    invoke-virtual {v1, p0}, Lde/blinkt/openvpn/OpenVPNTileService;->unbindService(Landroid/content/ServiceConnection;)V

    .line 73
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "componentName"    # Landroid/content/ComponentName;

    .line 78
    return-void
.end method
