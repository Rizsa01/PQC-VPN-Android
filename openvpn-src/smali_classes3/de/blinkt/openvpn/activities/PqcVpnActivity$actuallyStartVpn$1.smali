.class final Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PqcVpnActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/activities/PqcVpnActivity;->actuallyStartVpn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPqcVpnActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PqcVpnActivity.kt\nde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,155:1\n1#2:156\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "de.blinkt.openvpn.activities.PqcVpnActivity$actuallyStartVpn$1"
    f = "PqcVpnActivity.kt"
    i = {
        0x0
    }
    l = {
        0x6f
    }
    m = "invokeSuspend"
    n = {
        "$this$launch"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $baseUri:Landroid/net/Uri;

.field final synthetic $folderName:Ljava/lang/String;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iput-object p2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$baseUri:Landroid/net/Uri;

    iput-object p3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$folderName:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$folderName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 106
    iget v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/CoroutineScope;

    .local v0, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, v0

    move-object v0, p1

    goto :goto_0

    .end local v0    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/CoroutineScope;

    .line 107
    .local v1, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    sget-object v2, Lde/blinkt/openvpn/activities/VpnConfigManager;->INSTANCE:Lde/blinkt/openvpn/activities/VpnConfigManager;

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v3, Landroid/content/Context;

    invoke-virtual {v2, v3}, Lde/blinkt/openvpn/activities/VpnConfigManager;->copyAndGetConfigFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_0

    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    const/4 v2, 0x0

    .line 108
    .local v2, "$i$a$-run-PqcVpnActivity$actuallyStartVpn$1$1\\1\\107\\0":I
    const-string v3, "FATAL: Could not create OpenSSL config file."

    invoke-static {v0, v3}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$updateStatus(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/lang/String;)V

    .line 109
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 111
    .end local v2    # "$i$a$-run-PqcVpnActivity$actuallyStartVpn$1$1\\1\\107\\0":I
    :cond_0
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v2

    check-cast v2, Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v5, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$baseUri:Landroid/net/Uri;

    iget-object v6, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->$folderName:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->L$0:Ljava/lang/Object;

    const/4 v5, 0x1

    iput v5, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->label:I

    invoke-static {v2, v3, v4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_1

    .line 106
    return-object v0

    .line 111
    :cond_1
    move-object v0, p1

    move-object p1, v2

    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Lde/blinkt/openvpn/core/VpnProfile;

    if-nez p1, :cond_2

    .line 124
    iget-object p1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    .line 156
    const/4 v2, 0x0

    .line 124
    .local v2, "$i$a$-run-PqcVpnActivity$actuallyStartVpn$1$profile$2\\2\\124\\0":I
    const-string v3, "ERROR: Missing required files!"

    invoke-static {p1, v3}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$updateStatus(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/lang/String;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 125
    .end local v2    # "$i$a$-run-PqcVpnActivity$actuallyStartVpn$1$profile$2\\2\\124\\0":I
    .local p1, "profile":Lde/blinkt/openvpn/core/VpnProfile;
    :cond_2
    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lde/blinkt/openvpn/core/ProfileManager;->getInstance(Landroid/content/Context;)Lde/blinkt/openvpn/core/ProfileManager;

    move-result-object v2

    .line 126
    .local v2, "pm":Lde/blinkt/openvpn/core/ProfileManager;
    invoke-virtual {v2, p1}, Lde/blinkt/openvpn/core/ProfileManager;->addProfile(Lde/blinkt/openvpn/core/VpnProfile;)V

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v3, Landroid/content/Context;

    invoke-virtual {v2, v3}, Lde/blinkt/openvpn/core/ProfileManager;->saveProfileList(Landroid/content/Context;)V

    .line 127
    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v4, Landroid/content/Context;

    const-class v5, Lde/blinkt/openvpn/core/OpenVPNService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v4, v3

    .local v4, "$this$invokeSuspend_u24lambda_u242\\3":Landroid/content/Intent;
    const/4 v5, 0x0

    .line 128
    .local v5, "$i$a$-apply-PqcVpnActivity$actuallyStartVpn$1$startVpnIntent$1\\3\\127\\0":I
    const-string v6, "de.blinkt.openvpn.START_SERVICE"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const-string v6, "de.blinkt.openvpn.VPN_PROFILE_OBJECT"

    move-object v7, p1

    check-cast v7, Landroid/os/Parcelable;

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 130
    nop

    .line 127
    .end local v4    # "$this$invokeSuspend_u24lambda_u242\\3":Landroid/content/Intent;
    .end local v5    # "$i$a$-apply-PqcVpnActivity$actuallyStartVpn$1$startVpnIntent$1\\3\\127\\0":I
    nop

    .line 131
    .local v3, "startVpnIntent":Landroid/content/Intent;
    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v4, Landroid/content/Context;

    invoke-static {v4, v3}, Landroidx/core/content/ContextCompat;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)V

    .line 132
    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    const-string v5, "Starting service..."

    invoke-static {v4, v5}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$updateStatus(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/lang/String;)V

    .line 133
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
