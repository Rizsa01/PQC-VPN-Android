.class public Lde/blinkt/openvpn/core/VpnStatus;
.super Ljava/lang/Object;
.source "VpnStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/VpnStatus$LogLevel;,
        Lde/blinkt/openvpn/core/VpnStatus$StateListener;,
        Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;,
        Lde/blinkt/openvpn/core/VpnStatus$LogListener;,
        Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;
    }
.end annotation


# static fields
.field static final MAXLOGENTRIES:I = 0x3e8

.field static final amazonkey:[B

.field private static final byteCountListener:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;",
            ">;"
        }
    .end annotation
.end field

.field static final fdroidkey:[B

.field private static final logListener:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/VpnStatus$LogListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final logbuffer:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/LogItem;",
            ">;"
        }
    .end annotation
.end field

.field private static mHandlerThread:Landroid/os/HandlerThread;

.field private static mLastConnectedVPNUUID:Ljava/lang/String;

.field private static mLastIntent:Landroid/content/Intent;

.field private static mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

.field private static mLastStateresid:I

.field private static mLaststate:Ljava/lang/String;

.field private static mLaststatemsg:Ljava/lang/String;

.field private static mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

.field static final officaldebugkey:[B

.field static final officalkey:[B

.field static final officialO2Key:[B

.field private static final profileListener:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;",
            ">;"
        }
    .end annotation
.end field

.field static final readFileLock:Ljava/lang/Object;

.field static readFileLog:Z

.field private static final stateListener:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/VpnStatus$StateListener;",
            ">;"
        }
    .end annotation
.end field

.field public static trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 34
    const-string v0, ""

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    .line 36
    const-string v0, "NOPROCESS"

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLaststate:Ljava/lang/String;

    .line 38
    const v0, 0x7f110299

    sput v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    .line 40
    const/4 v0, 0x0

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastIntent:Landroid/content/Intent;

    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Lde/blinkt/openvpn/core/VpnStatus;->readFileLog:Z

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->readFileLock:Ljava/lang/Object;

    .line 192
    const/16 v0, 0x14

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lde/blinkt/openvpn/core/VpnStatus;->officalkey:[B

    .line 193
    new-array v1, v0, [B

    fill-array-data v1, :array_1

    sput-object v1, Lde/blinkt/openvpn/core/VpnStatus;->officaldebugkey:[B

    .line 194
    new-array v1, v0, [B

    fill-array-data v1, :array_2

    sput-object v1, Lde/blinkt/openvpn/core/VpnStatus;->amazonkey:[B

    .line 195
    new-array v0, v0, [B

    fill-array-data v0, :array_3

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->fdroidkey:[B

    .line 196
    const/16 v0, 0x20

    new-array v0, v0, [B

    fill-array-data v0, :array_4

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->officialO2Key:[B

    .line 199
    sget-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 204
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    .line 205
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logListener:Ljava/util/Vector;

    .line 206
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    .line 207
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->byteCountListener:Ljava/util/Vector;

    .line 208
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/TrafficHistory;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;

    .line 209
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->profileListener:Ljava/util/Vector;

    .line 211
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->logInformation()V

    .line 213
    return-void

    nop

    :array_0
    .array-data 1
        -0x3at
        -0x2at
        -0x2ct
        -0x6at
        0x5at
        -0x58t
        -0x57t
        -0x58t
        -0x34t
        -0x7ct
        0x54t
        0x75t
        0x42t
        0x4ft
        -0x70t
        -0x6ft
        -0x2et
        0x56t
        -0x25t
        0x6dt
    .end array-data

    :array_1
    .array-data 1
        -0x63t
        -0x45t
        0x2dt
        0x47t
        0x72t
        -0x74t
        0x52t
        0x42t
        -0x63t
        -0x7at
        0x32t
        -0x46t
        -0x38t
        -0x6ft
        0x62t
        -0x23t
        -0x41t
        0x69t
        0x52t
        0x2bt
    .end array-data

    :array_2
    .array-data 1
        -0x74t
        -0x73t
        -0x76t
        -0x59t
        -0x74t
        -0x70t
        0x78t
        0x37t
        0x4ft
        -0x8t
        -0x77t
        -0x17t
        0x6at
        -0x72t
        -0x55t
        -0x38t
        -0x4t
        0x69t
        0x1at
        -0x39t
    .end array-data

    :array_3
    .array-data 1
        -0x5ct
        0x6ft
        -0x2at
        -0x2et
        0x7bt
        -0x60t
        -0x3ct
        0x4ft
        -0x1bt
        -0x1ft
        0x31t
        0x67t
        0xbt
        -0x36t
        -0x44t
        -0x1bt
        0x11t
        0x2t
        0x79t
        0x68t
    .end array-data

    :array_4
    .array-data 1
        -0x32t
        -0x77t
        -0xbt
        0x79t
        0x79t
        0x7at
        -0x73t
        0x54t
        0x5at
        -0x7at
        0x1bt
        -0x75t
        -0xet
        0x3ct
        0x36t
        0x7ft
        0x29t
        -0x2dt
        0x1bt
        0x37t
        -0xet
        0x5at
        0x1ft
        0x48t
        -0x1at
        -0x55t
        -0x55t
        0x43t
        0x23t
        0x36t
        0x64t
        0x2at
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized addByteCountListener(Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;)V
    .locals 11
    .param p0, "bcl"    # Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;

    const-class v1, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v1

    .line 266
    :try_start_0
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lde/blinkt/openvpn/core/TrafficHistory;->getLastDiff(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;

    move-result-object v0

    .line 267
    .local v0, "diff":Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getIn()J

    move-result-wide v3

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getOut()J

    move-result-wide v5

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getDiffIn()J

    move-result-wide v7

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getDiffOut()J

    move-result-wide v9

    move-object v2, p0

    .end local p0    # "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    .local v2, "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    invoke-interface/range {v2 .. v10}, Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;->updateByteCount(JJJJ)V

    .line 268
    sget-object p0, Lde/blinkt/openvpn/core/VpnStatus;->byteCountListener:Ljava/util/Vector;

    invoke-virtual {p0, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    monitor-exit v1

    return-void

    .line 265
    .end local v0    # "diff":Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    .end local v2    # "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    :catchall_0
    move-exception v0

    move-object p0, v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static addExtraHints(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .line 514
    const-string v0, "md too weak"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "OpenSSL: error"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const-string v0, "error:140AB18E"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 515
    const-string v0, "SSL_CA_MD_TOO_WEAK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "ca md too weak"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 516
    :cond_1
    const-string v0, "OpenSSL reported a certificate with a weak hash, please see the in app FAQ about weak hashes."

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 517
    :cond_2
    const-string v0, "digital envelope routines::unsupported"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 518
    const-string v0, "The encryption method of your private keys/pkcs12 might be outdated and you probably need to enable the OpenSSL legacy provider to be able to use this profile."

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .line 520
    :cond_3
    return-void
.end method

.method public static declared-synchronized addLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V
    .locals 2
    .param p0, "ll"    # Lde/blinkt/openvpn/core/VpnStatus$LogListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 258
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    monitor-exit v0

    return-void

    .line 257
    .end local p0    # "ll":Lde/blinkt/openvpn/core/VpnStatus$LogListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized addProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V
    .locals 2
    .param p0, "pl"    # Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 285
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->profileListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    monitor-exit v0

    return-void

    .line 284
    .end local p0    # "pl":Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized addStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V
    .locals 8
    .param p0, "sl"    # Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    const-class v1, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v1

    .line 277
    :try_start_0
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 278
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 279
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLaststate:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 280
    sget-object v3, Lde/blinkt/openvpn/core/VpnStatus;->mLaststate:Ljava/lang/String;

    sget-object v4, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    sget v5, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    sget-object v6, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v7, Lde/blinkt/openvpn/core/VpnStatus;->mLastIntent:Landroid/content/Intent;

    move-object v2, p0

    .end local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    .local v2, "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    invoke-interface/range {v2 .. v7}, Lde/blinkt/openvpn/core/VpnStatus$StateListener;->updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 279
    .end local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    .restart local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    :cond_0
    move-object v2, p0

    .end local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    .restart local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    goto :goto_0

    .line 277
    .end local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    .restart local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    :cond_1
    move-object v2, p0

    .line 282
    .end local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    .restart local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    :goto_0
    monitor-exit v1

    return-void

    .line 276
    .end local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    :catchall_0
    move-exception v0

    move-object p0, v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized clearLog()V
    .locals 3

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 239
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 240
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus;->logInformation()V

    .line 241
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    if-eqz v1, :cond_0

    .line 242
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Lde/blinkt/openvpn/core/LogFileHandler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    :cond_0
    monitor-exit v0

    return-void

    .line 238
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static flushLog()V
    .locals 2

    .line 135
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    if-eqz v0, :cond_0

    .line 136
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/core/LogFileHandler;->sendEmptyMessage(I)Z

    .line 137
    :cond_0
    return-void
.end method

.method public static getLastCleanLogMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "c"    # Landroid/content/Context;

    .line 79
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    .line 80
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$ConnectionStatus:[I

    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/ConnectionStatus;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const-string v3, ","

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 82
    :pswitch_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "parts":[Ljava/lang/String;
    array-length v4, v1

    const/4 v5, 0x7

    if-lt v4, v5, :cond_0

    .line 98
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    aget-object v5, v1, v2

    const/4 v6, 0x6

    aget-object v6, v1, v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "%s %s"

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 102
    .end local v1    # "parts":[Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 103
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 105
    :cond_1
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLaststate:Ljava/lang/String;

    .line 106
    .local v1, "status":Ljava/lang/String;
    const-string v2, "NOPROCESS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 107
    return-object v0

    .line 109
    :cond_2
    sget v2, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    const v3, 0x7f1102a4

    if-ne v2, v3, :cond_3

    .line 110
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 113
    :cond_3
    sget v2, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "prefix":Ljava/lang/String;
    sget v3, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    const v4, 0x7f1102c7

    if-ne v3, v4, :cond_4

    .line 115
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_5

    .line 117
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 119
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static getLastConnectedVPNProfile()Ljava/lang/String;
    .locals 1

    .line 148
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastConnectedVPNUUID:Ljava/lang/String;

    return-object v0
.end method

.method private static getLevel(Ljava/lang/String;)Lde/blinkt/openvpn/core/ConnectionStatus;
    .locals 9
    .param p0, "state"    # Ljava/lang/String;

    .line 328
    const/4 v0, 0x5

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "CONNECTING"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "WAIT"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "RECONNECTING"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "RESOLVE"

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string v2, "TCP_CONNECT"

    const/4 v7, 0x4

    aput-object v2, v1, v7

    .line 329
    .local v1, "noreplyet":[Ljava/lang/String;
    new-array v0, v0, [Ljava/lang/String;

    const-string v2, "AUTH"

    aput-object v2, v0, v3

    const-string v2, "GET_CONFIG"

    aput-object v2, v0, v4

    const-string v2, "ASSIGN_IP"

    aput-object v2, v0, v5

    const-string v2, "ADD_ROUTES"

    aput-object v2, v0, v6

    const-string v2, "AUTH_PENDING"

    aput-object v2, v0, v7

    .line 330
    .local v0, "reply":[Ljava/lang/String;
    new-array v2, v4, [Ljava/lang/String;

    const-string v6, "CONNECTED"

    aput-object v6, v2, v3

    .line 331
    .local v2, "connected":[Ljava/lang/String;
    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "DISCONNECTED"

    aput-object v6, v5, v3

    const-string v6, "EXITING"

    aput-object v6, v5, v4

    .line 333
    .local v5, "notconnected":[Ljava/lang/String;
    array-length v4, v1

    move v6, v3

    :goto_0
    if-ge v6, v4, :cond_1

    aget-object v7, v1, v6

    .line 334
    .local v7, "x":Ljava/lang/String;
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 335
    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_NO_SERVER_REPLY_YET:Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v3

    .line 333
    .end local v7    # "x":Ljava/lang/String;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 337
    :cond_1
    array-length v4, v0

    move v6, v3

    :goto_1
    if-ge v6, v4, :cond_3

    aget-object v7, v0, v6

    .line 338
    .restart local v7    # "x":Ljava/lang/String;
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 339
    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_SERVER_REPLIED:Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v3

    .line 337
    .end local v7    # "x":Ljava/lang/String;
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 341
    :cond_3
    array-length v4, v2

    move v6, v3

    :goto_2
    if-ge v6, v4, :cond_5

    aget-object v7, v2, v6

    .line 342
    .restart local v7    # "x":Ljava/lang/String;
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 343
    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v3

    .line 341
    .end local v7    # "x":Ljava/lang/String;
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 345
    :cond_5
    array-length v4, v5

    :goto_3
    if-ge v3, v4, :cond_7

    aget-object v6, v5, v3

    .line 346
    .local v6, "x":Ljava/lang/String;
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 347
    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v3

    .line 345
    .end local v6    # "x":Ljava/lang/String;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 349
    :cond_7
    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->UNKNOWN_LEVEL:Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v3
.end method

.method private static getLocalizedState(Ljava/lang/String;)I
    .locals 1
    .param p0, "state"    # Ljava/lang/String;

    .line 293
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto/16 :goto_0

    :sswitch_0
    const-string v0, "RESOLVE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xa

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "DISCONNECTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    goto/16 :goto_1

    :sswitch_2
    const-string v0, "ADD_ROUTES"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto/16 :goto_1

    :sswitch_3
    const-string v0, "TCP_CONNECT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_4
    const-string v0, "WAIT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :sswitch_5
    const-string v0, "AUTH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_6
    const-string v0, "ASSIGN_IP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_7
    const-string v0, "CONNECTING"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_8
    const-string v0, "GET_CONFIG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_9
    const-string v0, "EXITING"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_a
    const-string v0, "AUTH_PENDING"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc

    goto :goto_1

    :sswitch_b
    const-string v0, "RECONNECTING"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    goto :goto_1

    :sswitch_c
    const-string v0, "CONNECTED"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 307
    const v0, 0x7f1102c7

    goto :goto_2

    .line 306
    :pswitch_0
    const v0, 0x7f110292

    goto :goto_2

    .line 305
    :pswitch_1
    const v0, 0x7f11029d

    goto :goto_2

    .line 304
    :pswitch_2
    const v0, 0x7f11029b

    goto :goto_2

    .line 303
    :pswitch_3
    const v0, 0x7f110296

    goto :goto_2

    .line 302
    :pswitch_4
    const v0, 0x7f11029a

    goto :goto_2

    .line 301
    :pswitch_5
    const v0, 0x7f110295

    goto :goto_2

    .line 300
    :pswitch_6
    const v0, 0x7f110293

    goto :goto_2

    .line 299
    :pswitch_7
    const v0, 0x7f11028e

    goto :goto_2

    .line 298
    :pswitch_8
    const v0, 0x7f11028f

    goto :goto_2

    .line 297
    :pswitch_9
    const v0, 0x7f110297

    goto :goto_2

    .line 296
    :pswitch_a
    const v0, 0x7f110290

    goto :goto_2

    .line 295
    :pswitch_b
    const v0, 0x7f1102a3

    goto :goto_2

    .line 294
    :pswitch_c
    const v0, 0x7f110294

    .line 293
    :goto_2
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7c6dfd17 -> :sswitch_c
        -0x78c66ed5 -> :sswitch_b
        -0x31f19620 -> :sswitch_a
        -0x239b921c -> :sswitch_9
        -0x1b0a8795 -> :sswitch_8
        -0x11519548 -> :sswitch_7
        -0x559e189 -> :sswitch_6
        0x1ed5a8 -> :sswitch_5
        0x288975 -> :sswitch_4
        0xfb59e4c -> :sswitch_3
        0x3281a8c8 -> :sswitch_2
        0x37c8963b -> :sswitch_1
        0x6c340dcc -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static declared-synchronized getlogbuffer()[Lde/blinkt/openvpn/core/LogItem;
    .locals 3

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 363
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    new-array v2, v2, [Lde/blinkt/openvpn/core/LogItem;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lde/blinkt/openvpn/core/LogItem;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 363
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static initLogCache(Ljava/io/File;)V
    .locals 3
    .param p0, "cacheDir"    # Ljava/io/File;

    .line 124
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "LogFileWriter"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mHandlerThread:Landroid/os/HandlerThread;

    .line 125
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 126
    new-instance v0, Lde/blinkt/openvpn/core/LogFileHandler;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/blinkt/openvpn/core/LogFileHandler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    .line 129
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    const/16 v1, 0x66

    invoke-virtual {v0, v1, p0}, Lde/blinkt/openvpn/core/LogFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 130
    .local v0, "m":Landroid/os/Message;
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    invoke-virtual {v1, v0}, Lde/blinkt/openvpn/core/LogFileHandler;->sendMessage(Landroid/os/Message;)Z

    .line 132
    return-void
.end method

.method private static insertLogItemByLogTime(Lde/blinkt/openvpn/core/LogItem;Z)V
    .locals 6
    .param p0, "logItem"    # Lde/blinkt/openvpn/core/LogItem;
    .param p1, "enforceUnique"    # Z

    .line 460
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/LogItem;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/LogItem;->getLogtime()J

    move-result-wide v0

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/LogItem;->getLogtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 462
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 463
    return-void

    .line 466
    :cond_0
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 467
    .local v0, "itr":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lde/blinkt/openvpn/core/LogItem;>;"
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/LogItem;->getLogtime()J

    move-result-wide v1

    .line 468
    .local v1, "newItemLogTime":J
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 469
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/blinkt/openvpn/core/LogItem;

    .line 470
    .local v3, "laterLogItem":Lde/blinkt/openvpn/core/LogItem;
    if-eqz p1, :cond_1

    invoke-virtual {v3, p0}, Lde/blinkt/openvpn/core/LogItem;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 472
    return-void

    .line 474
    :cond_1
    invoke-virtual {v3}, Lde/blinkt/openvpn/core/LogItem;->getLogtime()J

    move-result-wide v4

    cmp-long v4, v4, v1

    if-lez v4, :cond_2

    .line 475
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 476
    invoke-interface {v0, p0}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 477
    return-void

    .line 479
    .end local v3    # "laterLogItem":Lde/blinkt/openvpn/core/LogItem;
    :cond_2
    goto :goto_0

    .line 481
    :cond_3
    invoke-interface {v0, p0}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 482
    return-void
.end method

.method public static isVPNActive()Z
    .locals 2

    .line 75
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_AUTH_FAILED:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-eq v0, v1, :cond_0

    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static varargs logDebug(I[Ljava/lang/Object;)V
    .locals 2
    .param p0, "resourceId"    # I
    .param p1, "args"    # [Ljava/lang/Object;

    .line 417
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0, p1}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 418
    return-void
.end method

.method public static logDebug(Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .line 409
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 410
    return-void
.end method

.method public static logError(I)V
    .locals 2
    .param p0, "resourceId"    # I

    .line 500
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 501
    return-void
.end method

.method public static varargs logError(I[Ljava/lang/Object;)V
    .locals 2
    .param p0, "resourceId"    # I
    .param p1, "args"    # [Ljava/lang/Object;

    .line 504
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0, p1}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 505
    return-void
.end method

.method public static logError(Ljava/lang/String;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;

    .line 486
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 488
    return-void
.end method

.method public static logException(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p0, "ll"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p1, "context"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .line 53
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 54
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p2, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 56
    if-eqz p1, :cond_0

    .line 57
    new-instance v1, Lde/blinkt/openvpn/core/LogItem;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3, p1}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1102c6

    invoke-direct {v1, p0, v3, v2}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    .local v1, "li":Lde/blinkt/openvpn/core/LogItem;
    goto :goto_0

    .line 59
    .end local v1    # "li":Lde/blinkt/openvpn/core/LogItem;
    :cond_0
    new-instance v1, Lde/blinkt/openvpn/core/LogItem;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1102c5

    invoke-direct {v1, p0, v3, v2}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    .line 61
    .restart local v1    # "li":Lde/blinkt/openvpn/core/LogItem;
    :goto_0
    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 62
    return-void
.end method

.method public static logException(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "context"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Throwable;

    .line 69
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-static {v0, p0, p1}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    return-void
.end method

.method public static logException(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Throwable;

    .line 65
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const/4 v1, 0x0

    invoke-static {v0, v1, p0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    return-void
.end method

.method public static varargs logInfo(I[Ljava/lang/Object;)V
    .locals 2
    .param p0, "resourceId"    # I
    .param p1, "args"    # [Ljava/lang/Object;

    .line 413
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0, p1}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 414
    return-void
.end method

.method public static logInfo(Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .line 405
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 406
    return-void
.end method

.method private static logInformation()V
    .locals 12

    .line 248
    :try_start_0
    invoke-static {}, Lde/blinkt/openvpn/core/NativeUtils;->getNativeAPI()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .local v0, "nativeAPI":Ljava/lang/String;
    move-object v6, v0

    goto :goto_0

    .line 249
    .end local v0    # "nativeAPI":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 250
    .local v0, "ignore":Ljava/lang/LinkageError;
    const-string v1, "error"

    move-object v6, v1

    .line 253
    .end local v0    # "ignore":Ljava/lang/LinkageError;
    .local v6, "nativeAPI":Ljava/lang/String;
    :goto_0
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v3, Landroid/os/Build;->BOARD:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->ID:Ljava/lang/String;

    sget-object v9, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string v10, ""

    const-string v11, ""

    filled-new-array/range {v2 .. v11}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f1101a6

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(I[Ljava/lang/Object;)V

    .line 255
    return-void
.end method

.method public static declared-synchronized logMessage(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "level"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 234
    :try_start_0
    new-instance v1, Lde/blinkt/openvpn/core/LogItem;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 236
    monitor-exit v0

    return-void

    .line 233
    .end local p0    # "level":Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .end local p1    # "prefix":Ljava/lang/String;
    .end local p2    # "message":Ljava/lang/String;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static logMessageOpenVPN(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;ILjava/lang/String;)V
    .locals 1
    .param p0, "level"    # Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .param p1, "ovpnlevel"    # I
    .param p2, "message"    # Ljava/lang/String;

    .line 509
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    invoke-direct {v0, p0, p1, p2}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;ILjava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 510
    return-void
.end method

.method public static varargs logWarning(I[Ljava/lang/Object;)V
    .locals 2
    .param p0, "resourceId"    # I
    .param p1, "args"    # [Ljava/lang/Object;

    .line 491
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0, p1}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;I[Ljava/lang/Object;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 492
    return-void
.end method

.method public static logWarning(Ljava/lang/String;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;

    .line 495
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-direct {v0, v1, p0}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V

    .line 496
    return-void
.end method

.method static newLogItem(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 1
    .param p0, "logItem"    # Lde/blinkt/openvpn/core/LogItem;

    .line 421
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;ZZ)V

    .line 422
    return-void
.end method

.method public static newLogItem(Lde/blinkt/openvpn/core/LogItem;Z)V
    .locals 1
    .param p0, "logItem"    # Lde/blinkt/openvpn/core/LogItem;
    .param p1, "cachedLine"    # Z

    .line 430
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;ZZ)V

    .line 431
    return-void
.end method

.method static declared-synchronized newLogItem(Lde/blinkt/openvpn/core/LogItem;ZZ)V
    .locals 4
    .param p0, "logItem"    # Lde/blinkt/openvpn/core/LogItem;
    .param p1, "cachedLine"    # Z
    .param p2, "enforceUnique"    # Z

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 434
    if-eqz p1, :cond_0

    .line 435
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v1, p0}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_0

    .line 437
    :cond_0
    invoke-static {p0, p2}, Lde/blinkt/openvpn/core/VpnStatus;->insertLogItemByLogTime(Lde/blinkt/openvpn/core/LogItem;Z)V

    .line 438
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    if-eqz v1, :cond_1

    .line 439
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    const/16 v2, 0x67

    invoke-virtual {v1, v2, p0}, Lde/blinkt/openvpn/core/LogFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 440
    .local v1, "m":Landroid/os/Message;
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    invoke-virtual {v2, v1}, Lde/blinkt/openvpn/core/LogFileHandler;->sendMessage(Landroid/os/Message;)Z

    .line 444
    .end local v1    # "m":Landroid/os/Message;
    :cond_1
    :goto_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/16 v2, 0x5dc

    if-le v1, v2, :cond_3

    .line 445
    :goto_1
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/16 v2, 0x3e8

    if-le v1, v2, :cond_2

    .line 446
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logbuffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_1

    .line 447
    :cond_2
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    if-eqz v1, :cond_3

    .line 448
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->mLogFileHandler:Lde/blinkt/openvpn/core/LogFileHandler;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Lde/blinkt/openvpn/core/LogFileHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/blinkt/openvpn/core/LogFileHandler;->sendMessage(Landroid/os/Message;)Z

    .line 451
    :cond_3
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logListener:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/VpnStatus$LogListener;

    .line 452
    .local v2, "ll":Lde/blinkt/openvpn/core/VpnStatus$LogListener;
    invoke-interface {v2, p0}, Lde/blinkt/openvpn/core/VpnStatus$LogListener;->newLog(Lde/blinkt/openvpn/core/LogItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    .end local v2    # "ll":Lde/blinkt/openvpn/core/VpnStatus$LogListener;
    goto :goto_2

    .line 454
    :cond_4
    monitor-exit v0

    return-void

    .line 433
    .end local p0    # "logItem":Lde/blinkt/openvpn/core/LogItem;
    .end local p1    # "cachedLine":Z
    .end local p2    # "enforceUnique":Z
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static newLogItemIfUnique(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 2
    .param p0, "li"    # Lde/blinkt/openvpn/core/LogItem;

    .line 425
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;ZZ)V

    .line 426
    return-void
.end method

.method public static declared-synchronized notifyProfileVersionChanged(Ljava/lang/String;IZ)V
    .locals 3
    .param p0, "uuid"    # Ljava/lang/String;
    .param p1, "version"    # I
    .param p2, "changedInThisProcess"    # Z

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 532
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->profileListener:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;

    .line 534
    .local v2, "pl":Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;
    invoke-interface {v2, p0, p1, p2}, Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;->notifyProfileVersionChanged(Ljava/lang/String;IZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 535
    .end local v2    # "pl":Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;
    goto :goto_0

    .line 536
    :cond_0
    monitor-exit v0

    return-void

    .line 531
    .end local p0    # "uuid":Ljava/lang/String;
    .end local p1    # "version":I
    .end local p2    # "changedInThisProcess":Z
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized removeByteCountListener(Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;)V
    .locals 2
    .param p0, "bcl"    # Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 272
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->byteCountListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    monitor-exit v0

    return-void

    .line 271
    .end local p0    # "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized removeLogListener(Lde/blinkt/openvpn/core/VpnStatus$LogListener;)V
    .locals 2
    .param p0, "ll"    # Lde/blinkt/openvpn/core/VpnStatus$LogListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 262
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->logListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    monitor-exit v0

    return-void

    .line 261
    .end local p0    # "ll":Lde/blinkt/openvpn/core/VpnStatus$LogListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized removeProfileStateListener(Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;)V
    .locals 2
    .param p0, "pl"    # Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 289
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->profileListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    monitor-exit v0

    return-void

    .line 288
    .end local p0    # "pl":Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized removeStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V
    .locals 2
    .param p0, "sl"    # Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 355
    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    invoke-virtual {v1, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 356
    monitor-exit v0

    return-void

    .line 354
    .end local p0    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized setConnectedVPNProfile(Ljava/lang/String;)V
    .locals 3
    .param p0, "uuid"    # Ljava/lang/String;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 140
    :try_start_0
    sput-object p0, Lde/blinkt/openvpn/core/VpnStatus;->mLastConnectedVPNUUID:Ljava/lang/String;

    .line 141
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    .line 142
    .local v2, "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    invoke-interface {v2, p0}, Lde/blinkt/openvpn/core/VpnStatus$StateListener;->setConnectedVPN(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v2    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    goto :goto_0

    .line 143
    :cond_0
    monitor-exit v0

    return-void

    .line 139
    .end local p0    # "uuid":Ljava/lang/String;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static setTrafficHistory(Lde/blinkt/openvpn/core/TrafficHistory;)V
    .locals 0
    .param p0, "trafficHistory"    # Lde/blinkt/openvpn/core/TrafficHistory;

    .line 152
    sput-object p0, Lde/blinkt/openvpn/core/VpnStatus;->trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;

    .line 153
    return-void
.end method

.method public static declared-synchronized updateByteCount(JJ)V
    .locals 12
    .param p0, "in"    # J
    .param p2, "out"    # J

    const-class v1, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v1

    .line 523
    :try_start_0
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->trafficHistory:Lde/blinkt/openvpn/core/TrafficHistory;

    invoke-virtual {v0, p0, p1, p2, p3}, Lde/blinkt/openvpn/core/TrafficHistory;->add(JJ)Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;

    move-result-object v0

    .line 525
    .local v0, "diff":Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus;->byteCountListener:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;

    .line 526
    .local v2, "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getDiffIn()J

    move-result-wide v7

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->getDiffOut()J

    move-result-wide v9

    move-wide v3, p0

    move-wide v5, p2

    invoke-interface/range {v2 .. v10}, Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;->updateByteCount(JJJJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    .end local v2    # "bcl":Lde/blinkt/openvpn/core/VpnStatus$ByteCountListener;
    goto :goto_0

    .line 528
    :cond_0
    monitor-exit v1

    return-void

    .line 522
    .end local v0    # "diff":Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    .end local p0    # "in":J
    .end local p2    # "out":J
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static updateStatePause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V
    .locals 4
    .param p0, "pauseReason"    # Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 313
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, ""

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 321
    :pswitch_0
    const v0, 0x7f1102a2

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_VPNPAUSED:Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v3, "USERPAUSE"

    invoke-static {v3, v1, v0, v2}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    goto :goto_0

    .line 318
    :pswitch_1
    const v0, 0x7f11029c

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_VPNPAUSED:Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v3, "SCREENOFF"

    invoke-static {v3, v1, v0, v2}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    .line 319
    goto :goto_0

    .line 315
    :pswitch_2
    const v0, 0x7f110298

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NONETWORK:Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v3, "NONETWORK"

    invoke-static {v3, v1, v0, v2}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    .line 316
    nop

    .line 325
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static updateStateString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "state"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .line 370
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_WAITING_FOR_USER_INPUT:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-ne v0, v1, :cond_0

    const-string v0, "GET_CONFIG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    return-void

    .line 372
    :cond_0
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->getLocalizedState(Ljava/lang/String;)I

    move-result v0

    .line 373
    .local v0, "rid":I
    invoke-static {p0}, Lde/blinkt/openvpn/core/VpnStatus;->getLevel(Ljava/lang/String;)Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object v1

    .line 374
    .local v1, "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    invoke-static {p0, p1, v0, v1}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    .line 375
    return-void
.end method

.method public static declared-synchronized updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V
    .locals 2
    .param p0, "state"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "resid"    # I
    .param p3, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;

    const-class v0, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v0

    .line 379
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, p2, p3, v1}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    monitor-exit v0

    return-void

    .line 378
    .end local p0    # "state":Ljava/lang/String;
    .end local p1    # "msg":Ljava/lang/String;
    .end local p2    # "resid":I
    .end local p3    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 9
    .param p0, "state"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "resid"    # I
    .param p3, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p4, "intent"    # Landroid/content/Intent;

    const-class v1, Lde/blinkt/openvpn/core/VpnStatus;

    monitor-enter v1

    .line 385
    :try_start_0
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    if-ne v0, v2, :cond_1

    const-string v0, "WAIT"

    .line 386
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "AUTH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 387
    :cond_0
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v3, "Ignoring OpenVPN Status in CONNECTED state (%s->%s): %s"

    invoke-virtual {p3}, Lde/blinkt/openvpn/core/ConnectionStatus;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {p0, v4, p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;)V

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItem(Lde/blinkt/openvpn/core/LogItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    monitor-exit v1

    return-void

    .line 391
    :cond_1
    :try_start_1
    sput-object p0, Lde/blinkt/openvpn/core/VpnStatus;->mLaststate:Ljava/lang/String;

    .line 392
    sput-object p1, Lde/blinkt/openvpn/core/VpnStatus;->mLaststatemsg:Ljava/lang/String;

    .line 393
    sput p2, Lde/blinkt/openvpn/core/VpnStatus;->mLastStateresid:I

    .line 394
    sput-object p3, Lde/blinkt/openvpn/core/VpnStatus;->mLastLevel:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 395
    sput-object p4, Lde/blinkt/openvpn/core/VpnStatus;->mLastIntent:Landroid/content/Intent;

    .line 398
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus;->stateListener:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    move-object v3, v2

    .line 399
    .local v3, "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-object v7, p3

    move-object v8, p4

    .end local p0    # "state":Ljava/lang/String;
    .end local p1    # "msg":Ljava/lang/String;
    .end local p2    # "resid":I
    .end local p3    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .end local p4    # "intent":Landroid/content/Intent;
    .local v4, "state":Ljava/lang/String;
    .local v5, "msg":Ljava/lang/String;
    .local v6, "resid":I
    .local v7, "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .local v8, "intent":Landroid/content/Intent;
    invoke-interface/range {v3 .. v8}, Lde/blinkt/openvpn/core/VpnStatus$StateListener;->updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 400
    .end local v3    # "sl":Lde/blinkt/openvpn/core/VpnStatus$StateListener;
    move-object p0, v4

    move-object p1, v5

    move p2, v6

    move-object p3, v7

    move-object p4, v8

    goto :goto_0

    .line 402
    .end local v4    # "state":Ljava/lang/String;
    .end local v5    # "msg":Ljava/lang/String;
    .end local v6    # "resid":I
    .end local v7    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .end local v8    # "intent":Landroid/content/Intent;
    .restart local p0    # "state":Ljava/lang/String;
    .restart local p1    # "msg":Ljava/lang/String;
    .restart local p2    # "resid":I
    .restart local p3    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .restart local p4    # "intent":Landroid/content/Intent;
    :cond_2
    monitor-exit v1

    return-void

    .line 384
    .end local p0    # "state":Ljava/lang/String;
    .end local p1    # "msg":Ljava/lang/String;
    .end local p2    # "resid":I
    .end local p3    # "level":Lde/blinkt/openvpn/core/ConnectionStatus;
    .end local p4    # "intent":Landroid/content/Intent;
    :catchall_0
    move-exception v0

    move-object p0, v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method
