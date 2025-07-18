.class public abstract Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;
.super Landroid/os/Binder;
.source "IOpenVPNServiceInternal.java"

# interfaces
.implements Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_addAllowedExternalApp:I = 0x4

.field static final TRANSACTION_challengeResponse:I = 0x6

.field static final TRANSACTION_isAllowedExternalApp:I = 0x5

.field static final TRANSACTION_protect:I = 0x1

.field static final TRANSACTION_stopVPN:I = 0x3

.field static final TRANSACTION_userPause:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 44
    const-string v0, "de.blinkt.openvpn.core.IOpenVPNServiceInternal"

    invoke-virtual {p0, p0, v0}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 52
    if-nez p0, :cond_0

    .line 53
    const/4 v0, 0x0

    return-object v0

    .line 55
    :cond_0
    const-string v0, "de.blinkt.openvpn.core.IOpenVPNServiceInternal"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 56
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;

    if-eqz v1, :cond_1

    .line 57
    move-object v1, v0

    check-cast v1, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal;

    return-object v1

    .line 59
    :cond_1
    new-instance v1, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub$Proxy;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 63
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 4
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 67
    const-string v0, "de.blinkt.openvpn.core.IOpenVPNServiceInternal"

    .line 68
    .local v0, "descriptor":Ljava/lang/String;
    const/4 v1, 0x1

    if-lt p1, v1, :cond_0

    const v2, 0xffffff

    if-gt p1, v2, :cond_0

    .line 69
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 71
    :cond_0
    const v2, 0x5f4e5446

    if-ne p1, v2, :cond_1

    .line 72
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 73
    return v1

    .line 75
    :cond_1
    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    .line 130
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 123
    :pswitch_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->challengeResponse(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 126
    goto :goto_0

    .line 114
    .end local v2    # "_arg0":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 115
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->isAllowedExternalApp(Ljava/lang/String;)Z

    move-result v3

    .line 116
    .local v3, "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 117
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 118
    goto :goto_0

    .line 106
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_result":Z
    :pswitch_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 107
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->addAllowedExternalApp(Ljava/lang/String;)V

    .line 108
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 109
    goto :goto_0

    .line 97
    .end local v2    # "_arg0":Ljava/lang/String;
    :pswitch_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_2

    move v2, v1

    .line 98
    .local v2, "_arg0":Z
    :cond_2
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->stopVPN(Z)Z

    move-result v3

    .line 99
    .restart local v3    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 100
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 101
    goto :goto_0

    .line 89
    .end local v2    # "_arg0":Z
    .end local v3    # "_result":Z
    :pswitch_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_3

    move v2, v1

    .line 90
    .restart local v2    # "_arg0":Z
    :cond_3
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->userPause(Z)V

    .line 91
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 92
    goto :goto_0

    .line 80
    .end local v2    # "_arg0":Z
    :pswitch_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 81
    .local v2, "_arg0":I
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IOpenVPNServiceInternal$Stub;->protect(I)Z

    move-result v3

    .line 82
    .restart local v3    # "_result":Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 83
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 84
    nop

    .line 133
    .end local v2    # "_arg0":I
    .end local v3    # "_result":Z
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
