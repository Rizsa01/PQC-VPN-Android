.class public Lde/blinkt/openvpn/FileProvider;
.super Landroid/content/ContentProvider;
.source "FileProvider.java"

# interfaces
.implements Landroid/content/ContentProvider$PipeDataWriter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/ContentProvider;",
        "Landroid/content/ContentProvider$PipeDataWriter<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private getFileFromURI(Landroid/net/Uri;)Ljava/io/File;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 109
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "path":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 111
    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 115
    :cond_0
    const-string v1, "^[0-9a-z-.]*(dmp|dmp.log)$"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 117
    invoke-virtual {p0}, Lde/blinkt/openvpn/FileProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    .line 118
    .local v1, "cachedir":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2

    .line 116
    .end local v1    # "cachedir":Ljava/io/File;
    :cond_1
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "url not in expect format "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .line 88
    const-string v0, "application/octet-stream"

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .line 70
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 1

    .line 36
    const/4 v0, 0x1

    return v0
.end method

.method public openAssetFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 13
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 93
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/FileProvider;->getFileFromURI(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v1

    .line 97
    .local v1, "dumpfile":Ljava/io/File;
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v6, v0

    .line 99
    .local v6, "is":Ljava/io/InputStream;
    new-instance v0, Landroid/content/res/AssetFileDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 100
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v7, p0

    move-object v2, p0

    move-object v3, p1

    .end local p1    # "uri":Landroid/net/Uri;
    .local v3, "uri":Landroid/net/Uri;
    :try_start_1
    invoke-virtual/range {v2 .. v7}, Lde/blinkt/openvpn/FileProvider;->openPipeHelper(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/Object;Landroid/content/ContentProvider$PipeDataWriter;)Landroid/os/ParcelFileDescriptor;

    move-result-object v8

    .line 101
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v11

    const-wide/16 v9, 0x0

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Landroid/content/res/AssetFileDescriptor;-><init>(Landroid/os/ParcelFileDescriptor;JJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 99
    return-object v7

    .line 102
    .end local v6    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    move-object p1, v0

    goto :goto_0

    .end local v3    # "uri":Landroid/net/Uri;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_1
    move-exception v0

    move-object v3, p1

    move-object p1, v0

    .line 103
    .restart local v3    # "uri":Landroid/net/Uri;
    .local p1, "e":Ljava/io/IOException;
    :goto_0
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to open minidump "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .line 43
    :try_start_0
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/FileProvider;->getFileFromURI(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    .line 46
    .local v0, "dumpfile":Ljava/io/File;
    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, p2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 48
    .local v1, "c":Landroid/database/MatrixCursor;
    array-length v2, p2

    new-array v2, v2, [Ljava/lang/Object;

    .line 49
    .local v2, "row":[Ljava/lang/Object;
    const/4 v3, 0x0

    .line 50
    .local v3, "i":I
    array-length v4, p2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_2

    aget-object v6, p2, v5

    .line 51
    .local v6, "r":Ljava/lang/String;
    const-string v7, "_size"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 52
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v2, v3

    .line 53
    :cond_0
    const-string v7, "_display_name"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 54
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v3

    .line 55
    :cond_1
    nop

    .end local v6    # "r":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    .line 50
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {v1, v2}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    return-object v1

    .line 59
    .end local v0    # "dumpfile":Ljava/io/File;
    .end local v1    # "c":Landroid/database/MatrixCursor;
    .end local v2    # "row":[Ljava/lang/Object;
    .end local v3    # "i":I
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 61
    const/4 v1, 0x0

    return-object v1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public writeDataToPipe(Landroid/os/ParcelFileDescriptor;Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Ljava/io/InputStream;)V
    .locals 5
    .param p1, "output"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "opts"    # Landroid/os/Bundle;
    .param p5, "args"    # Ljava/io/InputStream;

    .line 125
    const/16 v0, 0x2000

    new-array v0, v0, [B

    .line 127
    .local v0, "buffer":[B
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 129
    .local v1, "fout":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_0
    invoke-virtual {p5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "n":I
    if-ltz v2, :cond_0

    .line 130
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 136
    :cond_0
    :try_start_1
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 138
    goto :goto_1

    .line 137
    :catch_0
    move-exception v2

    .line 140
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 142
    goto :goto_3

    .line 141
    :catch_1
    move-exception v2

    .line 143
    goto :goto_3

    .line 135
    .end local v3    # "n":I
    :catchall_0
    move-exception v2

    goto :goto_4

    .line 132
    :catch_2
    move-exception v2

    .line 133
    .local v2, "e":Ljava/io/IOException;
    :try_start_3
    const-string v3, "OpenVPNFileProvider"

    const-string v4, "Failed transferring"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 136
    .end local v2    # "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 138
    goto :goto_2

    .line 137
    :catch_3
    move-exception v2

    .line 140
    :goto_2
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 142
    goto :goto_3

    .line 141
    :catch_4
    move-exception v2

    .line 143
    nop

    .line 144
    :goto_3
    return-void

    .line 136
    :goto_4
    :try_start_6
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 138
    goto :goto_5

    .line 137
    :catch_5
    move-exception v3

    .line 140
    :goto_5
    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 142
    goto :goto_6

    .line 141
    :catch_6
    move-exception v3

    .line 143
    :goto_6
    throw v2
.end method

.method public bridge synthetic writeDataToPipe(Landroid/os/ParcelFileDescriptor;Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 32
    move-object v5, p5

    check-cast v5, Ljava/io/InputStream;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lde/blinkt/openvpn/FileProvider;->writeDataToPipe(Landroid/os/ParcelFileDescriptor;Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;Ljava/io/InputStream;)V

    return-void
.end method
