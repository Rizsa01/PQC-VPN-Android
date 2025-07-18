.class public Lde/blinkt/openvpn/core/LogItem;
.super Ljava/lang/Object;
.source "LogItem.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/LogItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private logtime:J

.field private mArgs:[Ljava/lang/Object;

.field mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field private mMessage:Ljava/lang/String;

.field private mRessourceId:I

.field private mVerbosityLevel:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 247
    new-instance v0, Lde/blinkt/openvpn/core/LogItem$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/LogItem$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/LogItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "ressourceId"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 53
    iput p1, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    .line 54
    iput-object p2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 239
    const-class v0, Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readArray(Ljava/lang/ClassLoader;)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 240
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 241
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    .line 242
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->getEnumByValue(I)Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 243
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 244
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 245
    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I)V
    .locals 2
    .param p1, "loglevel"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "ressourceId"    # I

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 277
    iput p2, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    .line 278
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 279
    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;ILjava/lang/String;)V
    .locals 2
    .param p1, "level"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "verblevel"    # I
    .param p3, "message"    # Ljava/lang/String;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 66
    iput-object p3, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 67
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 68
    iput p2, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 69
    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;ILjava/lang/String;J)V
    .locals 2
    .param p1, "level"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "verblevel"    # I
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "eventLogTime"    # J

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 58
    iput-object p3, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 59
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 60
    iput p2, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 61
    iput-wide p4, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 62
    return-void
.end method

.method public varargs constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "loglevel"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "ressourceId"    # I
    .param p3, "args"    # [Ljava/lang/Object;

    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 259
    iput p2, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    .line 260
    iput-object p3, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 261
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 262
    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V
    .locals 2
    .param p1, "loglevel"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "msg"    # Ljava/lang/String;

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 266
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 267
    iput-object p2, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 268
    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;J)V
    .locals 2
    .param p1, "loglevel"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "logEventTime"    # J

    .line 270
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 271
    iput-object p1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 272
    iput-object p2, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 273
    iput-wide p3, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 274
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 9
    .param p1, "in"    # [B
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 45
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 48
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iput-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 50
    const/4 v1, -0x1

    iput v1, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 156
    const/4 v1, 0x0

    invoke-static {p1, v1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 157
    .local v1, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    .line 158
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    iput-wide v2, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    .line 159
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    iput v2, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    .line 160
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->getEnumByValue(I)Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    move-result-object v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 161
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    iput v2, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    .line 162
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 163
    .local v2, "len":I
    if-nez v2, :cond_0

    .line 164
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-gt v2, v3, :cond_5

    .line 168
    new-array v3, v2, [B

    .line 169
    .local v3, "utf8bytes":[B
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 170
    new-instance v4, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v3, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v4, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 172
    .end local v3    # "utf8bytes":[B
    :goto_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 173
    .local v3, "numArgs":I
    const/16 v4, 0x1e

    if-gt v3, v4, :cond_4

    .line 176
    if-nez v3, :cond_1

    .line 177
    iput-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    goto :goto_3

    .line 179
    :cond_1
    new-array v4, v3, [Ljava/lang/Object;

    iput-object v4, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    .line 180
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v3, :cond_2

    .line 181
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getChar()C

    move-result v5

    .line 182
    .local v5, "type":C
    sparse-switch v5, :sswitch_data_0

    .line 202
    new-instance v0, Ljava/io/UnsupportedEncodingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown format type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :sswitch_0
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-direct {p0, v1}, Lde/blinkt/openvpn/core/LogItem;->unmarschalString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    .line 185
    goto :goto_2

    .line 196
    :sswitch_1
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v4

    .line 197
    goto :goto_2

    .line 187
    :sswitch_2
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    .line 188
    goto :goto_2

    .line 193
    :sswitch_3
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v4

    .line 194
    goto :goto_2

    .line 190
    :sswitch_4
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v6, v4

    .line 191
    goto :goto_2

    .line 199
    :sswitch_5
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    aput-object v0, v6, v4

    .line 200
    nop

    .line 180
    .end local v5    # "type":C
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 206
    .end local v4    # "i":I
    :cond_2
    :goto_3
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_3

    .line 208
    return-void

    .line 207
    :cond_3
    new-instance v0, Ljava/io/UnsupportedEncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes left after unmarshaling everything"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v4, "Too many arguments for Logitem to unmarschal"

    invoke-direct {v0, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    .end local v3    # "numArgs":I
    :cond_5
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "String length "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is bigger than remaining bytes "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_5
        0x64 -> :sswitch_4
        0x66 -> :sswitch_3
        0x69 -> :sswitch_2
        0x6c -> :sswitch_1
        0x73 -> :sswitch_0
    .end sparse-switch
.end method

.method private getMobileInfoString(Landroid/content/Context;)Ljava/lang/String;
    .locals 20
    .param p1, "c"    # Landroid/content/Context;

    .line 353
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 354
    const-string v3, "error getting package signature"

    .line 356
    .local v3, "apksign":Ljava/lang/String;
    const-string v4, "error getting version"

    .line 359
    .local v4, "version":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x40

    invoke-virtual {v0, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v5, 0x0

    aget-object v0, v0, v5

    .line 360
    .local v0, "raw":Landroid/content/pm/Signature;
    const-string v6, "X.509"

    invoke-static {v6}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v6

    .line 361
    .local v6, "cf":Ljava/security/cert/CertificateFactory;
    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v7

    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 362
    .local v7, "cert":Ljava/security/cert/X509Certificate;
    const-string v8, "SHA-1"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 363
    .local v8, "md":Ljava/security/MessageDigest;
    const-string v9, "SHA-256"

    invoke-static {v9}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 365
    .local v9, "mdsha256":Ljava/security/MessageDigest;
    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v10

    .line 366
    .local v10, "der":[B
    invoke-virtual {v8, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 367
    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v11

    .line 369
    .local v11, "digest":[B
    invoke-virtual {v9, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 370
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v12

    .line 372
    .local v12, "digestSha256":[B
    sget-object v13, Lde/blinkt/openvpn/core/VpnStatus;->officalkey:[B

    invoke-static {v11, v13}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_6

    if-eqz v13, :cond_0

    .line 373
    const v13, 0x7f110205

    :try_start_1
    invoke-virtual {v2, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0

    move-object/from16 v17, v0

    move-object v3, v13

    .end local v3    # "apksign":Ljava/lang/String;
    .local v13, "apksign":Ljava/lang/String;
    goto/16 :goto_1

    .line 393
    .end local v0    # "raw":Landroid/content/pm/Signature;
    .end local v6    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v7    # "cert":Ljava/security/cert/X509Certificate;
    .end local v8    # "md":Ljava/security/MessageDigest;
    .end local v9    # "mdsha256":Ljava/security/MessageDigest;
    .end local v10    # "der":[B
    .end local v11    # "digest":[B
    .end local v12    # "digestSha256":[B
    .end local v13    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto/16 :goto_4

    :catch_1
    move-exception v0

    goto/16 :goto_4

    :catch_2
    move-exception v0

    goto/16 :goto_4

    .line 374
    .restart local v0    # "raw":Landroid/content/pm/Signature;
    .restart local v6    # "cf":Ljava/security/cert/CertificateFactory;
    .restart local v7    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v8    # "md":Ljava/security/MessageDigest;
    .restart local v9    # "mdsha256":Ljava/security/MessageDigest;
    .restart local v10    # "der":[B
    .restart local v11    # "digest":[B
    .restart local v12    # "digestSha256":[B
    :cond_0
    :try_start_2
    sget-object v13, Lde/blinkt/openvpn/core/VpnStatus;->officaldebugkey:[B

    invoke-static {v11, v13}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_6

    if-eqz v13, :cond_1

    .line 375
    const v13, 0x7f1100c8

    :try_start_3
    invoke-virtual {v2, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v17, v0

    move-object v3, v13

    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v13    # "apksign":Ljava/lang/String;
    goto/16 :goto_1

    .line 376
    .end local v13    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :cond_1
    :try_start_4
    sget-object v13, Lde/blinkt/openvpn/core/VpnStatus;->amazonkey:[B

    invoke-static {v11, v13}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_6

    if-eqz v13, :cond_2

    .line 377
    :try_start_5
    const-string v13, "amazon version"
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_0

    move-object/from16 v17, v0

    move-object v3, v13

    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v13    # "apksign":Ljava/lang/String;
    goto/16 :goto_1

    .line 378
    .end local v13    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :cond_2
    :try_start_6
    sget-object v13, Lde/blinkt/openvpn/core/VpnStatus;->fdroidkey:[B

    invoke-static {v11, v13}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13
    :try_end_6
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_6

    if-eqz v13, :cond_3

    .line 379
    :try_start_7
    const-string v13, "F-Droid built and signed version"
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_0

    move-object/from16 v17, v0

    move-object v3, v13

    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v13    # "apksign":Ljava/lang/String;
    goto :goto_1

    .line 380
    .end local v13    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :cond_3
    :try_start_8
    sget-object v13, Lde/blinkt/openvpn/core/VpnStatus;->officialO2Key:[B

    invoke-static {v12, v13}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_8} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_8 .. :try_end_8} :catch_6

    if-eqz v13, :cond_4

    .line 381
    const v13, 0x7f110206

    :try_start_9
    invoke-virtual {v2, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13
    :try_end_9
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_9 .. :try_end_9} :catch_0

    move-object/from16 v17, v0

    move-object v3, v13

    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v13    # "apksign":Ljava/lang/String;
    goto :goto_1

    .line 383
    .end local v13    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :cond_4
    :try_start_a
    new-instance v13, Ljava/util/Vector;

    invoke-direct {v13}, Ljava/util/Vector;-><init>()V

    .line 384
    .local v13, "hexnums":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    array-length v14, v12

    move v15, v5

    :goto_0
    if-ge v15, v14, :cond_5

    aget-byte v16, v12, v15

    .line 385
    .local v16, "b":B
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v17, v0

    .end local v0    # "raw":Landroid/content/pm/Signature;
    .local v17, "raw":Landroid/content/pm/Signature;
    const-string v0, "%02x"

    invoke-static/range {v16 .. v16}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v18
    :try_end_a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_a} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_a .. :try_end_a} :catch_6

    move-object/from16 v19, v3

    .end local v3    # "apksign":Ljava/lang/String;
    .local v19, "apksign":Ljava/lang/String;
    :try_start_b
    filled-new-array/range {v18 .. v18}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v5, v0, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 384
    nop

    .end local v16    # "b":B
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, v17

    move-object/from16 v3, v19

    const/4 v5, 0x0

    goto :goto_0

    .line 387
    .end local v17    # "raw":Landroid/content/pm/Signature;
    .end local v19    # "apksign":Ljava/lang/String;
    .restart local v0    # "raw":Landroid/content/pm/Signature;
    .restart local v3    # "apksign":Ljava/lang/String;
    :cond_5
    move-object/from16 v17, v0

    move-object/from16 v19, v3

    .end local v0    # "raw":Landroid/content/pm/Signature;
    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v17    # "raw":Landroid/content/pm/Signature;
    .restart local v19    # "apksign":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, ":"

    invoke-static {v3, v13}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    const v3, 0x7f11006f

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b .. :try_end_b} :catch_5
    .catch Ljava/security/cert/CertificateException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_b .. :try_end_b} :catch_3

    move-object v3, v0

    .line 390
    .end local v13    # "hexnums":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v19    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :goto_1
    :try_start_c
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v13, 0x0

    invoke-virtual {v0, v5, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 391
    .local v0, "packageinfo":Landroid/content/pm/PackageInfo;
    iget-object v5, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_c .. :try_end_c} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_c .. :try_end_c} :catch_0

    move-object v4, v5

    .line 395
    .end local v0    # "packageinfo":Landroid/content/pm/PackageInfo;
    .end local v6    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v7    # "cert":Ljava/security/cert/X509Certificate;
    .end local v8    # "md":Ljava/security/MessageDigest;
    .end local v9    # "mdsha256":Ljava/security/MessageDigest;
    .end local v10    # "der":[B
    .end local v11    # "digest":[B
    .end local v12    # "digestSha256":[B
    .end local v17    # "raw":Landroid/content/pm/Signature;
    goto :goto_4

    .line 393
    .end local v3    # "apksign":Ljava/lang/String;
    .restart local v19    # "apksign":Ljava/lang/String;
    :catch_3
    move-exception v0

    goto :goto_2

    :catch_4
    move-exception v0

    goto :goto_2

    :catch_5
    move-exception v0

    :goto_2
    move-object/from16 v3, v19

    goto :goto_4

    .end local v19    # "apksign":Ljava/lang/String;
    .restart local v3    # "apksign":Ljava/lang/String;
    :catch_6
    move-exception v0

    goto :goto_3

    :catch_7
    move-exception v0

    goto :goto_3

    :catch_8
    move-exception v0

    :goto_3
    move-object/from16 v19, v3

    .line 397
    :goto_4
    iget-object v0, v1, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    iget-object v5, v1, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    array-length v5, v5

    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    .line 398
    .local v0, "argsext":[Ljava/lang/Object;
    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aput-object v3, v0, v5

    .line 399
    array-length v5, v0

    add-int/lit8 v5, v5, -0x2

    aput-object v4, v0, v5

    .line 401
    const v5, 0x7f1101a6

    invoke-virtual {v2, v5, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 5
    .param p0, "delimiter"    # Ljava/lang/CharSequence;
    .param p1, "tokens"    # [Ljava/lang/Object;

    .line 326
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 328
    .local v1, "firstTime":Z
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, p1, v3

    .line 329
    .local v4, "token":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 330
    const/4 v1, 0x0

    goto :goto_1

    .line 332
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 334
    :goto_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 328
    .end local v4    # "token":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 336
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private marschalString(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 211
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 213
    .local v0, "utf8bytes":[B
    const/16 v1, 0xd

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    .line 215
    .local v1, "elipse":[B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    add-int/lit8 v2, v2, -0x80

    const/16 v3, 0x2000

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 217
    .local v2, "maxStringLength":I
    array-length v3, v0

    if-le v3, v2, :cond_0

    .line 219
    array-length v3, v1

    add-int/2addr v3, v2

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 220
    const/4 v3, 0x0

    invoke-virtual {p2, v0, v3, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 221
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 225
    :cond_0
    array-length v3, v0

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 226
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 228
    :goto_0
    return-void

    nop

    :array_0
    .array-data 1
        0x2et
        0x2et
        0x2et
        0x5bt
        0x74t
        0x6ft
        0x6ft
        0x20t
        0x6ct
        0x6ft
        0x6et
        0x67t
        0x5dt
    .end array-data
.end method

.method private unmarschalString(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 4
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 231
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 232
    .local v0, "len":I
    new-array v1, v0, [B

    .line 233
    .local v1, "utf8bytes":[B
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 234
    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v2
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 90
    instance-of v0, p1, Lde/blinkt/openvpn/core/LogItem;

    if-nez v0, :cond_0

    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 92
    :cond_0
    move-object v0, p1

    check-cast v0, Lde/blinkt/openvpn/core/LogItem;

    .line 94
    .local v0, "other":Lde/blinkt/openvpn/core/LogItem;
    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    iget-object v2, v0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, v0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    iget-object v2, v0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    if-eq v1, v2, :cond_2

    :cond_1
    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    iget-object v2, v0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    .line 96
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_2
    iget v1, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    iget v2, v0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    if-ne v1, v2, :cond_5

    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    if-nez v1, :cond_3

    iget-object v1, v0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    if-eq v1, v2, :cond_4

    :cond_3
    iget-object v1, v0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 99
    invoke-virtual {v1, v2}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    iget v1, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    iget v2, v0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    if-ne v1, v2, :cond_5

    iget-wide v1, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    iget-wide v3, v0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_5

    const/4 v1, 0x1

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    .line 94
    :goto_0
    return v1
.end method

.method public getLogLevel()Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .locals 1

    .line 341
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0
.end method

.method public getLogtime()J
    .locals 2

    .line 406
    iget-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    return-wide v0
.end method

.method public getMarschaledBytes()[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/nio/BufferOverflowException;
        }
    .end annotation

    .line 105
    const/16 v0, 0x4000

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 108
    .local v0, "bb":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 109
    iget-wide v2, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 110
    iget v2, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 111
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->getInt()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 112
    iget v2, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 113
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    invoke-direct {p0, v2, v0}, Lde/blinkt/openvpn/core/LogItem;->marschalString(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    goto :goto_1

    .line 114
    :cond_1
    :goto_0
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 118
    :goto_1
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    if-eqz v2, :cond_9

    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    array-length v2, v2

    if-nez v2, :cond_2

    goto/16 :goto_4

    .line 121
    :cond_2
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    array-length v2, v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 122
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    array-length v3, v2

    :goto_2
    if-ge v1, v3, :cond_a

    aget-object v4, v2, v1

    .line 123
    .local v4, "o":Ljava/lang/Object;
    instance-of v5, v4, Ljava/lang/String;

    const/16 v6, 0x73

    if-eqz v5, :cond_3

    .line 124
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 125
    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5, v0}, Lde/blinkt/openvpn/core/LogItem;->marschalString(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    goto/16 :goto_3

    .line 126
    :cond_3
    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_4

    .line 127
    const/16 v5, 0x69

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 128
    move-object v5, v4

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 129
    :cond_4
    instance-of v5, v4, Ljava/lang/Float;

    if-eqz v5, :cond_5

    .line 130
    const/16 v5, 0x66

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 131
    move-object v5, v4

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 132
    :cond_5
    instance-of v5, v4, Ljava/lang/Double;

    if-eqz v5, :cond_6

    .line 133
    const/16 v5, 0x64

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 134
    move-object v5, v4

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 135
    :cond_6
    instance-of v5, v4, Ljava/lang/Long;

    if-eqz v5, :cond_7

    .line 136
    const/16 v5, 0x6c

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 137
    move-object v5, v4

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 138
    :cond_7
    if-nez v4, :cond_8

    .line 139
    const/16 v5, 0x30

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 141
    :cond_8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown object for LogItem marschaling "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 143
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v0}, Lde/blinkt/openvpn/core/LogItem;->marschalString(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 122
    .end local v4    # "o":Ljava/lang/Object;
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    .line 119
    :cond_9
    :goto_4
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 149
    :cond_a
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 150
    .local v1, "pos":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 151
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    return-object v2
.end method

.method public getString(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "c"    # Landroid/content/Context;

    .line 283
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 284
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/util/FormatFlagsConversionMismatchException; {:try_start_0 .. :try_end_0} :catch_2

    return-object v0

    .line 286
    :cond_0
    if-eqz p1, :cond_3

    .line 288
    :try_start_1
    iget v1, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    const v2, 0x7f1101a6

    if-ne v1, v2, :cond_1

    .line 289
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/LogItem;->getMobileInfoString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 290
    :cond_1
    iget-object v1, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    if-nez v1, :cond_2

    .line 291
    iget v1, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/util/FormatFlagsConversionMismatchException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v0

    .line 294
    :cond_2
    :try_start_2
    iget v1, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/util/MissingFormatArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/util/FormatFlagsConversionMismatchException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v0

    .line 295
    :catch_0
    move-exception v1

    .line 296
    .local v1, "ie":Ljava/util/MissingFormatArgumentException;
    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ERROR MISSING ARGUMENT("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/MissingFormatArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/util/FormatFlagsConversionMismatchException; {:try_start_3 .. :try_end_3} :catch_2

    return-object v0

    .line 298
    .end local v1    # "ie":Ljava/util/MissingFormatArgumentException;
    :catch_1
    move-exception v1

    .line 299
    .local v1, "re":Landroid/content/res/Resources$NotFoundException;
    :try_start_4
    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 302
    .end local v1    # "re":Landroid/content/res/Resources$NotFoundException;
    :cond_3
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "Log (no context) resid %d"

    iget v3, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "str":Ljava/lang/String;
    iget-object v2, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    if-eqz v2, :cond_4

    .line 304
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "|"

    iget-object v4, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-static {v3, v4}, Lde/blinkt/openvpn/core/LogItem;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/util/UnknownFormatConversionException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/util/FormatFlagsConversionMismatchException; {:try_start_4 .. :try_end_4} :catch_2

    move-object v1, v0

    .line 306
    :cond_4
    return-object v1

    .line 314
    .end local v1    # "str":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 315
    .local v1, "e":Ljava/util/FormatFlagsConversionMismatchException;
    if-eqz p1, :cond_5

    .line 316
    new-instance v2, Ljava/util/FormatFlagsConversionMismatchException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/util/FormatFlagsConversionMismatchException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/util/FormatFlagsConversionMismatchException;->getConversion()C

    move-result v3

    invoke-direct {v2, v0, v3}, Ljava/util/FormatFlagsConversionMismatchException;-><init>(Ljava/lang/String;C)V

    throw v2

    .line 318
    :cond_5
    throw v1

    .line 309
    .end local v1    # "e":Ljava/util/FormatFlagsConversionMismatchException;
    :catch_3
    move-exception v1

    .line 310
    .local v1, "e":Ljava/util/UnknownFormatConversionException;
    if-eqz p1, :cond_6

    .line 311
    new-instance v2, Ljava/util/UnknownFormatConversionException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/util/UnknownFormatConversionException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/util/UnknownFormatConversionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 313
    :cond_6
    throw v1
.end method

.method public getVerbosityLevel()I
    .locals 2

    .line 411
    iget v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 414
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->getInt()I

    move-result v0

    return v0

    .line 416
    :cond_0
    iget v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 347
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public verify()Z
    .locals 2

    .line 420
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 421
    return v1

    .line 423
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    if-nez v0, :cond_1

    iget v0, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    if-nez v0, :cond_1

    .line 424
    return v1

    .line 426
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 79
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mArgs:[Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeArray([Ljava/lang/Object;)V

    .line 80
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 81
    iget v0, p0, Lde/blinkt/openvpn/core/LogItem;->mRessourceId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 82
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogItem;->mLevel:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->getInt()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 83
    iget v0, p0, Lde/blinkt/openvpn/core/LogItem;->mVerbosityLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    iget-wide v0, p0, Lde/blinkt/openvpn/core/LogItem;->logtime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 86
    return-void
.end method
