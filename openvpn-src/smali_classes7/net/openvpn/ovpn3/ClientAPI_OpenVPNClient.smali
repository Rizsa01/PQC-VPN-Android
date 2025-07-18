.class public Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
.super Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;
.source "ClientAPI_OpenVPNClient.java"


# instance fields
.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 67
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_OpenVPNClient()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;-><init>(JZ)V

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p0, v0, v1, v2, v2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_director_connect(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JZZ)V

    .line 69
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 2
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-static {p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_SWIGUpcast(J)J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p3}, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;-><init>(JZ)V

    .line 16
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    .line 17
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 20
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method public static stats_n()I
    .locals 1

    .line 116
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_stats_n()I

    move-result v0

    return v0
.end method

.method public static stats_name(I)Ljava/lang/String;
    .locals 1
    .param p0, "index"    # I

    .line 120
    invoke-static {p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_stats_name(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 26
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 28
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    .line 29
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    .line 30
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->delete()V

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
.method public acc_event(Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)V
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;

    .line 164
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;
    .local v5, "arg0":Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_acc_event(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)V

    .line 165
    return-void
.end method

.method public clock_tick()V
    .locals 2

    .line 188
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    if-ne v0, v1, :cond_0

    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_clock_tick(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_clock_tickSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V

    .line 189
    :goto_0
    return-void
.end method

.method public connect()Lnet/openvpn/ovpn3/ClientAPI_Status;
    .locals 4

    .line 84
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_Status;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_connect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_Status;-><init>(JZ)V

    return-object v0
.end method

.method public connection_info()Lnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;
    .locals 4

    .line 88
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_connection_info(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;-><init>(JZ)V

    return-object v0
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 41
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 42
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    .line 44
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_OpenVPNClient(J)V

    .line 46
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    .line 48
    :cond_1
    invoke-super {p0}, Lnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;->delete()V
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

.method public eval_config(Lnet/openvpn/ovpn3/ClientAPI_Config;)Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;
    .locals 7
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_Config;

    .line 72
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_Config;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v4

    move-object v3, p0

    move-object v6, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_Config;
    .local v6, "arg0":Lnet/openvpn/ovpn3/ClientAPI_Config;
    invoke-static/range {v1 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_eval_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_Config;)J

    move-result-wide v1

    const/4 p1, 0x1

    invoke-direct {v0, v1, v2, p1}, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;-><init>(JZ)V

    return-object v0
.end method

.method public event(Lnet/openvpn/ovpn3/ClientAPI_Event;)V
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_Event;

    .line 160
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_Event;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_Event;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_Event;
    .local v5, "arg0":Lnet/openvpn/ovpn3/ClientAPI_Event;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_event(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_Event;)V

    .line 161
    return-void
.end method

.method public external_pki_cert_request(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)V
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;

    .line 172
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;
    .local v5, "arg0":Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_external_pki_cert_request(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)V

    .line 173
    return-void
.end method

.method public external_pki_sign_request(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)V
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;

    .line 176
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;
    .local v5, "arg0":Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_external_pki_sign_request(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)V

    .line 177
    return-void
.end method

.method protected finalize()V
    .locals 0

    .line 37
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->delete()V

    .line 38
    return-void
.end method

.method public log(Lnet/openvpn/ovpn3/ClientAPI_LogInfo;)V
    .locals 6
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_LogInfo;

    .line 168
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_LogInfo;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_LogInfo;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_LogInfo;
    .local v5, "arg0":Lnet/openvpn/ovpn3/ClientAPI_LogInfo;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_log(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_LogInfo;)V

    .line 169
    return-void
.end method

.method public pause(Ljava/lang/String;)V
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .line 100
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_pause(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public pause_on_connection_timeout()Z
    .locals 2

    .line 112
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_pause_on_connection_timeout(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z

    move-result v0

    return v0
.end method

.method public post_cc_msg(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .line 140
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_post_cc_msg(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public provide_creds(Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Lnet/openvpn/ovpn3/ClientAPI_Status;
    .locals 7
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;

    .line 76
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_Status;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)J

    move-result-wide v4

    move-object v3, p0

    move-object v6, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;
    .local v6, "arg0":Lnet/openvpn/ovpn3/ClientAPI_ProvideCreds;
    invoke-static/range {v1 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_provide_creds(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)J

    move-result-wide v1

    const/4 p1, 0x1

    invoke-direct {v0, v1, v2, p1}, Lnet/openvpn/ovpn3/ClientAPI_Status;-><init>(JZ)V

    return-object v0
.end method

.method public reconnect(I)V
    .locals 2
    .param p1, "seconds"    # I

    .line 108
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_reconnect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)V

    .line 109
    return-void
.end method

.method public remote_override(Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V
    .locals 13
    .param p1, "arg0"    # Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;

    .line 184
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    if-ne v0, v1, :cond_0

    iget-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)J

    move-result-wide v5

    move-object v4, p0

    move-object v7, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    .local v7, "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    invoke-static/range {v2 .. v7}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_remote_override(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V

    goto :goto_0

    .end local v7    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    .restart local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    :cond_0
    move-object v4, p0

    move-object v7, p1

    .end local p1    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    .restart local v7    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    move-object v12, v7

    .end local v7    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    .local v12, "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    iget-wide v7, v4, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v12}, Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)J

    move-result-wide v10

    move-object v9, v4

    invoke-static/range {v7 .. v12}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_remote_overrideSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V

    move-object v7, v12

    .line 185
    .end local v12    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    .restart local v7    # "arg0":Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;
    :goto_0
    return-void
.end method

.method public remote_override_enabled()Z
    .locals 2

    .line 180
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    if-ne v0, v1, :cond_0

    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_remote_override_enabled(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z

    move-result v0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_remote_override_enabledSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public resume()V
    .locals 2

    .line 104
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_resume(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V

    .line 105
    return-void
.end method

.method public send_app_control_channel_msg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .line 144
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_send_app_control_channel_msg(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public session_token(Lnet/openvpn/ovpn3/ClientAPI_SessionToken;)Z
    .locals 6
    .param p1, "tok"    # Lnet/openvpn/ovpn3/ClientAPI_SessionToken;

    .line 92
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_SessionToken;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_SessionToken;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "tok":Lnet/openvpn/ovpn3/ClientAPI_SessionToken;
    .local v5, "tok":Lnet/openvpn/ovpn3/ClientAPI_SessionToken;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_session_token(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_SessionToken;)Z

    move-result p1

    return p1
.end method

.method public socket_protect(ILjava/lang/String;Z)Z
    .locals 8
    .param p1, "socket"    # I
    .param p2, "remote"    # Ljava/lang/String;
    .param p3, "ipv6"    # Z

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    if-ne v0, v1, :cond_0

    iget-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    move-object v4, p0

    move v5, p1

    move-object v6, p2

    move v7, p3

    .end local p1    # "socket":I
    .end local p2    # "remote":Ljava/lang/String;
    .end local p3    # "ipv6":Z
    .local v5, "socket":I
    .local v6, "remote":Ljava/lang/String;
    .local v7, "ipv6":Z
    invoke-static/range {v2 .. v7}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_socket_protect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ILjava/lang/String;Z)Z

    move-result p1

    move-object v2, v4

    move v3, v5

    move-object v4, v6

    move v5, v7

    .end local v6    # "remote":Ljava/lang/String;
    .end local v7    # "ipv6":Z
    .local v3, "socket":I
    .local v4, "remote":Ljava/lang/String;
    .local v5, "ipv6":Z
    goto :goto_0

    .end local v3    # "socket":I
    .end local v4    # "remote":Ljava/lang/String;
    .end local v5    # "ipv6":Z
    .restart local p1    # "socket":I
    .restart local p2    # "remote":Ljava/lang/String;
    .restart local p3    # "ipv6":Z
    :cond_0
    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move v5, p3

    .end local p1    # "socket":I
    .end local p2    # "remote":Ljava/lang/String;
    .end local p3    # "ipv6":Z
    .restart local v3    # "socket":I
    .restart local v4    # "remote":Ljava/lang/String;
    .restart local v5    # "ipv6":Z
    iget-wide v0, v2, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_socket_protectSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ILjava/lang/String;Z)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public start_cert_check(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "client_cert"    # Ljava/lang/String;
    .param p2, "clientkey"    # Ljava/lang/String;

    .line 152
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_start_cert_check__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    return-void
.end method

.method public start_cert_check(Ljava/lang/String;Ljava/lang/String;Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;)V
    .locals 7
    .param p1, "client_cert"    # Ljava/lang/String;
    .param p2, "clientkey"    # Ljava/lang/String;
    .param p3, "ca"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;

    .line 148
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p3}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;->getCPtr(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;)J

    move-result-wide v5

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .end local p1    # "client_cert":Ljava/lang/String;
    .end local p2    # "clientkey":Ljava/lang/String;
    .local v3, "client_cert":Ljava/lang/String;
    .local v4, "clientkey":Ljava/lang/String;
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_start_cert_check__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;J)V

    .line 149
    return-void
.end method

.method public start_cert_check_epki(Ljava/lang/String;Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;)V
    .locals 6
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "ca"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;

    .line 156
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p2}, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;->getCPtr(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__optionalT_std__string_const_t;)J

    move-result-wide v4

    move-object v2, p0

    move-object v3, p1

    .end local p1    # "alias":Ljava/lang/String;
    .local v3, "alias":Ljava/lang/String;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_start_cert_check_epki(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;J)V

    .line 157
    return-void
.end method

.method public stats_bundle()Lnet/openvpn/ovpn3/ClientAPI_LLVector;
    .locals 4

    .line 128
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_stats_bundle(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>(JZ)V

    return-object v0
.end method

.method public stats_value(I)J
    .locals 2
    .param p1, "index"    # I

    .line 124
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_stats_value(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public stop()V
    .locals 2

    .line 96
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_stop(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V

    .line 97
    return-void
.end method

.method protected swigDirectorDisconnect()V
    .locals 1

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    .line 53
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->delete()V

    .line 54
    return-void
.end method

.method public swigReleaseOwnership()V
    .locals 3

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    .line 58
    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p0, v1, v2, v0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_change_ownership(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JZ)V

    .line 59
    return-void
.end method

.method public swigTakeOwnership()V
    .locals 3

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCMemOwn:Z

    .line 63
    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {p0, v1, v2, v0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_change_ownership(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JZ)V

    .line 64
    return-void
.end method

.method public transport_stats()Lnet/openvpn/ovpn3/ClientAPI_TransportStats;
    .locals 4

    .line 136
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_TransportStats;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_transport_stats(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_TransportStats;-><init>(JZ)V

    return-object v0
.end method

.method public tun_stats()Lnet/openvpn/ovpn3/ClientAPI_InterfaceStats;
    .locals 4

    .line 132
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_InterfaceStats;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_OpenVPNClient_tun_stats(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_InterfaceStats;-><init>(JZ)V

    return-object v0
.end method
