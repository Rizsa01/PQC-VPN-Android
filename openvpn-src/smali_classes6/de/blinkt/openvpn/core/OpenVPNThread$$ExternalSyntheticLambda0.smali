.class public final synthetic Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lde/blinkt/openvpn/core/OpenVPNThread;

.field public final synthetic f$1:Ljava/io/OutputStream;


# direct methods
.method public synthetic constructor <init>(Lde/blinkt/openvpn/core/OpenVPNThread;Ljava/io/OutputStream;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;->f$0:Lde/blinkt/openvpn/core/OpenVPNThread;

    iput-object p2, p0, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;->f$1:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;->f$0:Lde/blinkt/openvpn/core/OpenVPNThread;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVPNThread$$ExternalSyntheticLambda0;->f$1:Ljava/io/OutputStream;

    invoke-static {v0, v1}, Lde/blinkt/openvpn/core/OpenVPNThread;->$r8$lambda$rc7uGbtcgDB58k_aCpEHPkea9Qs(Lde/blinkt/openvpn/core/OpenVPNThread;Ljava/io/OutputStream;)V

    return-void
.end method
