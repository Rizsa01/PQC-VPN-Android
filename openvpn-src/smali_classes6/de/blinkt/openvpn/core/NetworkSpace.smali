.class public Lde/blinkt/openvpn/core/NetworkSpace;
.super Ljava/lang/Object;
.source "NetworkSpace.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    }
.end annotation


# instance fields
.field mIpAddresses:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet<",
            "Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    return-void
.end method

.method static assertTrue(Z)V
    .locals 1
    .param p0, "f"    # Z

    .line 35
    if-eqz p0, :cond_0

    .line 37
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method


# virtual methods
.method addIP(Lde/blinkt/openvpn/core/CIDRIP;Z)V
    .locals 2
    .param p1, "cidrIp"    # Lde/blinkt/openvpn/core/CIDRIP;
    .param p2, "include"    # Z

    .line 260
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    new-instance v1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-direct {v1, p1, p2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Lde/blinkt/openvpn/core/CIDRIP;Z)V

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 261
    return-void
.end method

.method public addIPSplit(Lde/blinkt/openvpn/core/CIDRIP;Z)V
    .locals 6
    .param p1, "cidrIp"    # Lde/blinkt/openvpn/core/CIDRIP;
    .param p2, "include"    # Z

    .line 264
    new-instance v0, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-direct {v0, p1, p2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Lde/blinkt/openvpn/core/CIDRIP;Z)V

    .line 265
    .local v0, "newIP":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    invoke-virtual {v0}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->split()[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    move-result-object v1

    .line 266
    .local v1, "splitIps":[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 267
    .local v4, "split":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    iget-object v5, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    invoke-virtual {v5, v4}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 266
    .end local v4    # "split":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 268
    :cond_0
    return-void
.end method

.method addIPv6(Ljava/net/Inet6Address;IZ)V
    .locals 2
    .param p1, "address"    # Ljava/net/Inet6Address;
    .param p2, "mask"    # I
    .param p3, "included"    # Z

    .line 271
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    new-instance v1, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    invoke-direct {v1, p1, p2, p3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;-><init>(Ljava/net/Inet6Address;IZ)V

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 272
    return-void
.end method

.method public clear()V
    .locals 1

    .line 254
    iget-object v0, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V

    .line 255
    return-void
.end method

.method generateIPList()Ljava/util/TreeSet;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeSet<",
            "Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;",
            ">;"
        }
    .end annotation

    .line 276
    new-instance v0, Ljava/util/PriorityQueue;

    iget-object v1, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(Ljava/util/SortedSet;)V

    .line 278
    .local v0, "networks":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 280
    .local v1, "ipsDone":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;>;"
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 281
    .local v2, "currentNet":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    if-nez v2, :cond_0

    .line 282
    return-object v1

    .line 284
    :cond_0
    :goto_0
    if-eqz v2, :cond_12

    .line 286
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 288
    .local v3, "nextNet":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    sget-boolean v4, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_2

    if-eqz v2, :cond_1

    move v4, v6

    goto :goto_1

    :cond_1
    move v4, v5

    :goto_1
    invoke-static {v4}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 289
    :cond_2
    if-eqz v3, :cond_11

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    const/4 v7, -0x1

    if-ne v4, v7, :cond_3

    goto/16 :goto_7

    .line 296
    :cond_3
    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    iget v4, v2, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v8, v3, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-lt v4, v8, :cond_9

    .line 297
    invoke-static {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v4

    invoke-static {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v7

    if-ne v4, v7, :cond_4

    .line 300
    move-object v2, v3

    goto/16 :goto_8

    .line 303
    :cond_4
    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->split()[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    move-result-object v4

    .line 309
    .local v4, "newNets":[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    aget-object v7, v4, v6

    invoke-virtual {v0, v7}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 310
    aget-object v7, v4, v6

    invoke-virtual {v0, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 312
    :cond_5
    aget-object v7, v4, v5

    invoke-virtual {v7}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 313
    sget-boolean v7, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-eqz v7, :cond_8

    .line 314
    aget-object v7, v4, v5

    iget v7, v7, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v8, v2, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-ne v7, v8, :cond_6

    move v5, v6

    :cond_6
    invoke-static {v5}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    goto :goto_2

    .line 317
    :cond_7
    aget-object v6, v4, v5

    invoke-virtual {v0, v6}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 318
    aget-object v5, v4, v5

    invoke-virtual {v0, v5}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 321
    .end local v4    # "newNets":[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :cond_8
    :goto_2
    goto/16 :goto_8

    .line 323
    :cond_9
    sget-boolean v4, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-eqz v4, :cond_d

    .line 324
    iget v4, v2, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v8, v3, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-ge v4, v8, :cond_a

    move v4, v6

    goto :goto_3

    :cond_a
    move v4, v5

    :goto_3
    invoke-static {v4}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 325
    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-ne v4, v6, :cond_b

    move v4, v6

    goto :goto_4

    :cond_b
    move v4, v5

    :goto_4
    invoke-static {v4}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 326
    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-eq v4, v7, :cond_c

    move v4, v6

    goto :goto_5

    :cond_c
    move v4, v5

    :goto_5
    invoke-static {v4}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 331
    :cond_d
    invoke-static {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v4

    invoke-static {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v7

    if-ne v4, v7, :cond_e

    goto :goto_8

    .line 336
    :cond_e
    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->split()[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    move-result-object v4

    .line 339
    .restart local v4    # "newNets":[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    aget-object v7, v4, v6

    iget v7, v7, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    iget v8, v3, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->networkMask:I

    if-ne v7, v8, :cond_10

    .line 340
    sget-boolean v7, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    if-eqz v7, :cond_f

    .line 341
    aget-object v7, v4, v6

    invoke-virtual {v7}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getFirstAddress()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v7

    invoke-static {v7}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 342
    aget-object v6, v4, v6

    invoke-virtual {v6}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->getLastAddress()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Lde/blinkt/openvpn/core/NetworkSpace;->assertTrue(Z)V

    .line 345
    :cond_f
    invoke-virtual {v0, v3}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 348
    :cond_10
    aget-object v6, v4, v6

    invoke-virtual {v0, v6}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 349
    invoke-virtual {v0, v3}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 351
    :goto_6
    aget-object v2, v4, v5

    goto :goto_8

    .line 291
    .end local v4    # "newNets":[Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :cond_11
    :goto_7
    invoke-virtual {v1, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 293
    move-object v2, v3

    .line 357
    .end local v3    # "nextNet":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :goto_8
    goto/16 :goto_0

    .line 359
    :cond_12
    return-object v1
.end method

.method public getNetworks(Z)Ljava/util/Collection;
    .locals 4
    .param p1, "included"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Collection<",
            "Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;",
            ">;"
        }
    .end annotation

    .line 245
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 246
    .local v0, "ips":Ljava/util/Vector;, "Ljava/util/Vector<Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;>;"
    iget-object v1, p0, Lde/blinkt/openvpn/core/NetworkSpace;->mIpAddresses:Ljava/util/TreeSet;

    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 247
    .local v2, "ip":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    invoke-static {v2}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v3

    if-ne v3, p1, :cond_0

    .line 248
    invoke-virtual {v0, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 249
    .end local v2    # "ip":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :cond_0
    goto :goto_0

    .line 250
    :cond_1
    return-object v0
.end method

.method getPositiveIPList()Ljava/util/Collection;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;",
            ">;"
        }
    .end annotation

    .line 363
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/NetworkSpace;->generateIPList()Ljava/util/TreeSet;

    move-result-object v0

    .line 365
    .local v0, "ipsSorted":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;>;"
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 366
    .local v1, "ips":Ljava/util/Vector;, "Ljava/util/Vector<Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;>;"
    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;

    .line 367
    .local v3, "ia":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    invoke-static {v3}, Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;->-$$Nest$fgetincluded(Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 368
    invoke-virtual {v1, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 369
    .end local v3    # "ia":Lde/blinkt/openvpn/core/NetworkSpace$IpAddress;
    :cond_0
    goto :goto_0

    .line 371
    :cond_1
    return-object v1
.end method
