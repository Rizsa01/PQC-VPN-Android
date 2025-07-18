.class public Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
.super Ljava/util/AbstractMap;
.source "DnsOptions_ServersMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap<",
        "Ljava/lang/Integer;",
        "Lnet/openvpn/ovpn3/DnsServer;",
        ">;"
    }
.end annotation


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 140
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions_ServersMap__SWIG_0()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;-><init>(JZ)V

    .line 141
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    .line 18
    return-void
.end method

.method public constructor <init>(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)V
    .locals 3
    .param p1, "other"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    .line 144
    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions_ServersMap__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;-><init>(JZ)V

    .line 145
    return-void
.end method

.method private begin()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    .locals 4

    .line 222
    new-instance v0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_begin(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;-><init>(JZ)V

    return-object v0
.end method

.method private containsImpl(I)Z
    .locals 2
    .param p1, "key"    # I

    .line 234
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_containsImpl(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;I)Z

    move-result v0

    return v0
.end method

.method private end()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    .locals 4

    .line 226
    new-instance v0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v1, v2, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_end(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;-><init>(JZ)V

    return-object v0
.end method

.method private find(I)Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    .locals 4
    .param p1, "key"    # I

    .line 218
    new-instance v0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v1, v2, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_find(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;I)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;-><init>(JZ)V

    return-object v0
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method private putUnchecked(ILnet/openvpn/ovpn3/DnsServer;)V
    .locals 7
    .param p1, "key"    # I
    .param p2, "value"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 238
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {p2}, Lnet/openvpn/ovpn3/DnsServer;->getCPtr(Lnet/openvpn/ovpn3/DnsServer;)J

    move-result-wide v4

    move-object v2, p0

    move v3, p1

    move-object v6, p2

    .end local p1    # "key":I
    .end local p2    # "value":Lnet/openvpn/ovpn3/DnsServer;
    .local v3, "key":I
    .local v6, "value":Lnet/openvpn/ovpn3/DnsServer;
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_putUnchecked(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;IJLnet/openvpn/ovpn3/DnsServer;)V

    .line 239
    return-void
.end method

.method private removeUnchecked(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)V
    .locals 6
    .param p1, "itr"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    .line 242
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    .local v5, "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_removeUnchecked(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;JLnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)V

    .line 243
    return-void
.end method

.method private sizeImpl()I
    .locals 2

    .line 230
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_sizeImpl(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)I

    move-result v0

    return v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->delete()V

    goto :goto_0

    .line 28
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Cannot release ownership as memory is not owned"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 33
    :cond_1
    :goto_0
    return-wide v0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 214
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_clear(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)V

    .line 215
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 57
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 58
    const/4 v0, 0x0

    return v0

    .line 61
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->containsImpl(I)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_DnsOptions_ServersMap(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_1
    monitor-exit p0

    return-void

    .line 41
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Integer;",
            "Lnet/openvpn/ovpn3/DnsServer;",
            ">;>;"
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 108
    .local v0, "setToReturn":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Integer;Lnet/openvpn/ovpn3/DnsServer;>;>;"
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->begin()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v1

    .line 109
    .local v1, "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->end()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v2

    .line 110
    .local v2, "end":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    :goto_0
    invoke-static {v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$misNot(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    new-instance v3, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;

    invoke-direct {v3, p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;-><init>(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)V

    .line 132
    invoke-static {v3, v1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->-$$Nest$minit(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Ljava/util/Map$Entry;

    move-result-object v3

    .line 111
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 133
    invoke-static {v1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetNextUnchecked(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v1

    goto :goto_0

    .line 136
    :cond_0
    return-object v0
.end method

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->delete()V

    .line 39
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->get(Ljava/lang/Object;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Lnet/openvpn/ovpn3/DnsServer;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 65
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 66
    return-object v1

    .line 69
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->find(I)Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v0

    .line 70
    .local v0, "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->end()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v2

    invoke-static {v0, v2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$misNot(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v1

    return-object v1

    .line 74
    :cond_1
    return-object v1
.end method

.method public isEmpty()Z
    .locals 2

    .line 210
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_ServersMap_isEmpty(JLnet/openvpn/ovpn3/DnsOptions_ServersMap;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 11
    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Lnet/openvpn/ovpn3/DnsServer;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->put(Ljava/lang/Integer;Lnet/openvpn/ovpn3/DnsServer;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/Integer;Lnet/openvpn/ovpn3/DnsServer;)Lnet/openvpn/ovpn3/DnsServer;
    .locals 2
    .param p1, "key"    # Ljava/lang/Integer;
    .param p2, "value"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 78
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->find(I)Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v0

    .line 79
    .local v0, "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->end()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v1

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$misNot(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v1

    .line 81
    .local v1, "oldValue":Lnet/openvpn/ovpn3/DnsServer;
    invoke-static {v0, p2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$msetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsServer;)V

    .line 82
    return-object v1

    .line 84
    .end local v1    # "oldValue":Lnet/openvpn/ovpn3/DnsServer;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1, p2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->putUnchecked(ILnet/openvpn/ovpn3/DnsServer;)V

    .line 85
    const/4 v1, 0x0

    return-object v1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->remove(Ljava/lang/Object;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Lnet/openvpn/ovpn3/DnsServer;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 90
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 91
    return-object v1

    .line 94
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->find(I)Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v0

    .line 95
    .local v0, "itr":Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->end()Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    move-result-object v2

    invoke-static {v0, v2}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$misNot(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v1

    .line 97
    .local v1, "oldValue":Lnet/openvpn/ovpn3/DnsServer;
    invoke-direct {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->removeUnchecked(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)V

    .line 98
    return-object v1

    .line 100
    .end local v1    # "oldValue":Lnet/openvpn/ovpn3/DnsServer;
    :cond_1
    return-object v1
.end method

.method public size()I
    .locals 1

    .line 53
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->sizeImpl()I

    move-result v0

    return v0
.end method
