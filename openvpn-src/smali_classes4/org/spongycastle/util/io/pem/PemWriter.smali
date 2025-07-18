.class public Lorg/spongycastle/util/io/pem/PemWriter;
.super Ljava/io/BufferedWriter;
.source "PemWriter.java"


# static fields
.field private static final LINE_LENGTH:I = 0x40


# instance fields
.field private buf:[C

.field private final nlLength:I


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 2
    .param p1, "out"    # Ljava/io/Writer;

    .line 34
    invoke-direct {p0, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 25
    const/16 v0, 0x40

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/spongycastle/util/io/pem/PemWriter;->buf:[C

    .line 36
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "nl":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    goto :goto_0

    .line 43
    :cond_0
    const/4 v1, 0x2

    iput v1, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    .line 45
    :goto_0
    return-void
.end method

.method private writeEncoded([B)V
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    invoke-static {p1}, Lorg/spongycastle/util/encoders/Base64;->encode([B)[B

    move-result-object p1

    .line 110
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_2

    .line 112
    const/4 v1, 0x0

    .line 114
    .local v1, "index":I
    :goto_1
    iget-object v2, p0, Lorg/spongycastle/util/io/pem/PemWriter;->buf:[C

    array-length v2, v2

    if-eq v1, v2, :cond_1

    .line 116
    add-int v2, v0, v1

    array-length v3, p1

    if-lt v2, v3, :cond_0

    .line 118
    goto :goto_2

    .line 120
    :cond_0
    iget-object v2, p0, Lorg/spongycastle/util/io/pem/PemWriter;->buf:[C

    add-int v3, v0, v1

    aget-byte v3, p1, v3

    int-to-char v3, v3

    aput-char v3, v2, v1

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 123
    :cond_1
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/util/io/pem/PemWriter;->buf:[C

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v1}, Lorg/spongycastle/util/io/pem/PemWriter;->write([CII)V

    .line 124
    invoke-virtual {p0}, Lorg/spongycastle/util/io/pem/PemWriter;->newLine()V

    .line 110
    .end local v1    # "index":I
    iget-object v1, p0, Lorg/spongycastle/util/io/pem/PemWriter;->buf:[C

    array-length v1, v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 126
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private writePostEncapsulationBoundary(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----END "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/util/io/pem/PemWriter;->write(Ljava/lang/String;)V

    .line 141
    invoke-virtual {p0}, Lorg/spongycastle/util/io/pem/PemWriter;->newLine()V

    .line 142
    return-void
.end method

.method private writePreEncapsulationBoundary(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-----BEGIN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-----"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/util/io/pem/PemWriter;->write(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p0}, Lorg/spongycastle/util/io/pem/PemWriter;->newLine()V

    .line 134
    return-void
.end method


# virtual methods
.method public getOutputSize(Lorg/spongycastle/util/io/pem/PemObject;)I
    .locals 5
    .param p1, "obj"    # Lorg/spongycastle/util/io/pem/PemObject;

    .line 57
    invoke-virtual {p1}, Lorg/spongycastle/util/io/pem/PemObject;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    iget v1, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x6

    add-int/lit8 v0, v0, 0x4

    .line 59
    .local v0, "size":I
    invoke-virtual {p1}, Lorg/spongycastle/util/io/pem/PemObject;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 61
    invoke-virtual {p1}, Lorg/spongycastle/util/io/pem/PemObject;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 63
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/util/io/pem/PemHeader;

    .line 65
    .local v2, "hdr":Lorg/spongycastle/util/io/pem/PemHeader;
    invoke-virtual {v2}, Lorg/spongycastle/util/io/pem/PemHeader;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, ": "

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {v2}, Lorg/spongycastle/util/io/pem/PemHeader;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    iget v4, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    add-int/2addr v3, v4

    add-int/2addr v0, v3

    .line 66
    .end local v2    # "hdr":Lorg/spongycastle/util/io/pem/PemHeader;
    goto :goto_0

    .line 68
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_0
    iget v1, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    add-int/2addr v0, v1

    .line 72
    :cond_1
    invoke-virtual {p1}, Lorg/spongycastle/util/io/pem/PemObject;->getContent()[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, 0x2

    div-int/lit8 v1, v1, 0x3

    mul-int/lit8 v1, v1, 0x4

    .line 74
    .local v1, "dataLen":I
    add-int/lit8 v2, v1, 0x40

    add-int/lit8 v2, v2, -0x1

    div-int/lit8 v2, v2, 0x40

    iget v3, p0, Lorg/spongycastle/util/io/pem/PemWriter;->nlLength:I

    mul-int/2addr v2, v3

    add-int/2addr v2, v1

    add-int/2addr v0, v2

    .line 76
    return v0
.end method

.method public writeObject(Lorg/spongycastle/util/io/pem/PemObjectGenerator;)V
    .locals 4
    .param p1, "objGen"    # Lorg/spongycastle/util/io/pem/PemObjectGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    invoke-interface {p1}, Lorg/spongycastle/util/io/pem/PemObjectGenerator;->generate()Lorg/spongycastle/util/io/pem/PemObject;

    move-result-object v0

    .line 84
    .local v0, "obj":Lorg/spongycastle/util/io/pem/PemObject;
    invoke-virtual {v0}, Lorg/spongycastle/util/io/pem/PemObject;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/util/io/pem/PemWriter;->writePreEncapsulationBoundary(Ljava/lang/String;)V

    .line 86
    invoke-virtual {v0}, Lorg/spongycastle/util/io/pem/PemObject;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 88
    invoke-virtual {v0}, Lorg/spongycastle/util/io/pem/PemObject;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/util/io/pem/PemHeader;

    .line 92
    .local v2, "hdr":Lorg/spongycastle/util/io/pem/PemHeader;
    invoke-virtual {v2}, Lorg/spongycastle/util/io/pem/PemHeader;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/spongycastle/util/io/pem/PemWriter;->write(Ljava/lang/String;)V

    .line 93
    const-string v3, ": "

    invoke-virtual {p0, v3}, Lorg/spongycastle/util/io/pem/PemWriter;->write(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v2}, Lorg/spongycastle/util/io/pem/PemHeader;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/spongycastle/util/io/pem/PemWriter;->write(Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0}, Lorg/spongycastle/util/io/pem/PemWriter;->newLine()V

    .line 96
    .end local v2    # "hdr":Lorg/spongycastle/util/io/pem/PemHeader;
    goto :goto_0

    .line 98
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/util/io/pem/PemWriter;->newLine()V

    .line 101
    :cond_1
    invoke-virtual {v0}, Lorg/spongycastle/util/io/pem/PemObject;->getContent()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/util/io/pem/PemWriter;->writeEncoded([B)V

    .line 102
    invoke-virtual {v0}, Lorg/spongycastle/util/io/pem/PemObject;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/util/io/pem/PemWriter;->writePostEncapsulationBoundary(Ljava/lang/String;)V

    .line 103
    return-void
.end method
