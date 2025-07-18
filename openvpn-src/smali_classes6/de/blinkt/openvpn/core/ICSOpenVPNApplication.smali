.class public Lde/blinkt/openvpn/core/ICSOpenVPNApplication;
.super Landroid/app/Application;
.source "ICSOpenVPNApplication.java"


# instance fields
.field private mStatus:Lde/blinkt/openvpn/core/StatusListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private createFirstLaunchSetting()V
    .locals 6

    .line 62
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 63
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "firstStart"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v2, v4, v2

    if-nez v2, :cond_0

    .line 64
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 65
    .local v2, "pedit":Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v2, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 66
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 68
    .end local v2    # "pedit":Landroid/content/SharedPreferences$Editor;
    :cond_0
    return-void
.end method

.method static synthetic lambda$onCreate$0()V
    .locals 3

    .line 37
    const-string v0, "PQC_VPN_App"

    :try_start_0
    const-string v1, "Starting background native library pre-load."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const-string v1, "openvpn"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 43
    const-string v1, "Background native library pre-load complete."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v1

    .line 46
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "Critical error during native library pre-load."

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .end local v1    # "t":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;

    .line 74
    invoke-static {p1}, Lde/blinkt/openvpn/core/LocaleHelper;->updateResources(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 75
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 79
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 80
    invoke-static {p0}, Lde/blinkt/openvpn/core/LocaleHelper;->onConfigurationChange(Landroid/content/Context;)V

    .line 81
    return-void
.end method

.method public onCreate()V
    .locals 2

    .line 23
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 25
    const-string v0, "debug"

    invoke-virtual {v0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lde/blinkt/openvpn/core/ICSOpenVPNApplication$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lde/blinkt/openvpn/core/ICSOpenVPNApplication$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 54
    new-instance v0, Lde/blinkt/openvpn/core/StatusListener;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/StatusListener;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/ICSOpenVPNApplication;->mStatus:Lde/blinkt/openvpn/core/StatusListener;

    .line 55
    iget-object v0, p0, Lde/blinkt/openvpn/core/ICSOpenVPNApplication;->mStatus:Lde/blinkt/openvpn/core/StatusListener;

    invoke-virtual {p0}, Lde/blinkt/openvpn/core/ICSOpenVPNApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/core/StatusListener;->init(Landroid/content/Context;)V

    .line 58
    invoke-direct {p0}, Lde/blinkt/openvpn/core/ICSOpenVPNApplication;->createFirstLaunchSetting()V

    .line 59
    return-void
.end method
