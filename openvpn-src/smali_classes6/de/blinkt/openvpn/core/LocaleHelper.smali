.class public Lde/blinkt/openvpn/core/LocaleHelper;
.super Ljava/lang/Object;
.source "LocaleHelper.java"


# static fields
.field private static desiredLocale:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const/4 v0, 0x0

    sput-object v0, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onConfigurationChange(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 63
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 66
    .local v0, "res":Landroid/content/res/Resources;
    nop

    .line 67
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v1

    .line 72
    .local v1, "current":Ljava/util/Locale;
    sget-object v2, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    if-ne v1, v2, :cond_0

    .line 73
    return-void

    .line 75
    :cond_0
    new-instance v2, Landroid/content/res/Configuration;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 77
    .local v2, "config":Landroid/content/res/Configuration;
    sget-object v3, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 79
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 80
    return-void
.end method

.method public static setDesiredLocale(Landroid/content/Context;)V
    .locals 8
    .param p0, "c"    # Landroid/content/Context;

    .line 19
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 20
    .local v0, "current":Ljava/util/Locale;
    const/4 v1, 0x1

    .line 23
    .local v1, "defForce":Z
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    new-instance v3, Ljava/util/Locale;

    const-string v4, "de"

    invoke-direct {v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Ljava/util/Locale;

    const-string v5, "ja"

    invoke-direct {v3, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    new-instance v3, Ljava/util/Locale;

    const-string v5, "tr"

    invoke-direct {v3, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 24
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x2

    aput-object v3, v2, v5

    new-instance v3, Ljava/util/Locale;

    const-string v5, "zh-TW"

    invoke-direct {v3, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x3

    aput-object v3, v2, v5

    .line 26
    .local v2, "whitelisted":[Ljava/lang/String;
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    .line 27
    .local v3, "currentLanguage":Ljava/lang/String;
    array-length v5, v2

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v6, v2, v4

    .line 28
    .local v6, "lang":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 29
    const/4 v1, 0x0

    .line 30
    goto :goto_1

    .line 27
    .end local v6    # "lang":Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 34
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object v4

    const-string v5, "zh-Hant"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 35
    const/4 v1, 0x0

    .line 37
    :cond_2
    invoke-static {p0}, Lde/blinkt/openvpn/core/Preferences;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "allow_translation"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 39
    .local v4, "allow_translation":Z
    if-nez v4, :cond_3

    .line 40
    new-instance v5, Ljava/util/Locale;

    const-string v6, "en"

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v5, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    .line 41
    :cond_3
    return-void
.end method

.method public static updateResources(Landroid/content/Context;)Landroid/content/Context;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 44
    sget-object v0, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    if-nez v0, :cond_0

    .line 45
    return-object p0

    .line 47
    :cond_0
    sget-object v0, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 49
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 50
    .local v0, "res":Landroid/content/res/Resources;
    new-instance v1, Landroid/content/res/Configuration;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 51
    .local v1, "config":Landroid/content/res/Configuration;
    nop

    .line 52
    sget-object v2, Lde/blinkt/openvpn/core/LocaleHelper;->desiredLocale:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 53
    invoke-virtual {p0, v1}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object p0

    .line 58
    return-object p0
.end method
