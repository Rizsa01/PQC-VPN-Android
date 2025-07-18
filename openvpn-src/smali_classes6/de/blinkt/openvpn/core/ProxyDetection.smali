.class public Lde/blinkt/openvpn/core/ProxyDetection;
.super Ljava/lang/Object;
.source "ProxyDetection.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static detectProxy(Lde/blinkt/openvpn/core/VpnProfile;)Ljava/net/SocketAddress;
    .locals 6
    .param p0, "vp"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 23
    const/4 v0, 0x0

    const v1, 0x7f11012e

    :try_start_0
    new-instance v2, Ljava/net/URL;

    const-string v3, "https://%s:%s"

    iget-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    iget-object v5, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerPort:Ljava/lang/String;

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 24
    .local v2, "url":Ljava/net/URL;
    invoke-static {v2}, Lde/blinkt/openvpn/core/ProxyDetection;->getFirstProxy(Ljava/net/URL;)Ljava/net/Proxy;

    move-result-object v3

    .line 26
    .local v3, "proxy":Ljava/net/Proxy;
    if-nez v3, :cond_0

    .line 27
    return-object v0

    .line 28
    :cond_0
    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v4

    .line 29
    .local v4, "addr":Ljava/net/SocketAddress;
    instance-of v1, v4, Ljava/net/InetSocketAddress;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    .line 30
    return-object v4

    .line 29
    .end local v2    # "url":Ljava/net/URL;
    .end local v3    # "proxy":Ljava/net/Proxy;
    .end local v4    # "addr":Ljava/net/SocketAddress;
    :cond_1
    goto :goto_0

    .line 35
    :catch_0
    move-exception v2

    .line 36
    .local v2, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v2}, Ljava/net/URISyntaxException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    goto :goto_1

    .line 33
    .end local v2    # "e":Ljava/net/URISyntaxException;
    :catch_1
    move-exception v2

    .line 34
    .local v2, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 37
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :goto_0
    nop

    .line 38
    :goto_1
    return-object v0
.end method

.method static getFirstProxy(Ljava/net/URL;)Ljava/net/Proxy;
    .locals 4
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 42
    const-string v0, "java.net.useSystemProxies"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v0

    .line 47
    .local v0, "proxylist":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v0, :cond_1

    .line 48
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/Proxy;

    .line 49
    .local v2, "proxy":Ljava/net/Proxy;
    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v3

    .line 51
    .local v3, "addr":Ljava/net/SocketAddress;
    if-eqz v3, :cond_0

    .line 52
    return-object v2

    .line 54
    .end local v2    # "proxy":Ljava/net/Proxy;
    .end local v3    # "addr":Ljava/net/SocketAddress;
    :cond_0
    goto :goto_0

    .line 57
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method
