.class public final Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem;
.super Ljava/lang/Object;
.source "EciesHkdfSenderKem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem$KemKey;
    }
.end annotation


# instance fields
.field private recipientPublicKey:Ljava/security/interfaces/ECPublicKey;


# direct methods
.method public constructor <init>(Ljava/security/interfaces/ECPublicKey;)V
    .locals 0
    .param p1, "recipientPublicKey"    # Ljava/security/interfaces/ECPublicKey;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "recipientPublicKey"
        }
    .end annotation

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem;->recipientPublicKey:Ljava/security/interfaces/ECPublicKey;

    .line 61
    return-void
.end method


# virtual methods
.method public generateKey(Ljava/lang/String;[B[BILcom/google/crypto/tink/subtle/EllipticCurves$PointFormatType;)Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem$KemKey;
    .locals 10
    .param p1, "hmacAlgo"    # Ljava/lang/String;
    .param p2, "hkdfSalt"    # [B
    .param p3, "hkdfInfo"    # [B
    .param p4, "keySizeInBytes"    # I
    .param p5, "pointFormat"    # Lcom/google/crypto/tink/subtle/EllipticCurves$PointFormatType;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10,
            0x0,
            0x0
        }
        names = {
            "hmacAlgo",
            "hkdfSalt",
            "hkdfInfo",
            "keySizeInBytes",
            "pointFormat"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem;->recipientPublicKey:Ljava/security/interfaces/ECPublicKey;

    invoke-interface {v0}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    invoke-static {v0}, Lcom/google/crypto/tink/subtle/EllipticCurves;->generateKeyPair(Ljava/security/spec/ECParameterSpec;)Ljava/security/KeyPair;

    move-result-object v0

    .line 71
    .local v0, "ephemeralKeyPair":Ljava/security/KeyPair;
    invoke-virtual {v0}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v1

    check-cast v1, Ljava/security/interfaces/ECPublicKey;

    .line 72
    .local v1, "ephemeralPublicKey":Ljava/security/interfaces/ECPublicKey;
    invoke-virtual {v0}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    check-cast v2, Ljava/security/interfaces/ECPrivateKey;

    .line 73
    .local v2, "ephemeralPrivateKey":Ljava/security/interfaces/ECPrivateKey;
    iget-object v3, p0, Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem;->recipientPublicKey:Ljava/security/interfaces/ECPublicKey;

    invoke-static {v2, v3}, Lcom/google/crypto/tink/subtle/EllipticCurves;->computeSharedSecret(Ljava/security/interfaces/ECPrivateKey;Ljava/security/interfaces/ECPublicKey;)[B

    move-result-object v5

    .line 75
    .local v5, "sharedSecret":[B
    nop

    .line 77
    invoke-interface {v1}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v3

    invoke-virtual {v3}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v3

    invoke-interface {v1}, Ljava/security/interfaces/ECPublicKey;->getW()Ljava/security/spec/ECPoint;

    move-result-object v4

    .line 76
    invoke-static {v3, p5, v4}, Lcom/google/crypto/tink/subtle/EllipticCurves;->pointEncode(Ljava/security/spec/EllipticCurve;Lcom/google/crypto/tink/subtle/EllipticCurves$PointFormatType;Ljava/security/spec/ECPoint;)[B

    move-result-object v4

    .line 78
    .local v4, "kemBytes":[B
    nop

    .line 79
    move-object v6, p1

    move-object v7, p2

    move-object v8, p3

    move v9, p4

    .end local p1    # "hmacAlgo":Ljava/lang/String;
    .end local p2    # "hkdfSalt":[B
    .end local p3    # "hkdfInfo":[B
    .end local p4    # "keySizeInBytes":I
    .local v6, "hmacAlgo":Ljava/lang/String;
    .local v7, "hkdfSalt":[B
    .local v8, "hkdfInfo":[B
    .local v9, "keySizeInBytes":I
    invoke-static/range {v4 .. v9}, Lcom/google/crypto/tink/subtle/Hkdf;->computeEciesHkdfSymmetricKey([B[BLjava/lang/String;[B[BI)[B

    move-result-object p1

    .line 81
    .local p1, "symmetricKey":[B
    new-instance p2, Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem$KemKey;

    invoke-direct {p2, v4, p1}, Lcom/google/crypto/tink/subtle/EciesHkdfSenderKem$KemKey;-><init>([B[B)V

    return-object p2
.end method
