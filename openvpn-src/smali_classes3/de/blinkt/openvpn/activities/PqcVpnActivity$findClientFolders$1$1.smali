.class final Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PqcVpnActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    c = "de.blinkt.openvpn.activities.PqcVpnActivity$findClientFolders$1$1"
    f = "PqcVpnActivity.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $found:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field label:I

.field final synthetic this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/util/List;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iput-object p2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->$found:Ljava/util/List;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->$found:Ljava/util/List;

    invoke-direct {v0, v1, v2, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 74
    iget v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 75
    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    invoke-static {v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$getClientCertFolders$p(Lde/blinkt/openvpn/activities/PqcVpnActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    invoke-static {v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$getClientCertFolders$p(Lde/blinkt/openvpn/activities/PqcVpnActivity;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->$found:Ljava/util/List;

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    invoke-static {v0}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$getSpinnerAdapter$p(Lde/blinkt/openvpn/activities/PqcVpnActivity;)Landroid/widget/ArrayAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "spinnerAdapter"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 77
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;->$found:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " folder(s). Ready to connect."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$updateStatus(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/lang/String;)V

    .line 78
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
