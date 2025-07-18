.class public Lde/blinkt/openvpn/core/ProfileManager;
.super Ljava/lang/Object;
.source "ProfileManager.java"


# static fields
.field private static final LAST_CONNECTED_PROFILE:Ljava/lang/String; = "lastConnectedProfile"

.field private static final PREFS_NAME:Ljava/lang/String; = "VPNList"

.field private static final TEMPORARY_PROFILE_FILENAME:Ljava/lang/String; = "temporary-vpn-profile"

.field private static encryptionBroken:Z

.field private static instance:Lde/blinkt/openvpn/core/ProfileManager;

.field private static mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

.field private static tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;


# instance fields
.field private profiles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lde/blinkt/openvpn/core/VpnProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const/4 v0, 0x0

    sput-object v0, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    .line 37
    sput-object v0, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lde/blinkt/openvpn/core/ProfileManager;->encryptionBroken:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    .line 43
    return-void
.end method

.method private static declared-synchronized checkInstance(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    const-class v0, Lde/blinkt/openvpn/core/ProfileManager;

    monitor-enter v0

    .line 55
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    if-nez v1, :cond_0

    .line 56
    new-instance v1, Lde/blinkt/openvpn/core/ProfileManager;

    invoke-direct {v1}, Lde/blinkt/openvpn/core/ProfileManager;-><init>()V

    sput-object v1, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    .line 57
    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileEncryption;->initMasterCryptAlias(Landroid/content/Context;)V

    .line 58
    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/ProfileManager;->loadVPNList(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :cond_0
    monitor-exit v0

    return-void

    .line 54
    .end local p0    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "profileUUID"    # Ljava/lang/String;

    .line 188
    const/4 v0, 0x0

    const/16 v1, 0xa

    invoke-static {p0, p1, v0, v1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Landroid/content/Context;Ljava/lang/String;II)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    return-object v0
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;II)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "profileUUID"    # Ljava/lang/String;
    .param p2, "version"    # I
    .param p3, "tries"    # I

    .line 192
    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileManager;->checkInstance(Landroid/content/Context;)V

    .line 193
    invoke-static {p1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    .line 194
    .local v0, "profile":Lde/blinkt/openvpn/core/VpnProfile;
    const/4 v1, 0x0

    .line 195
    .local v1, "tried":I
    :goto_0
    if-eqz v0, :cond_0

    iget v2, v0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    if-ge v2, p2, :cond_2

    :cond_0
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "tried":I
    .local v2, "tried":I
    if-ge v1, p3, :cond_1

    .line 197
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    goto :goto_1

    .line 198
    :catch_0
    move-exception v1

    .line 200
    :goto_1
    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/core/ProfileManager;->loadVPNList(Landroid/content/Context;)V

    .line 201
    invoke-static {p1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    move v1, v2

    goto :goto_0

    .line 195
    :cond_1
    move v1, v2

    .line 204
    .end local v2    # "tried":I
    .restart local v1    # "tried":I
    :cond_2
    const/4 v2, 0x5

    if-le v1, v2, :cond_4

    .line 205
    if-nez v0, :cond_3

    const/4 v2, -0x1

    goto :goto_2

    :cond_3
    iget v2, v0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    .line 206
    .local v2, "ver":I
    :goto_2
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "Used x %d tries to get current version (%d/%d) of the profile"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 208
    .end local v2    # "ver":I
    :cond_4
    return-object v0
.end method

.method private static get(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .line 46
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    if-eqz v0, :cond_0

    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/VpnProfile;->getUUIDString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    return-object v0

    .line 49
    :cond_0
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    if-nez v0, :cond_1

    .line 50
    const/4 v0, 0x0

    return-object v0

    .line 51
    :cond_1
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;

    iget-object v0, v0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/VpnProfile;

    return-object v0
.end method

.method public static getAlwaysOnVPN(Landroid/content/Context;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 216
    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileManager;->checkInstance(Landroid/content/Context;)V

    .line 217
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 219
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "alwaysOnVpn"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, "uuid":Ljava/lang/String;
    invoke-static {v1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v2

    return-object v2
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lde/blinkt/openvpn/core/ProfileManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    const-class v0, Lde/blinkt/openvpn/core/ProfileManager;

    monitor-enter v0

    .line 63
    :try_start_0
    invoke-static {p0}, Lde/blinkt/openvpn/core/ProfileManager;->checkInstance(Landroid/content/Context;)V

    .line 64
    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->instance:Lde/blinkt/openvpn/core/ProfileManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 62
    .end local p0    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static getLastConnectedProfile(Landroid/content/Context;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .line 90
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 92
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "lastConnectedProfile"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "lastConnectedProfile":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 94
    invoke-static {p0, v1}, Lde/blinkt/openvpn/core/ProfileManager;->get(Landroid/content/Context;Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v2

    return-object v2

    .line 96
    :cond_0
    return-object v2
.end method

.method public static getLastConnectedVpn()Lde/blinkt/openvpn/core/VpnProfile;
    .locals 1

    .line 212
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    return-object v0
.end method

.method public static isTempProfile()Z
    .locals 2

    .line 107
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    if-eqz v0, :cond_0

    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private declared-synchronized loadVPNList(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    monitor-enter p0

    .line 304
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    .line 305
    const-string v0, "VPNList"

    invoke-static {v0, p1}, Lde/blinkt/openvpn/core/Preferences;->getSharedPreferencesMulti(Ljava/lang/String;Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 306
    .local v0, "listpref":Landroid/content/SharedPreferences;
    const-string v1, "vpnlist"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    .line 307
    .local v1, "vlist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v1, :cond_0

    .line 308
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    move-object v1, v2

    .line 311
    .end local p0    # "this":Lde/blinkt/openvpn/core/ProfileManager;
    :cond_0
    const-string v2, "temporary-vpn-profile"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 313
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 314
    .local v3, "vpnentry":Ljava/lang/String;
    invoke-direct {p0, p1, v3}, Lde/blinkt/openvpn/core/ProfileManager;->loadVpnEntry(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    .end local v3    # "vpnentry":Ljava/lang/String;
    goto :goto_0

    .line 316
    :cond_1
    monitor-exit p0

    return-void

    .line 303
    .end local v0    # "listpref":Landroid/content/SharedPreferences;
    .end local v1    # "vlist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local p1    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private declared-synchronized loadVpnEntry(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "vpnentry"    # Ljava/lang/String;

    monitor-enter p0

    .line 319
    const/4 v0, 0x0

    .line 322
    .local v0, "vpnfile":Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 323
    .local v1, "encryptedPath":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cpold"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 325
    .local v2, "encryptedPathOld":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v3, :cond_0

    .line 326
    :try_start_1
    invoke-static {p1, v1}, Lde/blinkt/openvpn/core/ProfileEncryption;->getEncryptedVpInput(Landroid/content/Context;Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .local v3, "vpInput":Ljava/io/FileInputStream;
    goto :goto_0

    .line 349
    .end local v1    # "encryptedPath":Ljava/io/File;
    .end local v2    # "encryptedPathOld":Ljava/io/File;
    .end local v3    # "vpInput":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v1

    goto/16 :goto_7

    .line 345
    :catch_0
    move-exception v1

    goto/16 :goto_5

    :catch_1
    move-exception v1

    goto/16 :goto_5

    :catch_2
    move-exception v1

    goto/16 :goto_5

    .line 327
    .restart local v1    # "encryptedPath":Ljava/io/File;
    .restart local v2    # "encryptedPathOld":Ljava/io/File;
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v3, :cond_1

    .line 328
    :try_start_3
    invoke-static {p1, v2}, Lde/blinkt/openvpn/core/ProfileEncryption;->getEncryptedVpInput(Landroid/content/Context;Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .restart local v3    # "vpInput":Ljava/io/FileInputStream;
    goto :goto_0

    .line 330
    .end local v3    # "vpInput":Ljava/io/FileInputStream;
    :cond_1
    :try_start_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".vp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3

    .line 332
    .restart local v3    # "vpInput":Ljava/io/FileInputStream;
    :goto_0
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v4

    .line 333
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lde/blinkt/openvpn/core/VpnProfile;

    .line 336
    .local v4, "vp":Lde/blinkt/openvpn/core/VpnProfile;
    if-eqz v4, :cond_4

    iget-object v5, v4, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    if-eqz v5, :cond_4

    invoke-virtual {v4}, Lde/blinkt/openvpn/core/VpnProfile;->getUUID()Ljava/util/UUID;

    move-result-object v5

    if-nez v5, :cond_2

    goto :goto_3

    .line 339
    :cond_2
    invoke-virtual {v4}, Lde/blinkt/openvpn/core/VpnProfile;->upgradeProfile()V

    .line 340
    const-string v5, "temporary-vpn-profile"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/security/GeneralSecurityException; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v5, :cond_3

    .line 341
    :try_start_5
    sput-object v4, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 343
    :cond_3
    :try_start_6
    iget-object v5, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v4}, Lde/blinkt/openvpn/core/VpnProfile;->getUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/security/GeneralSecurityException; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 349
    .end local v1    # "encryptedPath":Ljava/io/File;
    .end local v2    # "encryptedPathOld":Ljava/io/File;
    .end local v3    # "vpInput":Ljava/io/FileInputStream;
    .end local v4    # "vp":Lde/blinkt/openvpn/core/VpnProfile;
    :goto_1
    nop

    .line 351
    :try_start_7
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 354
    goto :goto_6

    .line 352
    .end local p0    # "this":Lde/blinkt/openvpn/core/ProfileManager;
    :catch_3
    move-exception v1

    .line 353
    .local v1, "e":Ljava/io/IOException;
    :goto_2
    :try_start_8
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 354
    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_6

    .line 349
    .local v1, "encryptedPath":Ljava/io/File;
    .restart local v2    # "encryptedPathOld":Ljava/io/File;
    .restart local v3    # "vpInput":Ljava/io/FileInputStream;
    .restart local v4    # "vp":Lde/blinkt/openvpn/core/VpnProfile;
    :cond_4
    :goto_3
    nop

    .line 351
    :try_start_9
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 354
    goto :goto_4

    .line 352
    :catch_4
    move-exception v5

    .line 353
    .local v5, "e":Ljava/io/IOException;
    :try_start_a
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 337
    .end local v5    # "e":Ljava/io/IOException;
    :goto_4
    monitor-exit p0

    return-void

    .line 349
    .end local v1    # "encryptedPath":Ljava/io/File;
    .end local v2    # "encryptedPathOld":Ljava/io/File;
    .end local v3    # "vpInput":Ljava/io/FileInputStream;
    .end local v4    # "vp":Lde/blinkt/openvpn/core/VpnProfile;
    :catchall_1
    move-exception v1

    goto :goto_7

    .line 345
    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_5

    :catch_7
    move-exception v1

    .line 346
    .local v1, "e":Ljava/lang/Exception;
    :goto_5
    :try_start_b
    const-string v2, "temporary-vpn-profile"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 347
    const-string v2, "Loading VPN List"

    invoke-static {v2, v1}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 349
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5
    if-eqz v0, :cond_6

    .line 351
    :try_start_c
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 354
    goto :goto_6

    .line 352
    :catch_8
    move-exception v1

    goto :goto_2

    .line 357
    :cond_6
    :goto_6
    monitor-exit p0

    return-void

    .line 349
    :goto_7
    if-eqz v0, :cond_7

    .line 351
    :try_start_d
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 354
    goto :goto_8

    .line 352
    :catch_9
    move-exception v2

    .line 353
    .local v2, "e":Ljava/io/IOException;
    :try_start_e
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 356
    .end local v2    # "e":Ljava/io/IOException;
    :cond_7
    :goto_8
    throw v1

    .line 318
    .end local v0    # "vpnfile":Ljava/io/ObjectInputStream;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "vpnentry":Ljava/lang/String;
    :catchall_2
    move-exception p1

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw p1
.end method

.method public static notifyProfileVersionChanged(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "version"    # I

    .line 238
    const/16 v0, 0x64

    invoke-static {p0, p1, p2, v0}, Lde/blinkt/openvpn/core/ProfileManager;->get(Landroid/content/Context;Ljava/lang/String;II)Lde/blinkt/openvpn/core/VpnProfile;

    move-result-object v0

    .line 239
    .local v0, "loadedProfile":Lde/blinkt/openvpn/core/VpnProfile;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    iget v4, v0, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    if-lt v4, p2, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    and-int/2addr v1, v3

    if-eqz v1, :cond_2

    .line 240
    invoke-static {p1, p2, v2}, Lde/blinkt/openvpn/core/VpnStatus;->notifyProfileVersionChanged(Ljava/lang/String;IZ)V

    .line 242
    :cond_2
    return-void
.end method

.method public static saveProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 111
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 112
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "preferencryption"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 113
    .local v1, "preferEncryption":Z
    sget-boolean v3, Lde/blinkt/openvpn/core/ProfileManager;->encryptionBroken:Z

    if-eqz v3, :cond_0

    .line 114
    const/4 v1, 0x0

    .line 116
    :cond_0
    iget v3, p1, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    add-int/2addr v3, v2

    iput v3, p1, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    .line 117
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1c

    if-lt v3, v4, :cond_1

    .line 118
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Saving from version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from process "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 119
    invoke-static {}, Landroid/app/Application;->getProcessName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 118
    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/VpnProfile;->addChangeLogEntry(Ljava/lang/String;)V

    .line 123
    :cond_1
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "filename":Ljava/lang/String;
    iget-boolean v4, p1, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    if-eqz v4, :cond_2

    .line 126
    const-string v3, "temporary-vpn-profile"

    .line 128
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".cpold"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 130
    .local v4, "encryptedFileOld":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 132
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 138
    :cond_3
    const-string v5, ".cp"

    const-string v6, ".vp"

    if-eqz v1, :cond_6

    :try_start_0
    invoke-static {}, Lde/blinkt/openvpn/core/ProfileEncryption;->encryptionEnabled()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 139
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 141
    .local v5, "encryptedFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 143
    invoke-virtual {v5, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 145
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot rename "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 149
    :cond_4
    :try_start_1
    invoke-static {p0, v5}, Lde/blinkt/openvpn/core/ProfileEncryption;->getEncryptedVpOutput(Landroid/content/Context;Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v7

    .line 150
    .local v7, "vpnFileOut":Ljava/io/FileOutputStream;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 151
    .local v6, "deleteIfExists":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 152
    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 161
    :cond_5
    nop

    .line 162
    .end local v5    # "encryptedFile":Ljava/io/File;
    goto :goto_1

    .line 154
    .end local v6    # "deleteIfExists":Ljava/lang/String;
    .end local v7    # "vpnFileOut":Ljava/io/FileOutputStream;
    .restart local v5    # "encryptedFile":Ljava/io/File;
    :catch_0
    move-exception v6

    goto :goto_0

    :catch_1
    move-exception v6

    .line 156
    .local v6, "ioe":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    sget-object v7, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v8, "Error trying to write an encrypted VPN profile, disabling encryption"

    invoke-static {v7, v8, v6}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 158
    sput-boolean v2, Lde/blinkt/openvpn/core/ProfileManager;->encryptionBroken:Z

    .line 159
    invoke-static {p0, p1}, Lde/blinkt/openvpn/core/ProfileManager;->saveProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 160
    return-void

    .line 164
    .end local v5    # "encryptedFile":Ljava/io/File;
    .end local v6    # "ioe":Ljava/lang/Exception;
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v6

    move-object v7, v6

    .line 165
    .restart local v7    # "vpnFileOut":Ljava/io/FileOutputStream;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v6, v5

    .line 168
    .local v6, "deleteIfExists":Ljava/lang/String;
    :goto_1
    new-instance v5, Ljava/io/ObjectOutputStream;

    invoke-direct {v5, v7}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 170
    .local v5, "vpnFile":Ljava/io/ObjectOutputStream;
    invoke-virtual {v5, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 171
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->flush()V

    .line 172
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->close()V

    .line 174
    invoke-virtual {p0, v6}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 175
    .local v8, "delete":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 178
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 180
    :cond_7
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getUUIDString()Ljava/lang/String;

    move-result-object v9

    iget v10, p1, Lde/blinkt/openvpn/core/VpnProfile;->mVersion:I

    invoke-static {v9, v10, v2}, Lde/blinkt/openvpn/core/VpnStatus;->notifyProfileVersionChanged(Ljava/lang/String;IZ)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 184
    .end local v7    # "vpnFileOut":Ljava/io/FileOutputStream;
    .end local v8    # "delete":Ljava/io/File;
    nop

    .line 185
    return-void

    .line 181
    .end local v5    # "vpnFile":Ljava/io/ObjectOutputStream;
    .end local v6    # "deleteIfExists":Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 182
    .local v2, "e":Ljava/io/IOException;
    const-string v5, "saving VPN profile"

    invoke-static {v5, v2}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 183
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public static setConnectedVpnProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "connectedProfile"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 78
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 79
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 81
    .local v1, "prefsedit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "lastConnectedProfile"

    invoke-virtual {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getUUIDString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 82
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    sput-object p1, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    .line 84
    return-void
.end method

.method public static setConntectedVpnProfileDisconnected(Landroid/content/Context;)V
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .line 68
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 69
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 70
    .local v1, "prefsedit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "lastConnectedProfile"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 71
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 72
    return-void
.end method

.method public static setTemporaryProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 1
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "tmp"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p1, Lde/blinkt/openvpn/core/VpnProfile;->mTemporaryProfile:Z

    .line 101
    sput-object p1, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    .line 102
    const-string v0, "temporary profile saved"

    invoke-virtual {p1, v0}, Lde/blinkt/openvpn/core/VpnProfile;->addChangeLogEntry(Ljava/lang/String;)V

    .line 103
    invoke-static {p0, p1}, Lde/blinkt/openvpn/core/ProfileManager;->saveProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 104
    return-void
.end method

.method public static updateLRU(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 225
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lde/blinkt/openvpn/core/VpnProfile;->mLastUsed:J

    .line 227
    sget-object v0, Lde/blinkt/openvpn/core/ProfileManager;->tmpprofile:Lde/blinkt/openvpn/core/VpnProfile;

    if-eq p1, v0, :cond_0

    .line 228
    const-string v0, "Saved last recently used"

    invoke-virtual {p1, v0}, Lde/blinkt/openvpn/core/VpnProfile;->addChangeLogEntry(Ljava/lang/String;)V

    .line 229
    invoke-static {p0, p1}, Lde/blinkt/openvpn/core/ProfileManager;->saveProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 231
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addProfile(Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 2
    .param p1, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;

    monitor-enter p0

    .line 271
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    monitor-exit p0

    return-void

    .line 270
    .end local p0    # "this":Lde/blinkt/openvpn/core/ProfileManager;
    .end local p1    # "profile":Lde/blinkt/openvpn/core/VpnProfile;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getProfileByName(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnProfile;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 249
    iget-object v0, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/blinkt/openvpn/core/VpnProfile;

    .line 250
    .local v1, "vpnp":Lde/blinkt/openvpn/core/VpnProfile;
    invoke-virtual {v1}, Lde/blinkt/openvpn/core/VpnProfile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 251
    return-object v1

    .line 253
    .end local v1    # "vpnp":Lde/blinkt/openvpn/core/VpnProfile;
    :cond_0
    goto :goto_0

    .line 254
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getProfiles()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lde/blinkt/openvpn/core/VpnProfile;",
            ">;"
        }
    .end annotation

    .line 245
    iget-object v0, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized refreshVPNList(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    monitor-enter p0

    .line 281
    :try_start_0
    const-string v0, "VPNList"

    invoke-static {v0, p1}, Lde/blinkt/openvpn/core/Preferences;->getSharedPreferencesMulti(Ljava/lang/String;Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 282
    .local v0, "listpref":Landroid/content/SharedPreferences;
    const-string v1, "vpnlist"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    .local v1, "vlist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v1, :cond_0

    .line 284
    monitor-exit p0

    return-void

    .line 286
    :cond_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 287
    .local v3, "vpnentry":Ljava/lang/String;
    iget-object v4, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 288
    invoke-direct {p0, p1, v3}, Lde/blinkt/openvpn/core/ProfileManager;->loadVpnEntry(Landroid/content/Context;Ljava/lang/String;)V

    .line 289
    .end local v3    # "vpnentry":Ljava/lang/String;
    .end local p0    # "this":Lde/blinkt/openvpn/core/ProfileManager;
    :cond_1
    goto :goto_0

    .line 291
    :cond_2
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 292
    .local v2, "removeUuids":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v3, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 294
    .local v4, "profileuuid":Ljava/lang/String;
    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 295
    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 296
    .end local v4    # "profileuuid":Ljava/lang/String;
    :cond_3
    goto :goto_1

    .line 297
    :cond_4
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 299
    .local v4, "uuid":Ljava/lang/String;
    iget-object v5, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 300
    nop

    .end local v4    # "uuid":Ljava/lang/String;
    goto :goto_2

    .line 301
    :cond_5
    monitor-exit p0

    return-void

    .line 280
    .end local v0    # "listpref":Landroid/content/SharedPreferences;
    .end local v1    # "vlist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "removeUuids":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local p1    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized removeProfile(Landroid/content/Context;Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;

    monitor-enter p0

    .line 360
    :try_start_0
    invoke-virtual {p2}, Lde/blinkt/openvpn/core/VpnProfile;->getUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 361
    .local v0, "vpnentry":Ljava/lang/String;
    iget-object v1, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/ProfileManager;->saveProfileList(Landroid/content/Context;)V

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".vp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 364
    sget-object v1, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;

    if-ne v1, p2, :cond_0

    .line 365
    const/4 v1, 0x0

    sput-object v1, Lde/blinkt/openvpn/core/ProfileManager;->mLastConnectedVpn:Lde/blinkt/openvpn/core/VpnProfile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 367
    .end local p0    # "this":Lde/blinkt/openvpn/core/ProfileManager;
    :cond_0
    monitor-exit p0

    return-void

    .line 359
    .end local v0    # "vpnentry":Ljava/lang/String;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "profile":Lde/blinkt/openvpn/core/VpnProfile;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public saveProfileList(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .line 258
    const-string v0, "VPNList"

    invoke-static {v0, p1}, Lde/blinkt/openvpn/core/Preferences;->getSharedPreferencesMulti(Ljava/lang/String;Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 259
    .local v0, "sharedprefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 260
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Lde/blinkt/openvpn/core/ProfileManager;->profiles:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    const-string v3, "vpnlist"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 265
    const/4 v2, 0x0

    const-string v3, "counter"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 266
    .local v2, "counter":I
    add-int/lit8 v4, v2, 0x1

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 267
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 268
    return-void
.end method
