.class public Lde/blinkt/openvpn/core/OpenVpnManagementThread;
.super Ljava/lang/Object;
.source "OpenVpnManagementThread.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lde/blinkt/openvpn/core/OpenVPNManagement;


# static fields
.field private static final TAG:Ljava/lang/String; = "OpenVPNManagement"

.field private static final active:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lde/blinkt/openvpn/core/OpenVpnManagementThread;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private lastPauseReason:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

.field private mBytecountInterval:I

.field private final mFDList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/io/FileDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private mLastHoldRelease:J

.field private final mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

.field private mPauseCallback:Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;

.field private final mProfile:Lde/blinkt/openvpn/core/VpnProfile;

.field private final mResumeHandler:Landroid/os/Handler;

.field private final mResumeHoldRunnable:Ljava/lang/Runnable;

.field private mShuttingDown:Z

.field private mSocket:Landroid/net/LocalSocket;

.field private final mSocketPath:Ljava/lang/String;

.field private mWaitingForRelease:Z


# direct methods
.method public static synthetic $r8$lambda$TU0SZy0S2WW9k1JTbmjwoiifwF8(Lde/blinkt/openvpn/core/OpenVpnManagementThread;)V
    .locals 0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->lambda$new$0()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->active:Ljava/util/Vector;

    return-void
.end method

.method public constructor <init>(Lde/blinkt/openvpn/core/VpnProfile;Lde/blinkt/openvpn/core/OpenVPNService;Ljava/lang/String;)V
    .locals 2
    .param p1, "profile"    # Lde/blinkt/openvpn/core/VpnProfile;
    .param p2, "openVpnService"    # Lde/blinkt/openvpn/core/OpenVPNService;
    .param p3, "socketPath"    # Ljava/lang/String;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mFDList:Ljava/util/LinkedList;

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mLastHoldRelease:J

    .line 35
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->lastPauseReason:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 39
    const/4 v0, 0x2

    iput v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mBytecountInterval:I

    .line 40
    new-instance v0, Lde/blinkt/openvpn/core/OpenVpnManagementThread$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread$$ExternalSyntheticLambda0;-><init>(Lde/blinkt/openvpn/core/OpenVpnManagementThread;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHoldRunnable:Ljava/lang/Runnable;

    .line 43
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mProfile:Lde/blinkt/openvpn/core/VpnProfile;

    .line 44
    iput-object p2, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p2}, Lde/blinkt/openvpn/core/OpenVPNService;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHandler:Landroid/os/Handler;

    .line 46
    iput-object p3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocketPath:Ljava/lang/String;

    .line 47
    return-void
.end method

.method private handleHold(Ljava/lang/String;)V
    .locals 3
    .param p1, "argument"    # Ljava/lang/String;

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    const v0, 0x7f1102a3

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_WAITING_FOR_USER_INPUT:Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v2, "WAIT"

    invoke-static {v2, p1, v0, v1}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;)V

    return-void
.end method

.method private synthetic lambda$new$0()V
    .locals 1

    .line 40
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->shouldBeRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->releaseHoldCmd()V

    :cond_0
    return-void
.end method

.method private managementCommand(Ljava/lang/String;)Z
    .locals 3
    .param p1, "cmd"    # Ljava/lang/String;

    .line 61
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v0}, Landroid/net/LocalSocket;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 63
    :cond_0
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v0}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 64
    .local v0, "out":Ljava/io/OutputStream;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 65
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    const/4 v1, 0x1

    return v1

    .line 67
    .end local v0    # "out":Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    return v1

    .line 61
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :goto_0
    return v1
.end method

.method private processByteCount(Ljava/lang/String;)V
    .locals 5
    .param p1, "argument"    # Ljava/lang/String;

    .line 103
    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .local v0, "comma":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .local v1, "in":J
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .local v3, "out":J
    invoke-static {v1, v2, v3, v4}, Lde/blinkt/openvpn/core/VpnStatus;->updateByteCount(JJ)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "in":J
    .end local v3    # "out":J
    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    return-void
.end method

.method private processCommand(Ljava/lang/String;)V
    .locals 7
    .param p1, "command"    # Ljava/lang/String;

    .line 96
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, ":"

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "parts":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v3, v0, v2

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .local v3, "cmd":Ljava/lang/String;
    array-length v5, v0

    if-le v5, v4, :cond_0

    aget-object v5, v0, v4

    goto :goto_0

    :cond_0
    const-string v5, ""

    .local v5, "argument":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_1
    goto :goto_1

    :sswitch_0
    const-string v1, "PASSWORD"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v4

    goto :goto_2

    :sswitch_1
    const-string v1, "BYTECOUNT"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    goto :goto_2

    :sswitch_2
    const-string v1, "STATE"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x5

    goto :goto_2

    :sswitch_3
    const-string v1, "PROXY"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x6

    goto :goto_2

    :sswitch_4
    const-string v1, "INFO"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    goto :goto_2

    :sswitch_5
    const-string v2, "HOLD"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_2

    :sswitch_6
    const-string v1, "LOG"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x7

    goto :goto_2

    :sswitch_7
    const-string v1, "NEED-OK"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x3

    goto :goto_2

    :goto_1
    const/4 v1, -0x1

    :goto_2
    packed-switch v1, :pswitch_data_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown management command: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->logWarning(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_0
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processLogMessage(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_1
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processProxyCMD(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_2
    iget-boolean v1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mShuttingDown:Z

    if-nez v1, :cond_3

    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processState(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_3
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processByteCount(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_4
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processNeedCommand(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_5
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->handleHold(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_6
    invoke-direct {p0, v5}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processPWCommand(Ljava/lang/String;)V

    goto :goto_3

    .end local v0    # "parts":[Ljava/lang/String;
    .end local v3    # "cmd":Ljava/lang/String;
    .end local v5    # "argument":Ljava/lang/String;
    :cond_2
    const-string v0, "SUCCESS: "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    :goto_3
    :pswitch_7
    goto :goto_4

    :cond_4
    const-string v0, "PROTECTFD: "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mFDList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/FileDescriptor;

    .local v0, "fdToProtect":Ljava/io/FileDescriptor;
    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->protectFileDescriptor(Ljava/io/FileDescriptor;)V

    goto :goto_3

    .end local v0    # "fdToProtect":Ljava/io/FileDescriptor;
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unrecognized management command: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logWarning(Ljava/lang/String;)V

    :goto_4
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x682f9d8d -> :sswitch_7
        0x12724 -> :sswitch_6
        0x21ecbf -> :sswitch_5
        0x225cae -> :sswitch_4
        0x48dd24e -> :sswitch_3
        0x4b8cc71 -> :sswitch_2
        0x2c0c64e7 -> :sswitch_1
        0x772faa9b -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

.method private processInput(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "pendingInput"    # Ljava/lang/String;

    .line 95
    nop

    :goto_0
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "\\r?\\n"

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "tokens":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-direct {p0, v1}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processCommand(Ljava/lang/String;)V

    array-length v1, v0

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    aget-object v1, v0, v2

    goto :goto_1

    :cond_0
    const-string v1, ""

    :goto_1
    move-object p1, v1

    .end local v0    # "tokens":[Ljava/lang/String;
    goto :goto_0

    :cond_1
    return-object p1
.end method

.method private processLogMessage(Ljava/lang/String;)V
    .locals 6
    .param p1, "argument"    # Ljava/lang/String;

    .line 97
    const-string v0, ","

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "args":[Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, v0, v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_0
    goto :goto_0

    :pswitch_0
    const-string v2, "W"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_1

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    goto :goto_2

    :pswitch_1
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .local v1, "level":Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    :goto_2
    const/4 v2, 0x2

    :try_start_0
    aget-object v3, v0, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .local v3, "logLevel":I
    const/4 v4, 0x3

    aget-object v4, v0, v4

    invoke-static {v1, v3, v4}, Lde/blinkt/openvpn/core/VpnStatus;->logMessageOpenVPN(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "logLevel":I
    goto :goto_3

    :catch_0
    move-exception v3

    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid log level: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v2, v0, v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lde/blinkt/openvpn/core/VpnStatus;->logError(Ljava/lang/String;)V

    .end local v3    # "e":Ljava/lang/NumberFormatException;
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x57
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method

.method private processNeedCommand(Ljava/lang/String;)V
    .locals 18
    .param p1, "argument"    # Ljava/lang/String;

    .line 104
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const/16 v0, 0x27

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .local v3, "p1":I
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v2, v0, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .local v4, "p2":I
    const/4 v0, -0x1

    if-eq v3, v0, :cond_4

    if-ne v4, v0, :cond_0

    goto/16 :goto_3

    :cond_0
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .local v5, "needed":Ljava/lang/String;
    add-int/lit8 v6, v4, 0x2

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .local v6, "extra":Ljava/lang/String;
    const-string v7, "ok"

    .local v7, "status":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    sparse-switch v8, :sswitch_data_0

    :cond_1
    goto/16 :goto_0

    :sswitch_0
    const-string v8, "DNS6SERVER"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v8, v10

    goto :goto_1

    :sswitch_1
    const-string v8, "IFCONFIG6"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x7

    goto :goto_1

    :sswitch_2
    const-string v8, "ROUTE"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x4

    goto :goto_1

    :sswitch_3
    const-string v8, "OPENTUN"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/16 v8, 0x8

    goto :goto_1

    :sswitch_4
    const-string v8, "DNSSERVER"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v8, v12

    goto :goto_1

    :sswitch_5
    const-string v8, "DNSDOMAIN"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v8, v9

    goto :goto_1

    :sswitch_6
    const-string v8, "ROUTE6"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x5

    goto :goto_1

    :sswitch_7
    const-string v8, "IFCONFIG"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x6

    goto :goto_1

    :sswitch_8
    const-string v8, "PROTECTFD"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v8, v11

    goto :goto_1

    :goto_0
    move v8, v0

    :goto_1
    const/4 v13, 0x0

    const-string v14, " "

    packed-switch v8, :pswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown needok command: "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logWarning(Ljava/lang/String;)V

    const-string v7, "ignore"

    goto/16 :goto_2

    :pswitch_0
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0}, Lde/blinkt/openvpn/core/OpenVPNService;->openTun()Landroid/os/ParcelFileDescriptor;

    move-result-object v8

    .local v8, "pfd":Landroid/os/ParcelFileDescriptor;
    if-eqz v8, :cond_2

    :try_start_0
    const-class v0, Ljava/io/FileDescriptor;

    const-string v9, "getInt$"

    new-array v10, v11, [Ljava/lang/Class;

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "getInt":Ljava/lang/reflect/Method;
    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v9

    .local v9, "fdint":I
    new-instance v10, Ljava/io/FileDescriptor;

    invoke-direct {v10}, Ljava/io/FileDescriptor;-><init>()V

    .local v10, "fd":Ljava/io/FileDescriptor;
    const-class v14, Ljava/io/FileDescriptor;

    const-string v15, "setInt$"

    move/from16 v16, v11

    new-array v11, v12, [Ljava/lang/Class;

    sget-object v17, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v17, v11, v16

    invoke-virtual {v14, v15, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .local v11, "setInt":Ljava/lang/reflect/Method;
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v11, v10, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v14, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    new-array v12, v12, [Ljava/io/FileDescriptor;

    aput-object v10, v12, v16

    invoke-virtual {v14, v12}, Landroid/net/LocalSocket;->setFileDescriptorsForSend([Ljava/io/FileDescriptor;)V

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "needok \'"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, "\' ok\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v1, v12}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    iget-object v12, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v12, v13}, Landroid/net/LocalSocket;->setFileDescriptorsForSend([Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .end local v0    # "getInt":Ljava/lang/reflect/Method;
    .end local v9    # "fdint":I
    .end local v10    # "fd":Ljava/io/FileDescriptor;
    .end local v11    # "setInt":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v9, "Could not send fd"

    invoke-static {v9, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v7, "cancel"

    goto :goto_2

    .end local v8    # "pfd":Landroid/os/ParcelFileDescriptor;
    :pswitch_1
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0, v6}, Lde/blinkt/openvpn/core/OpenVPNService;->setLocalIPv6(Ljava/lang/String;)V

    goto :goto_2

    :pswitch_2
    move/from16 v16, v11

    invoke-virtual {v6, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .local v8, "i":[Ljava/lang/String;
    iget-object v9, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    aget-object v10, v8, v16

    aget-object v11, v8, v12

    const-string v12, ""

    invoke-virtual {v9, v10, v11, v0, v12}, Lde/blinkt/openvpn/core/OpenVPNService;->setLocalIP(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_2

    .end local v8    # "i":[Ljava/lang/String;
    :pswitch_3
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    const-string v8, "tun"

    invoke-virtual {v0, v6, v8}, Lde/blinkt/openvpn/core/OpenVPNService;->addRoutev6(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_4
    move/from16 v16, v11

    invoke-virtual {v6, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "r":[Ljava/lang/String;
    iget-object v8, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    aget-object v11, v0, v16

    aget-object v12, v0, v12

    aget-object v10, v0, v10

    array-length v14, v0

    if-le v14, v9, :cond_3

    aget-object v13, v0, v9

    :cond_3
    invoke-virtual {v8, v11, v12, v10, v13}, Lde/blinkt/openvpn/core/OpenVPNService;->addRoute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .end local v0    # "r":[Ljava/lang/String;
    :pswitch_5
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0, v6}, Lde/blinkt/openvpn/core/OpenVPNService;->addSearchDomain(Ljava/lang/String;)V

    goto :goto_2

    :pswitch_6
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v0, v6}, Lde/blinkt/openvpn/core/OpenVPNService;->addDNS(Ljava/lang/String;)V

    goto :goto_2

    :pswitch_7
    iget-object v0, v1, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mFDList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/FileDescriptor;

    invoke-direct {v1, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->protectFileDescriptor(Ljava/io/FileDescriptor;)V

    :goto_2
    const-string v0, "needok \'%s\' %s\n"

    filled-new-array {v5, v7}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    .end local v5    # "needed":Ljava/lang/String;
    .end local v6    # "extra":Ljava/lang/String;
    .end local v7    # "status":Ljava/lang/String;
    :cond_4
    :goto_3
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x7e2d8453 -> :sswitch_8
        -0x73038961 -> :sswitch_7
        -0x6f9174d3 -> :sswitch_6
        -0x580ad8f3 -> :sswitch_5
        -0x3efc7e74 -> :sswitch_4
        -0x207ef49d -> :sswitch_3
        0x4a8ba29 -> :sswitch_2
        0x12925d77 -> :sswitch_1
        0x78830dd0 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private processPWCommand(Ljava/lang/String;)V
    .locals 0
    .param p1, "argument"    # Ljava/lang/String;

    .line 106
    return-void
.end method

.method private processProxyCMD(Ljava/lang/String;)V
    .locals 1
    .param p1, "argument"    # Ljava/lang/String;

    .line 101
    const-string v0, "proxy NONE\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    return-void
.end method

.method private processState(Ljava/lang/String;)V
    .locals 3
    .param p1, "argument"    # Ljava/lang/String;

    .line 102
    const-string v0, ","

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "args":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x2

    if-le v1, v2, :cond_0

    aget-object v1, v0, v2

    goto :goto_0

    :cond_0
    const-string v1, ""

    .local v1, "message":Ljava/lang/String;
    :goto_0
    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2, v1}, Lde/blinkt/openvpn/core/VpnStatus;->updateStateString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private protectFileDescriptor(Ljava/io/FileDescriptor;)V
    .locals 4
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .line 105
    :try_start_0
    const-class v0, Ljava/io/FileDescriptor;

    const-string v1, "getInt$"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "getInt":Ljava/lang/reflect/Method;
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .local v1, "fdint":I
    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mOpenVPNService:Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-virtual {v2, v1}, Lde/blinkt/openvpn/core/OpenVPNService;->protect(I)Z

    invoke-static {p1}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "getInt":Ljava/lang/reflect/Method;
    .end local v1    # "fdint":I
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Failed to protect FD"

    invoke-static {v1, v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private releaseHoldCmd()V
    .locals 4

    .line 100
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHandler:Landroid/os/Handler;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHoldRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mLastHoldRelease:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7d0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const-wide/16 v0, 0x3e8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mLastHoldRelease:J

    const-string v0, "hold release\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bytecount "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mBytecountInterval:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    const-string v0, "state on\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    return-void
.end method


# virtual methods
.method public networkChange(Z)V
    .locals 1
    .param p1, "sameNetwork"    # Z

    .line 107
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->resume()V

    goto :goto_0

    :cond_0
    const-string v0, "network-change\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    :goto_0
    return-void
.end method

.method public openManagementInterface(Landroid/content/Context;)Z
    .locals 4
    .param p1, "c"    # Landroid/content/Context;

    .line 51
    :try_start_0
    new-instance v0, Landroid/net/LocalSocket;

    invoke-direct {v0}, Landroid/net/LocalSocket;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    .line 52
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    new-instance v1, Landroid/net/LocalSocketAddress;

    iget-object v2, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocketPath:Ljava/lang/String;

    sget-object v3, Landroid/net/LocalSocketAddress$Namespace;->FILESYSTEM:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v1, v2, v3}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    invoke-virtual {v0, v1}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    const/4 v0, 0x1

    return v0

    .line 54
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method public pause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V
    .locals 1
    .param p1, "reason"    # Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 112
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->lastPauseReason:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnStatus;->updateStatePause(Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->signalusr1()V

    :goto_0
    return-void
.end method

.method public reconnect()V
    .locals 0

    .line 111
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->signalusr1()V

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->resume()V

    return-void
.end method

.method public resume()V
    .locals 1

    .line 113
    iget-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->releaseHoldCmd()V

    goto :goto_0

    :cond_0
    const-string v0, "Not in waiting for release hold state, ignoring resume"

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logInfo(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public run()V
    .locals 8

    .line 72
    const-string v0, "Management Thread starting"

    const-string v1, "OpenVPNManagement"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const/16 v0, 0x800

    new-array v0, v0, [B

    .line 74
    .local v0, "buffer":[B
    const-string v2, ""

    .line 75
    .local v2, "pendingInput":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 76
    .local v3, "instream":Ljava/io/InputStream;
    :try_start_1
    const-string v4, "version 3\n"

    invoke-direct {p0, v4}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    .line 77
    const-string v4, "state on\n"

    invoke-direct {p0, v4}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    .line 78
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bytecount "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mBytecountInterval:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    .line 79
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v4

    if-nez v4, :cond_1

    iget-boolean v4, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mShuttingDown:Z

    if-nez v4, :cond_1

    .line 80
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 81
    .local v4, "numBytesRead":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    goto :goto_1

    .line 82
    :cond_0
    new-instance v5, Ljava/lang/String;

    const-string v6, "UTF-8"

    const/4 v7, 0x0

    invoke-direct {v5, v0, v7, v4, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 83
    .local v5, "input":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    .end local v2    # "pendingInput":Ljava/lang/String;
    .local v6, "pendingInput":Ljava/lang/String;
    :try_start_2
    invoke-direct {p0, v6}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->processInput(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .end local v4    # "numBytesRead":I
    .end local v5    # "input":Ljava/lang/String;
    .end local v6    # "pendingInput":Ljava/lang/String;
    .restart local v2    # "pendingInput":Ljava/lang/String;
    goto :goto_0

    .line 75
    .end local v2    # "pendingInput":Ljava/lang/String;
    .restart local v6    # "pendingInput":Ljava/lang/String;
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 86
    .end local v6    # "pendingInput":Ljava/lang/String;
    .restart local v2    # "pendingInput":Ljava/lang/String;
    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 89
    .end local v3    # "instream":Ljava/io/InputStream;
    :cond_2
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    if-eqz v3, :cond_5

    :try_start_4
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_5

    :catch_0
    move-exception v3

    goto :goto_5

    .line 75
    .restart local v3    # "instream":Ljava/io/InputStream;
    :catchall_1
    move-exception v4

    move-object v6, v2

    move-object v2, v4

    .end local v2    # "pendingInput":Ljava/lang/String;
    .restart local v6    # "pendingInput":Ljava/lang/String;
    :goto_2
    if-eqz v3, :cond_3

    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v4

    :try_start_6
    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "buffer":[B
    .end local v6    # "pendingInput":Ljava/lang/String;
    :cond_3
    :goto_3
    throw v2
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 89
    .end local v3    # "instream":Ljava/io/InputStream;
    .restart local v0    # "buffer":[B
    .restart local v6    # "pendingInput":Ljava/lang/String;
    :catchall_3
    move-exception v1

    move-object v2, v6

    goto :goto_6

    .line 86
    :catch_1
    move-exception v3

    move-object v2, v6

    goto :goto_4

    .line 89
    .end local v6    # "pendingInput":Ljava/lang/String;
    .restart local v2    # "pendingInput":Ljava/lang/String;
    :catchall_4
    move-exception v1

    goto :goto_6

    .line 86
    :catch_2
    move-exception v3

    .line 87
    .local v3, "e":Ljava/io/IOException;
    :goto_4
    :try_start_7
    iget-boolean v4, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mShuttingDown:Z

    if-nez v4, :cond_4

    const-string v4, "Management socket error"

    invoke-static {v4, v3}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 89
    .end local v3    # "e":Ljava/io/IOException;
    :cond_4
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    if-eqz v3, :cond_5

    :try_start_8
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 91
    :cond_5
    :goto_5
    const-string v3, "Management thread exiting"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    return-void

    .line 89
    :goto_6
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    if-eqz v3, :cond_6

    :try_start_9
    iget-object v3, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    goto :goto_7

    :catch_3
    move-exception v3

    .line 90
    :cond_6
    :goto_7
    throw v1
.end method

.method public sendCRResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cr-response "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    return-void
.end method

.method public setPauseCallback(Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;)V
    .locals 0
    .param p1, "callback"    # Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;

    .line 108
    iput-object p1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mPauseCallback:Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;

    return-void
.end method

.method shouldBeRunning()Z
    .locals 1

    .line 98
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mPauseCallback:Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mPauseCallback:Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;

    invoke-interface {v0}, Lde/blinkt/openvpn/core/OpenVPNManagement$PausedStateCallback;->shouldBeRunning()Z

    move-result v0

    if-eqz v0, :cond_0

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

.method public signalusr1()V
    .locals 2

    .line 110
    iget-object v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHandler:Landroid/os/Handler;

    iget-object v1, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mResumeHoldRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mWaitingForRelease:Z

    if-nez v0, :cond_0

    const-string v0, "signal SIGUSR1\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method public stopVPN(Z)Z
    .locals 1
    .param p1, "replaceConnection"    # Z

    .line 114
    const-string v0, "signal SIGTERM\n"

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->managementCommand(Ljava/lang/String;)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/blinkt/openvpn/core/OpenVpnManagementThread;->mShuttingDown:Z

    return v0
.end method
