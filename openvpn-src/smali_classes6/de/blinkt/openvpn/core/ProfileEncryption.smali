.class Lde/blinkt/openvpn/core/ProfileEncryption;
.super Ljava/lang/Object;
.source "ProfileEncryption.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static encryptionEnabled()Z
    .locals 1

    .line 25
    const/4 v0, 0x0

    return v0
.end method

.method static getEncryptedVpInput(Landroid/content/Context;Ljava/io/File;)Ljava/io/FileInputStream;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "encryption of file not supported in this build"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static getEncryptedVpOutput(Landroid/content/Context;Ljava/io/File;)Ljava/io/FileOutputStream;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "encryption of file not supported in this build"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static initMasterCryptAlias(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .line 21
    return-void
.end method
