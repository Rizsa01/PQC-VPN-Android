.class public interface abstract Lde/blinkt/openvpn/core/OpenVPNManagement;
.super Ljava/lang/Object;
.source "OpenVPNManagement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;,
        Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;,
        Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;
    }
.end annotation


# virtual methods
.method public abstract networkChange(Z)V
.end method

.method public abstract pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V
.end method

.method public abstract reconnect()V
.end method

.method public abstract resume()V
.end method

.method public abstract sendCRResponse(Ljava/lang/String;)V
.end method

.method public abstract setPauseCallback(Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;)V
.end method

.method public abstract signalusr1()V
.end method

.method public abstract stopVPN(Z)Z
.end method
