.class public Lnet/openvpn/ovpn3/DnsOptions;
.super Ljava/lang/Object;
.source "DnsOptions.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 86
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions;-><init>(JZ)V

    .line 87
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/DnsOptions;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/DnsOptions;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_DnsOptions(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/DnsOptions;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J
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

.method public equals(Lnet/openvpn/ovpn3/DnsOptions;)Z
    .locals 6
    .param p1, "at"    # Lnet/openvpn/ovpn3/DnsOptions;

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "at":Lnet/openvpn/ovpn3/DnsOptions;
    .local v5, "at":Lnet/openvpn/ovpn3/DnsOptions;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_equals(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions;)Z

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions;->delete()V

    .line 39
    return-void
.end method

.method public getFrom_dhcp_options()Z
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_from_dhcp_options_get(JLnet/openvpn/ovpn3/DnsOptions;)Z

    move-result v0

    return v0
.end method

.method public getSearch_domains()Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    .locals 4

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_search_domains_get(JLnet/openvpn/ovpn3/DnsOptions;)J

    move-result-wide v0

    .line 73
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/DnsOptions_DomainsList;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/DnsOptions_DomainsList;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getServers()Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
    .locals 4

    .line 81
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_servers_get(JLnet/openvpn/ovpn3/DnsOptions;)J

    move-result-wide v0

    .line 82
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public setFrom_dhcp_options(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_from_dhcp_options_set(JLnet/openvpn/ovpn3/DnsOptions;Z)V

    .line 61
    return-void
.end method

.method public setSearch_domains(Lnet/openvpn/ovpn3/DnsOptions_DomainsList;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsOptions_DomainsList;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_DomainsList;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_DomainsList;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    .local v5, "value":Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_search_domains_set(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)V

    .line 69
    return-void
.end method

.method public setServers(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    .line 77
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
    .local v5, "value":Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_servers_set(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)V

    .line 78
    return-void
.end method

.method public to_string()Ljava/lang/String;
    .locals 2

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_to_string(JLnet/openvpn/ovpn3/DnsOptions;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
