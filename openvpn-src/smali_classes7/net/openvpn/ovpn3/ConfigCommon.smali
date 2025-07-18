.class public Lnet/openvpn/ovpn3/ConfigCommon;
.super Ljava/lang/Object;
.source "ConfigCommon.java"


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 372
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ConfigCommon()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ConfigCommon;-><init>(JZ)V

    .line 373
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    .line 18
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ConfigCommon;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ConfigCommon;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ConfigCommon;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ConfigCommon;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ConfigCommon;->delete()V

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
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ConfigCommon(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ConfigCommon;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ConfigCommon;->delete()V

    .line 39
    return-void
.end method

.method public getAllowLocalDnsResolvers()Z
    .locals 2

    .line 344
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_allowLocalDnsResolvers_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getAllowLocalLanAccess()Z
    .locals 2

    .line 304
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_allowLocalLanAccess_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getAltProxy()Z
    .locals 2

    .line 272
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_altProxy_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getAppCustomProtocols()Ljava/lang/String;
    .locals 2

    .line 72
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_appCustomProtocols_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAutologinSessions()Z
    .locals 2

    .line 152
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_autologinSessions_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getClockTickMS()J
    .locals 2

    .line 320
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_clockTickMS_get(JLnet/openvpn/ovpn3/ConfigCommon;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getConnTimeout()I
    .locals 2

    .line 112
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_connTimeout_get(JLnet/openvpn/ovpn3/ConfigCommon;)I

    move-result v0

    return v0
.end method

.method public getDco()Z
    .locals 2

    .line 280
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_dco_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getDefaultKeyDirection()I
    .locals 2

    .line 192
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_defaultKeyDirection_get(JLnet/openvpn/ovpn3/ConfigCommon;)I

    move-result v0

    return v0
.end method

.method public getDhcpSearchDomainsAsSplitDomains()Z
    .locals 2

    .line 136
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_dhcpSearchDomainsAsSplitDomains_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getDisableClientCert()Z
    .locals 2

    .line 168
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_disableClientCert_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getEcho()Z
    .locals 2

    .line 288
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_echo_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getEnableLegacyAlgorithms()Z
    .locals 2

    .line 352
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableLegacyAlgorithms_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getEnableNonPreferredDCAlgorithms()Z
    .locals 2

    .line 360
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableNonPreferredDCAlgorithms_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getEnableRouteEmulation()Z
    .locals 2

    .line 312
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableRouteEmulation_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getGenerateTunBuilderCaptureEvent()Z
    .locals 2

    .line 368
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_generateTunBuilderCaptureEvent_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getGoogleDnsFallback()Z
    .locals 2

    .line 128
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_googleDnsFallback_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getGremlinConfig()Ljava/lang/String;
    .locals 2

    .line 328
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_gremlinConfig_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGuiVersion()Ljava/lang/String;
    .locals 2

    .line 56
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_guiVersion_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHwAddrOverride()Ljava/lang/String;
    .locals 2

    .line 80
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_hwAddrOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInfo()Z
    .locals 2

    .line 296
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_info_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getPlatformVersion()Ljava/lang/String;
    .locals 2

    .line 88
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_platformVersion_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPortOverride()Ljava/lang/String;
    .locals 2

    .line 104
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_portOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrivateKeyPassword()Ljava/lang/String;
    .locals 2

    .line 184
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_privateKeyPassword_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyAllowCleartextAuth()Z
    .locals 2

    .line 264
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyAllowCleartextAuth_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getProxyHost()Ljava/lang/String;
    .locals 2

    .line 232
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyHost_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyPassword()Ljava/lang/String;
    .locals 2

    .line 256
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyPassword_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyPort()Ljava/lang/String;
    .locals 2

    .line 240
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyPort_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyUsername()Ljava/lang/String;
    .locals 2

    .line 248
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyUsername_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRetryOnAuthFailed()Z
    .locals 2

    .line 160
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_retryOnAuthFailed_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getServerOverride()Ljava/lang/String;
    .locals 2

    .line 96
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_serverOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSslDebugLevel()I
    .locals 2

    .line 176
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_sslDebugLevel_get(JLnet/openvpn/ovpn3/ConfigCommon;)I

    move-result v0

    return v0
.end method

.method public getSsoMethods()Ljava/lang/String;
    .locals 2

    .line 64
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_ssoMethods_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSynchronousDnsLookup()Z
    .locals 2

    .line 144
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_synchronousDnsLookup_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getTlsCertProfileOverride()Ljava/lang/String;
    .locals 2

    .line 208
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCertProfileOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsCipherList()Ljava/lang/String;
    .locals 2

    .line 216
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCipherList_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsCiphersuitesList()Ljava/lang/String;
    .locals 2

    .line 224
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCiphersuitesList_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsVersionMinOverride()Ljava/lang/String;
    .locals 2

    .line 200
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsVersionMinOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTunPersist()Z
    .locals 2

    .line 120
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tunPersist_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public getWintun()Z
    .locals 2

    .line 336
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_wintun_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z

    move-result v0

    return v0
.end method

.method public setAllowLocalDnsResolvers(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 340
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_allowLocalDnsResolvers_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 341
    return-void
.end method

.method public setAllowLocalLanAccess(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 300
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_allowLocalLanAccess_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 301
    return-void
.end method

.method public setAltProxy(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 268
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_altProxy_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 269
    return-void
.end method

.method public setAppCustomProtocols(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 68
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_appCustomProtocols_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setAutologinSessions(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 148
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_autologinSessions_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 149
    return-void
.end method

.method public setClockTickMS(J)V
    .locals 2
    .param p1, "value"    # J

    .line 316
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_clockTickMS_set(JLnet/openvpn/ovpn3/ConfigCommon;J)V

    .line 317
    return-void
.end method

.method public setConnTimeout(I)V
    .locals 2
    .param p1, "value"    # I

    .line 108
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_connTimeout_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V

    .line 109
    return-void
.end method

.method public setDco(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 276
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_dco_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 277
    return-void
.end method

.method public setDefaultKeyDirection(I)V
    .locals 2
    .param p1, "value"    # I

    .line 188
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_defaultKeyDirection_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V

    .line 189
    return-void
.end method

.method public setDhcpSearchDomainsAsSplitDomains(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 132
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_dhcpSearchDomainsAsSplitDomains_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 133
    return-void
.end method

.method public setDisableClientCert(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 164
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_disableClientCert_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 165
    return-void
.end method

.method public setEcho(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 284
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_echo_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 285
    return-void
.end method

.method public setEnableLegacyAlgorithms(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 348
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableLegacyAlgorithms_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 349
    return-void
.end method

.method public setEnableNonPreferredDCAlgorithms(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 356
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableNonPreferredDCAlgorithms_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 357
    return-void
.end method

.method public setEnableRouteEmulation(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 308
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_enableRouteEmulation_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 309
    return-void
.end method

.method public setGenerateTunBuilderCaptureEvent(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 364
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_generateTunBuilderCaptureEvent_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 365
    return-void
.end method

.method public setGoogleDnsFallback(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 124
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_googleDnsFallback_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 125
    return-void
.end method

.method public setGremlinConfig(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 324
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_gremlinConfig_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 325
    return-void
.end method

.method public setGuiVersion(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 52
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_guiVersion_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public setHwAddrOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 76
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_hwAddrOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public setInfo(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 292
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_info_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 293
    return-void
.end method

.method public setPlatformVersion(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 84
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_platformVersion_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public setPortOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 100
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_portOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public setPrivateKeyPassword(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 180
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_privateKeyPassword_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public setProxyAllowCleartextAuth(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 260
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyAllowCleartextAuth_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 261
    return-void
.end method

.method public setProxyHost(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 228
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyHost_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method public setProxyPassword(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 252
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyPassword_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method public setProxyPort(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 236
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyPort_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 237
    return-void
.end method

.method public setProxyUsername(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 244
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_proxyUsername_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public setRetryOnAuthFailed(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 156
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_retryOnAuthFailed_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 157
    return-void
.end method

.method public setServerOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 92
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_serverOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public setSslDebugLevel(I)V
    .locals 2
    .param p1, "value"    # I

    .line 172
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_sslDebugLevel_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V

    .line 173
    return-void
.end method

.method public setSsoMethods(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 60
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_ssoMethods_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public setSynchronousDnsLookup(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 140
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_synchronousDnsLookup_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 141
    return-void
.end method

.method public setTlsCertProfileOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 204
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCertProfileOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method public setTlsCipherList(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 212
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCipherList_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 213
    return-void
.end method

.method public setTlsCiphersuitesList(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 220
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsCiphersuitesList_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method public setTlsVersionMinOverride(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 196
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tlsVersionMinOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public setTunPersist(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 116
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_tunPersist_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 117
    return-void
.end method

.method public setWintun(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 332
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ConfigCommon;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ConfigCommon_wintun_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V

    .line 333
    return-void
.end method
