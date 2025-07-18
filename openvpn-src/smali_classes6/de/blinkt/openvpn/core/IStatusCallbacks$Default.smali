.class public Lde/blinkt/openvpn/core/IStatusCallbacks$Default;
.super Ljava/lang/Object;
.source "IStatusCallbacks.java"

# interfaces
.implements Lde/blinkt/openvpn/core/IStatusCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/IStatusCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .line 33
    const/4 v0, 0x0

    return-object v0
.end method

.method public connectedVPN(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 27
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

    .line 18
    return-void
.end method

.method public notifyProfileVersionChanged(Ljava/lang/String;I)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "profileVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 30
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

    .line 24
    return-void
.end method

.method public updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 0
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

    .line 21
    return-void
.end method
