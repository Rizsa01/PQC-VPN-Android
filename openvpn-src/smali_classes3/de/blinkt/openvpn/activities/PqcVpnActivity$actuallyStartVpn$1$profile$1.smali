.class final Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PqcVpnActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "Lde/blinkt/openvpn/core/VpnProfile;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "Lde/blinkt/openvpn/core/VpnProfile;",
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
    c = "de.blinkt.openvpn.activities.PqcVpnActivity$actuallyStartVpn$1$profile$1"
    f = "PqcVpnActivity.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $baseUri:Landroid/net/Uri;

.field final synthetic $folderName:Ljava/lang/String;

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
            "Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iput-object p2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iput-object p3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

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

    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lde/blinkt/openvpn/core/VpnProfile;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 111
    iget v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 112
    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    const-string v3, "android_client.config"

    invoke-static {v0, v1, v2, v3}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$readTextFromFileInDir(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "customConfig":Ljava/lang/String;
    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    const-string v4, "ca_cert.crt"

    invoke-static {v1, v2, v3, v4}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$readTextFromFileInDir(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 114
    .local v1, "caCert":Ljava/lang/String;
    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    const-string v5, "client_cert.crt"

    invoke-static {v2, v3, v4, v5}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$readTextFromFileInDir(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, "clientCert":Ljava/lang/String;
    iget-object v3, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$baseUri:Landroid/net/Uri;

    iget-object v5, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    const-string v6, "client_key.key"

    invoke-static {v3, v4, v5, v6}, Lde/blinkt/openvpn/activities/PqcVpnActivity;->access$readTextFromFileInDir(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, "clientKey":Ljava/lang/String;
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    if-nez v3, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    new-instance v4, Lde/blinkt/openvpn/core/VpnProfile;

    iget-object v5, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$actuallyStartVpn$1$profile$1;->$folderName:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "PQC-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lde/blinkt/openvpn/core/VpnProfile;-><init>(Ljava/lang/String;)V

    move-object v5, v4

    .local v5, "$this$invokeSuspend_u24lambda_u240\\1":Lde/blinkt/openvpn/core/VpnProfile;
    const/4 v6, 0x0

    .line 118
    .local v6, "$i$a$-apply-PqcVpnActivity$actuallyStartVpn$1$profile$1$1\\1\\117\\0":I
    const/4 v7, 0x1

    iput-boolean v7, v5, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    iput-object v0, v5, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 119
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[[INLINE]]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    .line 120
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lde/blinkt/openvpn/core/VpnProfile;->mClientCertFilename:Ljava/lang/String;

    .line 121
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v5, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    .line 122
    const-string v7, "p256_mlkem512"

    iput-object v7, v5, Lde/blinkt/openvpn/core/VpnProfile;->mPqcKEMs:Ljava/lang/String;

    .line 123
    nop

    .line 117
    .end local v5    # "$this$invokeSuspend_u24lambda_u240\\1":Lde/blinkt/openvpn/core/VpnProfile;
    .end local v6    # "$i$a$-apply-PqcVpnActivity$actuallyStartVpn$1$profile$1$1\\1\\117\\0":I
    nop

    .line 123
    return-object v4

    .line 116
    .end local v0    # "customConfig":Ljava/lang/String;
    .end local v1    # "caCert":Ljava/lang/String;
    .end local v2    # "clientCert":Ljava/lang/String;
    .end local v3    # "clientKey":Ljava/lang/String;
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
