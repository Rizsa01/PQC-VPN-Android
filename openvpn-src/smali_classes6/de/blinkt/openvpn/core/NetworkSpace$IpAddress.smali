.class Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
.super Ljava/lang/Object;
.source "NetworkSpace.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/NetworkSpace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IpAddress"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;",
        ">;"
    }
.end annotation


# instance fields
.field private firstAddress:Ljava/math/BigInteger;

.field private included:Z

.field private isV4:Z

.field private lastAddress:Ljava/math/BigInteger;

.field private netAddress:Ljava/math/BigInteger;

.field public networkMask:I


# direct methods
.method static bridge synthetic -$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z
    .locals 0

    iget-boolean p0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    return p0
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/CIDRIP;Z)V
    .locals 2
    .param p1, "ip"    # Lde/blinkt/openvpn/core/CIDRIP;
    .param p2, "include"    # Z

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-boolean p2, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    .line 85
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/CIDRIP;->getInt()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 86
    iget v0, p1, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    iput v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    .line 88
    return-void
.end method

.method constructor <init>(Ljava/math/BigInteger;IZZ)V
    .locals 0
    .param p1, "baseAddress"    # Ljava/math/BigInteger;
    .param p2, "mask"    # I
    .param p3, "included"    # Z
    .param p4, "isV4"    # Z

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object p1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 149
    iput p2, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    .line 150
    iput-boolean p3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    .line 151
    iput-boolean p4, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/net/Inet6Address;IZ)V
    .locals 8
    .param p1, "address"    # Ljava/net/Inet6Address;
    .param p2, "mask"    # I
    .param p3, "include"    # Z

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput p2, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    .line 92
    iput-boolean p3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    .line 94
    const/16 v0, 0x80

    .line 96
    .local v0, "s":I
    sget-object v1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    iput-object v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 97
    invoke-virtual {p1}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-byte v4, v1, v3

    .line 98
    .local v4, "b":B
    add-int/lit8 v0, v0, -0x8

    .line 99
    iget-object v5, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    and-int/lit16 v6, v4, 0xff

    int-to-long v6, v6

    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    iput-object v5, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 97
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method

.method private getMaskedAddress(Z)Ljava/math/BigInteger;
    .locals 3
    .param p1, "one"    # Z

    .line 118
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 121
    .local v0, "numAddress":Ljava/math/BigInteger;
    iget-boolean v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    if-eqz v1, :cond_0

    .line 122
    iget v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    rsub-int/lit8 v1, v1, 0x20

    .local v1, "numBits":I
    goto :goto_0

    .line 124
    .end local v1    # "numBits":I
    :cond_0
    iget v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    rsub-int v1, v1, 0x80

    .line 127
    .restart local v1    # "numBits":I
    :goto_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_2

    .line 128
    if-eqz p1, :cond_1

    .line 129
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_2

    .line 131
    :cond_1
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->clearBit(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 127
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 133
    .end local v2    # "i":I
    :cond_2
    return-object v0
.end method


# virtual methods
.method public compareTo(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)I
    .locals 3
    .param p1, "another"    # Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 55
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v0

    .line 56
    .local v0, "comp":I
    if-eqz v0, :cond_0

    .line 57
    return v0

    .line 60
    :cond_0
    iget v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v2, p1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-le v1, v2, :cond_1

    .line 61
    const/4 v1, -0x1

    return v1

    .line 62
    :cond_1
    iget v1, p1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v2, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-ne v1, v2, :cond_2

    .line 63
    const/4 v1, 0x0

    return v1

    .line 65
    :cond_2
    const/4 v1, 0x1

    return v1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 39
    check-cast p1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->compareTo(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)I

    move-result p1

    return p1
.end method

.method public containsNet(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z
    .locals 9
    .param p1, "network"    # Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 205
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v0

    .line 206
    .local v0, "ourFirst":Ljava/math/BigInteger;
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v1

    .line 207
    .local v1, "ourLast":Ljava/math/BigInteger;
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v2

    .line 208
    .local v2, "netFirst":Ljava/math/BigInteger;
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v3

    .line 210
    .local v3, "netLast":Ljava/math/BigInteger;
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v4, v6, :cond_0

    move v4, v6

    goto :goto_0

    :cond_0
    move v4, v5

    .line 211
    .local v4, "a":Z
    :goto_0
    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    move v7, v6

    goto :goto_1

    :cond_1
    move v7, v5

    .line 212
    .local v7, "b":Z
    :goto_1
    if-eqz v4, :cond_2

    if-eqz v7, :cond_2

    move v5, v6

    :cond_2
    return v5
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 75
    instance-of v0, p1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    if-nez v0, :cond_0

    .line 76
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 79
    :cond_0
    move-object v0, p1

    check-cast v0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 80
    .local v0, "on":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    iget v1, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v2, v0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-ne v1, v2, :cond_1

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getFirstAddress()Ljava/math/BigInteger;
    .locals 1

    .line 111
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->firstAddress:Ljava/math/BigInteger;

    if-nez v0, :cond_0

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getMaskedAddress(Z)Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->firstAddress:Ljava/math/BigInteger;

    .line 113
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->firstAddress:Ljava/math/BigInteger;

    return-object v0
.end method

.method getIPv4Address()Ljava/lang/String;
    .locals 9

    .line 164
    sget-boolean v0, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-eqz v0, :cond_2

    .line 165
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    invoke-static {v0}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 166
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    const-wide v2, 0xffffffffL

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-gtz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 167
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-ltz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-static {v1}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 169
    :cond_2
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    .line 170
    .local v0, "ip":J
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/16 v3, 0x18

    shr-long v3, v0, v3

    const-wide/16 v5, 0x100

    rem-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/16 v4, 0x10

    shr-long v7, v0, v4

    rem-long/2addr v7, v5

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/16 v7, 0x8

    shr-long v7, v0, v7

    rem-long/2addr v7, v5

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    rem-long v5, v0, v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    filled-new-array {v3, v4, v7, v5}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "%d.%d.%d.%d"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method getIPv6Address()Ljava/lang/String;
    .locals 9

    .line 174
    sget-boolean v0, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    xor-int/2addr v0, v1

    invoke-static {v0}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 175
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    .line 177
    .local v0, "r":Ljava/math/BigInteger;
    const/4 v2, 0x0

    .line 178
    .local v2, "ipv6str":Ljava/lang/String;
    const/4 v3, 0x1

    .line 180
    .local v3, "lastPart":Z
    :goto_0
    sget-object v4, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-ne v4, v1, :cond_5

    .line 182
    const-wide/32 v4, 0x10000

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v4

    .line 183
    .local v4, "part":J
    if-nez v2, :cond_1

    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-eqz v6, :cond_4

    .line 184
    :cond_1
    if-nez v2, :cond_2

    if-nez v3, :cond_2

    .line 185
    const-string v2, ":"

    .line 187
    :cond_2
    if-eqz v3, :cond_3

    .line 188
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7, v2}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "%x"

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 190
    :cond_3
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7, v2}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "%x:%s"

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 193
    :cond_4
    :goto_1
    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 194
    const/4 v3, 0x0

    .line 195
    .end local v4    # "part":J
    goto :goto_0

    .line 196
    :cond_5
    if-nez v2, :cond_6

    .line 197
    const-string v1, "::"

    return-object v1

    .line 200
    :cond_6
    return-object v2
.end method

.method public getLastAddress()Ljava/math/BigInteger;
    .locals 1

    .line 104
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->lastAddress:Ljava/math/BigInteger;

    if-nez v0, :cond_0

    .line 105
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getMaskedAddress(Z)Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->lastAddress:Ljava/math/BigInteger;

    .line 106
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->lastAddress:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getPrefix()Landroid/net/IpPrefix;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 218
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    const-wide v2, 0x100000000L

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 223
    .local v0, "ipBytes":[B
    const/4 v2, 0x5

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 225
    invoke-static {v0}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    .line 226
    .local v1, "inet4addr":Ljava/net/InetAddress;
    new-instance v2, Landroid/net/IpPrefix;

    iget v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    invoke-direct {v2, v1, v3}, Landroid/net/IpPrefix;-><init>(Ljava/net/InetAddress;I)V

    return-object v2

    .line 231
    .end local v0    # "ipBytes":[B
    .end local v1    # "inet4addr":Ljava/net/InetAddress;
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->netAddress:Ljava/math/BigInteger;

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 232
    .restart local v0    # "ipBytes":[B
    const/16 v2, 0x11

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 234
    invoke-static {v0}, Ljava/net/Inet6Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    .line 235
    .local v1, "inet6addr":Ljava/net/InetAddress;
    new-instance v2, Landroid/net/IpPrefix;

    iget v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    invoke-direct {v2, v1, v3}, Landroid/net/IpPrefix;-><init>(Ljava/net/InetAddress;I)V

    return-object v2
.end method

.method public split()[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    .locals 6

    .line 156
    new-instance v0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v1

    iget v2, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    add-int/lit8 v2, v2, 0x1

    iget-boolean v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    iget-boolean v4, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Ljava/math/BigInteger;IZZ)V

    .line 157
    .local v0, "firstHalf":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    new-instance v1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v2

    sget-object v3, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iget v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    add-int/lit8 v3, v3, 0x1

    iget-boolean v4, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->included:Z

    iget-boolean v5, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    invoke-direct {v1, v2, v3, v4, v5}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Ljava/math/BigInteger;IZZ)V

    .line 158
    .local v1, "secondHalf":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    sget-boolean v2, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-eqz v2, :cond_0

    .line 159
    invoke-virtual {v1}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 160
    :cond_0
    filled-new-array {v0, v1}, [Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 141
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->isV4:Z

    const-string v1, "%s/%d"

    if-eqz v0, :cond_0

    .line 142
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getIPv4Address()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 144
    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getIPv6Address()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
