.class public Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;
.super Ljava/lang/Object;
.source "ClientAPI_OpenVPNClientHelper.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 52
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_OpenVPNClientHelper()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;-><init>(JZ)V

    .line 53
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    .line 18
    return-void
.end method

.method public static copyright()Ljava/lang/String;
    .locals 1

    .line 84
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_copyright()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method public static max_profile_size()I
    .locals 1

    .line 68
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_max_profile_size()I

    move-result v0

    return v0
.end method

.method public static parse_dynamic_challenge(Ljava/lang/String;Lnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Z
    .locals 2
    .param p0, "cookie"    # Ljava/lang/String;
    .param p1, "dc"    # Lnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;

    .line 72
    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)J

    move-result-wide v0

    invoke-static {p0, v0, v1, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_parse_dynamic_challenge(Ljava/lang/String;JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Z

    move-result v0

    return v0
.end method

.method public static platform()Ljava/lang/String;
    .locals 1

    .line 80
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_platform()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->delete()V

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
.method public crypto_self_test()Ljava/lang/String;
    .locals 2

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_crypto_self_test(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_OpenVPNClientHelper(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J
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

.method public eval_config(Lnet/openvpn/ovpn3/ClientAPI_Config;)Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;
    .locals 7
    .param p1, "config"    # Lnet/openvpn/ovpn3/ClientAPI_Config;

    .line 64
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_Config;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v4

    move-object v3, p0

    move-object v6, p1

    .end local p1    # "config":Lnet/openvpn/ovpn3/ClientAPI_Config;
    .local v6, "config":Lnet/openvpn/ovpn3/ClientAPI_Config;
    invoke-static/range {v1 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_eval_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;JLnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v1

    const/4 p1, 0x1

    invoke-direct {v0, v1, v2, p1}, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;-><init>(JZ)V

    return-object v0
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->delete()V

    .line 39
    return-void
.end method

.method public merge_config(Ljava/lang/String;Z)Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "follow_references"    # Z

    .line 56
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    invoke-static {v1, v2, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_merge_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;Ljava/lang/String;Z)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;-><init>(JZ)V

    return-object v0
.end method

.method public merge_config_string(Ljava/lang/String;)Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;
    .locals 4
    .param p1, "config_content"    # Ljava/lang/String;

    .line 60
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;->swigCPtr:J

    invoke-static {v1, v2, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClientHelper_merge_config_string(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;Ljava/lang/String;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_MergeConfig;-><init>(JZ)V

    return-object v0
.end method
