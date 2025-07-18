.class Lde/blinkt/openvpn/core/StatusListener$1;
.super Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;
.source "StatusListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/StatusListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/blinkt/openvpn/core/StatusListener;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/core/StatusListener;)V
    .locals 0
    .param p1, "this$0"    # Lde/blinkt/openvpn/core/StatusListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 36
    iput-object p1, p0, Lde/blinkt/openvpn/core/StatusListener$1;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-direct {p0}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;-><init>()V

    return-void
.end method

.method private reCreateIntent(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .line 52
    if-nez p1, :cond_0

    .line 53
    const/4 v0, 0x0

    return-object v0

    .line 54
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 55
    .local v0, "newIntent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 56
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 57
    :cond_1
    return-object v0
.end method


# virtual methods
.method public connectedVPN(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 67
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnStatus;->setConnectedVPNProfile(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public newLogItem(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 0
    .param p1, "item"    # Lde/blinkt/openvpn/core/LogItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 39
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 40
    return-void
.end method

.method public notifyProfileVersionChanged(Ljava/lang/String;I)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "version"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener$1;->this$0:Lde/blinkt/openvpn/core/StatusListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/StatusListener;->-$$Nest$fgetmContext(Lde/blinkt/openvpn/core/StatusListener;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lde/blinkt/openvpn/core/ProfileManager;->notifyProfileVersionChanged(Landroid/content/Context;Ljava/lang/String;I)V

    .line 74
    return-void
.end method

.method public updateByteCount(JJ)V
    .locals 0
    .param p1, "inBytes"    # J
    .param p3, "outBytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 62
    invoke-static {p1, p2, p3, p4}, Lde/blinkt/openvpn/core/VpnStatus;->updateByteCount(JJ)V

    .line 63
    return-void
.end method

.method public updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 1
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "resid"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 45
    invoke-direct {p0, p5}, Lde/blinkt/openvpn/core/StatusListener$1;->reCreateIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    .line 46
    .local v0, "newIntent":Landroid/content/Intent;
    invoke-static {p1, p2, p3, p4, v0}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V

    .line 47
    return-void
.end method
