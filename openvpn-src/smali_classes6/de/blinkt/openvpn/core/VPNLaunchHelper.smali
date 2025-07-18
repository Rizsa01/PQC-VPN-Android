.class public Lde/blinkt/openvpn/core/VPNLaunchHelper;
.super Ljava/lang/Object;
.source "VPNLaunchHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static buildOpenvpnArgv(Landroid/content/Context;)[Ljava/lang/String;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .line 36
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "openvpn"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "--config"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "stdin"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public static startOpenVpn(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 3
    .param p0, "startprofile"    # Lde/blinkt/openvpn/core/VpnProfile;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "startReason"    # Ljava/lang/String;
    .param p3, "replace_running_vpn"    # Z

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lde/blinkt/openvpn/core/VpnProfile;->getStartServiceIntent(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    .line 21
    .local v0, "startVPN":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 22
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 28
    :cond_1
    :goto_0
    return-void
.end method
