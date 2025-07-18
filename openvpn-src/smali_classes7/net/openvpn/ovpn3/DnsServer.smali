.class public Lnet/openvpn/ovpn3/DnsServer;
.super Ljava/lang/Object;
.source "DnsServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/openvpn/ovpn3/DnsServer$Security;,
        Lnet/openvpn/ovpn3/DnsServer$Transport;
    }
.end annotation


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 114
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsServer()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsServer;-><init>(JZ)V

    .line 115
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/DnsServer;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/DnsServer;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsServer;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_DnsServer(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/DnsServer;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J
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

.method public dnssec_string(Lnet/openvpn/ovpn3/DnsServer$Security;)Ljava/lang/String;
    .locals 3
    .param p1, "dnssec"    # Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-virtual {p1}, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue()I

    move-result v2

    invoke-static {v0, v1, p0, v2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_dnssec_string(JLnet/openvpn/ovpn3/DnsServer;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public equals(Lnet/openvpn/ovpn3/DnsServer;)Z
    .locals 6
    .param p1, "at"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsServer;->getCPtr(Lnet/openvpn/ovpn3/DnsServer;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "at":Lnet/openvpn/ovpn3/DnsServer;
    .local v5, "at":Lnet/openvpn/ovpn3/DnsServer;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_equals(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsServer;)Z

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsServer;->delete()V

    .line 39
    return-void
.end method

.method public getAddresses()Lnet/openvpn/ovpn3/DnsOptions_AddressList;
    .locals 4

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_addresses_get(JLnet/openvpn/ovpn3/DnsServer;)J

    move-result-wide v0

    .line 77
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/DnsOptions_AddressList;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getDnssec()Lnet/openvpn/ovpn3/DnsServer$Security;
    .locals 2

    .line 94
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_dnssec_get(JLnet/openvpn/ovpn3/DnsServer;)I

    move-result v0

    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsServer$Security;->swigToEnum(I)Lnet/openvpn/ovpn3/DnsServer$Security;

    move-result-object v0

    return-object v0
.end method

.method public getDomains()Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    .locals 4

    .line 85
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_domains_get(JLnet/openvpn/ovpn3/DnsServer;)J

    move-result-wide v0

    .line 86
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

.method public getSni()Ljava/lang/String;
    .locals 2

    .line 110
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_sni_get(JLnet/openvpn/ovpn3/DnsServer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransport()Lnet/openvpn/ovpn3/DnsServer$Transport;
    .locals 2

    .line 102
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_transport_get(JLnet/openvpn/ovpn3/DnsServer;)I

    move-result v0

    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigToEnum(I)Lnet/openvpn/ovpn3/DnsServer$Transport;

    move-result-object v0

    return-object v0
.end method

.method public setAddresses(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsOptions_AddressList;

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/DnsOptions_AddressList;
    .local v5, "value":Lnet/openvpn/ovpn3/DnsOptions_AddressList;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_addresses_set(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsOptions_AddressList;)V

    .line 73
    return-void
.end method

.method public setDnssec(Lnet/openvpn/ovpn3/DnsServer$Security;)V
    .locals 3
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 90
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-virtual {p1}, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue()I

    move-result v2

    invoke-static {v0, v1, p0, v2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_dnssec_set(JLnet/openvpn/ovpn3/DnsServer;I)V

    .line 91
    return-void
.end method

.method public setDomains(Lnet/openvpn/ovpn3/DnsOptions_DomainsList;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsOptions_DomainsList;

    .line 81
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_DomainsList;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_DomainsList;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    .local v5, "value":Lnet/openvpn/ovpn3/DnsOptions_DomainsList;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_domains_set(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)V

    .line 82
    return-void
.end method

.method public setSni(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 106
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_sni_set(JLnet/openvpn/ovpn3/DnsServer;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public setTransport(Lnet/openvpn/ovpn3/DnsServer$Transport;)V
    .locals 3
    .param p1, "value"    # Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 98
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-virtual {p1}, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue()I

    move-result v2

    invoke-static {v0, v1, p0, v2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_transport_set(JLnet/openvpn/ovpn3/DnsServer;I)V

    .line 99
    return-void
.end method

.method public to_string()Ljava/lang/String;
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_to_string__SWIG_1(JLnet/openvpn/ovpn3/DnsServer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public to_string(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_to_string__SWIG_0(JLnet/openvpn/ovpn3/DnsServer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transport_string(Lnet/openvpn/ovpn3/DnsServer$Transport;)Ljava/lang/String;
    .locals 3
    .param p1, "transport"    # Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsServer;->swigCPtr:J

    invoke-virtual {p1}, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue()I

    move-result v2

    invoke-static {v0, v1, p0, v2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsServer_transport_string(JLnet/openvpn/ovpn3/DnsServer;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
