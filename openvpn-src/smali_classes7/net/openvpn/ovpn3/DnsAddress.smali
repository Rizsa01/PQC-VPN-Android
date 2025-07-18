.class public Lnet/openvpn/ovpn3/DnsAddress;
.super Ljava/lang/Object;
.source "DnsAddress.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 80
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsAddress()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsAddress;-><init>(JZ)V

    .line 81
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/DnsAddress;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsAddress;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_DnsAddress(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/DnsAddress;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J
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

.method public equals(Lnet/openvpn/ovpn3/DnsAddress;)Z
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsAddress;->getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/DnsAddress;
    .local v5, "arg0":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_equals(JLnet/openvpn/ovpn3/DnsAddress;JLnet/openvpn/ovpn3/DnsAddress;)Z

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsAddress;->delete()V

    .line 39
    return-void
.end method

.method public getAddress()Ljava/lang/String;
    .locals 2

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_address_get(JLnet/openvpn/ovpn3/DnsAddress;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()J
    .locals 2

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_port_get(JLnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v0

    return-wide v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_address_set(JLnet/openvpn/ovpn3/DnsAddress;Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public setPort(J)V
    .locals 2
    .param p1, "value"    # J

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_port_set(JLnet/openvpn/ovpn3/DnsAddress;J)V

    .line 73
    return-void
.end method

.method public to_string()Ljava/lang/String;
    .locals 2

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_to_string(JLnet/openvpn/ovpn3/DnsAddress;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public validate(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsAddress;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsAddress_validate(JLnet/openvpn/ovpn3/DnsAddress;Ljava/lang/String;)V

    .line 57
    return-void
.end method
