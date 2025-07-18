.class public Lde/blinkt/openvpn/core/PasswordCache;
.super Ljava/lang/Object;
.source "PasswordCache.java"


# static fields
.field public static final AUTHPASSWORD:I = 0x3

.field public static final PCKS12ORCERTPASSWORD:I = 0x2

.field private static mInstance:Lde/blinkt/openvpn/core/PasswordCache;


# instance fields
.field private mAuthPassword:Ljava/lang/String;

.field private mKeyOrPkcs12Password:Ljava/lang/String;

.field private final mUuid:Ljava/util/UUID;


# direct methods
.method private constructor <init>(Ljava/util/UUID;)V
    .locals 0
    .param p1, "uuid"    # Ljava/util/UUID;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lde/blinkt/openvpn/core/PasswordCache;->mUuid:Ljava/util/UUID;

    .line 24
    return-void
.end method

.method public static getAuthPassword(Ljava/util/UUID;Z)Ljava/lang/String;
    .locals 3
    .param p0, "uuid"    # Ljava/util/UUID;
    .param p1, "resetPW"    # Z

    .line 42
    invoke-static {p0}, Lde/blinkt/openvpn/core/PasswordCache;->getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;

    move-result-object v0

    iget-object v0, v0, Lde/blinkt/openvpn/core/PasswordCache;->mAuthPassword:Ljava/lang/String;

    .line 43
    .local v0, "pwcopy":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 44
    invoke-static {p0}, Lde/blinkt/openvpn/core/PasswordCache;->getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;

    move-result-object v1

    const/4 v2, 0x0

    iput-object v2, v1, Lde/blinkt/openvpn/core/PasswordCache;->mAuthPassword:Ljava/lang/String;

    .line 45
    :cond_0
    return-object v0
.end method

.method public static getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;
    .locals 1
    .param p0, "uuid"    # Ljava/util/UUID;

    .line 27
    sget-object v0, Lde/blinkt/openvpn/core/PasswordCache;->mInstance:Lde/blinkt/openvpn/core/PasswordCache;

    if-eqz v0, :cond_0

    sget-object v0, Lde/blinkt/openvpn/core/PasswordCache;->mInstance:Lde/blinkt/openvpn/core/PasswordCache;

    iget-object v0, v0, Lde/blinkt/openvpn/core/PasswordCache;->mUuid:Ljava/util/UUID;

    invoke-virtual {v0, p0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 28
    :cond_0
    new-instance v0, Lde/blinkt/openvpn/core/PasswordCache;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/PasswordCache;-><init>(Ljava/util/UUID;)V

    sput-object v0, Lde/blinkt/openvpn/core/PasswordCache;->mInstance:Lde/blinkt/openvpn/core/PasswordCache;

    .line 30
    :cond_1
    sget-object v0, Lde/blinkt/openvpn/core/PasswordCache;->mInstance:Lde/blinkt/openvpn/core/PasswordCache;

    return-object v0
.end method

.method public static getPKCS12orCertificatePassword(Ljava/util/UUID;Z)Ljava/lang/String;
    .locals 3
    .param p0, "uuid"    # Ljava/util/UUID;
    .param p1, "resetPw"    # Z

    .line 34
    invoke-static {p0}, Lde/blinkt/openvpn/core/PasswordCache;->getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;

    move-result-object v0

    iget-object v0, v0, Lde/blinkt/openvpn/core/PasswordCache;->mKeyOrPkcs12Password:Ljava/lang/String;

    .line 35
    .local v0, "pwcopy":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 36
    invoke-static {p0}, Lde/blinkt/openvpn/core/PasswordCache;->getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;

    move-result-object v1

    const/4 v2, 0x0

    iput-object v2, v1, Lde/blinkt/openvpn/core/PasswordCache;->mKeyOrPkcs12Password:Ljava/lang/String;

    .line 37
    :cond_0
    return-object v0
.end method

.method public static setCachedPassword(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p0, "uuid"    # Ljava/lang/String;
    .param p1, "type"    # I
    .param p2, "password"    # Ljava/lang/String;

    .line 49
    invoke-static {p0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/PasswordCache;->getInstance(Ljava/util/UUID;)Lde/blinkt/openvpn/core/PasswordCache;

    move-result-object v0

    .line 50
    .local v0, "instance":Lde/blinkt/openvpn/core/PasswordCache;
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 55
    :pswitch_0
    iput-object p2, v0, Lde/blinkt/openvpn/core/PasswordCache;->mAuthPassword:Ljava/lang/String;

    goto :goto_0

    .line 52
    :pswitch_1
    iput-object p2, v0, Lde/blinkt/openvpn/core/PasswordCache;->mKeyOrPkcs12Password:Ljava/lang/String;

    .line 53
    nop

    .line 58
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
