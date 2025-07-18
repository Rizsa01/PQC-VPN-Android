.class final Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PqcVpnActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/blinkt/openvpn/activities/PqcVpnActivity;->findClientFolders()V
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
    value = "SMAP\nPqcVpnActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PqcVpnActivity.kt\nde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,155:1\n3829#2:156\n4344#2,2:157\n1611#3,9:159\n1863#3:168\n1864#3:170\n1620#3:171\n1#4:169\n*S KotlinDebug\n*F\n+ 1 PqcVpnActivity.kt\nde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1\n*L\n68#1:156\n68#1:157,2\n73#1:159,9\n73#1:168\n73#1:170\n73#1:171\n73#1:169\n*E\n"
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
    c = "de.blinkt.openvpn.activities.PqcVpnActivity$findClientFolders$1"
    f = "PqcVpnActivity.kt"
    i = {}
    l = {
        0x4a
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $parentUri:Landroid/net/Uri;

.field label:I

.field final synthetic this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;


# direct methods
.method constructor <init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity;",
            "Landroid/net/Uri;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iput-object p2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->$parentUri:Landroid/net/Uri;

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

    new-instance v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;

    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->$parentUri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 66
    iget v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_6

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 67
    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->$parentUri:Landroid/net/Uri;

    invoke-static {v1, v2}, Landroidx/documentfile/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 68
    .local v1, "parent":Landroidx/documentfile/provider/DocumentFile;
    :cond_0
    invoke-virtual {v1}, Landroidx/documentfile/provider/DocumentFile;->listFiles()[Landroidx/documentfile/provider/DocumentFile;

    move-result-object v2

    .end local v1    # "parent":Landroidx/documentfile/provider/DocumentFile;
    const-string v1, "listFiles(...)"

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, v2

    check-cast v1, [Ljava/lang/Object;

    .local v1, "$this$filter\\1":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 156
    .local v2, "$i$f$filter\\1\\68":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .local v1, "$this$filterTo\\2":[Ljava/lang/Object;
    .local v3, "destination\\2":Ljava/util/Collection;
    const/4 v4, 0x0

    .line 157
    .local v4, "$i$f$filterTo\\2\\156":I
    array-length v5, v1

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    const/4 v8, 0x1

    if-ge v7, v5, :cond_6

    aget-object v9, v1, v7

    .local v9, "element\\2":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/documentfile/provider/DocumentFile;

    .local v10, "it\\3":Landroidx/documentfile/provider/DocumentFile;
    const/4 v11, 0x0

    .line 69
    .local v11, "$i$a$-filter-PqcVpnActivity$findClientFolders$1$found$1\\3\\157\\0":I
    invoke-virtual {v10}, Landroidx/documentfile/provider/DocumentFile;->isDirectory()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 70
    const-string v12, "android_client.config"

    invoke-virtual {v10, v12}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v12

    if-eqz v12, :cond_1

    invoke-virtual {v12}, Landroidx/documentfile/provider/DocumentFile;->exists()Z

    move-result v12

    if-ne v12, v8, :cond_1

    move v12, v8

    goto :goto_1

    :cond_1
    move v12, v6

    :goto_1
    if-eqz v12, :cond_4

    .line 71
    const-string v12, "client_cert.crt"

    invoke-virtual {v10, v12}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v12

    if-eqz v12, :cond_2

    invoke-virtual {v12}, Landroidx/documentfile/provider/DocumentFile;->exists()Z

    move-result v12

    if-ne v12, v8, :cond_2

    move v12, v8

    goto :goto_2

    :cond_2
    move v12, v6

    :goto_2
    if-eqz v12, :cond_4

    .line 72
    const-string v12, "client_key.key"

    invoke-virtual {v10, v12}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v12

    if-eqz v12, :cond_3

    invoke-virtual {v12}, Landroidx/documentfile/provider/DocumentFile;->exists()Z

    move-result v12

    if-ne v12, v8, :cond_3

    move v10, v8

    goto :goto_3

    :cond_3
    move v10, v6

    .end local v10    # "it\\3":Landroidx/documentfile/provider/DocumentFile;
    :goto_3
    if-eqz v10, :cond_4

    goto :goto_4

    :cond_4
    move v8, v6

    .line 157
    .end local v11    # "$i$a$-filter-PqcVpnActivity$findClientFolders$1$found$1\\3\\157\\0":I
    :goto_4
    if-eqz v8, :cond_5

    invoke-interface {v3, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v9    # "element\\2":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 158
    :cond_6
    nop

    .end local v1    # "$this$filterTo\\2":[Ljava/lang/Object;
    .end local v3    # "destination\\2":Ljava/util/Collection;
    .end local v4    # "$i$f$filterTo\\2\\156":I
    move-object v1, v3

    check-cast v1, Ljava/util/List;

    .line 156
    nop

    .end local v2    # "$i$f$filter\\1\\68":I
    check-cast v1, Ljava/lang/Iterable;

    .line 73
    .local v1, "$this$mapNotNull\\4":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 159
    .local v2, "$i$f$mapNotNull\\4\\73":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/Collection;

    .local v1, "$this$mapNotNullTo\\5":Ljava/lang/Iterable;
    .local v3, "destination\\5":Ljava/util/Collection;
    const/4 v4, 0x0

    .line 167
    .local v4, "$i$f$mapNotNullTo\\5\\159":I
    nop

    .local v1, "$this$forEach\\6":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 168
    .local v5, "$i$f$forEach\\6\\167":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .end local v1    # "$this$forEach\\6":Ljava/lang/Iterable;
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .local v1, "element\\7":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 167
    .local v7, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1\\7\\168\\5":I
    move-object v9, v1

    check-cast v9, Landroidx/documentfile/provider/DocumentFile;

    .local v9, "it\\9":Landroidx/documentfile/provider/DocumentFile;
    const/4 v10, 0x0

    .line 73
    .local v10, "$i$a$-mapNotNull-PqcVpnActivity$findClientFolders$1$found$2\\9\\167\\0":I
    invoke-virtual {v9}, Landroidx/documentfile/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object v9

    .line 167
    .end local v9    # "it\\9":Landroidx/documentfile/provider/DocumentFile;
    .end local v10    # "$i$a$-mapNotNull-PqcVpnActivity$findClientFolders$1$found$2\\9\\167\\0":I
    if-eqz v9, :cond_7

    .line 169
    .local v9, "it\\7":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 167
    .local v10, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1\\8\\169\\7":I
    invoke-interface {v3, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 168
    .end local v1    # "element\\7":Ljava/lang/Object;
    .end local v7    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1\\7\\168\\5":I
    .end local v9    # "it\\7":Ljava/lang/Object;
    .end local v10    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1\\8\\169\\7":I
    :cond_7
    goto :goto_5

    .line 170
    :cond_8
    nop

    .line 171
    .end local v5    # "$i$f$forEach\\6\\167":I
    nop

    .end local v3    # "destination\\5":Ljava/util/Collection;
    .end local v4    # "$i$f$mapNotNullTo\\5\\159":I
    move-object v1, v3

    check-cast v1, Ljava/util/List;

    .line 159
    nop

    .line 73
    .end local v2    # "$i$f$mapNotNull\\4\\73":I
    nop

    .line 68
    nop

    .line 74
    .local v1, "found":Ljava/util/List;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    check-cast v2, Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;

    iget-object v4, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->this$0:Lde/blinkt/openvpn/activities/PqcVpnActivity;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v1, v5}, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1$1;-><init>(Lde/blinkt/openvpn/activities/PqcVpnActivity;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput v8, p0, Lde/blinkt/openvpn/activities/PqcVpnActivity$findClientFolders$1;->label:I

    invoke-static {v2, v3, v4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "found":Ljava/util/List;
    if-ne v1, v0, :cond_9

    .line 66
    return-object v0

    .line 79
    :cond_9
    :goto_6
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
