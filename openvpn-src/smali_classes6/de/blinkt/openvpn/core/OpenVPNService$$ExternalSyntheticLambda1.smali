.class public final synthetic Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lde/blinkt/openvpn/core/OpenVPNService;

.field public final synthetic f$1:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lde/blinkt/openvpn/core/OpenVPNService;Landroid/content/Intent;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;->f$0:Lde/blinkt/openvpn/core/OpenVPNService;

    iput-object p2, p0, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;->f$1:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;->f$0:Lde/blinkt/openvpn/core/OpenVPNService;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNService$$ExternalSyntheticLambda1;->f$1:Landroid/content/Intent;

    invoke-static {v0, v1}, Lde/blinkt/openvpn/core/OpenVPNService;->$r8$lambda$IIVoYZlPv3MJjHU9yhMDf6EmOAI(Lde/blinkt/openvpn/core/OpenVPNService;Landroid/content/Intent;)V

    return-void
.end method
