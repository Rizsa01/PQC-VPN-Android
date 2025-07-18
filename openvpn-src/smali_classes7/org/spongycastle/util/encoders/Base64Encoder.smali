.class public Lorg/spongycastle/util/encoders/Base64Encoder;
.super Ljava/lang/Object;
.source "Base64Encoder.java"

# interfaces
.implements Lorg/spongycastle/util/encoders/Encoder;


# instance fields
.field protected final decodingTable:[B

.field protected final encodingTable:[B

.field protected padding:B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    .line 30
    const/16 v0, 0x3d

    iput-byte v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    .line 35
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    .line 47
    invoke-virtual {p0}, Lorg/spongycastle/util/encoders/Base64Encoder;->initialiseDecodingTable()V

    .line 48
    return-void

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data
.end method

.method private decodeLastBlock(Ljava/io/OutputStream;CCCC)I
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 260
    iget-byte v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    if-ne p4, v0, :cond_0

    .line 262
    iget-object v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v0, v0, p2

    .line 263
    .local v0, "b1":B
    iget-object v1, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v1, v1, p3

    .line 265
    .local v1, "b2":B
    shl-int/lit8 v2, v0, 0x2

    shr-int/lit8 v3, v1, 0x4

    or-int/2addr v2, v3

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 267
    const/4 v2, 0x1

    return v2

    .line 269
    .end local v0    # "b1":B
    .end local v1    # "b2":B
    :cond_0
    iget-byte v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    if-ne p5, v0, :cond_1

    .line 271
    iget-object v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v0, v0, p2

    .line 272
    .restart local v0    # "b1":B
    iget-object v1, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v1, v1, p3

    .line 273
    .restart local v1    # "b2":B
    iget-object v2, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v2, v2, p4

    .line 275
    .local v2, "b3":B
    shl-int/lit8 v3, v0, 0x2

    shr-int/lit8 v4, v1, 0x4

    or-int/2addr v3, v4

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    .line 276
    shl-int/lit8 v3, v1, 0x4

    shr-int/lit8 v4, v2, 0x2

    or-int/2addr v3, v4

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write(I)V

    .line 278
    const/4 v3, 0x2

    return v3

    .line 282
    .end local v0    # "b1":B
    .end local v1    # "b2":B
    .end local v2    # "b3":B
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v0, v0, p2

    .line 283
    .restart local v0    # "b1":B
    iget-object v1, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v1, v1, p3

    .line 284
    .restart local v1    # "b2":B
    iget-object v2, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v2, v2, p4

    .line 285
    .restart local v2    # "b3":B
    iget-object v3, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    aget-byte v3, v3, p5

    .line 287
    .local v3, "b4":B
    shl-int/lit8 v4, v0, 0x2

    shr-int/lit8 v5, v1, 0x4

    or-int/2addr v4, v5

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 288
    shl-int/lit8 v4, v1, 0x4

    shr-int/lit8 v5, v2, 0x2

    or-int/2addr v4, v5

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 289
    shl-int/lit8 v4, v2, 0x6

    or-int/2addr v4, v3

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 291
    const/4 v4, 0x3

    return v4
.end method

.method private ignore(C)Z
    .locals 1
    .param p1, "c"    # C

    .line 119
    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0xd

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0x20

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private nextI(Ljava/lang/String;II)I
    .locals 1
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "finish"    # I

    .line 297
    nop

    :goto_0
    if-ge p2, p3, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-direct {p0, v0}, Lorg/spongycastle/util/encoders/Base64Encoder;->ignore(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 301
    :cond_0
    return p2
.end method

.method private nextI([BII)I
    .locals 1
    .param p1, "data"    # [B
    .param p2, "i"    # I
    .param p3, "finish"    # I

    .line 187
    nop

    :goto_0
    if-ge p2, p3, :cond_0

    aget-byte v0, p1, p2

    int-to-char v0, v0

    invoke-direct {p0, v0}, Lorg/spongycastle/util/encoders/Base64Encoder;->ignore(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 191
    :cond_0
    return p2
.end method


# virtual methods
.method public decode(Ljava/lang/String;Ljava/io/OutputStream;)I
    .locals 11
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    const/4 v0, 0x0

    .line 208
    .local v0, "length":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 210
    .local v1, "end":I
    :goto_0
    if-lez v1, :cond_1

    .line 212
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-direct {p0, v2}, Lorg/spongycastle/util/encoders/Base64Encoder;->ignore(C)Z

    move-result v2

    if-nez v2, :cond_0

    .line 214
    goto :goto_1

    .line 217
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 220
    :cond_1
    :goto_1
    const/4 v2, 0x0

    .line 221
    .local v2, "i":I
    add-int/lit8 v3, v1, -0x4

    .line 223
    .local v3, "finish":I
    invoke-direct {p0, p1, v2, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI(Ljava/lang/String;II)I

    move-result v2

    .line 225
    :goto_2
    if-ge v2, v3, :cond_2

    .line 227
    iget-object v4, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v5, v2, 0x1

    .end local v2    # "i":I
    .local v5, "i":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    aget-byte v2, v4, v2

    .line 229
    .local v2, "b1":B
    invoke-direct {p0, p1, v5, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI(Ljava/lang/String;II)I

    move-result v4

    .line 231
    .end local v5    # "i":I
    .local v4, "i":I
    iget-object v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v6, v4, 0x1

    .end local v4    # "i":I
    .local v6, "i":I
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    aget-byte v4, v5, v4

    .line 233
    .local v4, "b2":B
    invoke-direct {p0, p1, v6, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI(Ljava/lang/String;II)I

    move-result v5

    .line 235
    .end local v6    # "i":I
    .restart local v5    # "i":I
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v7, v5, 0x1

    .end local v5    # "i":I
    .local v7, "i":I
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aget-byte v5, v6, v5

    .line 237
    .local v5, "b3":B
    invoke-direct {p0, p1, v7, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI(Ljava/lang/String;II)I

    move-result v6

    .line 239
    .end local v7    # "i":I
    .restart local v6    # "i":I
    iget-object v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v8, v6, 0x1

    .end local v6    # "i":I
    .local v8, "i":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    aget-byte v6, v7, v6

    .line 241
    .local v6, "b4":B
    shl-int/lit8 v7, v2, 0x2

    shr-int/lit8 v9, v4, 0x4

    or-int/2addr v7, v9

    invoke-virtual {p2, v7}, Ljava/io/OutputStream;->write(I)V

    .line 242
    shl-int/lit8 v7, v4, 0x4

    shr-int/lit8 v9, v5, 0x2

    or-int/2addr v7, v9

    invoke-virtual {p2, v7}, Ljava/io/OutputStream;->write(I)V

    .line 243
    shl-int/lit8 v7, v5, 0x6

    or-int/2addr v7, v6

    invoke-virtual {p2, v7}, Ljava/io/OutputStream;->write(I)V

    .line 245
    add-int/lit8 v0, v0, 0x3

    .line 247
    invoke-direct {p0, p1, v8, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI(Ljava/lang/String;II)I

    move-result v7

    move v2, v7

    .end local v8    # "i":I
    .restart local v7    # "i":I
    goto :goto_2

    .line 250
    .end local v4    # "b2":B
    .end local v5    # "b3":B
    .end local v6    # "b4":B
    .end local v7    # "i":I
    .local v2, "i":I
    :cond_2
    add-int/lit8 v4, v1, -0x4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    add-int/lit8 v4, v1, -0x3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    add-int/lit8 v4, v1, -0x2

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    add-int/lit8 v4, v1, -0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v10

    move-object v5, p0

    move-object v6, p2

    .end local p2    # "out":Ljava/io/OutputStream;
    .local v6, "out":Ljava/io/OutputStream;
    invoke-direct/range {v5 .. v10}, Lorg/spongycastle/util/encoders/Base64Encoder;->decodeLastBlock(Ljava/io/OutputStream;CCCC)I

    move-result p2

    add-int/2addr v0, p2

    .line 252
    return v0
.end method

.method public decode([BIILjava/io/OutputStream;)I
    .locals 11
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "length"    # I
    .param p4, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    const/4 v0, 0x0

    .line 138
    .local v0, "outLen":I
    add-int v1, p2, p3

    .line 140
    .local v1, "end":I
    :goto_0
    if-le v1, p2, :cond_1

    .line 142
    add-int/lit8 v2, v1, -0x1

    aget-byte v2, p1, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/spongycastle/util/encoders/Base64Encoder;->ignore(C)Z

    move-result v2

    if-nez v2, :cond_0

    .line 144
    goto :goto_1

    .line 147
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 150
    :cond_1
    :goto_1
    move v2, p2

    .line 151
    .local v2, "i":I
    add-int/lit8 v3, v1, -0x4

    .line 153
    .local v3, "finish":I
    invoke-direct {p0, p1, v2, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI([BII)I

    move-result v2

    .line 155
    :goto_2
    if-ge v2, v3, :cond_2

    .line 157
    iget-object v4, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v5, v2, 0x1

    .end local v2    # "i":I
    .local v5, "i":I
    aget-byte v2, p1, v2

    aget-byte v2, v4, v2

    .line 159
    .local v2, "b1":B
    invoke-direct {p0, p1, v5, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI([BII)I

    move-result v4

    .line 161
    .end local v5    # "i":I
    .local v4, "i":I
    iget-object v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v6, v4, 0x1

    .end local v4    # "i":I
    .local v6, "i":I
    aget-byte v4, p1, v4

    aget-byte v4, v5, v4

    .line 163
    .local v4, "b2":B
    invoke-direct {p0, p1, v6, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI([BII)I

    move-result v5

    .line 165
    .end local v6    # "i":I
    .restart local v5    # "i":I
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v7, v5, 0x1

    .end local v5    # "i":I
    .local v7, "i":I
    aget-byte v5, p1, v5

    aget-byte v5, v6, v5

    .line 167
    .local v5, "b3":B
    invoke-direct {p0, p1, v7, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI([BII)I

    move-result v6

    .line 169
    .end local v7    # "i":I
    .restart local v6    # "i":I
    iget-object v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    add-int/lit8 v8, v6, 0x1

    .end local v6    # "i":I
    .local v8, "i":I
    aget-byte v6, p1, v6

    aget-byte v6, v7, v6

    .line 171
    .local v6, "b4":B
    shl-int/lit8 v7, v2, 0x2

    shr-int/lit8 v9, v4, 0x4

    or-int/2addr v7, v9

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 172
    shl-int/lit8 v7, v4, 0x4

    shr-int/lit8 v9, v5, 0x2

    or-int/2addr v7, v9

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 173
    shl-int/lit8 v7, v5, 0x6

    or-int/2addr v7, v6

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 175
    add-int/lit8 v0, v0, 0x3

    .line 177
    invoke-direct {p0, p1, v8, v3}, Lorg/spongycastle/util/encoders/Base64Encoder;->nextI([BII)I

    move-result v7

    move v2, v7

    .end local v8    # "i":I
    .restart local v7    # "i":I
    goto :goto_2

    .line 180
    .end local v4    # "b2":B
    .end local v5    # "b3":B
    .end local v6    # "b4":B
    .end local v7    # "i":I
    .local v2, "i":I
    :cond_2
    add-int/lit8 v4, v1, -0x4

    aget-byte v4, p1, v4

    int-to-char v7, v4

    add-int/lit8 v4, v1, -0x3

    aget-byte v4, p1, v4

    int-to-char v8, v4

    add-int/lit8 v4, v1, -0x2

    aget-byte v4, p1, v4

    int-to-char v9, v4

    add-int/lit8 v4, v1, -0x1

    aget-byte v4, p1, v4

    int-to-char v10, v4

    move-object v5, p0

    move-object v6, p4

    .end local p4    # "out":Ljava/io/OutputStream;
    .local v6, "out":Ljava/io/OutputStream;
    invoke-direct/range {v5 .. v10}, Lorg/spongycastle/util/encoders/Base64Encoder;->decodeLastBlock(Ljava/io/OutputStream;CCCC)I

    move-result p4

    add-int/2addr v0, p4

    .line 182
    return v0
.end method

.method public encode([BIILjava/io/OutputStream;)I
    .locals 9
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "length"    # I
    .param p4, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    rem-int/lit8 v0, p3, 0x3

    .line 63
    .local v0, "modulus":I
    sub-int v1, p3, v0

    .line 66
    .local v1, "dataLength":I
    move v2, p2

    .local v2, "i":I
    :goto_0
    add-int v3, p2, v1

    if-ge v2, v3, :cond_0

    .line 68
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    .line 69
    .local v3, "a1":I
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    .line 70
    .local v4, "a2":I
    add-int/lit8 v5, v2, 0x2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    .line 72
    .local v5, "a3":I
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    ushr-int/lit8 v7, v3, 0x2

    and-int/lit8 v7, v7, 0x3f

    aget-byte v6, v6, v7

    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 73
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    shl-int/lit8 v7, v3, 0x4

    ushr-int/lit8 v8, v4, 0x4

    or-int/2addr v7, v8

    and-int/lit8 v7, v7, 0x3f

    aget-byte v6, v6, v7

    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 74
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    shl-int/lit8 v7, v4, 0x2

    ushr-int/lit8 v8, v5, 0x6

    or-int/2addr v7, v8

    and-int/lit8 v7, v7, 0x3f

    aget-byte v6, v6, v7

    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 75
    iget-object v6, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    and-int/lit8 v7, v5, 0x3f

    aget-byte v6, v6, v7

    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 66
    add-int/lit8 v2, v2, 0x3

    goto :goto_0

    .line 84
    .end local v2    # "i":I
    .end local v3    # "a1":I
    .end local v4    # "a2":I
    .end local v5    # "a3":I
    :cond_0
    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 99
    :pswitch_0
    add-int v2, p2, v1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    .line 100
    .local v2, "d1":I
    add-int v3, p2, v1

    add-int/lit8 v3, v3, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    .line 102
    .local v3, "d2":I
    ushr-int/lit8 v4, v2, 0x2

    and-int/lit8 v4, v4, 0x3f

    .line 103
    .local v4, "b1":I
    shl-int/lit8 v5, v2, 0x4

    ushr-int/lit8 v6, v3, 0x4

    or-int/2addr v5, v6

    and-int/lit8 v5, v5, 0x3f

    .line 104
    .local v5, "b2":I
    shl-int/lit8 v6, v3, 0x2

    and-int/lit8 v6, v6, 0x3f

    .line 106
    .local v6, "b3":I
    iget-object v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v7, v7, v4

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 107
    iget-object v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v7, v7, v5

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 108
    iget-object v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v7, v7, v6

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    .line 109
    iget-byte v7, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    invoke-virtual {p4, v7}, Ljava/io/OutputStream;->write(I)V

    goto :goto_1

    .line 89
    .end local v2    # "d1":I
    .end local v3    # "d2":I
    .end local v4    # "b1":I
    .end local v5    # "b2":I
    .end local v6    # "b3":I
    :pswitch_1
    add-int v2, p2, v1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    .line 90
    .restart local v2    # "d1":I
    ushr-int/lit8 v3, v2, 0x2

    and-int/lit8 v3, v3, 0x3f

    .line 91
    .local v3, "b1":I
    shl-int/lit8 v4, v2, 0x4

    and-int/lit8 v4, v4, 0x3f

    .line 93
    .local v4, "b2":I
    iget-object v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v5, v5, v3

    invoke-virtual {p4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 94
    iget-object v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v5, v5, v4

    invoke-virtual {p4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 95
    iget-byte v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    invoke-virtual {p4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 96
    iget-byte v5, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->padding:B

    invoke-virtual {p4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 97
    goto :goto_1

    .line 87
    .end local v2    # "d1":I
    .end local v3    # "b1":I
    .end local v4    # "b2":I
    :pswitch_2
    nop

    .line 113
    :goto_1
    div-int/lit8 v2, v1, 0x3

    const/4 v3, 0x4

    mul-int/2addr v2, v3

    if-nez v0, :cond_1

    const/4 v3, 0x0

    :cond_1
    add-int/2addr v2, v3

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected initialiseDecodingTable()V
    .locals 4

    .line 39
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 41
    iget-object v1, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->decodingTable:[B

    iget-object v2, p0, Lorg/spongycastle/util/encoders/Base64Encoder;->encodingTable:[B

    aget-byte v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 43
    .end local v0    # "i":I
    :cond_0
    return-void
.end method
