.class Lde/blinkt/openvpn/core/LogFileHandler;
.super Landroid/os/Handler;
.source "LogFileHandler.java"


# static fields
.field static final FLUSH_TO_DISK:I = 0x65

.field public static final LOGFILE_NAME:Ljava/lang/String; = "logcache.dat"

.field static final LOG_INIT:I = 0x66

.field public static final LOG_MESSAGE:I = 0x67

.field public static final MAGIC_BYTE:I = 0x55

.field static final TRIM_LOG_FILE:I = 0x64

.field private static final hexArray:[C


# instance fields
.field protected mLogFile:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 236
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/LogFileHandler;->hexArray:[C

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0
    .param p1, "looper"    # Landroid/os/Looper;

    .line 42
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 43
    return-void
.end method

.method public static bytesToHex([BI)Ljava/lang/String;
    .locals 6
    .param p0, "bytes"    # [B
    .param p1, "len"    # I

    .line 239
    array-length v0, p0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 240
    mul-int/lit8 v0, p1, 0x2

    new-array v0, v0, [C

    .line 241
    .local v0, "hexChars":[C
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 242
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    .line 243
    .local v2, "v":I
    mul-int/lit8 v3, v1, 0x2

    sget-object v4, Lde/blinkt/openvpn/core/LogFileHandler;->hexArray:[C

    ushr-int/lit8 v5, v2, 0x4

    aget-char v4, v4, v5

    aput-char v4, v0, v3

    .line 244
    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    sget-object v4, Lde/blinkt/openvpn/core/LogFileHandler;->hexArray:[C

    and-int/lit8 v5, v2, 0xf

    aget-char v4, v4, v5

    aput-char v4, v0, v3

    .line 241
    .end local v2    # "v":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 246
    .end local v1    # "j":I
    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method private flushToDisk()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 77
    return-void
.end method

.method private openLogFile(Ljava/io/File;)V
    .locals 2
    .param p1, "cacheDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 125
    new-instance v0, Ljava/io/File;

    const-string v1, "logcache.dat"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 126
    .local v0, "logfile":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v1, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    .line 127
    return-void
.end method

.method private readLogCache(Ljava/io/File;)V
    .locals 4
    .param p1, "cacheDir"    # Ljava/io/File;

    .line 130
    const/4 v0, 0x0

    .line 132
    .local v0, "log":Ljava/io/FileInputStream;
    const/4 v1, 0x1

    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "logcache.dat"

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 134
    .local v2, "logfile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 137
    :cond_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v0, v3

    .line 138
    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->readCacheContents(Ljava/io/InputStream;)V

    .line 139
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 147
    .end local v2    # "logfile":Ljava/io/File;
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    monitor-enter v2

    .line 148
    :try_start_1
    sput-boolean v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    .line 149
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 150
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    nop

    .line 153
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 156
    :goto_0
    goto :goto_4

    .line 154
    :catch_0
    move-exception v1

    .line 155
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_0

    .line 150
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 147
    .restart local v2    # "logfile":Ljava/io/File;
    :cond_1
    :goto_1
    sget-object v3, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    monitor-enter v3

    .line 148
    :try_start_4
    sput-boolean v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    .line 149
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 150
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 151
    if-eqz v0, :cond_2

    .line 153
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 156
    goto :goto_2

    .line 154
    :catch_1
    move-exception v1

    .line 155
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 135
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    :goto_2
    return-void

    .line 150
    :catchall_1
    move-exception v1

    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 147
    .end local v2    # "logfile":Ljava/io/File;
    :catchall_2
    move-exception v2

    goto :goto_5

    .line 141
    :catch_2
    move-exception v2

    goto :goto_3

    :catch_3
    move-exception v2

    .line 142
    .local v2, "e":Ljava/lang/Exception;
    :goto_3
    :try_start_7
    const-string v3, "Reading cached logfile failed"

    invoke-static {v3}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 143
    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 144
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 147
    .end local v2    # "e":Ljava/lang/Exception;
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    monitor-enter v2

    .line 148
    :try_start_8
    sput-boolean v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    .line 149
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 150
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 151
    if-eqz v0, :cond_3

    .line 153
    :try_start_9
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    goto :goto_0

    .line 159
    :cond_3
    :goto_4
    return-void

    .line 150
    :catchall_3
    move-exception v1

    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw v1

    .line 147
    :goto_5
    sget-object v3, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    monitor-enter v3

    .line 148
    :try_start_b
    sput-boolean v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    .line 149
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 150
    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 151
    if-eqz v0, :cond_4

    .line 153
    :try_start_c
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_4

    .line 156
    goto :goto_6

    .line 154
    :catch_4
    move-exception v1

    .line 155
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 158
    .end local v1    # "e":Ljava/io/IOException;
    :cond_4
    :goto_6
    throw v2

    .line 150
    :catchall_4
    move-exception v1

    :try_start_d
    monitor-exit v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    throw v1
.end method

.method private trimLogFile()V
    .locals 3

    .line 81
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 82
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    check-cast v0, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 86
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private writeLogItemToDisk(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 1
    .param p1, "li"    # Lde/blinkt/openvpn/core/LogItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Lde/blinkt/openvpn/core/LogItem;->getMarschaledBytes()[B

    move-result-object v0

    .line 95
    .local v0, "liBytes":[B
    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->writeEscapedBytes([B)V

    .line 96
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .line 49
    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x66

    if-ne v0, v1, :cond_1

    .line 50
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 52
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->readLogCache(Ljava/io/File;)V

    .line 53
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->openLogFile(Ljava/io/File;)V

    goto :goto_1

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "mLogFile not null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local p1    # "msg":Landroid/os/Message;
    throw v0

    .line 54
    .restart local p1    # "msg":Landroid/os/Message;
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x67

    if-ne v0, v1, :cond_3

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lde/blinkt/openvpn/core/LogItem;

    if-eqz v0, :cond_3

    .line 56
    iget-object v0, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    if-nez v0, :cond_2

    .line 57
    return-void

    .line 58
    :cond_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lde/blinkt/openvpn/core/LogItem;

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->writeLogItemToDisk(Lde/blinkt/openvpn/core/LogItem;)V

    goto :goto_1

    .line 59
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_4

    .line 60
    invoke-direct {p0}, Lde/blinkt/openvpn/core/LogFileHandler;->trimLogFile()V

    .line 61
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->getlogbuffer()[Lde/blinkt/openvpn/core/LogItem;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    aget-object v3, v0, v2

    .line 62
    .local v3, "li":Lde/blinkt/openvpn/core/LogItem;
    invoke-direct {p0, v3}, Lde/blinkt/openvpn/core/LogFileHandler;->writeLogItemToDisk(Lde/blinkt/openvpn/core/LogItem;)V

    .line 61
    .end local v3    # "li":Lde/blinkt/openvpn/core/LogItem;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 63
    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_5

    .line 64
    invoke-direct {p0}, Lde/blinkt/openvpn/core/LogFileHandler;->flushToDisk()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferOverflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :cond_5
    :goto_1
    goto :goto_3

    .line 67
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error during log cache: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 70
    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 73
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method protected readCacheContents(Ljava/io/InputStream;)V
    .locals 16
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    new-instance v0, Ljava/io/BufferedInputStream;

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 165
    .local v0, "logFile":Ljava/io/BufferedInputStream;
    const/16 v2, 0x4000

    new-array v2, v2, [B

    .line 166
    .local v2, "buf":[B
    const/4 v3, 0x0

    const/4 v4, 0x5

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    .line 167
    .local v5, "read":I
    const/4 v6, 0x0

    .line 171
    .local v6, "itemsRead":I
    :goto_0
    if-lt v5, v4, :cond_a

    .line 172
    const/4 v7, 0x0

    .line 173
    .local v7, "skipped":I
    :cond_0
    aget-byte v8, v2, v7

    const/16 v9, 0x55

    const/4 v10, 0x1

    if-eq v8, v9, :cond_2

    .line 174
    add-int/lit8 v7, v7, 0x1

    .line 175
    add-int/lit8 v8, v7, 0x4

    invoke-virtual {v0, v2, v8, v10}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v8

    if-ne v8, v10, :cond_1

    add-int/lit8 v8, v7, 0xa

    array-length v9, v2

    if-le v8, v9, :cond_0

    .line 176
    :cond_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v8, "Skipped %d bytes and no a magic byte found"

    invoke-static {v3, v8, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 177
    move-object/from16 v3, p0

    goto/16 :goto_3

    .line 180
    :cond_2
    if-lez v7, :cond_3

    .line 181
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    const-string v12, "Skipped %d bytes before finding a magic byte"

    invoke-static {v8, v12, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 183
    :cond_3
    add-int/lit8 v8, v7, 0x1

    const/4 v11, 0x4

    invoke-static {v2, v8, v11}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/nio/IntBuffer;->get()I

    move-result v8

    .line 186
    .local v8, "len":I
    const/4 v12, 0x0

    .line 187
    .local v12, "pos":I
    array-length v13, v2

    new-array v13, v13, [B

    .line 189
    .local v13, "buf2":[B
    :goto_1
    if-ge v12, v8, :cond_8

    .line 190
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->read()I

    move-result v14

    int-to-byte v14, v14

    .line 191
    .local v14, "b":B
    if-ne v14, v9, :cond_4

    .line 192
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v15

    const-string v3, "Unexpected magic byte found at pos %d, abort current log item"

    invoke-static {v9, v3, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 193
    invoke-virtual {v0, v2, v10, v11}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v3

    add-int/lit8 v5, v3, 0x1

    .line 194
    const/4 v3, 0x0

    goto :goto_0

    .line 195
    :cond_4
    const/16 v3, 0x56

    if-ne v14, v3, :cond_7

    .line 196
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->read()I

    move-result v3

    int-to-byte v3, v3

    .line 197
    .end local v14    # "b":B
    .local v3, "b":B
    if-nez v3, :cond_5

    .line 198
    const/16 v14, 0x55

    .end local v3    # "b":B
    .restart local v14    # "b":B
    goto :goto_2

    .line 199
    .end local v14    # "b":B
    .restart local v3    # "b":B
    :cond_5
    if-ne v3, v10, :cond_6

    .line 200
    const/16 v14, 0x56

    .end local v3    # "b":B
    .restart local v14    # "b":B
    goto :goto_2

    .line 202
    .end local v14    # "b":B
    .restart local v3    # "b":B
    :cond_6
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v14

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v14

    const-string v15, "Escaped byte not 0 or 1: %d"

    invoke-static {v9, v15, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(Ljava/lang/String;)V

    .line 203
    invoke-virtual {v0, v2, v10, v11}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v9

    add-int/lit8 v5, v9, 0x1

    .line 204
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 207
    .end local v3    # "b":B
    .restart local v14    # "b":B
    :cond_7
    :goto_2
    add-int/lit8 v3, v12, 0x1

    .end local v12    # "pos":I
    .local v3, "pos":I
    aput-byte v14, v13, v12

    .line 208
    .end local v14    # "b":B
    move v12, v3

    const/4 v3, 0x0

    goto :goto_1

    .line 210
    .end local v3    # "pos":I
    .restart local v12    # "pos":I
    :cond_8
    move-object/from16 v3, p0

    invoke-virtual {v3, v13, v8}, Lde/blinkt/openvpn/core/LogFileHandler;->restoreLogItem([BI)V

    .line 213
    const/4 v9, 0x0

    invoke-virtual {v0, v2, v9, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    .line 214
    add-int/lit8 v6, v6, 0x1

    .line 215
    const/16 v10, 0x7d0

    if-le v6, v10, :cond_9

    .line 216
    const-string v10, "Too many logentries read from cache, aborting."

    invoke-static {v10}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 217
    const/4 v5, 0x0

    .line 220
    .end local v7    # "skipped":I
    .end local v8    # "len":I
    .end local v12    # "pos":I
    .end local v13    # "buf2":[B
    :cond_9
    move v3, v9

    goto/16 :goto_0

    .line 171
    :cond_a
    move-object/from16 v3, p0

    .line 221
    :goto_3
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v7, 0x7f110254

    invoke-static {v7, v4}, Lde/blinkt/openvpn/core/VpnStatus;->logDebug(I[Ljava/lang/Object;)V

    .line 222
    return-void
.end method

.method protected restoreLogItem([BI)V
    .locals 4
    .param p1, "buf"    # [B
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 226
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    invoke-direct {v0, p1, p2}, Lde/blinkt/openvpn/core/LogItem;-><init>([BI)V

    .line 227
    .local v0, "li":Lde/blinkt/openvpn/core/LogItem;
    invoke-virtual {v0}, Lde/blinkt/openvpn/core/LogItem;->verify()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 228
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;Z)V

    goto :goto_0

    .line 230
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 232
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x50

    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {p1, v3}, Lde/blinkt/openvpn/core/LogFileHandler;->bytesToHex([BI)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 230
    const-string v3, "Could not read log item from file: %d: %s"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 234
    :goto_0
    return-void
.end method

.method public writeEscapedBytes([B)V
    .locals 10
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    const/4 v0, 0x0

    .line 100
    .local v0, "magic":I
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/16 v4, 0x56

    const/16 v5, 0x55

    if-ge v3, v1, :cond_2

    aget-byte v6, p1, v3

    .line 101
    .local v6, "b":B
    if-eq v6, v5, :cond_0

    if-ne v6, v4, :cond_1

    .line 102
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 100
    .end local v6    # "b":B
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 104
    :cond_2
    array-length v1, p1

    add-int/2addr v1, v0

    new-array v1, v1, [B

    .line 106
    .local v1, "eBytes":[B
    const/4 v3, 0x0

    .line 107
    .local v3, "i":I
    array-length v6, p1

    :goto_1
    if-ge v2, v6, :cond_5

    aget-byte v7, p1, v2

    .line 108
    .local v7, "b":B
    if-eq v7, v5, :cond_4

    if-ne v7, v4, :cond_3

    goto :goto_2

    .line 112
    :cond_3
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "i":I
    .local v8, "i":I
    aput-byte v7, v1, v3

    move v3, v8

    goto :goto_3

    .line 109
    .end local v8    # "i":I
    .restart local v3    # "i":I
    :cond_4
    :goto_2
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "i":I
    .restart local v8    # "i":I
    aput-byte v4, v1, v3

    .line 110
    add-int/lit8 v3, v8, 0x1

    .end local v8    # "i":I
    .restart local v3    # "i":I
    add-int/lit8 v9, v7, -0x55

    int-to-byte v9, v9

    aput-byte v9, v1, v8

    .line 107
    .end local v7    # "b":B
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 116
    :cond_5
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    array-length v4, p1

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 117
    .local v2, "lenBytes":[B
    iget-object v4, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    monitor-enter v4

    .line 118
    :try_start_0
    iget-object v6, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    invoke-virtual {v6, v5}, Ljava/io/OutputStream;->write(I)V

    .line 119
    iget-object v5, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    invoke-virtual {v5, v2}, Ljava/io/OutputStream;->write([B)V

    .line 120
    iget-object v5, p0, Lde/blinkt/openvpn/core/LogFileHandler;->mLogFile:Ljava/io/OutputStream;

    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write([B)V

    .line 121
    monitor-exit v4

    .line 122
    return-void

    .line 121
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method
