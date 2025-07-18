.class public Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;
.super Ljava/lang/Object;
.source "ClientAPI_EvalConfig.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 205
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_EvalConfig()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;-><init>(JZ)V

    .line 206
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_EvalConfig(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->delete()V

    .line 39
    return-void
.end method

.method public getAllowPasswordSave()Z
    .locals 2

    .line 144
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_allowPasswordSave_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getAutologin()Z
    .locals 2

    .line 96
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_autologin_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getDcoCompatible()Z
    .locals 2

    .line 193
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_dcoCompatible_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getDcoIncompatibilityReason()Ljava/lang/String;
    .locals 2

    .line 201
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_dcoIncompatibilityReason_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getError()Z
    .locals 2

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_error_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getExternalPki()Z
    .locals 2

    .line 104
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_externalPki_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 2

    .line 88
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_friendlyName_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_message_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrivateKeyPasswordRequired()Z
    .locals 2

    .line 136
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_privateKeyPasswordRequired_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getProfileName()Ljava/lang/String;
    .locals 2

    .line 80
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_profileName_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 2

    .line 152
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remoteHost_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemotePort()Ljava/lang/String;
    .locals 2

    .line 160
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remotePort_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteProto()Ljava/lang/String;
    .locals 2

    .line 168
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remoteProto_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerList()Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;
    .locals 4

    .line 176
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_serverList_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)J

    move-result-wide v0

    .line 177
    .local v0, "cPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v2, Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;-><init>(JZ)V

    :goto_0
    return-object v2
.end method

.method public getStaticChallenge()Ljava/lang/String;
    .locals 2

    .line 120
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_staticChallenge_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStaticChallengeEcho()Z
    .locals 2

    .line 128
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_staticChallengeEcho_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z

    move-result v0

    return v0
.end method

.method public getUserlockedUsername()Ljava/lang/String;
    .locals 2

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_userlockedUsername_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVpnCa()Ljava/lang/String;
    .locals 2

    .line 112
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_vpnCa_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWindowsDriver()Ljava/lang/String;
    .locals 2

    .line 185
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_windowsDriver_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAllowPasswordSave(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 140
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_allowPasswordSave_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 141
    return-void
.end method

.method public setAutologin(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 92
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_autologin_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 93
    return-void
.end method

.method public setDcoCompatible(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 189
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_dcoCompatible_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 190
    return-void
.end method

.method public setDcoIncompatibilityReason(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 197
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_dcoIncompatibilityReason_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public setError(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_error_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 53
    return-void
.end method

.method public setExternalPki(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 100
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_externalPki_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 101
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 84
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_friendlyName_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_message_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public setPrivateKeyPasswordRequired(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 132
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_privateKeyPasswordRequired_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 133
    return-void
.end method

.method public setProfileName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_profileName_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public setRemoteHost(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 148
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remoteHost_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 149
    return-void
.end method

.method public setRemotePort(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 156
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remotePort_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public setRemoteProto(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 164
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_remoteProto_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public setServerList(Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)V
    .locals 6
    .param p1, "value"    # Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;

    .line 172
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "value":Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;
    .local v5, "value":Lnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_serverList_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)V

    .line 173
    return-void
.end method

.method public setStaticChallenge(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 116
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_staticChallenge_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public setStaticChallengeEcho(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 124
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_staticChallengeEcho_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V

    .line 125
    return-void
.end method

.method public setUserlockedUsername(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_userlockedUsername_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setVpnCa(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 108
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_vpnCa_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method public setWindowsDriver(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 181
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_EvalConfig;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_EvalConfig_windowsDriver_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V

    .line 182
    return-void
.end method
