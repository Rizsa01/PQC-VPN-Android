.class public final enum Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;
.super Ljava/lang/Enum;
.source "EncryptedFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/security/crypto/EncryptedFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FileEncryptionScheme"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

.field public static final enum AES256_GCM_HKDF_4KB:Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;


# instance fields
.field private final mStreamingAeadKeyTemplate:Lcom/google/crypto/tink/KeyTemplate;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 103
    new-instance v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    const/4 v1, 0x0

    invoke-static {}, Lcom/google/crypto/tink/streamingaead/AesGcmHkdfStreamingKeyManager;->aes256GcmHkdf4KBTemplate()Lcom/google/crypto/tink/KeyTemplate;

    move-result-object v2

    const-string v3, "AES256_GCM_HKDF_4KB"

    invoke-direct {v0, v3, v1, v2}, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;-><init>(Ljava/lang/String;ILcom/google/crypto/tink/KeyTemplate;)V

    sput-object v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->AES256_GCM_HKDF_4KB:Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    .line 93
    sget-object v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->AES256_GCM_HKDF_4KB:Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    filled-new-array {v0}, [Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    move-result-object v0

    sput-object v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->$VALUES:[Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/google/crypto/tink/KeyTemplate;)V
    .locals 0
    .param p3, "keyTemplate"    # Lcom/google/crypto/tink/KeyTemplate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/crypto/tink/KeyTemplate;",
            ")V"
        }
    .end annotation

    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 108
    iput-object p3, p0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->mStreamingAeadKeyTemplate:Lcom/google/crypto/tink/KeyTemplate;

    .line 109
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 93
    const-class v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    return-object v0
.end method

.method public static values()[Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;
    .locals 1

    .line 93
    sget-object v0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->$VALUES:[Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    invoke-virtual {v0}, [Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;

    return-object v0
.end method


# virtual methods
.method getKeyTemplate()Lcom/google/crypto/tink/KeyTemplate;
    .locals 1

    .line 112
    iget-object v0, p0, Landroidx/security/crypto/EncryptedFile$FileEncryptionScheme;->mStreamingAeadKeyTemplate:Lcom/google/crypto/tink/KeyTemplate;

    return-object v0
.end method
