.class public final Landroidx/webkit/URLUtilCompat;
.super Ljava/lang/Object;
.source "URLUtilCompat.java"


# static fields
.field private static final DISPOSITION_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 188
    const-string v0, "\\s*(\\S+?) # Group 1: parameter name\n\\s*=\\s* # Match equals sign\n(?: # non-capturing group of options\n   \'( (?: [^\'\\\\] | \\\\. )* )\' # Group 2: single-quoted\n | \"( (?: [^\"\\\\] | \\\\. )*  )\" # Group 3: double-quoted\n | ( [^\'\"][^;\\s]* ) # Group 4: un-quoted parameter\n)\\s*;? # Optional end semicolon"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroidx/webkit/URLUtilCompat;->DISPOSITION_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encodePlusCharacters(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "valueChars"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .line 306
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 307
    .local v0, "charset":Ljava/nio/charset/Charset;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "+"

    invoke-virtual {v0, v2}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-byte v5, v2, v4

    .line 309
    .local v5, "b":B
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "%02x"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 311
    :cond_0
    const-string v2, "\\+"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static extensionDifferentFromMimeType(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;

    .line 147
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 148
    .local v0, "lastDotIndex":I
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    .line 149
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 148
    invoke-virtual {v1, v2}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 150
    .local v1, "typeFromExt":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public static getFilenameFromContentDisposition(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "contentDisposition"    # Ljava/lang/String;

    .line 217
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, ";"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "parts":[Ljava/lang/String;
    array-length v1, v0

    const/4 v3, 0x0

    if-ge v1, v2, :cond_0

    .line 220
    return-object v3

    .line 222
    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "dispositionType":Ljava/lang/String;
    const-string v4, "inline"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 227
    return-object v3

    .line 229
    :cond_1
    const/4 v3, 0x1

    aget-object v4, v0, v3

    .line 230
    .local v4, "dispositionParameters":Ljava/lang/String;
    sget-object v5, Landroidx/webkit/URLUtilCompat;->DISPOSITION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 231
    .local v5, "matcher":Ljava/util/regex/Matcher;
    const/4 v6, 0x0

    .line 232
    .local v6, "filename":Ljava/lang/String;
    const/4 v7, 0x0

    .line 233
    .local v7, "filenameExt":Ljava/lang/String;
    :cond_2
    :goto_0
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 234
    invoke-virtual {v5, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 236
    .local v8, "parameter":Ljava/lang/String;
    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 237
    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroidx/webkit/URLUtilCompat;->removeSlashEscapes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .local v9, "value":Ljava/lang/String;
    goto :goto_1

    .line 238
    .end local v9    # "value":Ljava/lang/String;
    :cond_3
    const/4 v9, 0x3

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    .line 239
    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroidx/webkit/URLUtilCompat;->removeSlashEscapes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .restart local v9    # "value":Ljava/lang/String;
    goto :goto_1

    .line 241
    .end local v9    # "value":Ljava/lang/String;
    :cond_4
    const/4 v9, 0x4

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 244
    .restart local v9    # "value":Ljava/lang/String;
    :goto_1
    if-eqz v8, :cond_2

    if-nez v9, :cond_5

    .line 245
    goto :goto_0

    .line 248
    :cond_5
    const-string v10, "filename*"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 249
    invoke-static {v9}, Landroidx/webkit/URLUtilCompat;->parseExtValueString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 250
    :cond_6
    const-string v10, "filename"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 251
    move-object v6, v9

    .line 253
    .end local v8    # "parameter":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_7
    :goto_2
    goto :goto_0

    .line 256
    :cond_8
    if-eqz v7, :cond_9

    .line 257
    return-object v7

    .line 259
    :cond_9
    return-object v6
.end method

.method private static getFilenameSuggestion(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "contentDisposition"    # Ljava/lang/String;

    .line 111
    if-eqz p1, :cond_0

    .line 112
    invoke-static {p1}, Landroidx/webkit/URLUtilCompat;->getFilenameFromContentDisposition(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "filename":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 114
    invoke-static {v0}, Landroidx/webkit/URLUtilCompat;->replacePathSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 119
    .end local v0    # "filename":Ljava/lang/String;
    :cond_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 120
    .local v0, "parsedUri":Landroid/net/Uri;
    if-eqz v0, :cond_1

    .line 121
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    .line 122
    .local v1, "lastPathSegment":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 123
    invoke-static {v1}, Landroidx/webkit/URLUtilCompat;->replacePathSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 128
    .end local v1    # "lastPathSegment":Ljava/lang/String;
    :cond_1
    const-string v1, "downloadfile"

    return-object v1
.end method

.method public static guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "contentDisposition"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .line 83
    invoke-static {p0, p1}, Landroidx/webkit/URLUtilCompat;->getFilenameSuggestion(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "filename":Ljava/lang/String;
    invoke-static {p2}, Landroidx/webkit/URLUtilCompat;->suggestExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "extensionFromMimeType":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_0

    .line 90
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 96
    :cond_0
    if-eqz p2, :cond_1

    invoke-static {v0, p2}, Landroidx/webkit/URLUtilCompat;->extensionDifferentFromMimeType(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 97
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 99
    :cond_1
    return-object v0
.end method

.method private static parseExtValueString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "raw"    # Ljava/lang/String;

    .line 277
    const-string v0, "\'"

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x0

    if-ge v2, v1, :cond_0

    .line 279
    return-object v3

    .line 282
    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 284
    .local v1, "encoding":Ljava/lang/String;
    const/4 v2, 0x2

    aget-object v2, v0, v2

    .line 289
    .local v2, "valueChars":Ljava/lang/String;
    :try_start_0
    invoke-static {v2, v1}, Landroidx/webkit/URLUtilCompat;->encodePlusCharacters(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 292
    .local v4, "valueWithEncodedPlus":Ljava/lang/String;
    invoke-static {v4, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 293
    .end local v4    # "valueWithEncodedPlus":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0

    :catch_1
    move-exception v4

    .line 294
    .local v4, "ignored":Ljava/lang/Exception;
    :goto_0
    return-object v3
.end method

.method private static removeSlashEscapes(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "raw"    # Ljava/lang/String;

    .line 266
    if-nez p0, :cond_0

    .line 267
    const/4 v0, 0x0

    return-object v0

    .line 269
    :cond_0
    const-string v0, "\\\\(.)"

    const-string v1, "$1"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static replacePathSeparators(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "raw"    # Ljava/lang/String;

    .line 137
    const-string v0, "/"

    const-string v1, "_"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static suggestExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;

    .line 162
    const-string v0, ".bin"

    if-nez p0, :cond_0

    .line 163
    return-object v0

    .line 165
    :cond_0
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, "extensionFromMimeType":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 170
    :cond_1
    const-string v2, "text/html"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 171
    const-string v0, ".html"

    return-object v0

    .line 172
    :cond_2
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 173
    const-string v0, ".txt"

    return-object v0

    .line 175
    :cond_3
    return-object v0
.end method
