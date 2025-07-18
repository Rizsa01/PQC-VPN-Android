.class public Lde/blinkt/openvpn/core/VpnProfile;
.super Ljava/lang/Object;
.source "VpnProfile.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;,
        Lde/blinkt/openvpn/core/VpnProfile$NoCertReturnedException;,
        Lde/blinkt/openvpn/core/VpnProfile$RsaPaddingType;
    }
.end annotation


# static fields
.field private static final AUTH_RETRY_INTERACT:I = 0x3

.field public static final AUTH_RETRY_NOINTERACT:I = 0x2

.field public static final AUTH_RETRY_NONE_FORGET:I = 0x0

.field private static final AUTH_RETRY_NONE_KEEP:I = 0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/VpnProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final CURRENT_PROFILE_VERSION:I = 0xb

.field public static DEFAULT_DNS1:Ljava/lang/String; = null

.field public static DEFAULT_DNS2:Ljava/lang/String; = null

.field public static final DEFAULT_MSSFIX_SIZE:I = 0x500

.field public static final DISPLAYNAME_TAG:Ljava/lang/String; = "[[NAME]]"

.field private static final EXTRA_DIGEST:Ljava/lang/String; = "de.blinkt.openvpn.api.DIGEST"

.field private static final EXTRA_NEEDS_DIGEST:Ljava/lang/String; = "de.blinkt.openvpn.api.NEEDS_DIGEST"

.field public static final EXTRA_PROFILEUUID:Ljava/lang/String; = "de.blinkt.openvpn.profileUUID"

.field public static final EXTRA_PROFILE_VERSION:Ljava/lang/String; = "de.blinkt.openvpn.profileVersion"

.field private static final EXTRA_RSA_PADDING_TYPE:Ljava/lang/String; = "de.blinkt.openvpn.api.RSA_PADDING_TYPE"

.field private static final EXTRA_SALTLEN:Ljava/lang/String; = "de.blinkt.openvpn.api.SALTLEN"

.field public static final INLINE_TAG:Ljava/lang/String; = "[[INLINE]]"

.field public static final MAXLOGLEVEL:I = 0x4

.field public static final MAX_EMBED_FILE_SIZE:I = 0x200000

.field private static final PQC_VPN_LOG_TAG_PROFILE:Ljava/lang/String; = "PQC_VPN_Profile"

.field public static final TYPE_CERTIFICATES:I = 0x0

.field public static final TYPE_EXTERNAL_APP:I = 0x8

.field public static final TYPE_KEYSTORE:I = 0x2

.field public static final TYPE_PKCS12:I = 0x1

.field public static final TYPE_STATICKEYS:I = 0x4

.field public static final TYPE_USERPASS:I = 0x3

.field public static final TYPE_USERPASS_CERTIFICATES:I = 0x5

.field public static final TYPE_USERPASS_KEYSTORE:I = 0x7

.field public static final TYPE_USERPASS_PKCS12:I = 0x6

.field public static final X509_VERIFY_TLSREMOTE:I = 0x0

.field public static final X509_VERIFY_TLSREMOTE_COMPAT_NOREMAPPING:I = 0x1

.field public static final X509_VERIFY_TLSREMOTE_DN:I = 0x2

.field public static final X509_VERIFY_TLSREMOTE_RDN:I = 0x3

.field public static final X509_VERIFY_TLSREMOTE_RDN_PREFIX:I = 0x4

.field private static final serialVersionUID:J = 0x62556c8c6395eca3L


# instance fields
.field public changesLog:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;",
            ">;"
        }
    .end annotation
.end field

.field public importedProfileHash:Ljava/lang/String;

.field public mAlias:Ljava/lang/String;

.field public mAllowAppVpnBypass:Z

.field public mAllowLocalLAN:Z

.field public mAllowedAppsVpn:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mAllowedAppsVpnAreDisallowed:Z

.field public mAuth:Ljava/lang/String;

.field public mAuthRetry:I

.field public mAuthenticationType:I

.field public mBlockUnusedAddressFamilies:Z

.field public mCaFilename:Ljava/lang/String;

.field public mCheckPeerFingerprint:Z

.field public mCheckRemoteCN:Z

.field public mCipher:Ljava/lang/String;

.field public mClientCertFilename:Ljava/lang/String;

.field public mClientKeyFilename:Ljava/lang/String;

.field public mCompatMode:I

.field public mConnectRetry:Ljava/lang/String;

.field public mConnectRetryMax:Ljava/lang/String;

.field public mConnectRetryMaxTime:Ljava/lang/String;

.field public mConnections:[Lde/blinkt/openvpn/core/Connection;

.field public mCreationDate:J

.field public mCrlFilename:Ljava/lang/String;

.field public mCustomConfig:Ljava/lang/String;

.field public mCustomConfigOptions:Ljava/lang/String;

.field public mCustomRoutes:Ljava/lang/String;

.field public mCustomRoutesv6:Ljava/lang/String;

.field public mDNS1:Ljava/lang/String;

.field public mDNS2:Ljava/lang/String;

.field public mDataCiphers:Ljava/lang/String;

.field public mExcludedRoutes:Ljava/lang/String;

.field public mExcludedRoutesv6:Ljava/lang/String;

.field public mExpectTLSCert:Z

.field public mExternalAuthenticator:Ljava/lang/String;

.field public mIPv4Address:Ljava/lang/String;

.field public mIPv6Address:Ljava/lang/String;

.field public mKeyPassword:Ljava/lang/String;

.field public mLastUsed:J

.field public mMssFix:I

.field public mName:Ljava/lang/String;

.field public mNobind:Z

.field public mOverrideDNS:Z

.field public mPKCS12Filename:Ljava/lang/String;

.field public mPKCS12Password:Ljava/lang/String;

.field public mPassword:Ljava/lang/String;

.field public mPeerFingerPrints:Ljava/lang/String;

.field public mPersistTun:Z

.field public mPqcKEMs:Ljava/lang/String;

.field public mPqcTlsCipher:Ljava/lang/String;

.field private transient mPrivateKey:Ljava/security/PrivateKey;

.field public mProfileCreator:Ljava/lang/String;

.field private mProfileVersion:I

.field public mPushPeerInfo:Z

.field public mRemoteCN:Ljava/lang/String;

.field public mRemoteRandom:Z

.field public mRoutenopull:Z

.field public mSearchDomain:Ljava/lang/String;

.field public mServerName:Ljava/lang/String;

.field public mServerPort:Ljava/lang/String;

.field public mTLSAuthDirection:Ljava/lang/String;

.field public mTLSAuthFilename:Ljava/lang/String;

.field public mTemporaryProfile:Z

.field public mTlSCertProfile:Ljava/lang/String;

.field public mTunMtu:I

.field public mUseCustomConfig:Z

.field public mUseDefaultRoute:Z

.field public mUseDefaultRoutev6:Z

.field public mUseFloat:Z

.field public mUseLegacyProvider:Z

.field public mUseLzo:Z

.field public mUsePull:Z

.field public mUseRandomHostname:Z

.field public mUseTLSAuth:Z

.field public mUserEditable:Z

.field public mUsername:Ljava/lang/String;

.field private mUuid:Ljava/util/UUID;

.field public mVerb:Ljava/lang/String;

.field public mVersion:I

.field public mX509AuthType:I

.field public mx509UsernameField:Ljava/lang/String;

.field public transient profileDeleted:Z


# direct methods
.method public static synthetic $r8$lambda$NCVEShfitUJD-q1zmmfECWhVKzs(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/VpnProfile;->lambda$checkForRestart$0(Landroid/content/Context;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 114
    const-string v0, "9.9.9.9"

    sput-object v0, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS1:Ljava/lang/String;

    .line 115
    const-string v0, "2620:fe::fe"

    sput-object v0, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS2:Ljava/lang/String;

    .line 814
    new-instance v0, Lde/blinkt/openvpn/core/VpnProfile$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/VpnProfile$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnProfile;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    .line 75
    const-string v1, "48.209.35.108"

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    .line 76
    const-string v1, "1194"

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerPort:Ljava/lang/String;

    .line 77
    const/4 v1, 0x0

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfig:Ljava/lang/String;

    .line 117
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->profileDeleted:Z

    .line 119
    const/4 v2, 0x2

    iput v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 123
    const-string v2, ""

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 127
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLzo:Z

    .line 130
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 131
    sget-object v3, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS1:Ljava/lang/String;

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    .line 132
    sget-object v3, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS2:Ljava/lang/String;

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    .line 135
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    .line 136
    const-string v3, "blinkt.de"

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    .line 137
    const/4 v3, 0x1

    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    .line 138
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    .line 140
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 141
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    .line 142
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 143
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    .line 144
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 145
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRoutenopull:Z

    .line 146
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseRandomHostname:Z

    .line 147
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseFloat:Z

    .line 148
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    .line 149
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 150
    const-string v4, "1"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVerb:Ljava/lang/String;

    .line 151
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    .line 152
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    .line 153
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    .line 154
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutesv6:Ljava/lang/String;

    .line 155
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    .line 156
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    .line 157
    const-string v4, "-1"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMax:Ljava/lang/String;

    .line 158
    const-string v4, "2"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetry:Ljava/lang/String;

    .line 159
    const-string v4, "300"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMaxTime:Ljava/lang/String;

    .line 160
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUserEditable:Z

    .line 161
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuth:Ljava/lang/String;

    .line 162
    const/4 v4, 0x3

    iput v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    .line 163
    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mx509UsernameField:Ljava/lang/String;

    .line 167
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    .line 169
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteRandom:Z

    .line 170
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 171
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpnAreDisallowed:Z

    .line 172
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowAppVpnBypass:Z

    .line 176
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    .line 178
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPushPeerInfo:Z

    .line 181
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    .line 182
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    .line 183
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mBlockUnusedAddressFamilies:Z

    .line 184
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    .line 185
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    .line 186
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCompatMode:I

    .line 187
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 188
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    .line 189
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    .line 190
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 191
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 193
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    .line 226
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    .line 227
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerPort:Ljava/lang/String;

    .line 228
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfig:Ljava/lang/String;

    .line 229
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    .line 230
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 231
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    .line 232
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    .line 233
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientCertFilename:Ljava/lang/String;

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 235
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthFilename:Ljava/lang/String;

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    .line 238
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLzo:Z

    .line 239
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Filename:Ljava/lang/String;

    .line 240
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Password:Ljava/lang/String;

    .line 241
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v0

    :goto_1
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 242
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    .line 243
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    .line 244
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    .line 245
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    .line 246
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_2

    move v1, v3

    goto :goto_2

    :cond_2
    move v1, v0

    :goto_2
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    .line 247
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    .line 248
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_3

    move v1, v3

    goto :goto_3

    :cond_3
    move v1, v0

    :goto_3
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    .line 249
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_4

    move v1, v3

    goto :goto_4

    :cond_4
    move v1, v0

    :goto_4
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    .line 250
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutes:Ljava/lang/String;

    .line 251
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_5

    move v1, v3

    goto :goto_5

    :cond_5
    move v1, v0

    :goto_5
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 252
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_6

    move v1, v3

    goto :goto_6

    :cond_6
    move v1, v0

    :goto_6
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    .line 253
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 254
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    .line 255
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 256
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_7

    move v1, v3

    goto :goto_7

    :cond_7
    move v1, v0

    :goto_7
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRoutenopull:Z

    .line 257
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_8

    move v1, v3

    goto :goto_8

    :cond_8
    move v1, v0

    :goto_8
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseRandomHostname:Z

    .line 258
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_9

    move v1, v3

    goto :goto_9

    :cond_9
    move v1, v0

    :goto_9
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseFloat:Z

    .line 259
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_a

    move v1, v3

    goto :goto_a

    :cond_a
    move v1, v0

    :goto_a
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    .line 260
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 261
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVerb:Ljava/lang/String;

    .line 262
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    .line 263
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_b

    move v1, v3

    goto :goto_b

    :cond_b
    move v1, v0

    :goto_b
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    .line 264
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_c

    move v1, v3

    goto :goto_c

    :cond_c
    move v1, v0

    :goto_c
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    .line 265
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutesv6:Ljava/lang/String;

    .line 266
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    .line 267
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_d

    move v1, v3

    goto :goto_d

    :cond_d
    move v1, v0

    :goto_d
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    .line 268
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMax:Ljava/lang/String;

    .line 269
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetry:Ljava/lang/String;

    .line 270
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMaxTime:Ljava/lang/String;

    .line 271
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_e

    move v1, v3

    goto :goto_e

    :cond_e
    move v1, v0

    :goto_e
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUserEditable:Z

    .line 272
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuth:Ljava/lang/String;

    .line 273
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    .line 274
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mx509UsernameField:Ljava/lang/String;

    .line 275
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_f

    move v1, v3

    goto :goto_f

    :cond_f
    move v1, v0

    :goto_f
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    .line 276
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExcludedRoutes:Ljava/lang/String;

    .line 277
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExcludedRoutesv6:Ljava/lang/String;

    .line 278
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    .line 279
    sget-object v1, Lde/blinkt/openvpn/core/Connection;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lde/blinkt/openvpn/core/Connection;

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 280
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_10

    move v1, v3

    goto :goto_10

    :cond_10
    move v1, v0

    :goto_10
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteRandom:Z

    .line 281
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/HashSet;

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 282
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_11

    move v1, v3

    goto :goto_11

    :cond_11
    move v1, v0

    :goto_11
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpnAreDisallowed:Z

    .line 283
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_12

    move v1, v3

    goto :goto_12

    :cond_12
    move v1, v0

    :goto_12
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowAppVpnBypass:Z

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCrlFilename:Ljava/lang/String;

    .line 285
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileCreator:Ljava/lang/String;

    .line 286
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExternalAuthenticator:Ljava/lang/String;

    .line 287
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    .line 288
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I

    .line 289
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_13

    move v1, v3

    goto :goto_13

    :cond_13
    move v1, v0

    :goto_13
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPushPeerInfo:Z

    .line 290
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mLastUsed:J

    .line 291
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->importedProfileHash:Ljava/lang/String;

    .line 292
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_14

    move v1, v3

    goto :goto_14

    :cond_14
    move v1, v0

    :goto_14
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    .line 293
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    .line 294
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_15

    move v1, v3

    goto :goto_15

    :cond_15
    move v1, v0

    :goto_15
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mBlockUnusedAddressFamilies:Z

    .line 295
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_16

    move v1, v3

    goto :goto_16

    :cond_16
    move v1, v0

    :goto_16
    iput-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    .line 296
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    .line 297
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCompatMode:I

    .line 298
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_17

    move v0, v3

    :cond_17
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 299
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    .line 300
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    .line 301
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 302
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 303
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    .line 304
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    .line 75
    const-string v1, "48.209.35.108"

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    .line 76
    const-string v1, "1194"

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerPort:Ljava/lang/String;

    .line 77
    const/4 v1, 0x0

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfig:Ljava/lang/String;

    .line 117
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->profileDeleted:Z

    .line 119
    const/4 v2, 0x2

    iput v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 123
    const-string v2, ""

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 127
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLzo:Z

    .line 130
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 131
    sget-object v3, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS1:Ljava/lang/String;

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    .line 132
    sget-object v3, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS2:Ljava/lang/String;

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    .line 135
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    .line 136
    const-string v3, "blinkt.de"

    iput-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    .line 137
    const/4 v3, 0x1

    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    .line 138
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    .line 140
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 141
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    .line 142
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 143
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    .line 144
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 145
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRoutenopull:Z

    .line 146
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseRandomHostname:Z

    .line 147
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseFloat:Z

    .line 148
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    .line 149
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 150
    const-string v4, "1"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVerb:Ljava/lang/String;

    .line 151
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    .line 152
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    .line 153
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    .line 154
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutesv6:Ljava/lang/String;

    .line 155
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    .line 156
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    .line 157
    const-string v4, "-1"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMax:Ljava/lang/String;

    .line 158
    const-string v4, "2"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetry:Ljava/lang/String;

    .line 159
    const-string v4, "300"

    iput-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMaxTime:Ljava/lang/String;

    .line 160
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUserEditable:Z

    .line 161
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuth:Ljava/lang/String;

    .line 162
    const/4 v4, 0x3

    iput v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    .line 163
    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mx509UsernameField:Ljava/lang/String;

    .line 167
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    .line 169
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteRandom:Z

    .line 170
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 171
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpnAreDisallowed:Z

    .line 172
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowAppVpnBypass:Z

    .line 176
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    .line 178
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPushPeerInfo:Z

    .line 181
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    .line 182
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    .line 183
    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mBlockUnusedAddressFamilies:Z

    .line 184
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    .line 185
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    .line 186
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCompatMode:I

    .line 187
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 188
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    .line 189
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    .line 190
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 191
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 193
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 211
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    .line 212
    iput-object p1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    .line 213
    const/16 v1, 0xb

    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    .line 214
    new-array v1, v3, [Lde/blinkt/openvpn/core/Connection;

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 215
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    new-instance v3, Lde/blinkt/openvpn/core/Connection;

    invoke-direct {v3}, Lde/blinkt/openvpn/core/Connection;-><init>()V

    aput-object v3, v1, v0

    .line 216
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mLastUsed:J

    .line 217
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    .line 218
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 219
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 220
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 221
    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 222
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    .line 223
    return-void
.end method

.method private cidrToIPAndNetmask(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "route"    # Ljava/lang/String;

    .line 535
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 536
    :cond_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 537
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x2

    if-le v2, v3, :cond_1

    return-object v1

    .line 538
    :cond_1
    const/4 v2, 0x0

    aget-object v2, v0, v2

    .line 540
    .local v2, "ip":Ljava/lang/String;
    :try_start_0
    array-length v4, v0

    const/16 v5, 0x20

    if-ne v4, v3, :cond_2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    :cond_2
    move v3, v5

    .line 541
    .local v3, "len":I
    :goto_0
    if-ltz v3, :cond_4

    if-le v3, v5, :cond_3

    goto :goto_1

    .line 542
    :cond_3
    rsub-int/lit8 v4, v3, 0x20

    const-wide/16 v5, -0x1

    shl-long v4, v5, v4

    .line 543
    .local v4, "nm":J
    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "%d.%d.%d.%d"

    const/16 v8, 0x18

    shr-long v8, v4, v8

    const-wide/16 v10, 0xff

    and-long/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/16 v9, 0x10

    shr-long v12, v4, v9

    and-long/2addr v12, v10

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const/16 v12, 0x8

    shr-long v12, v4, v12

    and-long/2addr v12, v10

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    and-long/2addr v10, v4

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    filled-new-array {v8, v9, v12, v10}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 544
    .local v6, "netmask":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 541
    .end local v4    # "nm":J
    .end local v6    # "netmask":Ljava/lang/String;
    :cond_4
    :goto_1
    return-object v1

    .line 545
    .end local v3    # "len":I
    :catch_0
    move-exception v3

    .line 546
    .local v3, "e":Ljava/lang/NumberFormatException;
    return-object v1
.end method

.method public static doUseOpenVPN3(Landroid/content/Context;)Z
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .line 319
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 320
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "ovpn3"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    return v2
.end method

.method private getCustomRoutes(Ljava/lang/String;)Ljava/util/Collection;
    .locals 6
    .param p1, "routes"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 514
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 515
    .local v0, "cidrRoutes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    return-object v0

    .line 516
    :cond_0
    const-string v1, "[\n \t]"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 517
    .local v4, "route":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 518
    invoke-direct {p0, v4}, Lde/blinkt/openvpn/core/VpnProfile;->cidrToIPAndNetmask(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 519
    .local v5, "cidrroute":Ljava/lang/String;
    if-eqz v5, :cond_1

    invoke-virtual {v0, v5}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 516
    .end local v4    # "route":Ljava/lang/String;
    .end local v5    # "cidrroute":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 522
    :cond_2
    return-object v0
.end method

.method private getCustomRoutesv6(Ljava/lang/String;)Ljava/util/Collection;
    .locals 6
    .param p1, "routes"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 526
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 527
    .local v0, "cidrRoutes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    return-object v0

    .line 528
    :cond_0
    const-string v1, "[\n \t]"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 529
    .local v4, "route":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v0, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 528
    .end local v4    # "route":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 531
    :cond_2
    return-object v0
.end method

.method public static getDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "embeddedFile"    # Ljava/lang/String;

    .line 335
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "[[NAME]]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 336
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 337
    .local v0, "start":I
    const-string v1, "[[INLINE]]"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 338
    .local v1, "end":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    if-gt v1, v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_2
    :goto_0
    const-string v2, "file_error"

    :goto_1
    return-object v2

    .line 335
    .end local v0    # "start":I
    .end local v1    # "end":I
    :cond_3
    :goto_2
    const-string v0, "file"

    return-object v0
.end method

.method public static getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "data"    # Ljava/lang/String;

    .line 342
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 343
    :cond_0
    const-string v0, "[[INLINE]]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 344
    .local v1, "start":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 345
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public static getVersionEnvString(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "c"    # Landroid/content/Context;

    .line 354
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 355
    .local v0, "packageinfo":Landroid/content/pm/PackageInfo;
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s %s"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 356
    .end local v0    # "packageinfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 357
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "getVersionEnvString"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 358
    const-string v1, "unknown"

    return-object v1
.end method

.method public static insertFileData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "cfgentry"    # Ljava/lang/String;
    .param p1, "filedata"    # Ljava/lang/String;

    .line 324
    if-nez p1, :cond_0

    .line 325
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "# %s is not set in profile\n"

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 326
    :cond_0
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 327
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "dataWithOutHeader":Ljava/lang/String;
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "<%s>\n%s\n</%s>\n"

    filled-new-array {p0, v0, p0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 330
    .end local v0    # "dataWithOutHeader":Ljava/lang/String;
    :cond_1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->openVpnEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s %s\n"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isEmbedded(Ljava/lang/String;)Z
    .locals 1
    .param p0, "data"    # Ljava/lang/String;

    .line 349
    if-eqz p0, :cond_1

    const-string v0, "[[INLINE]]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "[[NAME]]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isStaticKey()Z
    .locals 2

    .line 698
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private synthetic lambda$checkForRestart$0(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 562
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/VpnProfile;->getExternalCertificates(Landroid/content/Context;)[Ljava/lang/String;

    return-void
.end method

.method private moveOptionsToConnection()V
    .locals 4

    .line 448
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v0, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    aget-object v0, v0, v1

    if-nez v0, :cond_1

    .line 449
    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [Lde/blinkt/openvpn/core/Connection;

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 450
    new-instance v2, Lde/blinkt/openvpn/core/Connection;

    invoke-direct {v2}, Lde/blinkt/openvpn/core/Connection;-><init>()V

    .line 451
    .local v2, "conn":Lde/blinkt/openvpn/core/Connection;
    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    iput-object v3, v2, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    .line 452
    const-string v3, "1194"

    iput-object v3, v2, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 453
    iput-boolean v0, v2, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 454
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    aput-object v2, v0, v1

    .line 456
    .end local v2    # "conn":Lde/blinkt/openvpn/core/Connection;
    :cond_1
    return-void
.end method

.method public static openVpnEscape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "unescaped"    # Ljava/lang/String;

    .line 307
    if-nez p0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 308
    :cond_0
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 309
    const-string v1, "\""

    const-string v2, "\\\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 310
    const-string v1, "\n"

    const-string v2, "\\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "escapedString":Ljava/lang/String;
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, ".*[\\s#;\'].*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 312
    return-object p0

    .line 314
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private useTLSClient()Z
    .locals 2

    .line 711
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public addChangeLogEntry(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .line 459
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 460
    :cond_0
    :goto_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/16 v1, 0x32

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->removeElementAt(I)V

    goto :goto_0

    .line 461
    :cond_1
    new-instance v0, Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;-><init>()V

    .line 462
    .local v0, "cle":Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;->time:J

    .line 463
    iput-object p1, v0, Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;->message:Ljava/lang/String;

    .line 464
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 465
    return-void
.end method

.method public addProfileToBuilder(Landroid/net/VpnService$Builder;Landroid/content/Context;)V
    .locals 8
    .param p1, "builder"    # Landroid/net/VpnService$Builder;
    .param p2, "context"    # Landroid/content/Context;

    .line 827
    const-string v0, "Configuring VpnService.Builder from profile."

    const-string v1, "PQC_VPN_Profile"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 830
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/VpnService$Builder;->setSession(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    .line 833
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I

    if-lez v0, :cond_0

    .line 834
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I

    invoke-virtual {p1, v0}, Landroid/net/VpnService$Builder;->setMtu(I)Landroid/net/VpnService$Builder;

    .line 835
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting MTU: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_0
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    if-eqz v0, :cond_3

    .line 840
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v2, "Adding DNS Server: "

    const-string v3, "Failed to add DNS server: "

    if-nez v0, :cond_1

    .line 842
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/VpnService$Builder;->addDnsServer(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    .line 843
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 846
    goto :goto_0

    .line 844
    :catch_0
    move-exception v0

    .line 845
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 848
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_1
    :goto_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 850
    :try_start_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/VpnService$Builder;->addDnsServer(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    .line 851
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 854
    goto :goto_1

    .line 852
    :catch_1
    move-exception v0

    .line 853
    .restart local v0    # "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 856
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2
    :goto_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 857
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/net/VpnService$Builder;->addSearchDomain(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    .line 858
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding DNS Search Domain: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 863
    :cond_3
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x2

    const-string v4, "/"

    const/4 v5, 0x0

    if-nez v0, :cond_5

    .line 865
    :try_start_2
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 866
    .local v0, "parts":[Ljava/lang/String;
    array-length v6, v0

    if-ne v6, v3, :cond_4

    .line 867
    aget-object v6, v0, v5

    aget-object v7, v0, v2

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {p1, v6, v7}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    .line 868
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Setting IPv4 Address: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 872
    .end local v0    # "parts":[Ljava/lang/String;
    :cond_4
    goto :goto_2

    .line 870
    :catch_2
    move-exception v0

    .line 871
    .local v0, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to set IPv4 address: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 875
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    :goto_2
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    if-eqz v0, :cond_6

    .line 876
    const-string v0, "0.0.0.0"

    invoke-virtual {p1, v0, v5}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    .line 877
    const-string v0, "Adding default IPv4 route."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 881
    :cond_6
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 883
    :try_start_3
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 884
    .local v0, "parts":[Ljava/lang/String;
    array-length v4, v0

    if-ne v4, v3, :cond_7

    .line 885
    aget-object v3, v0, v5

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v3, v2}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    .line 886
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting IPv6 Address: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 890
    .end local v0    # "parts":[Ljava/lang/String;
    :cond_7
    goto :goto_3

    .line 888
    :catch_3
    move-exception v0

    .line 889
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to set IPv6 address: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 893
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_8
    :goto_3
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    if-eqz v0, :cond_9

    .line 894
    const-string v0, "::"

    invoke-virtual {p1, v0, v5}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    .line 895
    const-string v0, "Adding default IPv6 route."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 897
    :cond_9
    return-void
.end method

.method public checkForRestart(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 560
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPrivateKey:Ljava/security/PrivateKey;

    if-nez v0, :cond_1

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    .line 561
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 562
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lde/blinkt/openvpn/core/VpnProfile$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lde/blinkt/openvpn/core/VpnProfile$$ExternalSyntheticLambda0;-><init>(Lde/blinkt/openvpn/core/VpnProfile;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 564
    :cond_1
    return-void
.end method

.method public checkProfile(Landroid/content/Context;)I
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 618
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->doUseOpenVPN3(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lde/blinkt/openvpn/core/VpnProfile;->checkProfile(Landroid/content/Context;Z)I

    move-result v0

    return v0
.end method

.method public checkProfile(Landroid/content/Context;Z)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "useOpenVPN3"    # Z

    .line 622
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 623
    const v0, 0x7f1101f7

    return v0

    .line 624
    :cond_1
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    if-eqz v0, :cond_2

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    :cond_2
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    if-nez v0, :cond_3

    .line 625
    const v0, 0x7f1101f1

    return v0

    .line 626
    :cond_3
    const v0, 0x7f1101f5

    return v0
.end method

.method public clearDefaults()V
    .locals 1

    .line 416
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    .line 417
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    .line 418
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    .line 419
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    .line 420
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 421
    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    .line 422
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    .line 423
    iput v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    .line 424
    const-string v0, ""

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 425
    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 426
    return-void
.end method

.method public clone()Lde/blinkt/openvpn/core/VpnProfile;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 391
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/VpnProfile;

    .line 392
    .local v0, "copy":Lde/blinkt/openvpn/core/VpnProfile;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    .line 393
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    if-eqz v1, :cond_1

    .line 394
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v1, v1

    new-array v1, v1, [Lde/blinkt/openvpn/core/Connection;

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 395
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 396
    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    iget-object v2, v0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lde/blinkt/openvpn/core/Connection;->clone()Lde/blinkt/openvpn/core/Connection;

    move-result-object v3

    aput-object v3, v2, v1

    .line 395
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 399
    .end local v1    # "i":I
    :cond_1
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    if-eqz v1, :cond_2

    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 400
    :cond_2
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    if-eqz v1, :cond_3

    new-instance v1, Ljava/util/Vector;

    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 401
    :cond_3
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 402
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 403
    const/4 v1, 0x0

    iput-object v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mPrivateKey:Ljava/security/PrivateKey;

    .line 404
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mLastUsed:J

    .line 405
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->clone()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    return-object v0
.end method

.method public copy(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 409
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->clone()Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    .line 410
    .local v0, "copy":Lde/blinkt/openvpn/core/VpnProfile;
    iput-object p1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    .line 411
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    .line 412
    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .line 728
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 364
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 365
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 366
    :cond_1
    move-object v0, p1

    check-cast v0, Lde/blinkt/openvpn/core/VpnProfile;

    .line 367
    .local v0, "that":Lde/blinkt/openvpn/core/VpnProfile;
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    iget-object v2, v0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 365
    .end local v0    # "that":Lde/blinkt/openvpn/core/VpnProfile;
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public getConfigFile(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "configForOvpn3"    # Z

    .line 469
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    return-object v0
.end method

.method public getExternalCertificates(Landroid/content/Context;)[Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 571
    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Lde/blinkt/openvpn/core/VpnProfile;->getExternalCertificates(Landroid/content/Context;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized getExternalCertificates(Landroid/content/Context;I)[Ljava/lang/String;
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tries"    # I

    monitor-enter p0

    .line 575
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-object v1, v0

    .line 578
    .local v1, "appContext":Landroid/content/Context;
    const/4 v2, 0x0

    :try_start_1
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/16 v3, 0x8

    if-eq v0, v3, :cond_5

    .line 581
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 583
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/security/KeyChain;->getPrivateKey(Landroid/content/Context;Ljava/lang/String;)Ljava/security/PrivateKey;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPrivateKey:Ljava/security/PrivateKey;

    .line 584
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPrivateKey:Ljava/security/PrivateKey;

    if-eqz v0, :cond_3

    .line 586
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/security/KeyChain;->getCertificateChain(Landroid/content/Context;Ljava/lang/String;)[Ljava/security/cert/X509Certificate;

    move-result-object v0

    move-object v3, v0

    .line 589
    .local v3, "certChain":[Ljava/security/cert/X509Certificate;
    if-eqz v3, :cond_2

    array-length v0, v3

    if-eqz v0, :cond_2

    .line 592
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    move-object v4, v0

    .line 593
    .local v4, "userCertSw":Ljava/io/StringWriter;
    new-instance v0, Lorg/spongycastle/util/io/pem/PemWriter;

    invoke-direct {v0, v4}, Lorg/spongycastle/util/io/pem/PemWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    move-object v5, v0

    .line 594
    .local v5, "userPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    :try_start_2
    new-instance v0, Lorg/spongycastle/util/io/pem/PemObject;

    const-string v6, "CERTIFICATE"

    const/4 v7, 0x0

    aget-object v8, v3, v7

    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v8

    invoke-direct {v0, v6, v8}, Lorg/spongycastle/util/io/pem/PemObject;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v5, v0}, Lorg/spongycastle/util/io/pem/PemWriter;->writeObject(Lorg/spongycastle/util/io/pem/PemObjectGenerator;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 595
    :try_start_3
    invoke-virtual {v5}, Lorg/spongycastle/util/io/pem/PemWriter;->close()V

    .line 596
    .end local v5    # "userPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    invoke-virtual {v4}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 598
    .local v5, "userCertPem":Ljava/lang/String;
    const/4 v6, 0x0

    .line 599
    .local v6, "intermediateCaPem":Ljava/lang/String;
    array-length v0, v3

    const/4 v8, 0x1

    if-le v0, v8, :cond_1

    .line 600
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    move-object v9, v0

    .line 601
    .local v9, "intermediateCaSw":Ljava/io/StringWriter;
    new-instance v0, Lorg/spongycastle/util/io/pem/PemWriter;

    invoke-direct {v0, v9}, Lorg/spongycastle/util/io/pem/PemWriter;-><init>(Ljava/io/Writer;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    move-object v10, v0

    .line 602
    .local v10, "intermediateCaPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    :try_start_4
    array-length v11, v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-ge v0, v11, :cond_0

    .line 603
    :try_start_5
    new-instance v11, Lorg/spongycastle/util/io/pem/PemObject;

    const-string v12, "CERTIFICATE"

    aget-object v13, v3, v0

    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/spongycastle/util/io/pem/PemObject;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v10, v11}, Lorg/spongycastle/util/io/pem/PemWriter;->writeObject(Lorg/spongycastle/util/io/pem/PemObjectGenerator;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 602
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 601
    .end local v0    # "i":I
    :catchall_0
    move-exception v0

    move-object v7, v0

    goto :goto_1

    .line 605
    :cond_0
    :try_start_6
    invoke-virtual {v10}, Lorg/spongycastle/util/io/pem/PemWriter;->close()V

    .line 606
    .end local v10    # "intermediateCaPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    invoke-virtual {v9}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    move-object v6, v0

    goto :goto_3

    .line 601
    .end local p0    # "this":Lde/blinkt/openvpn/core/VpnProfile;
    .restart local v10    # "intermediateCaPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    :catchall_1
    move-exception v0

    move-object v7, v0

    :goto_1
    :try_start_7
    invoke-virtual {v10}, Lorg/spongycastle/util/io/pem/PemWriter;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    :try_start_8
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    :goto_2
    throw v7

    .line 609
    .end local v9    # "intermediateCaSw":Ljava/io/StringWriter;
    .end local v10    # "intermediateCaPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :cond_1
    :goto_3
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    aput-object v6, v0, v7

    aput-object v2, v0, v8

    const/4 v7, 0x2

    aput-object v5, v0, v7
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    monitor-exit p0

    return-object v0

    .line 593
    .end local v6    # "intermediateCaPem":Ljava/lang/String;
    .local v5, "userPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    :catchall_3
    move-exception v0

    move-object v6, v0

    :try_start_9
    invoke-virtual {v5}, Lorg/spongycastle/util/io/pem/PemWriter;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    goto :goto_4

    :catchall_4
    move-exception v0

    :try_start_a
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    :goto_4
    throw v6

    .line 590
    .end local v4    # "userCertSw":Ljava/io/StringWriter;
    .end local v5    # "userPemWriter":Lorg/spongycastle/util/io/pem/PemWriter;
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :cond_2
    new-instance v0, Lde/blinkt/openvpn/core/VpnProfile$NoCertReturnedException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No certificate chain returned for alias: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lde/blinkt/openvpn/core/VpnProfile$NoCertReturnedException;-><init>(Ljava/lang/String;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    throw v0

    .line 585
    .end local v3    # "certChain":[Ljava/security/cert/X509Certificate;
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :cond_3
    new-instance v0, Landroid/security/KeyChainException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to retrieve private key for alias: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/security/KeyChainException;-><init>(Ljava/lang/String;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    throw v0

    .line 582
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :cond_4
    new-instance v0, Landroid/security/KeyChainException;

    const-string v3, "Certificate alias not specified for KeyStore."

    invoke-direct {v0, v3}, Landroid/security/KeyChainException;-><init>(Ljava/lang/String;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    throw v0

    .line 579
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :cond_5
    new-instance v0, Landroid/security/KeyChainException;

    const-string v3, "External App authentication is not supported in this version."

    invoke-direct {v0, v3}, Landroid/security/KeyChainException;-><init>(Ljava/lang/String;)V

    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    throw v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 610
    .restart local v1    # "appContext":Landroid/content/Context;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "tries":I
    :catch_0
    move-exception v0

    .line 611
    .local v0, "e":Ljava/lang/Exception;
    :try_start_b
    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f110164

    invoke-static {v4, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(I[Ljava/lang/Object;)V

    .line 612
    const-string v3, "PQC_VPN_Profile"

    const-string v4, "Error getting external certificates"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 613
    monitor-exit p0

    return-object v2

    .line 574
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "appContext":Landroid/content/Context;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "tries":I
    :catchall_5
    move-exception v0

    move-object p1, v0

    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    throw p1
.end method

.method public getKeystoreKey()Ljava/security/PrivateKey;
    .locals 1

    .line 689
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPrivateKey:Ljava/security/PrivateKey;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 376
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    const-string v0, "Unnamed Profile"

    return-object v0

    .line 379
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPasswordAuth()Ljava/lang/String;
    .locals 2

    .line 684
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lde/blinkt/openvpn/core/PasswordCache;->getAuthPassword(Ljava/util/UUID;Z)Ljava/lang/String;

    move-result-object v0

    .line 685
    .local v0, "cachedPw":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    :goto_0
    return-object v1
.end method

.method public getPasswordPrivateKey()Ljava/lang/String;
    .locals 2

    .line 630
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lde/blinkt/openvpn/core/PasswordCache;->getPKCS12orCertificatePassword(Ljava/util/UUID;Z)Ljava/lang/String;

    move-result-object v0

    .line 631
    .local v0, "cachedPw":Ljava/lang/String;
    if-eqz v0, :cond_0

    return-object v0

    .line 632
    :cond_0
    iget v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    packed-switch v1, :pswitch_data_0

    .line 635
    :pswitch_0
    const/4 v1, 0x0

    return-object v1

    .line 633
    :pswitch_1
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Password:Ljava/lang/String;

    return-object v1

    .line 634
    :pswitch_2
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public getPlatformVersionEnvString()Ljava/lang/String;
    .locals 8

    .line 508
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 509
    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->getNativeAPI()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sget-object v6, Landroid/os/Build;->BOARD:Ljava/lang/String;

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    move-result-object v1

    .line 508
    const-string v2, "%d %s %s %s %s %s"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPqcKEMs()Ljava/lang/String;
    .locals 1

    .line 701
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getPqcTlsCipher()Ljava/lang/String;
    .locals 1

    .line 703
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getSignedData(Landroid/content/Context;Ljava/lang/String;Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "b64data"    # Ljava/lang/String;
    .param p3, "padding"    # Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;
    .param p4, "saltlen"    # Ljava/lang/String;
    .param p5, "hashalg"    # Ljava/lang/String;
    .param p6, "needDigest"    # Z

    .line 694
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStartServiceIntent(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "startReason"    # Ljava/lang/String;
    .param p3, "replace_running_vpn"    # Z

    .line 551
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 552
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "de.blinkt.openvpn.profileUUID"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 553
    const-string v1, "de.blinkt.openvpn.profileVersion"

    iget v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 554
    if-eqz p2, :cond_0

    const-string v1, "de.blinkt.openvpn.startReason"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 555
    :cond_0
    if-nez p3, :cond_1

    const-string v1, "de.blinkt.openvpn.DO_NOT_REPLACE_RUNNING_VPN"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 556
    :cond_1
    return-object v0
.end method

.method public getUUID()Ljava/util/UUID;
    .locals 1

    .line 197
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    return-object v0
.end method

.method public getUUIDString()Ljava/lang/String;
    .locals 2

    .line 721
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 372
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    return v0
.end method

.method public isUserPWAuth()Z
    .locals 1

    .line 640
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    packed-switch v0, :pswitch_data_0

    .line 645
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 643
    :pswitch_1
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public needUserPWInput(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "transientCertOrPkcs12PW"    # Ljava/lang/String;
    .param p2, "transientAuthPW"    # Ljava/lang/String;

    .line 669
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Password:Ljava/lang/String;

    .line 670
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 671
    const v0, 0x7f11022a

    return v0

    .line 673
    :cond_1
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    if-eqz v0, :cond_2

    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    .line 674
    :cond_2
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->requireTLSKeyPassword()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 675
    const v0, 0x7f11022f

    return v0

    .line 677
    :cond_3
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->isUserPWAuth()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->getPasswordAuth()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 678
    const v0, 0x7f11021a

    return v0

    .line 680
    :cond_4
    const/4 v0, 0x0

    return v0
.end method

.method public pwDidFail(Landroid/content/Context;)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;

    .line 567
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "A password attempt failed for profile: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PQC_VPN_Profile"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    return-void
.end method

.method public requireTLSKeyPassword()Z
    .locals 8

    .line 650
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 651
    :cond_0
    const-string v0, ""

    .line 652
    .local v0, "keyFileContent":Ljava/lang/String;
    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 653
    iget-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnProfile;->getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 655
    :cond_1
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    .local v2, "fr":Ljava/io/FileReader;
    const/16 v3, 0x800

    :try_start_1
    new-array v3, v3, [C

    .line 658
    .local v3, "buf":[C
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 659
    .local v4, "sw":Ljava/io/StringWriter;
    :goto_0
    invoke-virtual {v2, v3}, Ljava/io/FileReader;->read([C)I

    move-result v5

    move v6, v5

    .local v6, "len":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_2

    invoke-virtual {v4, v3, v1, v6}, Ljava/io/StringWriter;->write([CII)V

    goto :goto_0

    .line 660
    :cond_2
    invoke-virtual {v4}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v5

    .line 661
    .end local v3    # "buf":[C
    .end local v4    # "sw":Ljava/io/StringWriter;
    .end local v6    # "len":I
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 663
    .end local v2    # "fr":Ljava/io/FileReader;
    nop

    .line 665
    :goto_1
    const-string v2, "Proc-Type: 4,ENCRYPTED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "-----BEGIN ENCRYPTED PRIVATE KEY-----"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1

    .line 655
    .restart local v2    # "fr":Ljava/io/FileReader;
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v4

    :try_start_4
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "keyFileContent":Ljava/lang/String;
    :goto_2
    throw v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 661
    .end local v2    # "fr":Ljava/io/FileReader;
    .restart local v0    # "keyFileContent":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 662
    .local v2, "e":Ljava/io/IOException;
    return v1
.end method

.method public setPqcKEMs(Ljava/lang/String;)V
    .locals 1
    .param p1, "pqcKEMs"    # Ljava/lang/String;

    .line 702
    iput-object p1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    const-string v0, "PQC KEMs changed"

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/VpnProfile;->addChangeLogEntry(Ljava/lang/String;)V

    return-void
.end method

.method public setPqcTlsCipher(Ljava/lang/String;)V
    .locals 1
    .param p1, "pqcTlsCipher"    # Ljava/lang/String;

    .line 704
    iput-object p1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    const-string v0, "PQC TLS Cipher changed"

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/VpnProfile;->addChangeLogEntry(Ljava/lang/String;)V

    return-void
.end method

.method public setUUID(Ljava/util/UUID;)V
    .locals 0
    .param p1, "uuid"    # Ljava/util/UUID;

    .line 201
    iput-object p1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    .line 202
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 385
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public upgradeProfile()V
    .locals 7

    .line 429
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->changesLog:Ljava/util/Vector;

    .line 430
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    .line 431
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v0, v0

    if-nez v0, :cond_3

    :cond_2
    invoke-direct {p0}, Lde/blinkt/openvpn/core/VpnProfile;->moveOptionsToConnection()V

    .line 433
    :cond_3
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ge v0, v1, :cond_4

    iput-boolean v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    .line 434
    :cond_4
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/4 v1, 0x4

    const/4 v3, 0x1

    if-ge v0, v1, :cond_5

    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpnAreDisallowed:Z

    .line 435
    :cond_5
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/4 v1, 0x6

    if-ge v0, v1, :cond_6

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileCreator:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUserEditable:Z

    .line 436
    :cond_6
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/4 v1, 0x7

    if-ge v0, v1, :cond_8

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v1, v0

    move v4, v2

    :goto_0
    if-ge v4, v1, :cond_8

    aget-object v5, v0, v4

    .local v5, "c":Lde/blinkt/openvpn/core/Connection;
    if-eqz v5, :cond_7

    iget-object v6, v5, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    if-nez v6, :cond_7

    sget-object v6, Lde/blinkt/openvpn/core/Connection$ProxyType;->NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

    iput-object v6, v5, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .end local v5    # "c":Lde/blinkt/openvpn/core/Connection;
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 437
    :cond_8
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/16 v1, 0x8

    if-ge v0, v1, :cond_9

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowAppVpnBypass:Z

    if-eqz v0, :cond_9

    iput-boolean v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mBlockUnusedAddressFamilies:Z

    .line 438
    :cond_9
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/16 v1, 0x9

    if-ge v0, v1, :cond_a

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    const-string v1, "AES-(256|128)-GCM|CHACHA20-POLY1305"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    .line 439
    :cond_a
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_b

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BF-CBC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b

    iput-boolean v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 440
    :cond_b
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_d

    .line 441
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    const-string v2, ""

    if-nez v0, :cond_c

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 442
    :cond_c
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    if-nez v0, :cond_d

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    .line 444
    :cond_d
    iput v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    .line 445
    return-void
.end method

.method public writeConfigFileOutput(Landroid/content/Context;Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 473
    new-instance v0, Ljava/io/PrintWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p2, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 475
    .local v0, "pw":Ljava/io/PrintWriter;
    iget-boolean v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    const-string v2, "PQC_VPN_Profile"

    if-eqz v1, :cond_1

    .line 476
    const-string v1, "Writing custom config from mCustomConfigOptions to process stdin."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 480
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 483
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 484
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Dynamically adding PQC KEMs: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    iget-object v1, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v3, "tls-groups %s\n"

    invoke-virtual {v0, v3, v1}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 490
    :cond_0
    const-string v1, "Adding inline CA certificate."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    const-string v1, "ca"

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    invoke-static {v1, v3}, Lde/blinkt/openvpn/core/VpnProfile;->insertFileData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 493
    const-string v1, "Adding inline client certificate."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    const-string v1, "cert"

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientCertFilename:Ljava/lang/String;

    invoke-static {v1, v3}, Lde/blinkt/openvpn/core/VpnProfile;->insertFileData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 496
    const-string v1, "Adding inline client key."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    const-string v1, "key"

    iget-object v3, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-static {v1, v3}, Lde/blinkt/openvpn/core/VpnProfile;->insertFileData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 500
    :cond_1
    const-string v1, "Programmatic config generation not supported. mUseCustomConfig must be true."

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    const-string v1, "# Programmatic config generation not supported in this mode.\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 503
    :goto_0
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 504
    const-string v1, "Finished writing config to stdin."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 733
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 734
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 735
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mServerPort:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 736
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfig:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 737
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileVersion:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 738
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 739
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 740
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAlias:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 741
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientCertFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 742
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 743
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 744
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 745
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 746
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLzo:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 747
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Filename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 748
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Password:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 749
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 750
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 751
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 752
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 753
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mIPv6Address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 754
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 755
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 756
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 757
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 758
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutes:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 759
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 760
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 761
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 762
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 763
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 764
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRoutenopull:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 765
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseRandomHostname:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 766
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseFloat:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 767
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 768
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 769
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mVerb:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 770
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 771
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 772
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 773
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutesv6:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 774
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mKeyPassword:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 775
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 776
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMax:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 777
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetry:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 778
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMaxTime:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 779
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUserEditable:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 780
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuth:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 781
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 782
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mx509UsernameField:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 783
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 784
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExcludedRoutes:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 785
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExcludedRoutesv6:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 786
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 787
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeTypedArray([Landroid/os/Parcelable;I)V

    .line 788
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteRandom:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 789
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpn:Ljava/util/HashSet;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 790
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowedAppsVpnAreDisallowed:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 791
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAllowAppVpnBypass:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 792
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCrlFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 793
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mProfileCreator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 794
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mExternalAuthenticator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 795
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 796
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 797
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPushPeerInfo:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 798
    iget-wide v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mLastUsed:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 799
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->importedProfileHash:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 800
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 801
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 802
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mBlockUnusedAddressFamilies:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 803
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 804
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 805
    iget v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCompatMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 806
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 807
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 808
    iget-wide v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mCreationDate:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 809
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 810
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPqcTlsCipher:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 811
    iget-object v0, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUuid:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 812
    return-void
.end method
