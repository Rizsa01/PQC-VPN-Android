.class public Lde/blinkt/openvpn/core/StatusListener;
.super Ljava/lang/Object;
.source "StatusListener.java"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$LogListener;
.implements Lde/blinkt/openvpn/core/VpnStatus$ProfileNotifyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;
    }
.end annotation


# instance fields
.field private mCacheDir:Ljava/io/File;

.field private final mCallback:Lde/blinkt/openvpn/core/IStatusCallbacks;

.field private final mConnection:Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

.field private mContext:Landroid/content/Context;

.field private pkgName:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetmCacheDir(Lde/blinkt/openvpn/core/StatusListener;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lde/blinkt/openvpn/core/StatusListener;->mCacheDir:Ljava/io/File;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCallback(Lde/blinkt/openvpn/core/StatusListener;)Lde/blinkt/openvpn/core/IStatusCallbacks;
    .locals 0

    iget-object p0, p0, Lde/blinkt/openvpn/core/StatusListener;->mCallback:Lde/blinkt/openvpn/core/IStatusCallbacks;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmContext(Lde/blinkt/openvpn/core/StatusListener;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lde/blinkt/openvpn/core/StatusListener$1;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/StatusListener$1;-><init>(Lde/blinkt/openvpn/core/StatusListener;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->mCallback:Lde/blinkt/openvpn/core/IStatusCallbacks;

    .line 77
    new-instance v0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

    invoke-direct {v0, p0}, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;-><init>(Lde/blinkt/openvpn/core/StatusListener;)V

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->mConnection:Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

    .line 134
    const-string v0, "(packageName not yet set)"

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->pkgName:Ljava/lang/String;

    return-void
.end method

.method private logExitNotification(Landroid/app/ApplicationExitInfo;Ljava/lang/String;)V
    .locals 5
    .param p1, "aei"    # Landroid/app/ApplicationExitInfo;
    .param p2, "s"    # Ljava/lang/String;

    .line 170
    if-eqz p1, :cond_0

    .line 171
    new-instance v0, Lde/blinkt/openvpn/core/LogItem;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v3

    invoke-direct {v0, v1, v2, v3, v4}, Lde/blinkt/openvpn/core/LogItem;-><init>(Lde/blinkt/openvpn/core/VpnStatus$LogLevel;Ljava/lang/String;J)V

    .line 172
    .local v0, "li":Lde/blinkt/openvpn/core/LogItem;
    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->newLogItemIfUnique(Lde/blinkt/openvpn/core/LogItem;)V

    .line 174
    .end local v0    # "li":Lde/blinkt/openvpn/core/LogItem;
    :cond_0
    return-void
.end method

.method private logLatestExitReasons(Landroid/content/Context;)V
    .locals 10
    .param p1, "c"    # Landroid/content/Context;

    .line 151
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 152
    .local v0, "activityManager":Landroid/app/ActivityManager;
    const/4 v1, 0x0

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v2}, Landroid/app/ActivityManager;->getHistoricalProcessExitReasons(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v1

    .line 153
    .local v1, "exitReasons":Ljava/util/List;, "Ljava/util/List<Landroid/app/ApplicationExitInfo;>;"
    const/4 v2, 0x0

    .line 154
    .local v2, "lastguiexit":Landroid/app/ApplicationExitInfo;
    const/4 v3, 0x0

    .line 155
    .local v3, "lastserviceexit":Landroid/app/ApplicationExitInfo;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ApplicationExitInfo;

    .line 156
    .local v5, "aei":Landroid/app/ApplicationExitInfo;
    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getProcessName()Ljava/lang/String;

    move-result-object v6

    const-string v7, ":openvpn"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 157
    if-eqz v3, :cond_0

    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v6

    invoke-virtual {v3}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_3

    .line 158
    :cond_0
    move-object v3, v5

    goto :goto_1

    .line 160
    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v6

    invoke-virtual {v2}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_3

    .line 161
    :cond_2
    move-object v2, v5

    .line 163
    .end local v5    # "aei":Landroid/app/ApplicationExitInfo;
    :cond_3
    :goto_1
    goto :goto_0

    .line 164
    :cond_4
    const-string v4, "Last exit reason reported by Android for Service Process: "

    invoke-direct {p0, v3, v4}, Lde/blinkt/openvpn/core/StatusListener;->logExitNotification(Landroid/app/ApplicationExitInfo;Ljava/lang/String;)V

    .line 165
    const-string v4, "Last exit reason reported by Android for UI Process: "

    invoke-direct {p0, v2, v4}, Lde/blinkt/openvpn/core/StatusListener;->logExitNotification(Landroid/app/ApplicationExitInfo;Ljava/lang/String;)V

    .line 167
    return-void
.end method


# virtual methods
.method init(Landroid/content/Context;)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;

    .line 137
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->pkgName:Ljava/lang/String;

    .line 138
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/blinkt/openvpn/core/OpenVPNStatusService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 139
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "de.blinkt.openvpn.START_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lde/blinkt/openvpn/core/StatusListener;->mCacheDir:Ljava/io/File;

    .line 142
    iget-object v1, p0, Lde/blinkt/openvpn/core/StatusListener;->mConnection:Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 143
    iput-object p1, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    .line 145
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    .line 146
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/StatusListener;->logLatestExitReasons(Landroid/content/Context;)V

    .line 147
    :cond_0
    return-void
.end method

.method public newLog(Lde/blinkt/openvpn/core/LogItem;)V
    .locals 7
    .param p1, "logItem"    # Lde/blinkt/openvpn/core/LogItem;

    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lde/blinkt/openvpn/core/StatusListener;->pkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(OpenVPN)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "tag":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1}, Lde/blinkt/openvpn/core/LogItem;->getLogtime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    .line 180
    .local v1, "logAge":J
    const-wide/16 v3, 0x1388

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    .line 182
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/16 v5, 0x3e8

    div-long v5, v1, v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "[%ds ago]"

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    :cond_0
    sget-object v3, Lde/blinkt/openvpn/core/StatusListener$2;->$SwitchMap$de$blinkt$openvpn$core$VpnStatus$LogLevel:[I

    invoke-virtual {p1}, Lde/blinkt/openvpn/core/LogItem;->getLogLevel()Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    move-result-object v4

    invoke-virtual {v4}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 190
    iget-object v3, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 189
    :pswitch_0
    iget-object v3, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 188
    :pswitch_1
    iget-object v3, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 187
    :pswitch_2
    iget-object v3, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 186
    :pswitch_3
    iget-object v3, p0, Lde/blinkt/openvpn/core/StatusListener;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lde/blinkt/openvpn/core/LogItem;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public notifyProfileVersionChanged(Ljava/lang/String;IZ)V
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "version"    # I
    .param p3, "changedInThisProcess"    # Z

    .line 197
    if-eqz p3, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->mConnection:Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

    iget-object v0, v0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    if-eqz v0, :cond_0

    .line 200
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/StatusListener;->mConnection:Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;

    iget-object v0, v0, Lde/blinkt/openvpn/core/StatusListener$StatusServiceConnection;->serviceStatus:Lde/blinkt/openvpn/core/IServiceStatus;

    invoke-interface {v0, p1, p2}, Lde/blinkt/openvpn/core/IServiceStatus;->notifyProfileVersionChanged(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    goto :goto_0

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->logException(Ljava/lang/Throwable;)V

    .line 205
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method
