.class public Lde/blinkt/openvpn/core/X509Utils;
.super Ljava/lang/Object;
.source "X509Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCertificateFriendlyName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "filename"    # Ljava/lang/String;

    .line 78
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 80
    :try_start_0
    invoke-static {p1}, Lde/blinkt/openvpn/core/X509Utils;->getCertificatesFromFile(Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 81
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    invoke-static {v0}, Lde/blinkt/openvpn/core/X509Utils;->getCertificateFriendlyName(Ljava/security/cert/X509Certificate;)Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "friendlycn":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v0, v3}, Lde/blinkt/openvpn/core/X509Utils;->getCertificateValidityString(Ljava/security/cert/X509Certificate;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .end local v1    # "friendlycn":Ljava/lang/String;
    .local v2, "friendlycn":Ljava/lang/String;
    return-object v2

    .line 85
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v2    # "friendlycn":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not read certificate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 89
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const v0, 0x7f11007c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCertificateFriendlyName(Ljava/security/cert/X509Certificate;)Ljava/lang/String;
    .locals 13
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .line 127
    const-string v0, "1.2.840.113549.1.9.1"

    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v1

    .line 128
    .local v1, "principal":Ljavax/security/auth/x500/X500Principal;
    invoke-virtual {v1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v2

    .line 129
    .local v2, "encodedSubject":[B
    const/4 v3, 0x0

    .line 132
    .local v3, "friendlyName":Ljava/lang/String;
    const/4 v4, 0x0

    .line 134
    .local v4, "exp":Ljava/lang/Exception;
    :try_start_0
    const-string v5, "com.android.org.bouncycastle.asn1.x509.X509Name"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 135
    .local v5, "X509NameClass":Ljava/lang/Class;
    const-string v6, "getInstance"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 137
    .local v6, "getInstance":Ljava/lang/reflect/Method;
    const-string v8, "DefaultSymbols"

    invoke-virtual {v5, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Hashtable;

    .line 139
    .local v8, "defaultSymbols":Ljava/util/Hashtable;
    invoke-virtual {v8, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 140
    const-string v9, "eMail"

    invoke-virtual {v8, v0, v9}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_0
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "subjectName":Ljava/lang/Object;
    const-string v9, "toString"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Class;

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v12, v11, v10

    const-class v10, Ljava/util/Hashtable;

    aput-object v10, v11, v7

    invoke-virtual {v5, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 146
    .local v9, "toString":Ljava/lang/reflect/Method;
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v9, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v7

    .end local v0    # "subjectName":Ljava/lang/Object;
    .end local v5    # "X509NameClass":Ljava/lang/Class;
    .end local v6    # "getInstance":Ljava/lang/reflect/Method;
    .end local v8    # "defaultSymbols":Ljava/util/Hashtable;
    .end local v9    # "toString":Ljava/lang/reflect/Method;
    goto :goto_2

    .line 150
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    const/4 v4, 0x0

    goto :goto_3

    .line 148
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    .line 149
    .restart local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_1
    move-object v4, v0

    .line 153
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_2
    nop

    .line 154
    :goto_3
    if-eqz v4, :cond_1

    .line 155
    const-string v0, "Getting X509 Name from certificate"

    invoke-static {v0, v4}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    :cond_1
    if-nez v3, :cond_2

    .line 160
    invoke-virtual {v1}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v3

    .line 166
    :cond_2
    const-string v0, ","

    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 167
    .local v5, "parts":[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    array-length v7, v5

    if-ge v6, v7, :cond_4

    .line 168
    aget-object v7, v5, v6

    .line 169
    .local v7, "part":Ljava/lang/String;
    const-string v8, "1.2.840.113549.1.9.1=#16"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 170
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "email="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ""

    invoke-virtual {v7, v8, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lde/blinkt/openvpn/core/X509Utils;->ia5decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v6

    .line 167
    .end local v7    # "part":Ljava/lang/String;
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 173
    .end local v6    # "i":I
    :cond_4
    invoke-static {v0, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .end local v3    # "friendlyName":Ljava/lang/String;
    .local v0, "friendlyName":Ljava/lang/String;
    return-object v0
.end method

.method public static getCertificateValidityString(Ljava/security/cert/X509Certificate;Landroid/content/res/Resources;)Ljava/lang/String;
    .locals 9
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "res"    # Landroid/content/res/Resources;

    .line 94
    :try_start_0
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->checkValidity()V
    :try_end_0
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    nop

    .line 101
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getNotAfter()Ljava/util/Date;

    move-result-object v0

    .line 102
    .local v0, "certNotAfter":Ljava/util/Date;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 103
    .local v1, "now":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    .line 107
    .local v2, "timeLeft":J
    const-wide v4, 0x1cf7c5800L

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 108
    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/X509Utils;->getMonthsDifference(Ljava/util/Date;Ljava/util/Date;)I

    move-result v4

    int-to-long v4, v4

    .line 109
    .local v4, "months":J
    long-to-int v6, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f0f0003

    invoke-virtual {p1, v8, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 110
    .end local v4    # "months":J
    :cond_0
    const-wide/32 v4, 0xf731400

    cmp-long v4, v2, v4

    if-lez v4, :cond_1

    .line 111
    const-wide/32 v4, 0x5265c00

    div-long v4, v2, v4

    .line 112
    .local v4, "days":J
    long-to-int v6, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const/high16 v8, 0x7f0f0000

    invoke-virtual {p1, v8, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 114
    .end local v4    # "days":J
    :cond_1
    const-wide/32 v4, 0x36ee80

    div-long v4, v2, v4

    .line 116
    .local v4, "hours":J
    long-to-int v6, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f0f0001

    invoke-virtual {p1, v8, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 97
    .end local v0    # "certNotAfter":Ljava/util/Date;
    .end local v1    # "now":Ljava/util/Date;
    .end local v2    # "timeLeft":J
    .end local v4    # "hours":J
    :catch_0
    move-exception v0

    .line 98
    .local v0, "cny":Ljava/security/cert/CertificateNotYetValidException;
    const-string v1, "NOT YET VALID: "

    return-object v1

    .line 95
    .end local v0    # "cny":Ljava/security/cert/CertificateNotYetValidException;
    :catch_1
    move-exception v0

    .line 96
    .local v0, "ce":Ljava/security/cert/CertificateExpiredException;
    const-string v1, "EXPIRED: "

    return-object v1
.end method

.method public static getCertificatesFromFile(Ljava/lang/String;)[Ljava/security/cert/Certificate;
    .locals 7
    .param p0, "certfilename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 35
    const-string v0, "X.509"

    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 37
    .local v0, "certFact":Ljava/security/cert/CertificateFactory;
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 38
    .local v1, "certificates":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/security/cert/Certificate;>;"
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 39
    const-string v2, "-----BEGIN CERTIFICATE-----"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 44
    .local v4, "subIndex":I
    :cond_0
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 45
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 46
    .local v5, "inStream":Ljava/io/InputStream;
    invoke-virtual {v0, v5}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 48
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {p0, v2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 49
    .end local v5    # "inStream":Ljava/io/InputStream;
    if-gtz v4, :cond_0

    .line 50
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v2, v2, [Ljava/security/cert/Certificate;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/security/cert/Certificate;

    return-object v2

    .line 52
    .end local v4    # "subIndex":I
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 53
    .local v2, "inStream":Ljava/io/InputStream;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/security/cert/Certificate;

    invoke-virtual {v0, v2}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v5

    aput-object v5, v4, v3

    return-object v4
.end method

.method public static getMonthsDifference(Ljava/util/Date;Ljava/util/Date;)I
    .locals 3
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;

    .line 121
    invoke-virtual {p0}, Ljava/util/Date;->getYear()I

    move-result v0

    mul-int/lit8 v0, v0, 0xc

    invoke-virtual {p0}, Ljava/util/Date;->getMonth()I

    move-result v1

    add-int/2addr v0, v1

    .line 122
    .local v0, "m1":I
    invoke-virtual {p1}, Ljava/util/Date;->getYear()I

    move-result v1

    mul-int/lit8 v1, v1, 0xc

    invoke-virtual {p1}, Ljava/util/Date;->getMonth()I

    move-result v2

    add-int/2addr v1, v2

    .line 123
    .local v1, "m2":I
    sub-int v2, v1, v0

    add-int/lit8 v2, v2, 0x1

    return v2
.end method

.method private static ia5decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "ia5string"    # Ljava/lang/String;

    .line 185
    const-string v0, ""

    .line 186
    .local v0, "d":Ljava/lang/String;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 187
    add-int/lit8 v2, v1, -0x1

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "hexstr":Ljava/lang/String;
    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-char v3, v3

    .line 189
    .local v3, "c":C
    invoke-static {v3}, Lde/blinkt/openvpn/core/X509Utils;->isPrintableChar(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 191
    :cond_0
    const/4 v4, 0x1

    if-ne v1, v4, :cond_2

    const/16 v4, 0x12

    if-eq v3, v4, :cond_1

    const/16 v4, 0x1b

    if-ne v3, v4, :cond_2

    :cond_1
    goto :goto_1

    .line 194
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 186
    .end local v2    # "hexstr":Ljava/lang/String;
    .end local v3    # "c":C
    :goto_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 197
    .end local v1    # "i":I
    :cond_3
    return-object v0
.end method

.method public static isPrintableChar(C)Z
    .locals 2
    .param p0, "c"    # C

    .line 178
    invoke-static {p0}, Ljava/lang/Character$UnicodeBlock;->of(C)Ljava/lang/Character$UnicodeBlock;

    move-result-object v0

    .line 179
    .local v0, "block":Ljava/lang/Character$UnicodeBlock;
    invoke-static {p0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    sget-object v1, Ljava/lang/Character$UnicodeBlock;->SPECIALS:Ljava/lang/Character$UnicodeBlock;

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static readPemObjectFromFile(Ljava/lang/String;)Lorg/spongycastle/util/io/pem/PemObject;
    .locals 3
    .param p0, "keyfilename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnProfile;->isEmbedded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    new-instance v0, Ljava/io/StringReader;

    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnProfile;->getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .local v0, "inStream":Ljava/io/Reader;
    goto :goto_0

    .line 66
    .end local v0    # "inStream":Ljava/io/Reader;
    :cond_0
    new-instance v0, Ljava/io/FileReader;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 68
    .restart local v0    # "inStream":Ljava/io/Reader;
    :goto_0
    new-instance v1, Lorg/spongycastle/util/io/pem/PemReader;

    invoke-direct {v1, v0}, Lorg/spongycastle/util/io/pem/PemReader;-><init>(Ljava/io/Reader;)V

    .line 69
    .local v1, "pr":Lorg/spongycastle/util/io/pem/PemReader;
    invoke-virtual {v1}, Lorg/spongycastle/util/io/pem/PemReader;->readPemObject()Lorg/spongycastle/util/io/pem/PemObject;

    move-result-object v2

    .line 70
    .local v2, "r":Lorg/spongycastle/util/io/pem/PemObject;
    invoke-virtual {v1}, Lorg/spongycastle/util/io/pem/PemReader;->close()V

    .line 71
    return-object v2
.end method
