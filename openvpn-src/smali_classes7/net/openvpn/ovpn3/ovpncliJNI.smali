.class public Lnet/openvpn/ovpn3/ovpncliJNI;
.super Ljava/lang/Object;
.source "ovpncliJNI.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 650
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->swig_module_init()V

    .line 651
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native ClientAPI_AppCustomControlMessageEvent_payload_get(JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_AppCustomControlMessageEvent_payload_set(JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_AppCustomControlMessageEvent_protocol_get(JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_AppCustomControlMessageEvent_protocol_set(JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_SWIGUpcast(J)J
.end method

.method public static final native ClientAPI_Config_allowUnusedAddrFamilies_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Config_allowUnusedAddrFamilies_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_compressionMode_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Config_compressionMode_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_contentList_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)J
.end method

.method public static final native ClientAPI_Config_contentList_set(JLnet/openvpn/ovpn3/ClientAPI_Config;J)V
.end method

.method public static final native ClientAPI_Config_content_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Config_content_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_externalPkiAlias_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Config_externalPkiAlias_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_peerInfo_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)J
.end method

.method public static final native ClientAPI_Config_peerInfo_set(JLnet/openvpn/ovpn3/ClientAPI_Config;J)V
.end method

.method public static final native ClientAPI_Config_protoOverride_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Config_protoOverride_set(JLnet/openvpn/ovpn3/ClientAPI_Config;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Config_protoVersionOverride_get(JLnet/openvpn/ovpn3/ClientAPI_Config;)I
.end method

.method public static final native ClientAPI_Config_protoVersionOverride_set(JLnet/openvpn/ovpn3/ClientAPI_Config;I)V
.end method

.method public static final native ClientAPI_ConnectionInfo_clientIp_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_clientIp_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_defined_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Z
.end method

.method public static final native ClientAPI_ConnectionInfo_defined_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Z)V
.end method

.method public static final native ClientAPI_ConnectionInfo_gw4_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_gw4_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_gw6_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_gw6_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_serverHost_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_serverHost_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_serverIp_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_serverIp_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_serverPort_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_serverPort_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_serverProto_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_serverProto_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_tunName_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_tunName_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_user_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_user_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnIp4_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnIp4_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnIp6_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnIp6_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnMtu_get(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ConnectionInfo_vpnMtu_set(JLnet/openvpn/ovpn3/ClientAPI_ConnectionInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_DynamicChallenge_challenge_get(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_DynamicChallenge_challenge_set(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_DynamicChallenge_echo_get(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Z
.end method

.method public static final native ClientAPI_DynamicChallenge_echo_set(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;Z)V
.end method

.method public static final native ClientAPI_DynamicChallenge_responseRequired_get(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Z
.end method

.method public static final native ClientAPI_DynamicChallenge_responseRequired_set(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;Z)V
.end method

.method public static final native ClientAPI_DynamicChallenge_stateID_get(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_DynamicChallenge_stateID_set(JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_allowPasswordSave_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_allowPasswordSave_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_autologin_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_autologin_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_dcoCompatible_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_dcoCompatible_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_dcoIncompatibilityReason_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_dcoIncompatibilityReason_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_error_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_error_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_externalPki_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_externalPki_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_friendlyName_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_friendlyName_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_message_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_message_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_privateKeyPasswordRequired_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_privateKeyPasswordRequired_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_profileName_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_profileName_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_remoteHost_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_remoteHost_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_remotePort_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_remotePort_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_remoteProto_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_remoteProto_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_serverList_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)J
.end method

.method public static final native ClientAPI_EvalConfig_serverList_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)V
.end method

.method public static final native ClientAPI_EvalConfig_staticChallengeEcho_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Z
.end method

.method public static final native ClientAPI_EvalConfig_staticChallengeEcho_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Z)V
.end method

.method public static final native ClientAPI_EvalConfig_staticChallenge_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_staticChallenge_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_userlockedUsername_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_userlockedUsername_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_vpnCa_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_vpnCa_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_EvalConfig_windowsDriver_get(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_EvalConfig_windowsDriver_set(JLnet/openvpn/ovpn3/ClientAPI_EvalConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Event_error_get(JLnet/openvpn/ovpn3/ClientAPI_Event;)Z
.end method

.method public static final native ClientAPI_Event_error_set(JLnet/openvpn/ovpn3/ClientAPI_Event;Z)V
.end method

.method public static final native ClientAPI_Event_fatal_get(JLnet/openvpn/ovpn3/ClientAPI_Event;)Z
.end method

.method public static final native ClientAPI_Event_fatal_set(JLnet/openvpn/ovpn3/ClientAPI_Event;Z)V
.end method

.method public static final native ClientAPI_Event_info_get(JLnet/openvpn/ovpn3/ClientAPI_Event;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Event_info_set(JLnet/openvpn/ovpn3/ClientAPI_Event;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Event_name_get(JLnet/openvpn/ovpn3/ClientAPI_Event;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Event_name_set(JLnet/openvpn/ovpn3/ClientAPI_Event;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKIBase_sign(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIBase;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public static final native ClientAPI_ExternalPKICertRequest_SWIGUpcast(J)J
.end method

.method public static final native ClientAPI_ExternalPKICertRequest_cert_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKICertRequest_cert_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKICertRequest_supportingChain_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKICertRequest_supportingChain_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_alias_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_alias_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_errorText_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_errorText_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_error_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;)Z
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_error_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;Z)V
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_invalidAlias_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;)Z
.end method

.method public static final native ClientAPI_ExternalPKIRequestBase_invalidAlias_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKIRequestBase;Z)V
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_SWIGUpcast(J)J
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_algorithm_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_algorithm_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_data_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_data_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_hashalg_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_hashalg_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_saltlen_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_saltlen_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_sig_get(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ExternalPKISignRequest_sig_set(JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_InterfaceStats_bytesIn_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_bytesIn_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_InterfaceStats_bytesOut_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_bytesOut_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_InterfaceStats_errorsIn_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_errorsIn_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_InterfaceStats_errorsOut_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_errorsOut_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_InterfaceStats_packetsIn_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_packetsIn_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_InterfaceStats_packetsOut_get(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;)J
.end method

.method public static final native ClientAPI_InterfaceStats_packetsOut_set(JLnet/openvpn/ovpn3/ClientAPI_InterfaceStats;J)V
.end method

.method public static final native ClientAPI_KeyValue_key_get(JLnet/openvpn/ovpn3/ClientAPI_KeyValue;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_KeyValue_key_set(JLnet/openvpn/ovpn3/ClientAPI_KeyValue;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_KeyValue_value_get(JLnet/openvpn/ovpn3/ClientAPI_KeyValue;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_KeyValue_value_set(JLnet/openvpn/ovpn3/ClientAPI_KeyValue;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_LLVector_clear(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)V
.end method

.method public static final native ClientAPI_LLVector_doAdd__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_LLVector;J)V
.end method

.method public static final native ClientAPI_LLVector_doAdd__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_LLVector;IJ)V
.end method

.method public static final native ClientAPI_LLVector_doCapacity(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)I
.end method

.method public static final native ClientAPI_LLVector_doGet(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)J
.end method

.method public static final native ClientAPI_LLVector_doRemove(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)J
.end method

.method public static final native ClientAPI_LLVector_doRemoveRange(JLnet/openvpn/ovpn3/ClientAPI_LLVector;II)V
.end method

.method public static final native ClientAPI_LLVector_doReserve(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)V
.end method

.method public static final native ClientAPI_LLVector_doSet(JLnet/openvpn/ovpn3/ClientAPI_LLVector;IJ)J
.end method

.method public static final native ClientAPI_LLVector_doSize(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)I
.end method

.method public static final native ClientAPI_LLVector_isEmpty(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)Z
.end method

.method public static final native ClientAPI_LogInfo_text_get(JLnet/openvpn/ovpn3/ClientAPI_LogInfo;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_LogInfo_text_set(JLnet/openvpn/ovpn3/ClientAPI_LogInfo;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_MergeConfig_basename_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_MergeConfig_basename_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_MergeConfig_errorText_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_MergeConfig_errorText_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_MergeConfig_profileContent_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_MergeConfig_profileContent_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_MergeConfig_refPathList_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)J
.end method

.method public static final native ClientAPI_MergeConfig_refPathList_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;JLnet/openvpn/ovpn3/ClientAPI_StringVec;)V
.end method

.method public static final native ClientAPI_MergeConfig_status_get(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_MergeConfig_status_set(JLnet/openvpn/ovpn3/ClientAPI_MergeConfig;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_copyright()Ljava/lang/String;
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_crypto_self_test(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_eval_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;JLnet/openvpn/ovpn3/ClientAPI_Config;)J
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_max_profile_size()I
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_merge_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;Ljava/lang/String;Z)J
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_merge_config_string(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClientHelper;Ljava/lang/String;)J
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_parse_dynamic_challenge(Ljava/lang/String;JLnet/openvpn/ovpn3/ClientAPI_DynamicChallenge;)Z
.end method

.method public static final native ClientAPI_OpenVPNClientHelper_platform()Ljava/lang/String;
.end method

.method public static final native ClientAPI_OpenVPNClient_SWIGUpcast(J)J
.end method

.method public static final native ClientAPI_OpenVPNClient_acc_event(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_change_ownership(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JZ)V
.end method

.method public static final native ClientAPI_OpenVPNClient_clock_tick(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_clock_tickSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_connect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_connection_info(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_director_connect(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JZZ)V
.end method

.method public static final native ClientAPI_OpenVPNClient_eval_config(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_Config;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_event(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_Event;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_external_pki_cert_request(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_external_pki_sign_request(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_log(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_LogInfo;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_pause(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_pause_on_connection_timeout(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_post_cc_msg(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_provide_creds(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_reconnect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)V
.end method

.method public static final native ClientAPI_OpenVPNClient_remote_override(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_remote_overrideSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_remote_override_enabled(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_remote_override_enabledSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_resume(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_send_app_control_channel_msg(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_session_token(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;JLnet/openvpn/ovpn3/ClientAPI_SessionToken;)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_socket_protect(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ILjava/lang/String;Z)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_socket_protectSwigExplicitClientAPI_OpenVPNClient(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ILjava/lang/String;Z)Z
.end method

.method public static final native ClientAPI_OpenVPNClient_start_cert_check__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;J)V
.end method

.method public static final native ClientAPI_OpenVPNClient_start_cert_check__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_start_cert_check_epki(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;J)V
.end method

.method public static final native ClientAPI_OpenVPNClient_stats_bundle(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_stats_n()I
.end method

.method public static final native ClientAPI_OpenVPNClient_stats_name(I)Ljava/lang/String;
.end method

.method public static final native ClientAPI_OpenVPNClient_stats_value(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)J
.end method

.method public static final native ClientAPI_OpenVPNClient_stop(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
.end method

.method public static final native ClientAPI_OpenVPNClient_transport_stats(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
.end method

.method public static final native ClientAPI_OpenVPNClient_tun_stats(JLnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)J
.end method

.method public static final native ClientAPI_ProvideCreds_dynamicChallengeCookie_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_dynamicChallengeCookie_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ProvideCreds_http_proxy_pass_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_http_proxy_pass_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ProvideCreds_http_proxy_user_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_http_proxy_user_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ProvideCreds_password_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_password_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ProvideCreds_response_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_response_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ProvideCreds_username_get(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ProvideCreds_username_set(JLnet/openvpn/ovpn3/ClientAPI_ProvideCreds;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_RemoteOverride_error_get(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_RemoteOverride_error_set(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_RemoteOverride_host_get(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_RemoteOverride_host_set(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_RemoteOverride_ip_get(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_RemoteOverride_ip_set(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_RemoteOverride_port_get(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_RemoteOverride_port_set(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_RemoteOverride_proto_get(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_RemoteOverride_proto_set(JLnet/openvpn/ovpn3/ClientAPI_RemoteOverride;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ServerEntryVector_clear(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)V
.end method

.method public static final native ClientAPI_ServerEntryVector_doAdd__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;JLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)V
.end method

.method public static final native ClientAPI_ServerEntryVector_doAdd__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;IJLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)V
.end method

.method public static final native ClientAPI_ServerEntryVector_doCapacity(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)I
.end method

.method public static final native ClientAPI_ServerEntryVector_doGet(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;I)J
.end method

.method public static final native ClientAPI_ServerEntryVector_doRemove(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;I)J
.end method

.method public static final native ClientAPI_ServerEntryVector_doRemoveRange(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;II)V
.end method

.method public static final native ClientAPI_ServerEntryVector_doReserve(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;I)V
.end method

.method public static final native ClientAPI_ServerEntryVector_doSet(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;IJLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)J
.end method

.method public static final native ClientAPI_ServerEntryVector_doSize(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)I
.end method

.method public static final native ClientAPI_ServerEntryVector_isEmpty(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)Z
.end method

.method public static final native ClientAPI_ServerEntry_friendlyName_get(JLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ServerEntry_friendlyName_set(JLnet/openvpn/ovpn3/ClientAPI_ServerEntry;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_ServerEntry_server_get(JLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_ServerEntry_server_set(JLnet/openvpn/ovpn3/ClientAPI_ServerEntry;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_SessionToken_session_id_get(JLnet/openvpn/ovpn3/ClientAPI_SessionToken;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_SessionToken_session_id_set(JLnet/openvpn/ovpn3/ClientAPI_SessionToken;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_SessionToken_username_get(JLnet/openvpn/ovpn3/ClientAPI_SessionToken;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_SessionToken_username_set(JLnet/openvpn/ovpn3/ClientAPI_SessionToken;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Status_error_get(JLnet/openvpn/ovpn3/ClientAPI_Status;)Z
.end method

.method public static final native ClientAPI_Status_error_set(JLnet/openvpn/ovpn3/ClientAPI_Status;Z)V
.end method

.method public static final native ClientAPI_Status_message_get(JLnet/openvpn/ovpn3/ClientAPI_Status;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Status_message_set(JLnet/openvpn/ovpn3/ClientAPI_Status;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_Status_status_get(JLnet/openvpn/ovpn3/ClientAPI_Status;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_Status_status_set(JLnet/openvpn/ovpn3/ClientAPI_Status;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_StringVec_clear(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)V
.end method

.method public static final native ClientAPI_StringVec_doAdd__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_StringVec;Ljava/lang/String;)V
.end method

.method public static final native ClientAPI_StringVec_doAdd__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_StringVec;ILjava/lang/String;)V
.end method

.method public static final native ClientAPI_StringVec_doCapacity(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)I
.end method

.method public static final native ClientAPI_StringVec_doGet(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)Ljava/lang/String;
.end method

.method public static final native ClientAPI_StringVec_doRemove(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)Ljava/lang/String;
.end method

.method public static final native ClientAPI_StringVec_doRemoveRange(JLnet/openvpn/ovpn3/ClientAPI_StringVec;II)V
.end method

.method public static final native ClientAPI_StringVec_doReserve(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)V
.end method

.method public static final native ClientAPI_StringVec_doSet(JLnet/openvpn/ovpn3/ClientAPI_StringVec;ILjava/lang/String;)Ljava/lang/String;
.end method

.method public static final native ClientAPI_StringVec_doSize(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)I
.end method

.method public static final native ClientAPI_StringVec_isEmpty(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)Z
.end method

.method public static final native ClientAPI_TransportStats_bytesIn_get(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;)J
.end method

.method public static final native ClientAPI_TransportStats_bytesIn_set(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;J)V
.end method

.method public static final native ClientAPI_TransportStats_bytesOut_get(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;)J
.end method

.method public static final native ClientAPI_TransportStats_bytesOut_set(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;J)V
.end method

.method public static final native ClientAPI_TransportStats_lastPacketReceived_get(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;)I
.end method

.method public static final native ClientAPI_TransportStats_lastPacketReceived_set(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;I)V
.end method

.method public static final native ClientAPI_TransportStats_packetsIn_get(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;)J
.end method

.method public static final native ClientAPI_TransportStats_packetsIn_set(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;J)V
.end method

.method public static final native ClientAPI_TransportStats_packetsOut_get(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;)J
.end method

.method public static final native ClientAPI_TransportStats_packetsOut_set(JLnet/openvpn/ovpn3/ClientAPI_TransportStats;J)V
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_add_address(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;ILjava/lang/String;ZZ)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_add_proxy_bypass(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_add_route(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;IIZ)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_add_wins_server(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_establish(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)I
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_establish_lite(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)V
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_exclude_route(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;IIZ)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_get_local_networks(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)J
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_new(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_persist(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_reroute_gw(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;ZZJ)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_allow_family(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;IZ)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_allow_local_dns(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_dns_options(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;JLnet/openvpn/ovpn3/DnsOptions;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_layer(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_mtu(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_proxy_auto_config_url(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_proxy_http(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;I)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_proxy_https(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;I)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_remote_address(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;Z)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_route_metric_default(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;I)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_set_session_name(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Ljava/lang/String;)Z
.end method

.method public static final native ClientAPI_TunBuilderBase_tun_builder_teardown(JLnet/openvpn/ovpn3/ClientAPI_TunBuilderBase;Z)V
.end method

.method public static final native ConfigCommon_allowLocalDnsResolvers_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_allowLocalDnsResolvers_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_allowLocalLanAccess_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_allowLocalLanAccess_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_altProxy_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_altProxy_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_appCustomProtocols_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_appCustomProtocols_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_autologinSessions_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_autologinSessions_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_clockTickMS_get(JLnet/openvpn/ovpn3/ConfigCommon;)J
.end method

.method public static final native ConfigCommon_clockTickMS_set(JLnet/openvpn/ovpn3/ConfigCommon;J)V
.end method

.method public static final native ConfigCommon_connTimeout_get(JLnet/openvpn/ovpn3/ConfigCommon;)I
.end method

.method public static final native ConfigCommon_connTimeout_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V
.end method

.method public static final native ConfigCommon_dco_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_dco_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_defaultKeyDirection_get(JLnet/openvpn/ovpn3/ConfigCommon;)I
.end method

.method public static final native ConfigCommon_defaultKeyDirection_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V
.end method

.method public static final native ConfigCommon_dhcpSearchDomainsAsSplitDomains_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_dhcpSearchDomainsAsSplitDomains_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_disableClientCert_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_disableClientCert_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_echo_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_echo_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_enableLegacyAlgorithms_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_enableLegacyAlgorithms_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_enableNonPreferredDCAlgorithms_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_enableNonPreferredDCAlgorithms_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_enableRouteEmulation_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_enableRouteEmulation_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_generateTunBuilderCaptureEvent_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_generateTunBuilderCaptureEvent_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_googleDnsFallback_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_googleDnsFallback_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_gremlinConfig_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_gremlinConfig_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_guiVersion_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_guiVersion_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_hwAddrOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_hwAddrOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_info_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_info_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_platformVersion_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_platformVersion_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_portOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_portOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_privateKeyPassword_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_privateKeyPassword_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_proxyAllowCleartextAuth_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_proxyAllowCleartextAuth_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_proxyHost_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_proxyHost_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_proxyPassword_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_proxyPassword_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_proxyPort_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_proxyPort_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_proxyUsername_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_proxyUsername_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_retryOnAuthFailed_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_retryOnAuthFailed_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_serverOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_serverOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_sslDebugLevel_get(JLnet/openvpn/ovpn3/ConfigCommon;)I
.end method

.method public static final native ConfigCommon_sslDebugLevel_set(JLnet/openvpn/ovpn3/ConfigCommon;I)V
.end method

.method public static final native ConfigCommon_ssoMethods_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_ssoMethods_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_synchronousDnsLookup_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_synchronousDnsLookup_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_tlsCertProfileOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_tlsCertProfileOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_tlsCipherList_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_tlsCipherList_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_tlsCiphersuitesList_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_tlsCiphersuitesList_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_tlsVersionMinOverride_get(JLnet/openvpn/ovpn3/ConfigCommon;)Ljava/lang/String;
.end method

.method public static final native ConfigCommon_tlsVersionMinOverride_set(JLnet/openvpn/ovpn3/ConfigCommon;Ljava/lang/String;)V
.end method

.method public static final native ConfigCommon_tunPersist_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_tunPersist_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native ConfigCommon_wintun_get(JLnet/openvpn/ovpn3/ConfigCommon;)Z
.end method

.method public static final native ConfigCommon_wintun_set(JLnet/openvpn/ovpn3/ConfigCommon;Z)V
.end method

.method public static final native DnsAddress_address_get(JLnet/openvpn/ovpn3/DnsAddress;)Ljava/lang/String;
.end method

.method public static final native DnsAddress_address_set(JLnet/openvpn/ovpn3/DnsAddress;Ljava/lang/String;)V
.end method

.method public static final native DnsAddress_equals(JLnet/openvpn/ovpn3/DnsAddress;JLnet/openvpn/ovpn3/DnsAddress;)Z
.end method

.method public static final native DnsAddress_port_get(JLnet/openvpn/ovpn3/DnsAddress;)J
.end method

.method public static final native DnsAddress_port_set(JLnet/openvpn/ovpn3/DnsAddress;J)V
.end method

.method public static final native DnsAddress_to_string(JLnet/openvpn/ovpn3/DnsAddress;)Ljava/lang/String;
.end method

.method public static final native DnsAddress_validate(JLnet/openvpn/ovpn3/DnsAddress;Ljava/lang/String;)V
.end method

.method public static final native DnsDomain_domain_get(JLnet/openvpn/ovpn3/DnsDomain;)Ljava/lang/String;
.end method

.method public static final native DnsDomain_domain_set(JLnet/openvpn/ovpn3/DnsDomain;Ljava/lang/String;)V
.end method

.method public static final native DnsDomain_equals(JLnet/openvpn/ovpn3/DnsDomain;JLnet/openvpn/ovpn3/DnsDomain;)Z
.end method

.method public static final native DnsDomain_to_string(JLnet/openvpn/ovpn3/DnsDomain;)Ljava/lang/String;
.end method

.method public static final native DnsDomain_validate(JLnet/openvpn/ovpn3/DnsDomain;Ljava/lang/String;)V
.end method

.method public static final native DnsOptions_AddressList_clear(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)V
.end method

.method public static final native DnsOptions_AddressList_doAdd__SWIG_0(JLnet/openvpn/ovpn3/DnsOptions_AddressList;JLnet/openvpn/ovpn3/DnsAddress;)V
.end method

.method public static final native DnsOptions_AddressList_doAdd__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_AddressList;IJLnet/openvpn/ovpn3/DnsAddress;)V
.end method

.method public static final native DnsOptions_AddressList_doCapacity(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)I
.end method

.method public static final native DnsOptions_AddressList_doGet(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)J
.end method

.method public static final native DnsOptions_AddressList_doRemove(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)J
.end method

.method public static final native DnsOptions_AddressList_doRemoveRange(JLnet/openvpn/ovpn3/DnsOptions_AddressList;II)V
.end method

.method public static final native DnsOptions_AddressList_doReserve(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)V
.end method

.method public static final native DnsOptions_AddressList_doSet(JLnet/openvpn/ovpn3/DnsOptions_AddressList;IJLnet/openvpn/ovpn3/DnsAddress;)J
.end method

.method public static final native DnsOptions_AddressList_doSize(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)I
.end method

.method public static final native DnsOptions_AddressList_isEmpty(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)Z
.end method

.method public static final native DnsOptions_DomainsList_clear(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)V
.end method

.method public static final native DnsOptions_DomainsList_doAdd__SWIG_0(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;JLnet/openvpn/ovpn3/DnsDomain;)V
.end method

.method public static final native DnsOptions_DomainsList_doAdd__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;IJLnet/openvpn/ovpn3/DnsDomain;)V
.end method

.method public static final native DnsOptions_DomainsList_doCapacity(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)I
.end method

.method public static final native DnsOptions_DomainsList_doGet(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;I)J
.end method

.method public static final native DnsOptions_DomainsList_doRemove(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;I)J
.end method

.method public static final native DnsOptions_DomainsList_doRemoveRange(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;II)V
.end method

.method public static final native DnsOptions_DomainsList_doReserve(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;I)V
.end method

.method public static final native DnsOptions_DomainsList_doSet(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;IJLnet/openvpn/ovpn3/DnsDomain;)J
.end method

.method public static final native DnsOptions_DomainsList_doSize(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)I
.end method

.method public static final native DnsOptions_DomainsList_isEmpty(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)Z
.end method

.method public static final native DnsOptions_ServersMap_Iterator_getKey(JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)I
.end method

.method public static final native DnsOptions_ServersMap_Iterator_getNextUnchecked(JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)J
.end method

.method public static final native DnsOptions_ServersMap_Iterator_getValue(JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)J
.end method

.method public static final native DnsOptions_ServersMap_Iterator_isNot(JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Z
.end method

.method public static final native DnsOptions_ServersMap_Iterator_setValue(JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;JLnet/openvpn/ovpn3/DnsServer;)V
.end method

.method public static final native DnsOptions_ServersMap_begin(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J
.end method

.method public static final native DnsOptions_ServersMap_clear(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)V
.end method

.method public static final native DnsOptions_ServersMap_containsImpl(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;I)Z
.end method

.method public static final native DnsOptions_ServersMap_end(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J
.end method

.method public static final native DnsOptions_ServersMap_find(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;I)J
.end method

.method public static final native DnsOptions_ServersMap_isEmpty(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)Z
.end method

.method public static final native DnsOptions_ServersMap_putUnchecked(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;IJLnet/openvpn/ovpn3/DnsServer;)V
.end method

.method public static final native DnsOptions_ServersMap_removeUnchecked(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)V
.end method

.method public static final native DnsOptions_ServersMap_sizeImpl(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)I
.end method

.method public static final native DnsOptions_equals(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions;)Z
.end method

.method public static final native DnsOptions_from_dhcp_options_get(JLnet/openvpn/ovpn3/DnsOptions;)Z
.end method

.method public static final native DnsOptions_from_dhcp_options_set(JLnet/openvpn/ovpn3/DnsOptions;Z)V
.end method

.method public static final native DnsOptions_search_domains_get(JLnet/openvpn/ovpn3/DnsOptions;)J
.end method

.method public static final native DnsOptions_search_domains_set(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)V
.end method

.method public static final native DnsOptions_servers_get(JLnet/openvpn/ovpn3/DnsOptions;)J
.end method

.method public static final native DnsOptions_servers_set(JLnet/openvpn/ovpn3/DnsOptions;JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)V
.end method

.method public static final native DnsOptions_to_string(JLnet/openvpn/ovpn3/DnsOptions;)Ljava/lang/String;
.end method

.method public static final native DnsServer_addresses_get(JLnet/openvpn/ovpn3/DnsServer;)J
.end method

.method public static final native DnsServer_addresses_set(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsOptions_AddressList;)V
.end method

.method public static final native DnsServer_dnssec_get(JLnet/openvpn/ovpn3/DnsServer;)I
.end method

.method public static final native DnsServer_dnssec_set(JLnet/openvpn/ovpn3/DnsServer;I)V
.end method

.method public static final native DnsServer_dnssec_string(JLnet/openvpn/ovpn3/DnsServer;I)Ljava/lang/String;
.end method

.method public static final native DnsServer_domains_get(JLnet/openvpn/ovpn3/DnsServer;)J
.end method

.method public static final native DnsServer_domains_set(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)V
.end method

.method public static final native DnsServer_equals(JLnet/openvpn/ovpn3/DnsServer;JLnet/openvpn/ovpn3/DnsServer;)Z
.end method

.method public static final native DnsServer_sni_get(JLnet/openvpn/ovpn3/DnsServer;)Ljava/lang/String;
.end method

.method public static final native DnsServer_sni_set(JLnet/openvpn/ovpn3/DnsServer;Ljava/lang/String;)V
.end method

.method public static final native DnsServer_to_string__SWIG_0(JLnet/openvpn/ovpn3/DnsServer;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static final native DnsServer_to_string__SWIG_1(JLnet/openvpn/ovpn3/DnsServer;)Ljava/lang/String;
.end method

.method public static final native DnsServer_transport_get(JLnet/openvpn/ovpn3/DnsServer;)I
.end method

.method public static final native DnsServer_transport_set(JLnet/openvpn/ovpn3/DnsServer;I)V
.end method

.method public static final native DnsServer_transport_string(JLnet/openvpn/ovpn3/DnsServer;I)Ljava/lang/String;
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_acc_event(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 627
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->acc_event(Lnet/openvpn/ovpn3/ClientAPI_AppCustomControlMessageEvent;)V

    .line 628
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_clock_tick(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
    .locals 0
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 645
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->clock_tick()V

    .line 646
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_event(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 624
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_Event;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_Event;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->event(Lnet/openvpn/ovpn3/ClientAPI_Event;)V

    .line 625
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_external_pki_cert_request(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 633
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->external_pki_cert_request(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKICertRequest;)V

    .line 634
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_external_pki_sign_request(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 636
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->external_pki_sign_request(Lnet/openvpn/ovpn3/ClientAPI_ExternalPKISignRequest;)V

    .line 637
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_log(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 630
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_LogInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_LogInfo;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->log(Lnet/openvpn/ovpn3/ClientAPI_LogInfo;)V

    .line 631
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_pause_on_connection_timeout(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 621
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->pause_on_connection_timeout()Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_remote_override(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)V
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "arg0"    # J

    .line 642
    new-instance v0, Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->remote_override(Lnet/openvpn/ovpn3/ClientAPI_RemoteOverride;)V

    .line 643
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_remote_override_enabled(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 639
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->remote_override_enabled()Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_socket_protect(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ILjava/lang/String;Z)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "socket"    # I
    .param p2, "remote"    # Ljava/lang/String;
    .param p3, "ipv6"    # Z

    .line 618
    invoke-virtual {p0, p1, p2, p3}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->socket_protect(ILjava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_add_address(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;ILjava/lang/String;ZZ)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "gateway"    # Ljava/lang/String;
    .param p4, "ipv6"    # Z
    .param p5, "net30"    # Z

    .line 558
    invoke-virtual/range {p0 .. p5}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_add_address(Ljava/lang/String;ILjava/lang/String;ZZ)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_add_proxy_bypass(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "bypass_host"    # Ljava/lang/String;

    .line 582
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_add_proxy_bypass(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_add_route(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;IIZ)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "metric"    # I
    .param p4, "ipv6"    # Z

    .line 567
    invoke-virtual {p0, p1, p2, p3, p4}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_add_route(Ljava/lang/String;IIZ)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_add_wins_server(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "address"    # Ljava/lang/String;

    .line 594
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_add_wins_server(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_establish(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)I
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 603
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_establish()I

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_establish_lite(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)V
    .locals 0
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 612
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_establish_lite()V

    .line 613
    return-void
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_exclude_route(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;IIZ)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "prefix_length"    # I
    .param p3, "metric"    # I
    .param p4, "ipv6"    # Z

    .line 570
    invoke-virtual {p0, p1, p2, p3, p4}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_exclude_route(Ljava/lang/String;IIZ)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_get_local_networks(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Z)J
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "ipv6"    # Z

    .line 609
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_get_local_networks(Z)Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    move-result-object v0

    invoke-static {v0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_new(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 549
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_new()Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_persist(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;

    .line 606
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_persist()Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_reroute_gw(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;ZZJ)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "ipv4"    # Z
    .param p2, "ipv6"    # Z
    .param p3, "flags"    # J

    .line 564
    invoke-virtual {p0, p1, p2, p3, p4}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_reroute_gw(ZZJ)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_allow_family(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;IZ)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "af"    # I
    .param p2, "allow"    # Z

    .line 597
    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_allow_family(IZ)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_allow_local_dns(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Z)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "allow"    # Z

    .line 600
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_allow_local_dns(Z)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_dns_options(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;J)Z
    .locals 2
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "dns"    # J

    .line 573
    new-instance v0, Lnet/openvpn/ovpn3/DnsOptions;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/DnsOptions;-><init>(JZ)V

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_dns_options(Lnet/openvpn/ovpn3/DnsOptions;)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_layer(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "layer"    # I

    .line 552
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_layer(I)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_mtu(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "mtu"    # I

    .line 576
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_mtu(I)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_proxy_auto_config_url(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "url"    # Ljava/lang/String;

    .line 585
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_proxy_auto_config_url(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_proxy_http(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;I)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 588
    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_proxy_http(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_proxy_https(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;I)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 591
    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_proxy_https(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_remote_address(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "ipv6"    # Z

    .line 555
    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_remote_address(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_route_metric_default(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;I)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "metric"    # I

    .line 561
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_route_metric_default(I)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_set_session_name(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "name"    # Ljava/lang/String;

    .line 579
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_set_session_name(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static SwigDirector_ClientAPI_OpenVPNClient_tun_builder_teardown(Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;Z)V
    .locals 0
    .param p0, "jself"    # Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;
    .param p1, "disconnect"    # Z

    .line 615
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_OpenVPNClient;->tun_builder_teardown(Z)V

    .line 616
    return-void
.end method

.method public static final native delete_ClientAPI_AppCustomControlMessageEvent(J)V
.end method

.method public static final native delete_ClientAPI_Config(J)V
.end method

.method public static final native delete_ClientAPI_ConnectionInfo(J)V
.end method

.method public static final native delete_ClientAPI_DynamicChallenge(J)V
.end method

.method public static final native delete_ClientAPI_EvalConfig(J)V
.end method

.method public static final native delete_ClientAPI_Event(J)V
.end method

.method public static final native delete_ClientAPI_ExternalPKIBase(J)V
.end method

.method public static final native delete_ClientAPI_ExternalPKICertRequest(J)V
.end method

.method public static final native delete_ClientAPI_ExternalPKIRequestBase(J)V
.end method

.method public static final native delete_ClientAPI_ExternalPKISignRequest(J)V
.end method

.method public static final native delete_ClientAPI_InterfaceStats(J)V
.end method

.method public static final native delete_ClientAPI_KeyValue(J)V
.end method

.method public static final native delete_ClientAPI_LLVector(J)V
.end method

.method public static final native delete_ClientAPI_LogInfo(J)V
.end method

.method public static final native delete_ClientAPI_MergeConfig(J)V
.end method

.method public static final native delete_ClientAPI_OpenVPNClient(J)V
.end method

.method public static final native delete_ClientAPI_OpenVPNClientHelper(J)V
.end method

.method public static final native delete_ClientAPI_ProvideCreds(J)V
.end method

.method public static final native delete_ClientAPI_RemoteOverride(J)V
.end method

.method public static final native delete_ClientAPI_ServerEntry(J)V
.end method

.method public static final native delete_ClientAPI_ServerEntryVector(J)V
.end method

.method public static final native delete_ClientAPI_SessionToken(J)V
.end method

.method public static final native delete_ClientAPI_Status(J)V
.end method

.method public static final native delete_ClientAPI_StringVec(J)V
.end method

.method public static final native delete_ClientAPI_TransportStats(J)V
.end method

.method public static final native delete_ClientAPI_TunBuilderBase(J)V
.end method

.method public static final native delete_ConfigCommon(J)V
.end method

.method public static final native delete_DnsAddress(J)V
.end method

.method public static final native delete_DnsDomain(J)V
.end method

.method public static final native delete_DnsOptions(J)V
.end method

.method public static final native delete_DnsOptions_AddressList(J)V
.end method

.method public static final native delete_DnsOptions_DomainsList(J)V
.end method

.method public static final native delete_DnsOptions_ServersMap(J)V
.end method

.method public static final native delete_DnsOptions_ServersMap_Iterator(J)V
.end method

.method public static final native delete_DnsServer(J)V
.end method

.method public static final native delete_ExternalPKIImpl(J)V
.end method

.method public static final native new_ClientAPI_AppCustomControlMessageEvent()J
.end method

.method public static final native new_ClientAPI_Config()J
.end method

.method public static final native new_ClientAPI_ConnectionInfo()J
.end method

.method public static final native new_ClientAPI_DynamicChallenge()J
.end method

.method public static final native new_ClientAPI_EvalConfig()J
.end method

.method public static final native new_ClientAPI_Event()J
.end method

.method public static final native new_ClientAPI_ExternalPKICertRequest()J
.end method

.method public static final native new_ClientAPI_ExternalPKIRequestBase()J
.end method

.method public static final native new_ClientAPI_ExternalPKISignRequest()J
.end method

.method public static final native new_ClientAPI_InterfaceStats()J
.end method

.method public static final native new_ClientAPI_KeyValue__SWIG_0()J
.end method

.method public static final native new_ClientAPI_KeyValue__SWIG_1(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method public static final native new_ClientAPI_LLVector__SWIG_0()J
.end method

.method public static final native new_ClientAPI_LLVector__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)J
.end method

.method public static final native new_ClientAPI_LLVector__SWIG_2(IJ)J
.end method

.method public static final native new_ClientAPI_LogInfo__SWIG_0()J
.end method

.method public static final native new_ClientAPI_LogInfo__SWIG_1(Ljava/lang/String;)J
.end method

.method public static final native new_ClientAPI_MergeConfig()J
.end method

.method public static final native new_ClientAPI_OpenVPNClient()J
.end method

.method public static final native new_ClientAPI_OpenVPNClientHelper()J
.end method

.method public static final native new_ClientAPI_ProvideCreds()J
.end method

.method public static final native new_ClientAPI_RemoteOverride()J
.end method

.method public static final native new_ClientAPI_ServerEntry()J
.end method

.method public static final native new_ClientAPI_ServerEntryVector__SWIG_0()J
.end method

.method public static final native new_ClientAPI_ServerEntryVector__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_ServerEntryVector;)J
.end method

.method public static final native new_ClientAPI_ServerEntryVector__SWIG_2(IJLnet/openvpn/ovpn3/ClientAPI_ServerEntry;)J
.end method

.method public static final native new_ClientAPI_SessionToken()J
.end method

.method public static final native new_ClientAPI_Status()J
.end method

.method public static final native new_ClientAPI_StringVec__SWIG_0()J
.end method

.method public static final native new_ClientAPI_StringVec__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)J
.end method

.method public static final native new_ClientAPI_StringVec__SWIG_2(ILjava/lang/String;)J
.end method

.method public static final native new_ClientAPI_TransportStats()J
.end method

.method public static final native new_ClientAPI_TunBuilderBase()J
.end method

.method public static final native new_ConfigCommon()J
.end method

.method public static final native new_DnsAddress()J
.end method

.method public static final native new_DnsDomain()J
.end method

.method public static final native new_DnsOptions()J
.end method

.method public static final native new_DnsOptions_AddressList__SWIG_0()J
.end method

.method public static final native new_DnsOptions_AddressList__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)J
.end method

.method public static final native new_DnsOptions_AddressList__SWIG_2(IJLnet/openvpn/ovpn3/DnsAddress;)J
.end method

.method public static final native new_DnsOptions_DomainsList__SWIG_0()J
.end method

.method public static final native new_DnsOptions_DomainsList__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_DomainsList;)J
.end method

.method public static final native new_DnsOptions_DomainsList__SWIG_2(IJLnet/openvpn/ovpn3/DnsDomain;)J
.end method

.method public static final native new_DnsOptions_ServersMap__SWIG_0()J
.end method

.method public static final native new_DnsOptions_ServersMap__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J
.end method

.method public static final native new_DnsServer()J
.end method

.method public static final native new_ExternalPKIImpl()J
.end method

.method private static final native swig_module_init()V
.end method
