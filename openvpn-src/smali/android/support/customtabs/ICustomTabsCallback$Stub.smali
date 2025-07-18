.class public abstract Landroid/support/customtabs/ICustomTabsCallback$Stub;
.super Landroid/os/Binder;
.source "ICustomTabsCallback.java"

# interfaces
.implements Landroid/support/customtabs/ICustomTabsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/customtabs/ICustomTabsCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/customtabs/ICustomTabsCallback$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_extraCallback:I = 0x3

.field static final TRANSACTION_extraCallbackWithResult:I = 0x7

.field static final TRANSACTION_onActivityLayout:I = 0xa

.field static final TRANSACTION_onActivityResized:I = 0x8

.field static final TRANSACTION_onMessageChannelReady:I = 0x4

.field static final TRANSACTION_onMinimized:I = 0xb

.field static final TRANSACTION_onNavigationEvent:I = 0x2

.field static final TRANSACTION_onPostMessage:I = 0x5

.field static final TRANSACTION_onRelationshipValidationResult:I = 0x6

.field static final TRANSACTION_onUnminimized:I = 0xc

.field static final TRANSACTION_onWarmupCompleted:I = 0x9


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 60
    sget-object v0, Landroid/support/customtabs/ICustomTabsCallback$Stub;->DESCRIPTOR:Ljava/lang/String;

    invoke-virtual {p0, p0, v0}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/support/customtabs/ICustomTabsCallback;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 68
    if-nez p0, :cond_0

    .line 69
    const/4 v0, 0x0

    return-object v0

    .line 71
    :cond_0
    sget-object v0, Landroid/support/customtabs/ICustomTabsCallback$Stub;->DESCRIPTOR:Ljava/lang/String;

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 72
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/customtabs/ICustomTabsCallback;

    if-eqz v1, :cond_1

    .line 73
    move-object v1, v0

    check-cast v1, Landroid/support/customtabs/ICustomTabsCallback;

    return-object v1

    .line 75
    :cond_1
    new-instance v1, Landroid/support/customtabs/ICustomTabsCallback$Stub$Proxy;

    invoke-direct {v1, p0}, Landroid/support/customtabs/ICustomTabsCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 79
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 10
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 83
    sget-object v0, Landroid/support/customtabs/ICustomTabsCallback$Stub;->DESCRIPTOR:Ljava/lang/String;

    .line 84
    .local v0, "descriptor":Ljava/lang/String;
    const/4 v1, 0x1

    if-lt p1, v1, :cond_0

    const v2, 0xffffff

    if-gt p1, v2, :cond_0

    .line 85
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 87
    :cond_0
    const v2, 0x5f4e5446

    if-ne p1, v2, :cond_1

    .line 88
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    return v1

    .line 91
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 204
    move-object v3, p0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 198
    :pswitch_0
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 199
    .local v2, "_arg0":Landroid/os/Bundle;
    invoke-virtual {p0, v2}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onUnminimized(Landroid/os/Bundle;)V

    .line 200
    move-object v3, p0

    goto/16 :goto_1

    .line 191
    .end local v2    # "_arg0":Landroid/os/Bundle;
    :pswitch_1
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 192
    .restart local v2    # "_arg0":Landroid/os/Bundle;
    invoke-virtual {p0, v2}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onMinimized(Landroid/os/Bundle;)V

    .line 193
    move-object v3, p0

    goto/16 :goto_1

    .line 174
    .end local v2    # "_arg0":Landroid/os/Bundle;
    :pswitch_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 176
    .local v4, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 178
    .local v5, "_arg1":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 180
    .local v6, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 182
    .local v7, "_arg3":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v8

    .line 184
    .local v8, "_arg4":I
    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/os/Bundle;

    .line 185
    .local v9, "_arg5":Landroid/os/Bundle;
    move-object v3, p0

    invoke-virtual/range {v3 .. v9}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onActivityLayout(IIIIILandroid/os/Bundle;)V

    .line 186
    goto/16 :goto_1

    .line 167
    .end local v4    # "_arg0":I
    .end local v5    # "_arg1":I
    .end local v6    # "_arg2":I
    .end local v7    # "_arg3":I
    .end local v8    # "_arg4":I
    .end local v9    # "_arg5":Landroid/os/Bundle;
    :pswitch_3
    move-object v3, p0

    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 168
    .restart local v2    # "_arg0":Landroid/os/Bundle;
    invoke-virtual {p0, v2}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onWarmupCompleted(Landroid/os/Bundle;)V

    .line 169
    goto/16 :goto_1

    .line 156
    .end local v2    # "_arg0":Landroid/os/Bundle;
    :pswitch_4
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 158
    .local v2, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 160
    .local v4, "_arg1":I
    sget-object v5, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v5}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/Bundle;

    .line 161
    .local v5, "_arg2":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4, v5}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onActivityResized(IILandroid/os/Bundle;)V

    .line 162
    goto/16 :goto_1

    .line 145
    .end local v2    # "_arg0":I
    .end local v4    # "_arg1":I
    .end local v5    # "_arg2":Landroid/os/Bundle;
    :pswitch_5
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "_arg0":Ljava/lang/String;
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    .line 148
    .local v4, "_arg1":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->extraCallbackWithResult(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v5

    .line 149
    .local v5, "_result":Landroid/os/Bundle;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 150
    invoke-static {p3, v5, v1}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$100(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    .line 151
    goto/16 :goto_1

    .line 132
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v4    # "_arg1":Landroid/os/Bundle;
    .end local v5    # "_result":Landroid/os/Bundle;
    :pswitch_6
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 134
    .local v2, "_arg0":I
    sget-object v4, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    .line 136
    .local v4, "_arg1":Landroid/net/Uri;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_2

    move v5, v1

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    .line 138
    .local v5, "_arg2":Z
    :goto_0
    sget-object v6, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v6}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Bundle;

    .line 139
    .local v6, "_arg3":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4, v5, v6}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onRelationshipValidationResult(ILandroid/net/Uri;ZLandroid/os/Bundle;)V

    .line 140
    goto :goto_1

    .line 122
    .end local v2    # "_arg0":I
    .end local v4    # "_arg1":Landroid/net/Uri;
    .end local v5    # "_arg2":Z
    .end local v6    # "_arg3":Landroid/os/Bundle;
    :pswitch_7
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "_arg0":Ljava/lang/String;
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    .line 125
    .local v4, "_arg1":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onPostMessage(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 126
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 127
    goto :goto_1

    .line 114
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v4    # "_arg1":Landroid/os/Bundle;
    :pswitch_8
    move-object v3, p0

    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v2}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 115
    .local v2, "_arg0":Landroid/os/Bundle;
    invoke-virtual {p0, v2}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onMessageChannelReady(Landroid/os/Bundle;)V

    .line 116
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 117
    goto :goto_1

    .line 105
    .end local v2    # "_arg0":Landroid/os/Bundle;
    :pswitch_9
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "_arg0":Ljava/lang/String;
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    .line 108
    .restart local v4    # "_arg1":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->extraCallback(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 109
    goto :goto_1

    .line 96
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v4    # "_arg1":Landroid/os/Bundle;
    :pswitch_a
    move-object v3, p0

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 98
    .local v2, "_arg0":I
    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v4}, Landroid/support/customtabs/ICustomTabsCallback$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    .line 99
    .restart local v4    # "_arg1":Landroid/os/Bundle;
    invoke-virtual {p0, v2, v4}, Landroid/support/customtabs/ICustomTabsCallback$Stub;->onNavigationEvent(ILandroid/os/Bundle;)V

    .line 100
    nop

    .line 207
    .end local v2    # "_arg0":I
    .end local v4    # "_arg1":Landroid/os/Bundle;
    :goto_1
    return v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
