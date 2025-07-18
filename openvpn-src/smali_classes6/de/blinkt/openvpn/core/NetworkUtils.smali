.class public Lde/blinkt/openvpn/core/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFakeMacAddrFromSAAID(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .param p0, "c"    # Landroid/content/Context;

    .line 69
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 71
    .local v0, "HEX_ARRAY":[C
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 74
    .local v1, "saaid":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 75
    const/4 v2, 0x0

    return-object v2

    .line 77
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .local v2, "ret":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x6

    if-lt v3, v4, :cond_2

    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 80
    .local v3, "sb":[B
    const/4 v5, 0x0

    .local v5, "b":I
    :goto_0
    if-gt v5, v4, :cond_2

    .line 81
    if-eqz v5, :cond_1

    .line 82
    const-string v6, ":"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    :cond_1
    aget-byte v6, v3, v5

    and-int/lit16 v6, v6, 0xff

    .line 84
    .local v6, "v":I
    ushr-int/lit8 v7, v6, 0x4

    aget-char v7, v0, v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    and-int/lit8 v7, v6, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .end local v6    # "v":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 88
    .end local v3    # "sb":[B
    .end local v5    # "b":I
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getLocalNetworks(Landroid/content/Context;Z)Ljava/util/Vector;
    .locals 17
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ipv6"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z)",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 26
    const-string v0, "connectivity"

    move-object/from16 v1, p0

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 28
    .local v0, "conn":Landroid/net/ConnectivityManager;
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 29
    .local v2, "nets":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v3

    .line 30
    .local v3, "networks":[Landroid/net/Network;
    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_8

    aget-object v7, v3, v6

    .line 31
    .local v7, "network":Landroid/net/Network;
    invoke-virtual {v0, v7}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v8

    .line 32
    .local v8, "ni":Landroid/net/NetworkInfo;
    invoke-virtual {v0, v7}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v9

    .line 34
    .local v9, "li":Landroid/net/LinkProperties;
    invoke-virtual {v0, v7}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v10

    .line 37
    .local v10, "nc":Landroid/net/NetworkCapabilities;
    if-nez v10, :cond_0

    .line 38
    move-object/from16 v16, v0

    goto/16 :goto_4

    .line 41
    :cond_0
    const/4 v11, 0x4

    invoke-virtual {v10, v11}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 42
    move-object/from16 v16, v0

    goto/16 :goto_4

    .line 45
    :cond_1
    invoke-virtual {v10, v5}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 46
    move-object/from16 v16, v0

    goto/16 :goto_4

    .line 49
    :cond_2
    invoke-virtual {v9}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/net/LinkAddress;

    .line 50
    .local v12, "la":Landroid/net/LinkAddress;
    invoke-virtual {v12}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v13

    instance-of v13, v13, Ljava/net/Inet4Address;

    if-eqz v13, :cond_3

    if-eqz p1, :cond_4

    .line 51
    :cond_3
    invoke-virtual {v12}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v13

    instance-of v13, v13, Ljava/net/Inet6Address;

    if-eqz v13, :cond_6

    if-eqz p1, :cond_6

    .line 54
    :cond_4
    invoke-virtual {v12}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v13

    instance-of v13, v13, Ljava/net/Inet6Address;

    const/4 v14, 0x1

    if-eqz v13, :cond_5

    .line 55
    new-instance v13, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-virtual {v12}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v15

    check-cast v15, Ljava/net/Inet6Address;

    invoke-virtual {v12}, Landroid/net/LinkAddress;->getPrefixLength()I

    move-result v5

    invoke-direct {v13, v15, v5, v14}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Ljava/net/Inet6Address;IZ)V

    move-object/from16 v16, v0

    .local v13, "ipaddress":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    goto :goto_2

    .line 57
    .end local v13    # "ipaddress":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :cond_5
    new-instance v5, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    new-instance v13, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-virtual {v12}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v16, v0

    .end local v0    # "conn":Landroid/net/ConnectivityManager;
    .local v16, "conn":Landroid/net/ConnectivityManager;
    invoke-virtual {v12}, Landroid/net/LinkAddress;->getPrefixLength()I

    move-result v0

    invoke-direct {v13, v15, v0}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;I)V

    invoke-direct {v5, v13, v14}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Lde/blinkt/openvpn/core/CIDRIP;Z)V

    move-object v13, v5

    .line 59
    .restart local v13    # "ipaddress":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :goto_2
    invoke-virtual {v13}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 51
    .end local v13    # "ipaddress":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    .end local v16    # "conn":Landroid/net/ConnectivityManager;
    .restart local v0    # "conn":Landroid/net/ConnectivityManager;
    :cond_6
    move-object/from16 v16, v0

    .line 61
    .end local v0    # "conn":Landroid/net/ConnectivityManager;
    .end local v12    # "la":Landroid/net/LinkAddress;
    .restart local v16    # "conn":Landroid/net/ConnectivityManager;
    :goto_3
    move-object/from16 v0, v16

    const/4 v5, 0x0

    goto :goto_1

    .line 49
    .end local v16    # "conn":Landroid/net/ConnectivityManager;
    .restart local v0    # "conn":Landroid/net/ConnectivityManager;
    :cond_7
    move-object/from16 v16, v0

    .line 30
    .end local v0    # "conn":Landroid/net/ConnectivityManager;
    .end local v7    # "network":Landroid/net/Network;
    .end local v8    # "ni":Landroid/net/NetworkInfo;
    .end local v9    # "li":Landroid/net/LinkProperties;
    .end local v10    # "nc":Landroid/net/NetworkCapabilities;
    .restart local v16    # "conn":Landroid/net/ConnectivityManager;
    :goto_4
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v16

    const/4 v5, 0x0

    goto/16 :goto_0

    .line 64
    .end local v16    # "conn":Landroid/net/ConnectivityManager;
    .restart local v0    # "conn":Landroid/net/ConnectivityManager;
    :cond_8
    return-object v2
.end method
