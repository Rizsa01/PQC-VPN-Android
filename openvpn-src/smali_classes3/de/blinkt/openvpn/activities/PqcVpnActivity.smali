.class public final Lde/blinkt/openvpn/activities/PqcVpnActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "PqcVpnActivity.kt"

# interfaces
.implements Lde/blinkt/openvpn/core/VpnStatus$StateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/activities/PqcVpnActivity$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPqcVpnActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PqcVpnActivity.kt\nde/blinkt/openvpn/activities/PqcVpnActivity\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,155:1\n1#2:156\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000]\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u000f\u0018\u0000 .2\u00020\u00012\u00020\u0002:\u0001.B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0008\u0010\u0011\u001a\u00020\u0012H\u0014J\u0008\u0010\u0013\u001a\u00020\u0012H\u0014J\u0008\u0010\u0017\u001a\u00020\u0012H\u0002J\u0008\u0010\u0019\u001a\u00020\u0012H\u0002J\"\u0010\u001a\u001a\u0004\u0018\u00010\t2\u0006\u0010\u001b\u001a\u00020\r2\u0006\u0010\u001c\u001a\u00020\t2\u0006\u0010\u001d\u001a\u00020\tH\u0002J\u0008\u0010\u001e\u001a\u00020\u0012H\u0002J\u0012\u0010\u001f\u001a\u00020\u00122\u0008\u0010 \u001a\u0004\u0018\u00010\tH\u0016J2\u0010!\u001a\u00020\u00122\u0006\u0010\"\u001a\u00020\t2\u0006\u0010#\u001a\u00020\t2\u0006\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020\'2\u0008\u0010(\u001a\u0004\u0018\u00010\u0016H\u0016J\u0012\u0010)\u001a\u00020\u00122\u0008\u0010*\u001a\u0004\u0018\u00010+H\u0014J\u0010\u0010,\u001a\u00020\u00122\u0006\u0010-\u001a\u00020\tH\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000bX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0010R\u0014\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006/"
    }
    d2 = {
        "Lde/blinkt/openvpn/activities/PqcVpnActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "Lde/blinkt/openvpn/core/VpnStatus$StateListener;",
        "<init>",
        "()V",
        "binding",
        "Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;",
        "clientCertFolders",
        "",
        "",
        "spinnerAdapter",
        "Landroid/widget/ArrayAdapter;",
        "certsFolderUri",
        "Landroid/net/Uri;",
        "serviceConnection",
        "de/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1",
        "Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;",
        "onStart",
        "",
        "onStop",
        "openDirectoryLauncher",
        "Landroidx/activity/result/ActivityResultLauncher;",
        "Landroid/content/Intent;",
        "findClientFolders",
        "vpnPermissionLauncher",
        "requestVpnPermission",
        "readTextFromFileInDir",
        "baseDirUri",
        "subDirName",
        "targetFileName",
        "actuallyStartVpn",
        "setConnectedVPN",
        "uuid",
        "updateState",
        "state",
        "log",
        "resId",
        "",
        "level",
        "Lde/blinkt/openvpn/core/ConnectionStatus;",
        "intent",
        "onCreate",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "updateStatus",
        "msg",
        "Companion",
        "main_skeletonOvpn2Debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lde/blinkt/openvpn/activities/PqcVpnActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "PQC_VPN_DEBUG_LOG"


# instance fields
.field private binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

.field private certsFolderUri:Landroid/net/Uri;

.field private final clientCertFolders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final openDirectoryLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private final serviceConnection:Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;

.field private spinnerAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final vpnPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$3Nlu4Y4i4k6oJqkzDPj6WmcIf_E(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->onCreate$lambda$7(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$3uTnG4rMLKi-MOp0DU6RI-6setk(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->onCreate$lambda$6(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$RcuUQR04KWH_TwXeDasGytdARtM(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->onCreate$lambda$8(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$W4rZ_-HygbVr2laCztCp96abnDI(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->vpnPermissionLauncher$lambda$2(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$f7ggC-tZascmV1fhv-ePaWUUJro(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-static {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->openDirectoryLauncher$lambda$1(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->Companion:Lde/blinkt/openvpn/activities/PqcVpnActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 27
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->clientCertFolders:Ljava/util/List;

    .line 36
    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->serviceConnection:Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;

    .line 54
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    check-cast v0, Landroidx/activity/result/contract/ActivityResultContract;

    new-instance v1, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda0;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;)V

    invoke-virtual {p0, v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->openDirectoryLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 82
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    check-cast v0, Landroidx/activity/result/contract/ActivityResultContract;

    new-instance v1, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;)V

    invoke-virtual {p0, v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->vpnPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 27
    return-void
.end method

.method public static final synthetic access$getClientCertFolders$p(Lde/blinkt/openvpn/activities/PqcVpnActivity;)Ljava/util/List;
    .locals 1
    .param p0, "$this"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;

    .line 27
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->clientCertFolders:Ljava/util/List;

    return-object v0
.end method

.method public static final synthetic access$getSpinnerAdapter$p(Lde/blinkt/openvpn/activities/PqcVpnActivity;)Landroid/widget/ArrayAdapter;
    .locals 1
    .param p0, "$this"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;

    .line 27
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->spinnerAdapter:Landroid/widget/ArrayAdapter;

    return-object v0
.end method

.method public static final synthetic access$readTextFromFileInDir(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "$this"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "baseDirUri"    # Landroid/net/Uri;
    .param p2, "subDirName"    # Ljava/lang/String;
    .param p3, "targetFileName"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0, p1, p2, p3}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->readTextFromFileInDir(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$updateStatus(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "$this"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "msg"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0, p1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->updateStatus(Ljava/lang/String;)V

    return-void
.end method

.method private final actuallyStartVpn()V
    .locals 10

    .line 104
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "binding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->spinnerPqcKem:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_2

    return-void

    .line 105
    .local v0, "folderName":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->certsFolderUri:Landroid/net/Uri;

    if-nez v2, :cond_3

    return-void

    .line 106
    .local v2, "baseUri":Landroid/net/Uri;
    :cond_3
    move-object v3, p0

    check-cast v3, Landroidx/lifecycle/LifecycleOwner;

    invoke-static {v3}, Landroidx/lifecycle/LifecycleOwnerKt;->getLifecycleScope(Landroidx/lifecycle/LifecycleOwner;)Landroidx/lifecycle/LifecycleCoroutineScope;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lkotlinx/coroutines/CoroutineScope;

    new-instance v3, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;

    invoke-direct {v3, p0, v2, v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    move-object v7, v3

    check-cast v7, Lkotlin/jvm/functions/Function2;

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 134
    return-void
.end method

.method private final findClientFolders()V
    .locals 8

    .line 65
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->certsFolderUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    return-void

    .line 66
    .local v0, "parentUri":Landroid/net/Uri;
    :cond_0
    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/LifecycleOwner;

    invoke-static {v1}, Landroidx/lifecycle/LifecycleOwnerKt;->getLifecycleScope(Landroidx/lifecycle/LifecycleOwner;)Landroidx/lifecycle/LifecycleCoroutineScope;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;

    const/4 v4, 0x0

    invoke-direct {v1, p0, v0, v4}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V

    move-object v5, v1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x2

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 80
    return-void
.end method

.method private static final onCreate$lambda$6(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 148
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->openDirectoryLauncher:Landroidx/activity/result/ActivityResultLauncher;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    return-void
.end method

.method private static final onCreate$lambda$7(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 149
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_0

    const-string v0, "binding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->spinnerPqcKem:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-string v1, "Select folder"

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->requestVpnPermission()V

    :goto_0
    return-void
.end method

.method private static final onCreate$lambda$8(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/view/View;)V
    .locals 1
    .param p0, "this$0"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 150
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lde/blinkt/openvpn/core/ProfileManager;->setConntectedVpnProfileDisconnected(Landroid/content/Context;)V

    return-void
.end method

.method private static final openDirectoryLauncher$lambda$1(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 4
    .param p0, "this$0"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "result"    # Landroidx/activity/result/ActivityResult;

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 56
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .local v0, "uri\\1":Landroid/net/Uri;
    const/4 v1, 0x0

    .line 57
    .local v1, "$i$a$-also-PqcVpnActivity$openDirectoryLauncher$1$1\\1\\56\\0":I
    invoke-virtual {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    .line 58
    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->certsFolderUri:Landroid/net/Uri;

    .line 59
    invoke-direct {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->findClientFolders()V

    .line 60
    nop

    .line 56
    .end local v0    # "uri\\1":Landroid/net/Uri;
    .end local v1    # "$i$a$-also-PqcVpnActivity$openDirectoryLauncher$1$1\\1\\56\\0":I
    :cond_0
    nop

    .line 62
    :cond_1
    return-void
.end method

.method private final readTextFromFileInDir(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "baseDirUri"    # Landroid/net/Uri;
    .param p2, "subDirName"    # Ljava/lang/String;
    .param p3, "targetFileName"    # Ljava/lang/String;

    .line 92
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/documentfile/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 93
    .local v0, "subDir":Landroidx/documentfile/provider/DocumentFile;
    :goto_0
    nop

    .line 94
    if-eqz v0, :cond_2

    :try_start_0
    invoke-virtual {v0, p3}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroidx/documentfile/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_2

    .local v2, "it\\1":Landroid/net/Uri;
    const/4 v3, 0x0

    .line 95
    .local v3, "$i$a$-let-PqcVpnActivity$readTextFromFileInDir$1\\1\\94\\0":I
    invoke-virtual {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    if-eqz v4, :cond_1

    check-cast v4, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v5, v4

    check-cast v5, Ljava/io/InputStream;

    .local v5, "stream\\2":Ljava/io/InputStream;
    const/4 v6, 0x0

    .line 96
    .local v6, "$i$a$-use-PqcVpnActivity$readTextFromFileInDir$1$1\\2\\95\\1":I
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    check-cast v8, Ljava/io/Reader;

    invoke-direct {v7, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    check-cast v7, Ljava/io/Reader;

    invoke-static {v7}, Lkotlin/io/TextStreamsKt;->readText(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v5    # "stream\\2":Ljava/io/InputStream;
    .end local v6    # "$i$a$-use-PqcVpnActivity$readTextFromFileInDir$1$1\\2\\95\\1":I
    :try_start_2
    invoke-static {v4, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v7

    :catchall_0
    move-exception v5

    .end local v0    # "subDir":Landroidx/documentfile/provider/DocumentFile;
    .end local v2    # "it\\1":Landroid/net/Uri;
    .end local v3    # "$i$a$-let-PqcVpnActivity$readTextFromFileInDir$1\\1\\94\\0":I
    .end local p1    # "baseDirUri":Landroid/net/Uri;
    .end local p2    # "subDirName":Ljava/lang/String;
    .end local p3    # "targetFileName":Ljava/lang/String;
    :try_start_3
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v0    # "subDir":Landroidx/documentfile/provider/DocumentFile;
    .restart local v2    # "it\\1":Landroid/net/Uri;
    .restart local v3    # "$i$a$-let-PqcVpnActivity$readTextFromFileInDir$1\\1\\94\\0":I
    .restart local p1    # "baseDirUri":Landroid/net/Uri;
    .restart local p2    # "subDirName":Ljava/lang/String;
    .restart local p3    # "targetFileName":Ljava/lang/String;
    :catchall_1
    move-exception v6

    :try_start_4
    invoke-static {v4, v5}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v0    # "subDir":Landroidx/documentfile/provider/DocumentFile;
    .end local p1    # "baseDirUri":Landroid/net/Uri;
    .end local p2    # "subDirName":Ljava/lang/String;
    .end local p3    # "targetFileName":Ljava/lang/String;
    throw v6
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 97
    .restart local v0    # "subDir":Landroidx/documentfile/provider/DocumentFile;
    .restart local p1    # "baseDirUri":Landroid/net/Uri;
    .restart local p2    # "subDirName":Ljava/lang/String;
    .restart local p3    # "targetFileName":Ljava/lang/String;
    :cond_1
    nop

    .end local v2    # "it\\1":Landroid/net/Uri;
    .end local v3    # "$i$a$-let-PqcVpnActivity$readTextFromFileInDir$1\\1\\94\\0":I
    goto :goto_1

    .line 99
    :catch_0
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    const-string v3, "Read error"

    move-object v4, v2

    check-cast v4, Ljava/lang/Throwable;

    const-string v5, "PQC_VPN_DEBUG_LOG"

    invoke-static {v5, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 94
    .end local v2    # "e":Ljava/io/IOException;
    :cond_2
    :goto_1
    nop

    .line 100
    :goto_2
    return-object v1
.end method

.method private final requestVpnPermission()V
    .locals 3

    .line 88
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 156
    .local v0, "it\\1":Landroid/content/Intent;
    const/4 v1, 0x0

    .line 88
    .local v1, "$i$a$-let-PqcVpnActivity$requestVpnPermission$1\\1\\88\\0":I
    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->vpnPermissionLauncher:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v2, v0}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .end local v0    # "it\\1":Landroid/content/Intent;
    .end local v1    # "$i$a$-let-PqcVpnActivity$requestVpnPermission$1\\1\\88\\0":I
    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->actuallyStartVpn()V

    .line 89
    :goto_0
    return-void
.end method

.method private final updateStatus(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .line 154
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_0

    const-string v0, "binding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->textStatus:Landroid/widget/TextView;

    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static final vpnPermissionLauncher$lambda$2(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroidx/activity/result/ActivityResult;)V
    .locals 2
    .param p0, "this$0"    # Lde/blinkt/openvpn/activities/PqcVpnActivity;
    .param p1, "res"    # Landroidx/activity/result/ActivityResult;

    const-string v0, "res"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->actuallyStartVpn()V

    goto :goto_0

    .line 84
    :cond_0
    const-string v0, "VPN permission was denied."

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->updateStatus(Ljava/lang/String;)V

    .line 85
    :goto_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 142
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 143
    invoke-virtual {p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->inflate(Landroid/view/LayoutInflater;)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    move-result-object v0

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    .line 144
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    const-string v1, "binding"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_0
    invoke-virtual {v0}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->setContentView(Landroid/view/View;)V

    .line 145
    new-instance v0, Landroid/widget/ArrayAdapter;

    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    const v4, 0x1090008

    iget-object v5, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->clientCertFolders:Ljava/util/List;

    invoke-direct {v0, v3, v4, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->spinnerAdapter:Landroid/widget/ArrayAdapter;

    .line 146
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->spinnerAdapter:Landroid/widget/ArrayAdapter;

    const-string v3, "spinnerAdapter"

    if-nez v0, :cond_1

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_1
    const v4, 0x1090009

    invoke-virtual {v0, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 147
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_2

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_2
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->spinnerPqcKem:Landroid/widget/Spinner;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->spinnerAdapter:Landroid/widget/ArrayAdapter;

    if-nez v4, :cond_3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v2

    :cond_3
    check-cast v4, Landroid/widget/SpinnerAdapter;

    invoke-virtual {v0, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 148
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_4

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_4
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonSelectFolder:Landroid/widget/Button;

    new-instance v3, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda2;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_5

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_5
    iget-object v0, v0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonConnect:Landroid/widget/Button;

    new-instance v3, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda3;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->binding:Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    if-nez v0, :cond_6

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    move-object v2, v0

    :goto_0
    iget-object v0, v2, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonDisconnect:Landroid/widget/Button;

    new-instance v1, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lde/blinkt/openvpn/activities/PqcVpnActivity$$ExternalSyntheticLambda4;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    const-string v0, "Ready."

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->updateStatus(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method protected onStart()V
    .locals 3

    .line 42
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 43
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "de.blinkt.openvpn.START_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "setAction(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->serviceConnection:Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;

    check-cast v1, Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 45
    move-object v1, p0

    check-cast v1, Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->addStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 46
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 49
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 50
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity;->serviceConnection:Lde/blinkt/openvpn/activities/PqcVpnActivity$serviceConnection$1;

    check-cast v0, Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 51
    move-object v0, p0

    check-cast v0, Lde/blinkt/openvpn/core/VpnStatus$StateListener;

    invoke-static {v0}, Lde/blinkt/openvpn/core/VpnStatus;->removeStateListener(Lde/blinkt/openvpn/core/VpnStatus$StateListener;)V

    .line 52
    return-void
.end method

.method public setConnectedVPN(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .line 136
    return-void
.end method

.method public updateState(Ljava/lang/String;Ljava/lang/String;ILde/blinkt/openvpn/core/ConnectionStatus;Landroid/content/Intent;)V
    .locals 3
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "log"    # Ljava/lang/String;
    .param p3, "resId"    # I
    .param p4, "level"    # Lde/blinkt/openvpn/core/ConnectionStatus;
    .param p5, "intent"    # Landroid/content/Intent;

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "log"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "level"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    invoke-virtual {p4}, Lde/blinkt/openvpn/core/ConnectionStatus;->name()Ljava/lang/String;

    move-result-object v0

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lde/blinkt/openvpn/core/VpnStatus;->getLastCleanLogMessage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->updateStatus(Ljava/lang/String;)V

    .line 139
    return-void
.end method
