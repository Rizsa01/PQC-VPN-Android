.class public Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;
.super Lnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;
.source "ClientAPI_ExternalPKISignRequest.java"


# instance fields
.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 92
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_ExternalPKISignRequest()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;-><init>(JZ)V

    .line 93
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 2
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-static {p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_SWIGUpcast(J)J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p3}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;-><init>(JZ)V

    .line 16
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    .line 17
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;

    .line 20
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;

    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 26
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 28
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    .line 29
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCMemOwn:Z

    .line 30
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->delete()V

    goto :goto_0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Cannot release ownership as memory is not owned"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 32
    :cond_1
    :goto_0
    return-wide v0
.end method


# virtual methods
.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 41
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 42
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCMemOwn:Z

    .line 44
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_ExternalPKISignRequest(J)V

    .line 46
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    .line 48
    :cond_1
    invoke-super {p0}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;->delete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit p0

    return-void

    .line 40
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

    .line 37
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->delete()V

    .line 38
    return-void
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 2

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_algorithm_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .locals 2

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_data_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHashalg()Ljava/lang/String;
    .locals 2

    .line 80
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_hashalg_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSaltlen()Ljava/lang/String;
    .locals 2

    .line 88
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_saltlen_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSig()Ljava/lang/String;
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_sig_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_algorithm_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_data_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public setHashalg(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_hashalg_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public setSaltlen(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 84
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_saltlen_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public setSig(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_ExternalPKISignRequest_sig_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V

    .line 61
    return-void
.end method
