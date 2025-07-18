.class public Lde/blinkt/openvpn/OpenVPNTileService;
.super Landroid/service/quicksettings/TileService;
.source "OpenVPNTileService.java"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$StateListener;


# direct methods
.method static bridge synthetic -$$Nest$mclickAction(Lde/blinkt/openvpn/OpenVPNTileService;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/OpenVPNTileService;->clickAction(Lde/blinkt/openvpn/core/VpnProfile;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    return-void
.end method

.method private clickAction(Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 3
    .param p1, "bootProfile"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 57
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->isVPNActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 59
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "de.blinkt.openvpn.START_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    new-instance v1, Lde/blinkt/openvpn/OpenVPNTileService$2;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/OpenVPNTileService$2;-><init>(Lde/blinkt/openvpn/OpenVPNTileService;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lde/blinkt/openvpn/OpenVPNTileService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 80
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 81
    :cond_0
    invoke-virtual {p0, p1, p0}, Lde/blinkt/openvpn/OpenVPNTileService;->launchVPN(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;)V

    .line 82
    :goto_0
    return-void
.end method


# virtual methods
.method public getQSVPN()Lde/blinkt/openvpn/core/VpnProfile;
    .locals 1

    .line 105
    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileManager;->getAlwaysOnVPN(Landroid/content/Context;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    return-object v0
.end method

.method launchVPN(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;)V
    .locals 3
    .param p1, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;
    .param p2, "context"    # Landroid/content/Context;

    .line 88
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "QuickTile"

    const/4 v2, 0x1

    invoke-static {p1, v0, v1, v2}, Lde/blinkt/openvpn/core/VPNLaunchHelper;->startOpenVpn(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;Ljava/lang/String;Z)V

    .line 89
    return-void
.end method

.method public onClick()V
    .locals 3

    .line 39
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    .line 40
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->getQSVPN()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    .line 41
    .local v0, "bootProfile":Lde/blinkt/openvpn/core/VpnProfile;
    if-nez v0, :cond_0

    .line 42
    const v1, 0x7f110203

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->isLocked()Z

    move-result v1

    if-nez v1, :cond_1

    .line 45
    invoke-direct {p0, v0}, Lde/blinkt/openvpn/OpenVPNTileService;->clickAction(Lde/blinkt/openvpn/core/VpnProfile;)V

    goto :goto_0

    .line 47
    :cond_1
    new-instance v1, Lde/blinkt/openvpn/OpenVPNTileService$1;

    invoke-direct {v1, p0, v0}, Lde/blinkt/openvpn/OpenVPNTileService$1;-><init>(Lde/blinkt/openvpn/OpenVPNTileService;Lde/blinkt/openvpn/core/VpnProfile;)V

    invoke-virtual {p0, v1}, Lde/blinkt/openvpn/OpenVPNTileService;->unlockAndRun(Ljava/lang/Runnable;)V

    .line 54
    :goto_0
    return-void
.end method

.method public onStartListening()V
    .locals 0

    .line 98
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    .line 99
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->addStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 100
    return-void
.end method

.method public onStopListening()V
    .locals 0

    .line 143
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->removeStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 144
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStopListening()V

    .line 145
    return-void
.end method

.method public onTileAdded()V
    .locals 0

    .line 94
    return-void
.end method

.method public setConnectedVPN(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .line 139
    return-void
.end method

.method public updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 5
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "logmessage"    # Ljava/lang/String;
    .param p3, "localizedResId"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;

    .line 111
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    .line 112
    .local v0, "t":Landroid/service/quicksettings/Tile;
    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_AUTH_FAILED:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-eq p4, v1, :cond_2

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-ne p4, v1, :cond_0

    goto :goto_1

    .line 123
    :cond_0
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->getLastConnectedVPNProfile()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lde/blinkt/openvpn/core/ProfileManager;->get(Landroid/content/Context;Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v1

    .line 125
    .local v1, "vpn":Lde/blinkt/openvpn/core/VpnProfile;
    if-nez v1, :cond_1

    .line 126
    const-string v2, "null?!"

    .local v2, "name":Ljava/lang/String;
    goto :goto_0

    .line 128
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v2

    .line 129
    .restart local v2    # "name":Ljava/lang/String;
    :goto_0
    const v3, 0x7f11023f

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lde/blinkt/openvpn/OpenVPNTileService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 130
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/service/quicksettings/Tile;->setState(I)V

    goto :goto_2

    .line 114
    .end local v1    # "vpn":Lde/blinkt/openvpn/core/VpnProfile;
    .end local v2    # "name":Ljava/lang/String;
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lde/blinkt/openvpn/OpenVPNTileService;->getQSVPN()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v1

    .line 115
    .restart local v1    # "vpn":Lde/blinkt/openvpn/core/VpnProfile;
    if-nez v1, :cond_3

    .line 116
    const v2, 0x7f110203

    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/OpenVPNTileService;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 117
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    goto :goto_2

    .line 119
    :cond_3
    invoke-virtual {v1}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f11023e

    invoke-virtual {p0, v3, v2}, Lde/blinkt/openvpn/OpenVPNTileService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 120
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 133
    :goto_2
    invoke-virtual {v0}, Landroid/service/quicksettings/Tile;->updateTile()V

    .line 134
    return-void
.end method
