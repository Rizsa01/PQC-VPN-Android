.class public Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;
.super Ljava/lang/Object;
.source "ClientAPI_MergeConfig.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 93
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_MergeConfig()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;-><init>(JZ)V

    .line 94
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_MergeConfig(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->delete()V

    .line 39
    return-void
.end method

.method public getBasename()Ljava/lang/String;
    .locals 2

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_basename_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getErrorText()Ljava/lang/String;
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_errorText_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProfileContent()Ljava/lang/String;
    .locals 2

    .line 80
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_profileContent_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRefPathList()Lnet/openvpn/ovpn3/ClientAPI_StringVec;
    .locals 4

    .line 88
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_refPathList_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)J

    move-result-wide v0

    .line 89
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getStatus()Ljava/lang/String;
    .locals 2

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_status_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setBasename(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_basename_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setErrorText(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_errorText_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public setProfileContent(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_profileContent_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public setRefPathList(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    .line 84
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/ClientAPI_StringVec;
    .local v5, "value":Lnet/openvpn/ovpn3/ClientAPI_StringVec;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_refPathList_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;JLnet/openvpn/ovpn3/ClientAPI_StringVec;)V

    .line 85
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_MergeConfig_status_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V

    .line 53
    return-void
.end method
