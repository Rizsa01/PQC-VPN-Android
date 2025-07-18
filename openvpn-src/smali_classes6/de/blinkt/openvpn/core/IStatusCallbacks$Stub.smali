.class public abstract Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;
.super Landroid/os/Binder;
.source "IStatusCallbacks.java"

# interfaces
.implements Lde/blinkt/openvpn/core/IStatusCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/IStatusCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/IStatusCallbacks$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_connectedVPN:I = 0x4

.field static final TRANSACTION_newLogItem:I = 0x1

.field static final TRANSACTION_notifyProfileVersionChanged:I = 0x5

.field static final TRANSACTION_updateByteCount:I = 0x3

.field static final TRANSACTION_updateStateString:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 43
    const-string v0, "de.blinkt.openvpn.core.IStatusCallbacks"

    invoke-virtual {p0, p0, v0}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lde/blinkt/openvpn/core/IStatusCallbacks;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 51
    if-nez p0, :cond_0

    .line 52
    const/4 v0, 0x0

    return-object v0

    .line 54
    :cond_0
    const-string v0, "de.blinkt.openvpn.core.IStatusCallbacks"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 55
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lde/blinkt/openvpn/core/IStatusCallbacks;

    if-eqz v1, :cond_1

    .line 56
    move-object v1, v0

    check-cast v1, Lde/blinkt/openvpn/core/IStatusCallbacks;

    return-object v1

    .line 58
    :cond_1
    new-instance v1, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub$Proxy;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 62
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 8
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 66
    const-string v6, "de.blinkt.openvpn.core.IStatusCallbacks"

    .line 67
    .local v6, "descriptor":Ljava/lang/String;
    const/4 v7, 0x1

    if-lt p1, v7, :cond_0

    const v1, 0xffffff

    if-gt p1, v1, :cond_0

    .line 68
    invoke-virtual {p2, v6}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 70
    :cond_0
    const v1, 0x5f4e5446

    if-ne p1, v1, :cond_1

    .line 71
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 72
    return v7

    .line 74
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 125
    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 117
    :pswitch_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 119
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 120
    .local v2, "_arg1":I
    invoke-virtual {p0, v1, v2}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->notifyProfileVersionChanged(Ljava/lang/String;I)V

    .line 121
    goto :goto_0

    .line 110
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":I
    :pswitch_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 111
    .restart local v1    # "_arg0":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->connectedVPN(Ljava/lang/String;)V

    .line 112
    goto :goto_0

    .line 101
    .end local v1    # "_arg0":Ljava/lang/String;
    :pswitch_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    .line 103
    .local v1, "_arg0":J
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    .line 104
    .local v3, "_arg1":J
    invoke-virtual {p0, v1, v2, v3, v4}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->updateByteCount(JJ)V

    .line 105
    goto :goto_0

    .line 86
    .end local v1    # "_arg0":J
    .end local v3    # "_arg1":J
    :pswitch_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "_arg0":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, "_arg1":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 92
    .local v3, "_arg2":I
    sget-object v4, Lde/blinkt/openvpn/core/ConnectionStatus;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Lde/blinkt/openvpn/core/IStatusCallbacks$_Parcel;->-$$Nest$smreadTypedObject(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 94
    .local v4, "_arg3":Lde/blinkt/openvpn/core/ConnectionStatus;
    sget-object v5, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v5}, Lde/blinkt/openvpn/core/IStatusCallbacks$_Parcel;->-$$Nest$smreadTypedObject(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Intent;

    .line 95
    .local v5, "_arg4":Landroid/content/Intent;
    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V

    .line 96
    goto :goto_0

    .line 79
    .end local v1    # "_arg0":Ljava/lang/String;
    .end local v2    # "_arg1":Ljava/lang/String;
    .end local v3    # "_arg2":I
    .end local v4    # "_arg3":Lde/blinkt/openvpn/core/ConnectionStatus;
    .end local v5    # "_arg4":Landroid/content/Intent;
    :pswitch_4
    sget-object v1, Lde/blinkt/openvpn/core/LogItem;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v1}, Lde/blinkt/openvpn/core/IStatusCallbacks$_Parcel;->-$$Nest$smreadTypedObject(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/blinkt/openvpn/core/LogItem;

    .line 80
    .local v1, "_arg0":Lde/blinkt/openvpn/core/LogItem;
    invoke-virtual {p0, v1}, Lde/blinkt/openvpn/core/IStatusCallbacks$Stub;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 81
    nop

    .line 128
    .end local v1    # "_arg0":Lde/blinkt/openvpn/core/LogItem;
    :goto_0
    return v7

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
