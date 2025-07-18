.class Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;
.super Ljava/lang/Object;
.source "OpenVPNStatusService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNStatusService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UpdateMessage"
.end annotation


# instance fields
.field public intent:Landroid/content/Intent;

.field public level:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public logmessage:Ljava/lang/String;

.field resId:I

.field public state:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "logmessage"    # Ljava/lang/String;
    .param p3, "resId"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->state:Ljava/lang/String;

    .line 157
    iput p3, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->resId:I

    .line 158
    iput-object p2, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->logmessage:Ljava/lang/String;

    .line 159
    iput-object p4, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->level:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 160
    iput-object p5, p0, Lde/blinkt/openvpn/core/OpenVPNStatusService$UpdateMessage;->intent:Landroid/content/Intent;

    .line 161
    return-void
.end method
