.class public abstract Lde/blinkt/openvpn/core/IServiceStatus$Stub;
.super Landroid/os/Binder;
.source "IServiceStatus.java"

# interfaces
.implements Lde/blinkt/openvpn/core/IServiceStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/IServiceStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/IServiceStatus$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_getLastConnectedVPN:I = 0x3

.field static final TRANSACTION_getTrafficHistory:I = 0x5

.field static final TRANSACTION_notifyProfileVersionChanged:I = 0x6

.field static final TRANSACTION_registerStatusCallback:I = 0x1

.field static final TRANSACTION_setCachedPassword:I = 0x4

.field static final TRANSACTION_unregisterStatusCallback:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 53
    const-string v0, "de.blinkt.openvpn.core.IServiceStatus"

    invoke-virtual {p0, p0, v0}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IServiceStatus;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 61
    if-nez p0, :cond_0

    .line 62
    const/4 v0, 0x0

    return-object v0

    .line 64
    :cond_0
    const-string v0, "de.blinkt.openvpn.core.IServiceStatus"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 65
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lde/blinkt/openvpn/core/IServiceStatus;

    if-eqz v1, :cond_1

    .line 66
    move-object v1, v0

    check-cast v1, Lde/blinkt/openvpn/core/IServiceStatus;

    return-object v1

    .line 68
    :cond_1
    new-instance v1, Lde/blinkt/openvpn/core/IServiceStatus$Stub$Proxy;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/IServiceStatus$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 72
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 76
    const-string v0, "de.blinkt.openvpn.core.IServiceStatus"

    .line 77
    .local v0, "descriptor":Ljava/lang/String;
    const/4 v1, 0x1

    if-lt p1, v1, :cond_0

    const v2, 0xffffff

    if-gt p1, v2, :cond_0

    .line 78
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 80
    :cond_0
    const v2, 0x5f4e5446

    if-ne p1, v2, :cond_1

    .line 81
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 82
    return v1

    .line 84
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 140
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 132
    :pswitch_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 134
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 135
    .local v3, "_arg1":I
    invoke-virtual {p0, v2, v3}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->notifyProfileVersionChanged(Ljava/lang/String;I)V

    .line 136
    goto :goto_0

    .line 124
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":I
    :pswitch_1
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->getTrafficHistory()Lde/blinkt/openvpn/core/TrafficHistory;

    move-result-object v2

    .line 125
    .local v2, "_result":Lde/blinkt/openvpn/core/TrafficHistory;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 126
    invoke-static {p3, v2, v1}, Lde/blinkt/openvpn/core/IServiceStatus$_Parcel;->-$$Nest$smwriteTypedObject(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    .line 127
    goto :goto_0

    .line 113
    .end local v2    # "_result":Lde/blinkt/openvpn/core/TrafficHistory;
    :pswitch_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 117
    .restart local v3    # "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 118
    .local v4, "_arg2":Ljava/lang/String;
    invoke-virtual {p0, v2, v3, v4}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->setCachedPassword(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 120
    goto :goto_0

    .line 105
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":Ljava/lang/String;
    :pswitch_3
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->getLastConnectedVPN()Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "_result":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 107
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 108
    goto :goto_0

    .line 98
    .end local v2    # "_result":Ljava/lang/String;
    :pswitch_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IStatusCallbacks;

    move-result-object v2

    .line 99
    .local v2, "_arg0":Lde/blinkt/openvpn/core/IStatusCallbacks;
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->unregisterStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)V

    .line 100
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 101
    goto :goto_0

    .line 89
    .end local v2    # "_arg0":Lde/blinkt/openvpn/core/IStatusCallbacks;
    :pswitch_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IStatusCallbacks;

    move-result-object v2

    .line 90
    .restart local v2    # "_arg0":Lde/blinkt/openvpn/core/IStatusCallbacks;
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/IServiceStatus$Stub;->registerStatusCallback(Lde/blinkt/openvpn/core/IStatusCallbacks;)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    .line 91
    .local v3, "_result":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 92
    invoke-static {p3, v3, v1}, Lde/blinkt/openvpn/core/IServiceStatus$_Parcel;->-$$Nest$smwriteTypedObject(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    .line 93
    nop

    .line 143
    .end local v2    # "_arg0":Lde/blinkt/openvpn/core/IStatusCallbacks;
    .end local v3    # "_result":Landroid/os/ParcelFileDescriptor;
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
