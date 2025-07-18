.class public Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;
.super Ljava/lang/Object;
.source "ClientAPI_TunBuilderBase.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 144
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_TunBuilderBase()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;-><init>(JZ)V

    .line 145
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->delete()V

    goto :goto_0

    .line 28
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Cannot release ownership as memory is not owned"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 33
    :cond_1
    :goto_0
    return-wide v0
.end method


# virtual methods
.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_TunBuilderBase(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_1
    monitor-exit p0

    return-void

    .line 41
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->delete()V

    .line 39
    return-void
.end method

.method public tun_builder_add_address(Ljava/lang/String;ILjava/lang/String;ZZ)Z
    .locals 8
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "gateway"    # Ljava/lang/String;
    .param p4, "ipv6"    # Z
    .param p5, "net30"    # Z

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    .end local p1    # "address":Ljava/lang/String;
    .end local p2    # "prefix_length":I
    .end local p3    # "gateway":Ljava/lang/String;
    .end local p4    # "ipv6":Z
    .end local p5    # "net30":Z
    .local v3, "address":Ljava/lang/String;
    .local v4, "prefix_length":I
    .local v5, "gateway":Ljava/lang/String;
    .local v6, "ipv6":Z
    .local v7, "net30":Z
    invoke-static/range {v0 .. v7}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_add_address(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;ILjava/lang/String;ZZ)Z

    move-result p1

    return p1
.end method

.method public tun_builder_add_proxy_bypass(Ljava/lang/String;)Z
    .locals 2
    .param p1, "bypass_host"    # Ljava/lang/String;

    .line 96
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_add_proxy_bypass(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_add_route(Ljava/lang/String;IIZ)Z
    .locals 7
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "metric"    # I
    .param p4, "ipv6"    # Z

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    .end local p1    # "address":Ljava/lang/String;
    .end local p2    # "prefix_length":I
    .end local p3    # "metric":I
    .end local p4    # "ipv6":Z
    .local v3, "address":Ljava/lang/String;
    .local v4, "prefix_length":I
    .local v5, "metric":I
    .local v6, "ipv6":Z
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_add_route(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;IIZ)Z

    move-result p1

    return p1
.end method

.method public tun_builder_add_wins_server(Ljava/lang/String;)Z
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .line 112
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_add_wins_server(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_establish()I
    .locals 2

    .line 124
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_establish(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)I

    move-result v0

    return v0
.end method

.method public tun_builder_establish_lite()V
    .locals 2

    .line 136
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_establish_lite(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)V

    .line 137
    return-void
.end method

.method public tun_builder_exclude_route(Ljava/lang/String;IIZ)Z
    .locals 7
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "metric"    # I
    .param p4, "ipv6"    # Z

    .line 80
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    .end local p1    # "address":Ljava/lang/String;
    .end local p2    # "prefix_length":I
    .end local p3    # "metric":I
    .end local p4    # "ipv6":Z
    .local v3, "address":Ljava/lang/String;
    .local v4, "prefix_length":I
    .local v5, "metric":I
    .local v6, "ipv6":Z
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_exclude_route(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;IIZ)Z

    move-result p1

    return p1
.end method

.method public tun_builder_get_local_networks(Z)Lnet/openvpn/ovpn3/ClientAPI_StringVec;
    .locals 4
    .param p1, "ipv6"    # Z

    .line 132
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v1, v2, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_get_local_networks(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>(JZ)V

    return-object v0
.end method

.method public tun_builder_new()Z
    .locals 2

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_new(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_persist()Z
    .locals 2

    .line 128
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_persist(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_reroute_gw(ZZJ)Z
    .locals 7
    .param p1, "ipv4"    # Z
    .param p2, "ipv6"    # Z
    .param p3, "flags"    # J

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    move-object v2, p0

    move v3, p1

    move v4, p2

    move-wide v5, p3

    .end local p1    # "ipv4":Z
    .end local p2    # "ipv6":Z
    .end local p3    # "flags":J
    .local v3, "ipv4":Z
    .local v4, "ipv6":Z
    .local v5, "flags":J
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_reroute_gw(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;ZZJ)Z

    move-result p1

    return p1
.end method

.method public tun_builder_set_allow_family(IZ)Z
    .locals 2
    .param p1, "af"    # I
    .param p2, "allow"    # Z

    .line 116
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_allow_family(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;IZ)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_allow_local_dns(Z)Z
    .locals 2
    .param p1, "allow"    # Z

    .line 120
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_allow_local_dns(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_dns_options(Lnet/openvpn/ovpn3/DnsOptions;)Z
    .locals 6
    .param p1, "dns"    # Lnet/openvpn/ovpn3/DnsOptions;

    .line 84
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "dns":Lnet/openvpn/ovpn3/DnsOptions;
    .local v5, "dns":Lnet/openvpn/ovpn3/DnsOptions;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_dns_options(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;JLnet/openvpn/ovpn3/DnsOptions;)Z

    move-result p1

    return p1
.end method

.method public tun_builder_set_layer(I)Z
    .locals 2
    .param p1, "layer"    # I

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_layer(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_mtu(I)Z
    .locals 2
    .param p1, "mtu"    # I

    .line 88
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_mtu(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_proxy_auto_config_url(Ljava/lang/String;)Z
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .line 100
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_proxy_auto_config_url(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_proxy_http(Ljava/lang/String;I)Z
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 104
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_proxy_http(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_proxy_https(Ljava/lang/String;I)Z
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 108
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_proxy_https(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_remote_address(Ljava/lang/String;Z)Z
    .locals 2
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "ipv6"    # Z

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_remote_address(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_route_metric_default(I)Z
    .locals 2
    .param p1, "metric"    # I

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_route_metric_default(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z

    move-result v0

    return v0
.end method

.method public tun_builder_set_session_name(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 92
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_set_session_name(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public tun_builder_teardown(Z)V
    .locals 2
    .param p1, "disconnect"    # Z

    .line 140
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_TunBuilderBase_tun_builder_teardown(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)V

    .line 141
    return-void
.end method
