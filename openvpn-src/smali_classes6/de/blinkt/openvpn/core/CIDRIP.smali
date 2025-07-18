.class Lde/blinkt/openvpn/core/CIDRIP;
.super Ljava/lang/Object;
.source "CIDRIP.java"


# instance fields
.field len:I

.field mIp:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    .line 24
    iput p2, p0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "mask"    # Ljava/lang/String;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    .line 19
    invoke-static {p2}, Lde/blinkt/openvpn/core/CIDRIP;->calculateLenFromMask(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    .line 20
    return-void
.end method

.method public static calculateLenFromMask(Ljava/lang/String;)I
    .locals 7
    .param p0, "mask"    # Ljava/lang/String;

    .line 108
    invoke-static {p0}, Lde/blinkt/openvpn/core/CIDRIP;->getInt(Ljava/lang/String;)J

    move-result-wide v0

    .line 110
    .local v0, "netmask":J
    const-wide v2, 0x100000000L

    or-long/2addr v0, v2

    .line 111
    const/4 v2, 0x0

    .line 112
    .local v2, "zeroCount":I
    :goto_0
    const-wide/16 v3, 0x1

    and-long/2addr v3, v0

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 113
    add-int/lit8 v2, v2, 0x1

    .line 114
    const/4 v3, 0x1

    shr-long/2addr v0, v3

    goto :goto_0

    .line 116
    :cond_0
    const-wide v3, 0x1ffffffffL

    shr-long/2addr v3, v2

    .line 117
    .local v3, "expected":J
    cmp-long v5, v0, v3

    if-eqz v5, :cond_1

    .line 119
    const/16 v5, 0x20

    return v5

    .line 121
    :cond_1
    rsub-int/lit8 v5, v2, 0x20

    return v5
.end method

.method static getInt(Ljava/lang/String;)J
    .locals 11
    .param p0, "ipaddr"    # Ljava/lang/String;

    .line 85
    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "octets":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 89
    const-wide/16 v1, 0x0

    .line 90
    .local v1, "result":J
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, v0, v4

    .line 91
    .local v5, "octet":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 92
    .local v6, "val":I
    const/16 v7, 0x8

    shl-long v7, v1, v7

    and-int/lit16 v9, v6, 0xff

    int-to-long v9, v9

    or-long v1, v7, v9

    .line 90
    .end local v5    # "octet":Ljava/lang/String;
    .end local v6    # "val":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 94
    :cond_0
    return-wide v1

    .line 87
    .end local v1    # "result":J
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid IPv4 address: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static parse(Ljava/lang/String;)Lde/blinkt/openvpn/core/CIDRIP;
    .locals 7
    .param p0, "cidr"    # Ljava/lang/String;

    .line 34
    if-eqz p0, :cond_2

    .line 37
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "parts":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 41
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 42
    .local v1, "ip":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v0, v2

    .line 44
    .local v2, "maskPart":Ljava/lang/String;
    :try_start_0
    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 46
    new-instance v3, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-direct {v3, v1, v2}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 49
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 50
    .local v3, "prefix":I
    new-instance v4, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-direct {v4, v1, v3}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 52
    .end local v3    # "prefix":I
    :catch_0
    move-exception v3

    .line 53
    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid prefix or mask in CIDR: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 39
    .end local v1    # "ip":Ljava/lang/String;
    .end local v2    # "maskPart":Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid CIDR format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 35
    .end local v0    # "parts":[Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CIDR string is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getInt()J
    .locals 2

    .line 101
    iget-object v0, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    invoke-static {v0}, Lde/blinkt/openvpn/core/CIDRIP;->getInt(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public normalise()Z
    .locals 13

    .line 67
    iget-object v0, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    invoke-static {v0}, Lde/blinkt/openvpn/core/CIDRIP;->getInt(Ljava/lang/String;)J

    move-result-wide v0

    .line 68
    .local v0, "ipVal":J
    iget v2, p0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    rsub-int/lit8 v2, v2, 0x20

    const-wide v3, 0xffffffffL

    shl-long v2, v3, v2

    .line 69
    .local v2, "mask":J
    and-long v4, v0, v2

    .line 70
    .local v4, "newIp":J
    cmp-long v6, v4, v0

    if-eqz v6, :cond_0

    .line 71
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/16 v7, 0x18

    shr-long v7, v4, v7

    const-wide/16 v9, 0xff

    and-long/2addr v7, v9

    .line 72
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const/16 v8, 0x10

    shr-long v11, v4, v8

    and-long/2addr v11, v9

    .line 73
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/16 v11, 0x8

    shr-long v11, v4, v11

    and-long/2addr v11, v9

    .line 74
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    and-long/2addr v9, v4

    .line 75
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    filled-new-array {v7, v8, v11, v9}, [Ljava/lang/Object;

    move-result-object v7

    .line 71
    const-string v8, "%d.%d.%d.%d"

    invoke-static {v6, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    .line 76
    const/4 v6, 0x1

    return v6

    .line 78
    :cond_0
    const/4 v6, 0x0

    return v6
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 59
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget-object v1, p0, Lde/blinkt/openvpn/core/CIDRIP;->mIp:Ljava/lang/String;

    iget v2, p0, Lde/blinkt/openvpn/core/CIDRIP;->len:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s/%d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
