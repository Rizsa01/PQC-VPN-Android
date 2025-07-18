.class public interface abstract Lde/blinkt/openvpn/core/VpnStatus$StateListener;
.super Ljava/lang/Object;
.source "VpnStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/VpnStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StateListener"
.end annotation


# virtual methods
.method public abstract setConnectedVPN(Ljava/lang/String;)V
.end method

.method public abstract updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
.end method
