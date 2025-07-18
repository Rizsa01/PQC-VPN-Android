.class public Lde/blinkt/openvpn/core/Connection;
.super Ljava/lang/Object;
.source "Connection.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/Connection$ProxyType;
    }
.end annotation


# static fields
.field public static final CONNECTION_DEFAULT_TIMEOUT:I = 0x78

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x146f68730960261L


# instance fields
.field public mConnectTimeout:I

.field public mCustomConfiguration:Ljava/lang/String;

.field public mEnabled:Z

.field public mProxyAuthPassword:Ljava/lang/String;

.field public mProxyAuthUser:Ljava/lang/String;

.field public mProxyName:Ljava/lang/String;

.field public mProxyPort:Ljava/lang/String;

.field public mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

.field public mServerName:Ljava/lang/String;

.field public mServerPort:Ljava/lang/String;

.field public mUseCustomConfig:Z

.field public mUseProxyAuth:Z

.field public mUseUdp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 84
    new-instance v0, Lde/blinkt/openvpn/core/Connection$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/Connection$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/Connection;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, "openvpn.example.com"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    .line 19
    const-string v0, "1194"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 21
    const-string v1, ""

    iput-object v1, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    .line 22
    const/4 v1, 0x0

    iput-boolean v1, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    .line 23
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mEnabled:Z

    .line 24
    iput v1, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    .line 26
    sget-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 27
    const-string v0, "proxy.example.com"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    .line 28
    const-string v0, "8080"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    .line 43
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, "openvpn.example.com"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    .line 19
    const-string v0, "1194"

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 21
    const-string v1, ""

    iput-object v1, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    .line 22
    const/4 v1, 0x0

    iput-boolean v1, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    .line 23
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mEnabled:Z

    .line 24
    iput v1, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    .line 26
    sget-object v2, Lde/blinkt/openvpn/core/Connection$ProxyType;->NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 27
    const-string v2, "proxy.example.com"

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    .line 28
    const-string v2, "8080"

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    .line 31
    const/4 v2, 0x0

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    .line 32
    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    iput-boolean v2, p0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    .line 51
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    iput-boolean v2, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    iput-boolean v2, p0, Lde/blinkt/openvpn/core/Connection;->mEnabled:Z

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/Connection$ProxyType;->valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/Connection$ProxyType;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_3

    :cond_3
    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseProxyAuth:Z

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    .line 60
    return-void
.end method


# virtual methods
.method public clone()Lde/blinkt/openvpn/core/Connection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 132
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/Connection;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/Connection;->clone()Lde/blinkt/openvpn/core/Connection;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public getConnectionBlock(Z)Ljava/lang/String;
    .locals 5
    .param p1, "isOpenVPN3"    # Z

    .line 99
    const-string v0, ""

    .line 100
    .local v0, "cfg":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "remote "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    iget-boolean v1, p0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    if-eqz v1, :cond_0

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " udp\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 107
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " tcp-client\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    :goto_0
    iget v1, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    if-eqz v1, :cond_1

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v3, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, " connect-timeout  %d\n"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    :cond_1
    if-nez p1, :cond_2

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/Connection;->usesExtraProxyOptions()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    iget-object v1, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    sget-object v2, Lde/blinkt/openvpn/core/Connection$ProxyType;->HTTP:Lde/blinkt/openvpn/core/Connection$ProxyType;

    if-ne v1, v2, :cond_3

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v3, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    iget-object v4, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "http-proxy %s %s\n"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    iget-boolean v1, p0, Lde/blinkt/openvpn/core/Connection;->mUseProxyAuth:Z

    if-eqz v1, :cond_3

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v3, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    iget-object v4, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "<http-proxy-user-pass>\n%s\n%s\n</http-proxy-user-pass>\n"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 115
    :cond_3
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/Connection;->usesExtraProxyOptions()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    sget-object v2, Lde/blinkt/openvpn/core/Connection$ProxyType;->SOCKS5:Lde/blinkt/openvpn/core/Connection$ProxyType;

    if-ne v1, v2, :cond_4

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v3, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    iget-object v4, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "socks-proxy %s %s\n"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    :cond_4
    iget-object v1, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    if-eqz v1, :cond_5

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    :cond_5
    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .line 140
    iget v0, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    if-gtz v0, :cond_0

    .line 141
    const/16 v0, 0x78

    return v0

    .line 143
    :cond_0
    iget v0, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    return v0
.end method

.method public isOnlyRemote()Z
    .locals 1

    .line 136
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public usesExtraProxyOptions()Z
    .locals 2

    .line 126
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    const-string v1, "http-proxy-option "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 64
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 66
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 67
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 68
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 69
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mEnabled:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 70
    iget v0, p0, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/Connection$ProxyType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 74
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/Connection;->mUseProxyAuth:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 75
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 76
    iget-object v0, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 77
    return-void
.end method
