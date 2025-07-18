.class public final Landroidx/browser/customtabs/CustomTabsIntent$Builder;
.super Ljava/lang/Object;
.source "CustomTabsIntent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/browser/customtabs/CustomTabsIntent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mActionButtons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field private mActivityOptions:Landroid/app/ActivityOptions;

.field private mColorSchemeParamBundles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field private final mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

.field private mDefaultColorSchemeBundle:Landroid/os/Bundle;

.field private mInstantAppsEnabled:Z

.field private final mIntent:Landroid/content/Intent;

.field private mMenuItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field private mShareIdentity:Z

.field private mShareState:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 691
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 675
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    .line 676
    new-instance v0, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-direct {v0}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;-><init>()V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 683
    const/4 v0, 0x0

    iput v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareState:I

    .line 684
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mInstantAppsEnabled:Z

    .line 691
    return-void
.end method

.method public constructor <init>(Landroidx/browser/customtabs/CustomTabsSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/browser/customtabs/CustomTabsSession;

    .line 702
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 675
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    .line 676
    new-instance v0, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-direct {v0}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;-><init>()V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 683
    const/4 v0, 0x0

    iput v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareState:I

    .line 684
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mInstantAppsEnabled:Z

    .line 703
    if-eqz p1, :cond_0

    .line 704
    invoke-virtual {p0, p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setSession(Landroidx/browser/customtabs/CustomTabsSession;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    .line 706
    :cond_0
    return-void
.end method

.method private setCurrentLocaleAsDefaultAcceptLanguage()V
    .locals 5

    .line 1490
    invoke-static {}, Landroidx/browser/customtabs/CustomTabsIntent$Api24Impl;->getDefaultLocale()Ljava/lang/String;

    move-result-object v0

    .line 1491
    .local v0, "defaultLocale":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1492
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.android.browser.headers"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1493
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 1494
    .local v1, "header":Landroid/os/Bundle;
    :goto_0
    const-string v3, "Accept-Language"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1495
    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1496
    iget-object v3, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v3, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1499
    .end local v1    # "header":Landroid/os/Bundle;
    :cond_1
    return-void
.end method

.method private setLanguageTag(Ljava/util/Locale;)V
    .locals 1
    .param p1, "locale"    # Ljava/util/Locale;

    .line 1503
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-static {v0, p1}, Landroidx/browser/customtabs/CustomTabsIntent$Api21Impl;->setLanguageTag(Landroid/content/Intent;Ljava/util/Locale;)V

    .line 1504
    return-void
.end method

.method private setSessionParameters(Landroid/os/IBinder;Landroid/app/PendingIntent;)V
    .locals 2
    .param p1, "binder"    # Landroid/os/IBinder;
    .param p2, "sessionId"    # Landroid/app/PendingIntent;

    .line 735
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 736
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.support.customtabs.extra.SESSION"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 737
    if-eqz p2, :cond_0

    .line 738
    const-string v1, "android.support.customtabs.extra.SESSION_ID"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 741
    :cond_0
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 742
    return-void
.end method

.method private setShareIdentityEnabled()V
    .locals 2

    .line 1508
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    if-nez v0, :cond_0

    .line 1509
    invoke-static {}, Landroidx/browser/customtabs/CustomTabsIntent$Api23Impl;->makeBasicActivityOptions()Landroid/app/ActivityOptions;

    move-result-object v0

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    .line 1511
    :cond_0
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    iget-boolean v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareIdentity:Z

    invoke-static {v0, v1}, Landroidx/browser/customtabs/CustomTabsIntent$Api34Impl;->setShareIdentityEnabled(Landroid/app/ActivityOptions;Z)V

    .line 1512
    return-void
.end method


# virtual methods
.method public addDefaultShareMenuItem()Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 834
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShareState(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    .line 835
    return-object p0
.end method

.method public addMenuItem(Ljava/lang/String;Landroid/app/PendingIntent;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;

    .line 818
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mMenuItems:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mMenuItems:Ljava/util/ArrayList;

    .line 819
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 820
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.support.customtabs.customaction.MENU_ITEM_TITLE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    const-string v1, "android.support.customtabs.customaction.PENDING_INTENT"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 822
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 823
    return-object p0
.end method

.method public addToolbarItem(ILandroid/graphics/Bitmap;Ljava/lang/String;Landroid/app/PendingIntent;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "id"    # I
    .param p2, "icon"    # Landroid/graphics/Bitmap;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "pendingIntent"    # Landroid/app/PendingIntent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 945
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 946
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    .line 948
    :cond_0
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_1

    .line 952
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 953
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.support.customtabs.customaction.ID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 954
    const-string v1, "android.support.customtabs.customaction.ICON"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 955
    const-string v1, "android.support.customtabs.customaction.DESCRIPTION"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 956
    const-string v1, "android.support.customtabs.customaction.PENDING_INTENT"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 957
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 958
    return-object p0

    .line 949
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Exceeded maximum toolbar item count of 5"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public build()Landroidx/browser/customtabs/CustomTabsIntent;
    .locals 3

    .line 1445
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.SESSION"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1447
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setSessionParameters(Landroid/os/IBinder;Landroid/app/PendingIntent;)V

    .line 1449
    :cond_0
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mMenuItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 1450
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.MENU_ITEMS"

    iget-object v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 1452
    :cond_1
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    .line 1453
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.TOOLBAR_ITEMS"

    iget-object v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActionButtons:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 1455
    :cond_2
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS"

    iget-boolean v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mInstantAppsEnabled:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1457
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-virtual {v1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;->build()Landroidx/browser/customtabs/CustomTabColorSchemeParams;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1458
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBundle:Landroid/os/Bundle;

    if-eqz v0, :cond_3

    .line 1459
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1462
    :cond_3
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mColorSchemeParamBundles:Landroid/util/SparseArray;

    if-eqz v0, :cond_4

    .line 1463
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1464
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "androidx.browser.customtabs.extra.COLOR_SCHEME_PARAMS"

    iget-object v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mColorSchemeParamBundles:Landroid/util/SparseArray;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 1466
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1468
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_4
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.SHARE_STATE"

    iget v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareState:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1470
    nop

    .line 1471
    invoke-direct {p0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setCurrentLocaleAsDefaultAcceptLanguage()V

    .line 1474
    const/4 v0, 0x0

    .line 1475
    .restart local v0    # "bundle":Landroid/os/Bundle;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_5

    .line 1476
    invoke-direct {p0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShareIdentityEnabled()V

    .line 1478
    :cond_5
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    if-eqz v1, :cond_6

    .line 1479
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1481
    :cond_6
    new-instance v1, Landroidx/browser/customtabs/CustomTabsIntent;

    iget-object v2, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-direct {v1, v2, v0}, Landroidx/browser/customtabs/CustomTabsIntent;-><init>(Landroid/content/Intent;Landroid/os/Bundle;)V

    return-object v1
.end method

.method public enableUrlBarHiding()Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 772
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.ENABLE_URLBAR_HIDING"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 773
    return-object p0
.end method

.method public setActionButton(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/app/PendingIntent;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/Bitmap;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;

    .line 920
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setActionButton(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/app/PendingIntent;Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setActionButton(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/app/PendingIntent;Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "icon"    # Landroid/graphics/Bitmap;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "shouldTint"    # Z

    .line 901
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 902
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.support.customtabs.customaction.ID"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 903
    const-string v1, "android.support.customtabs.customaction.ICON"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 904
    const-string v1, "android.support.customtabs.customaction.DESCRIPTION"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    const-string v1, "android.support.customtabs.customaction.PENDING_INTENT"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 906
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "android.support.customtabs.extra.ACTION_BUTTON_BUNDLE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 907
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "android.support.customtabs.extra.TINT_ACTION_BUTTON"

    invoke-virtual {v1, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 908
    return-object p0
.end method

.method public setActivitySideSheetBreakpointDp(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "breakpointDp"    # I

    .line 1245
    if-lez p1, :cond_0

    .line 1250
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_SIDE_SHEET_BREAKPOINT_DP"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1251
    return-object p0

    .line 1246
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the initialWidthPx argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActivitySideSheetDecorationType(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "decorationType"    # I

    .line 1298
    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-gt p1, v0, :cond_0

    .line 1302
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_SIDE_SHEET_DECORATION_TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1303
    return-object p0

    .line 1299
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the decorationType argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActivitySideSheetMaximizationEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "enabled"    # Z

    .line 1262
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_SIDE_SHEET_ENABLE_MAXIMIZATION"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1263
    return-object p0
.end method

.method public setActivitySideSheetPosition(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "position"    # I

    .line 1276
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 1281
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_SIDE_SHEET_POSITION"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1282
    return-object p0

    .line 1277
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the sideSheetPosition argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActivitySideSheetRoundedCornersPosition(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "roundedCornersPosition"    # I

    .line 1318
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 1324
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_SIDE_SHEET_ROUNDED_CORNERS_POSITION"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1326
    return-object p0

    .line 1320
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the roundedCornersPosition./ argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBackgroundInteractionEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "enabled"    # Z

    .line 1425
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    xor-int/lit8 v1, p1, 0x1

    const-string v2, "androidx.browser.customtabs.extra.DISABLE_BACKGROUND_INTERACTION"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1426
    return-object p0
.end method

.method public setBookmarksButtonEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "enabled"    # Z

    .line 1372
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    xor-int/lit8 v1, p1, 0x1

    const-string v2, "org.chromium.chrome.browser.customtabs.EXTRA_DISABLE_STAR_BUTTON"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1373
    return-object p0
.end method

.method public setCloseButtonIcon(Landroid/graphics/Bitmap;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .line 794
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.CLOSE_BUTTON_ICON"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 795
    return-object p0
.end method

.method public setCloseButtonPosition(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "position"    # I

    .line 1355
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 1359
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.CLOSE_BUTTON_POSITION"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1360
    return-object p0

    .line 1356
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the position argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setColorScheme(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "colorScheme"    # I

    .line 1106
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 1109
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.COLOR_SCHEME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1110
    return-object p0

    .line 1107
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the colorScheme argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setColorSchemeParams(ILandroidx/browser/customtabs/CustomTabColorSchemeParams;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "colorScheme"    # I
    .param p2, "params"    # Landroidx/browser/customtabs/CustomTabColorSchemeParams;

    .line 1148
    if-ltz p1, :cond_1

    const/4 v0, 0x2

    if-gt p1, v0, :cond_1

    if-eqz p1, :cond_1

    .line 1152
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mColorSchemeParamBundles:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 1153
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mColorSchemeParamBundles:Landroid/util/SparseArray;

    .line 1155
    :cond_0
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mColorSchemeParamBundles:Landroid/util/SparseArray;

    invoke-virtual {p2}, Landroidx/browser/customtabs/CustomTabColorSchemeParams;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1156
    return-object p0

    .line 1150
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid colorScheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDefaultColorSchemeParams(Landroidx/browser/customtabs/CustomTabColorSchemeParams;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "params"    # Landroidx/browser/customtabs/CustomTabColorSchemeParams;

    .line 1170
    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBundle:Landroid/os/Bundle;

    .line 1171
    return-object p0
.end method

.method public setDefaultShareMenuItemEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 849
    if-eqz p1, :cond_0

    .line 850
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShareState(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    goto :goto_0

    .line 852
    :cond_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setShareState(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    .line 854
    :goto_0
    return-object p0
.end method

.method public setDownloadButtonEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "enabled"    # Z

    .line 1385
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    xor-int/lit8 v1, p1, 0x1

    const-string v2, "org.chromium.chrome.browser.customtabs.EXTRA_DISABLE_DOWNLOAD_BUTTON"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1386
    return-object p0
.end method

.method public setExitAnimations(Landroid/content/Context;II)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "enterResId"    # I
    .param p3, "exitResId"    # I

    .line 1090
    invoke-static {p1, p2, p3}, Landroidx/core/app/ActivityOptionsCompat;->makeCustomAnimation(Landroid/content/Context;II)Landroidx/core/app/ActivityOptionsCompat;

    move-result-object v0

    .line 1091
    invoke-virtual {v0}, Landroidx/core/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1092
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "android.support.customtabs.extra.EXIT_ANIMATION_BUNDLE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1093
    return-object p0
.end method

.method public setInitialActivityHeightPx(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "initialHeightPx"    # I

    .line 1216
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setInitialActivityHeightPx(II)Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setInitialActivityHeightPx(II)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "initialHeightPx"    # I
    .param p2, "activityHeightResizeBehavior"    # I

    .line 1191
    if-lez p1, :cond_1

    .line 1195
    if-ltz p2, :cond_0

    const/4 v0, 0x2

    if-gt p2, v0, :cond_0

    .line 1201
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.INITIAL_ACTIVITY_HEIGHT_PX"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1202
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.ACTIVITY_HEIGHT_RESIZE_BEHAVIOR"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1203
    return-object p0

    .line 1197
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the activityHeightResizeBehavior argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1192
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the initialHeightPx argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInitialActivityWidthPx(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "initialWidthPx"    # I

    .line 1229
    if-lez p1, :cond_0

    .line 1234
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.INITIAL_ACTIVITY_WIDTH_PX"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1235
    return-object p0

    .line 1230
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the initialWidthPx argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInstantAppsEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 0
    .param p1, "enabled"    # Z

    .line 1055
    iput-boolean p1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mInstantAppsEnabled:Z

    .line 1056
    return-object p0
.end method

.method public setNavigationBarColor(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 992
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-virtual {v0, p1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;->setNavigationBarColor(I)Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 993
    return-object p0
.end method

.method public setNavigationBarDividerColor(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1008
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-virtual {v0, p1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;->setNavigationBarDividerColor(I)Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 1009
    return-object p0
.end method

.method public setPendingSession(Landroidx/browser/customtabs/CustomTabsSession$PendingSession;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "session"    # Landroidx/browser/customtabs/CustomTabsSession$PendingSession;

    .line 729
    const/4 v0, 0x0

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsSession$PendingSession;->getId()Landroid/app/PendingIntent;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setSessionParameters(Landroid/os/IBinder;Landroid/app/PendingIntent;)V

    .line 730
    return-object p0
.end method

.method public setSecondaryToolbarColor(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 972
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-virtual {v0, p1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;->setSecondaryToolbarColor(I)Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 973
    return-object p0
.end method

.method public setSecondaryToolbarSwipeUpGesture(Landroid/app/PendingIntent;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;

    .line 1044
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.SECONDARY_TOOLBAR_SWIPE_UP_GESTURE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1045
    return-object p0
.end method

.method public setSecondaryToolbarViews(Landroid/widget/RemoteViews;[ILandroid/app/PendingIntent;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "remoteViews"    # Landroid/widget/RemoteViews;
    .param p2, "clickableIDs"    # [I
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;

    .line 1030
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.EXTRA_REMOTEVIEWS"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1031
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.EXTRA_REMOTEVIEWS_VIEW_IDS"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    .line 1032
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.EXTRA_REMOTEVIEWS_PENDINGINTENT"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1033
    return-object p0
.end method

.method public setSendToExternalDefaultHandlerEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "enabled"    # Z

    .line 1397
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.SEND_TO_EXTERNAL_HANDLER"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1398
    return-object p0
.end method

.method public setSession(Landroidx/browser/customtabs/CustomTabsSession;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "session"    # Landroidx/browser/customtabs/CustomTabsSession;

    .line 716
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsSession;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 717
    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsSession;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsSession;->getId()Landroid/app/PendingIntent;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setSessionParameters(Landroid/os/IBinder;Landroid/app/PendingIntent;)V

    .line 718
    return-object p0
.end method

.method public setShareIdentityEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 0
    .param p1, "enabled"    # Z

    .line 1435
    iput-boolean p1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareIdentity:Z

    .line 1436
    return-object p0
.end method

.method public setShareState(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 3
    .param p1, "shareState"    # I

    .line 868
    if-ltz p1, :cond_2

    const/4 v0, 0x2

    if-gt p1, v0, :cond_2

    .line 871
    iput p1, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mShareState:I

    .line 874
    const/4 v1, 0x1

    const-string v2, "android.support.customtabs.extra.SHARE_MENU_ITEM"

    if-ne p1, v1, :cond_0

    .line 875
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 876
    :cond_0
    if-ne p1, v0, :cond_1

    .line 877
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 879
    :cond_1
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 881
    :goto_0
    return-object p0

    .line 869
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the shareState argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setShowTitle(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "showTitle"    # Z

    .line 805
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    .line 806
    nop

    .line 805
    const-string v1, "android.support.customtabs.extra.TITLE_VISIBILITY"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 807
    return-object p0
.end method

.method public setStartAnimations(Landroid/content/Context;II)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "enterResId"    # I
    .param p3, "exitResId"    # I

    .line 1075
    invoke-static {p1, p2, p3}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object v0

    iput-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mActivityOptions:Landroid/app/ActivityOptions;

    .line 1077
    return-object p0
.end method

.method public setToolbarColor(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 1
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 761
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mDefaultColorSchemeBuilder:Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    invoke-virtual {v0, p1}, Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;->setToolbarColor(I)Landroidx/browser/customtabs/CustomTabColorSchemeParams$Builder;

    .line 762
    return-object p0
.end method

.method public setToolbarCornerRadiusDp(I)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "cornerRadiusDp"    # I

    .line 1337
    if-ltz p1, :cond_0

    const/16 v0, 0x10

    if-gt p1, v0, :cond_0

    .line 1341
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "androidx.browser.customtabs.extra.TOOLBAR_CORNER_RADIUS_DP"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1342
    return-object p0

    .line 1338
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value for the cornerRadiusDp argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTranslateLocale(Ljava/util/Locale;)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 0
    .param p1, "locale"    # Ljava/util/Locale;

    .line 1409
    nop

    .line 1410
    invoke-direct {p0, p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->setLanguageTag(Ljava/util/Locale;)V

    .line 1412
    return-object p0
.end method

.method public setUrlBarHidingEnabled(Z)Landroidx/browser/customtabs/CustomTabsIntent$Builder;
    .locals 2
    .param p1, "enabled"    # Z

    .line 783
    iget-object v0, p0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.customtabs.extra.ENABLE_URLBAR_HIDING"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 784
    return-object p0
.end method
