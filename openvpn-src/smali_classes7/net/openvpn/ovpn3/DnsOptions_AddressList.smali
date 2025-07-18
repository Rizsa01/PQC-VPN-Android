.class public Lnet/openvpn/ovpn3/DnsOptions_AddressList;
.super Ljava/util/AbstractList;
.source "DnsOptions_AddressList.java"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Lnet/openvpn/ovpn3/DnsAddress;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field protected transient swigCMemOwn:Z

.field private transient swigCPtr:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 109
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions_AddressList__SWIG_0()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>(JZ)V

    .line 110
    return-void
.end method

.method public constructor <init>(ILnet/openvpn/ovpn3/DnsAddress;)V
    .locals 3
    .param p1, "count"    # I
    .param p2, "value"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 125
    invoke-static {p2}, Lnet/openvpn/ovpn3/DnsAddress;->getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v0

    invoke-static {p1, v0, v1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions_AddressList__SWIG_2(IJLnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>(JZ)V

    .line 126
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "cMemoryOwn"    # Z

    .line 15
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 16
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lnet/openvpn/ovpn3/DnsAddress;",
            ">;)V"
        }
    .end annotation

    .line 61
    .local p1, "initialElements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lnet/openvpn/ovpn3/DnsAddress;>;"
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>()V

    .line 62
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnet/openvpn/ovpn3/DnsAddress;

    .line 63
    .local v1, "element":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-virtual {p0, v1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->add(Lnet/openvpn/ovpn3/DnsAddress;)Z

    .line 64
    .end local v1    # "element":Lnet/openvpn/ovpn3/DnsAddress;
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method public constructor <init>(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)V
    .locals 3
    .param p1, "other"    # Lnet/openvpn/ovpn3/DnsOptions_AddressList;

    .line 113
    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->getCPtr(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_DnsOptions_AddressList__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>(JZ)V

    .line 114
    return-void
.end method

.method public constructor <init>([Lnet/openvpn/ovpn3/DnsAddress;)V
    .locals 3
    .param p1, "initialElements"    # [Lnet/openvpn/ovpn3/DnsAddress;

    .line 52
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;-><init>()V

    .line 53
    array-length v0, p1

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->reserve(I)V

    .line 55
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 56
    .local v2, "element":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-virtual {p0, v2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->add(Lnet/openvpn/ovpn3/DnsAddress;)Z

    .line 55
    .end local v2    # "element":Lnet/openvpn/ovpn3/DnsAddress;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method private doAdd(ILnet/openvpn/ovpn3/DnsAddress;)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "x"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 145
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {p2}, Lnet/openvpn/ovpn3/DnsAddress;->getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v4

    move-object v2, p0

    move v3, p1

    move-object v6, p2

    .end local p1    # "index":I
    .end local p2    # "x":Lnet/openvpn/ovpn3/DnsAddress;
    .local v3, "index":I
    .local v6, "x":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-static/range {v0 .. v6}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doAdd__SWIG_1(JLnet/openvpn/ovpn3/DnsOptions_AddressList;IJLnet/openvpn/ovpn3/DnsAddress;)V

    .line 146
    return-void
.end method

.method private doAdd(Lnet/openvpn/ovpn3/DnsAddress;)V
    .locals 6
    .param p1, "x"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 141
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {p1}, Lnet/openvpn/ovpn3/DnsAddress;->getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v3

    move-object v2, p0

    move-object v5, p1

    .end local p1    # "x":Lnet/openvpn/ovpn3/DnsAddress;
    .local v5, "x":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doAdd__SWIG_0(JLnet/openvpn/ovpn3/DnsOptions_AddressList;JLnet/openvpn/ovpn3/DnsAddress;)V

    .line 142
    return-void
.end method

.method private doCapacity()I
    .locals 2

    .line 129
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doCapacity(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)I

    move-result v0

    return v0
.end method

.method private doGet(I)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 4
    .param p1, "index"    # I

    .line 153
    new-instance v0, Lnet/openvpn/ovpn3/DnsAddress;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v1, v2, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doGet(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/DnsAddress;-><init>(JZ)V

    return-object v0
.end method

.method private doRemove(I)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 4
    .param p1, "index"    # I

    .line 149
    new-instance v0, Lnet/openvpn/ovpn3/DnsAddress;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v1, v2, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doRemove(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnet/openvpn/ovpn3/DnsAddress;-><init>(JZ)V

    return-object v0
.end method

.method private doRemoveRange(II)V
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 161
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doRemoveRange(JLnet/openvpn/ovpn3/DnsOptions_AddressList;II)V

    .line 162
    return-void
.end method

.method private doReserve(I)V
    .locals 2
    .param p1, "n"    # I

    .line 133
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doReserve(JLnet/openvpn/ovpn3/DnsOptions_AddressList;I)V

    .line 134
    return-void
.end method

.method private doSet(ILnet/openvpn/ovpn3/DnsAddress;)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 8
    .param p1, "index"    # I
    .param p2, "val"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 157
    new-instance v0, Lnet/openvpn/ovpn3/DnsAddress;

    iget-wide v1, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {p2}, Lnet/openvpn/ovpn3/DnsAddress;->getCPtr(Lnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide v5

    move-object v3, p0

    move v4, p1

    move-object v7, p2

    .end local p1    # "index":I
    .end local p2    # "val":Lnet/openvpn/ovpn3/DnsAddress;
    .local v4, "index":I
    .local v7, "val":Lnet/openvpn/ovpn3/DnsAddress;
    invoke-static/range {v1 .. v7}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doSet(JLnet/openvpn/ovpn3/DnsOptions_AddressList;IJLnet/openvpn/ovpn3/DnsAddress;)J

    move-result-wide p1

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lnet/openvpn/ovpn3/DnsAddress;-><init>(JZ)V

    return-object v0
.end method

.method private doSize()I
    .locals 2

    .line 137
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_doSize(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)I

    move-result v0

    return v0
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions_AddressList;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/DnsOptions_AddressList;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/DnsOptions_AddressList;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->delete()V

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
.method public bridge synthetic add(ILjava/lang/Object;)V
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
    check-cast p2, Lnet/openvpn/ovpn3/DnsAddress;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->add(ILnet/openvpn/ovpn3/DnsAddress;)V

    return-void
.end method

.method public add(ILnet/openvpn/ovpn3/DnsAddress;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "e"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 82
    iget v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    .line 83
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doAdd(ILnet/openvpn/ovpn3/DnsAddress;)V

    .line 84
    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
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
    check-cast p1, Lnet/openvpn/ovpn3/DnsAddress;

    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->add(Lnet/openvpn/ovpn3/DnsAddress;)Z

    move-result p1

    return p1
.end method

.method public add(Lnet/openvpn/ovpn3/DnsAddress;)Z
    .locals 2
    .param p1, "e"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 76
    iget v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    .line 77
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doAdd(Lnet/openvpn/ovpn3/DnsAddress;)V

    .line 78
    return v1
.end method

.method public capacity()I
    .locals 1

    .line 101
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doCapacity()I

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 2

    .line 121
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_clear(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)V

    .line 122
    return-void
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_DnsOptions_AddressList(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/DnsOptions_AddressList;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J
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

.method protected finalize()V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->delete()V

    .line 39
    return-void
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->get(I)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 1
    .param p1, "index"    # I

    .line 68
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doGet(I)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    .line 117
    iget-wide v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->DnsOptions_AddressList_isEmpty(JLnet/openvpn/ovpn3/DnsOptions_AddressList;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->remove(I)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object p1

    return-object p1
.end method

.method public remove(I)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 1
    .param p1, "index"    # I

    .line 87
    iget v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    .line 88
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doRemove(I)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object v0

    return-object v0
.end method

.method protected removeRange(II)V
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 92
    iget v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->modCount:I

    .line 93
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doRemoveRange(II)V

    .line 94
    return-void
.end method

.method public reserve(I)V
    .locals 0
    .param p1, "n"    # I

    .line 105
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doReserve(I)V

    .line 106
    return-void
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
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
    check-cast p2, Lnet/openvpn/ovpn3/DnsAddress;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->set(ILnet/openvpn/ovpn3/DnsAddress;)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object p1

    return-object p1
.end method

.method public set(ILnet/openvpn/ovpn3/DnsAddress;)Lnet/openvpn/ovpn3/DnsAddress;
    .locals 1
    .param p1, "index"    # I
    .param p2, "e"    # Lnet/openvpn/ovpn3/DnsAddress;

    .line 72
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doSet(ILnet/openvpn/ovpn3/DnsAddress;)Lnet/openvpn/ovpn3/DnsAddress;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 97
    invoke-direct {p0}, Lnet/openvpn/ovpn3/DnsOptions_AddressList;->doSize()I

    move-result v0

    return v0
.end method
