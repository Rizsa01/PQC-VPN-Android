.class public Lnet/openvpn/ovpn3/ClientAPI_Config;
.super Lnet/openvpn/ovpn3/ConfigCommon;
.source "ClientAPI_Config.java"


# instance fields
.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 118
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_Config()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_Config;-><init>(JZ)V

    .line 119
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 2
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-static {p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_SWIGUpcast(J)J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p3}, Lnet/openvpn/ovpn3/ConfigCommon;-><init>(JZ)V

    .line 16
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    .line 17
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_Config;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_Config;

    .line 20
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_Config;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_Config;

    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 26
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 28
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    .line 29
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCMemOwn:Z

    .line 30
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_Config;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 42
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCMemOwn:Z

    .line 44
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_Config(J)V

    .line 46
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_Config;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    .line 48
    :cond_1
    invoke-super {p0}, Lnet/openvpn/ovpn3/ConfigCommon;->delete()V
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_Config;->delete()V

    .line 38
    return-void
.end method

.method public getAllowUnusedAddrFamilies()Ljava/lang/String;
    .locals 2

    .line 89
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_allowUnusedAddrFamilies_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCompressionMode()Ljava/lang/String;
    .locals 2

    .line 97
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_compressionMode_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 2

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_content_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentList()Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;
    .locals 4

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_contentList_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v0

    .line 65
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getExternalPkiAlias()Ljava/lang/String;
    .locals 2

    .line 105
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_externalPkiAlias_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerInfo()Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;
    .locals 4

    .line 113
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_peerInfo_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v0

    .line 114
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getProtoOverride()Ljava/lang/String;
    .locals 2

    .line 73
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_protoOverride_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtoVersionOverride()I
    .locals 2

    .line 81
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_protoVersionOverride_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)I

    move-result v0

    return v0
.end method

.method public setAllowUnusedAddrFamilies(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 85
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_allowUnusedAddrFamilies_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public setCompressionMode(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 93
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_compressionMode_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_content_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public setContentList(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;)V
    .locals 4
    .param p1, "value"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;->getCPtr(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;)J

    move-result-wide v2

    invoke-static {v0, v1, p0, v2, v3}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_contentList_set(JLnet/openvpn/ovpn3/ClientAPI_Config;J)V

    .line 61
    return-void
.end method

.method public setExternalPkiAlias(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 101
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_externalPkiAlias_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public setPeerInfo(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;)V
    .locals 4
    .param p1, "value"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;

    .line 109
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;->getCPtr(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__vectorT_openvpn__ClientAPI__KeyValue_t;)J

    move-result-wide v2

    invoke-static {v0, v1, p0, v2, v3}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_peerInfo_set(JLnet/openvpn/ovpn3/ClientAPI_Config;J)V

    .line 110
    return-void
.end method

.method public setProtoOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 69
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_protoOverride_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public setProtoVersionOverride(I)V
    .locals 2
    .param p1, "value"    # I

    .line 77
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_Config;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_Config_protoVersionOverride_set(JLnet/openvpn/ovpn3/ClientAPI_Config;I)V

    .line 78
    return-void
.end method
