.class public Lnet/openvpn/ovpn3/ClientAPI_LLVector;
.super Ljava/util/AbstractList;
.source "ClientAPI_LLVector.java"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/Long;",
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
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_LLVector__SWIG_0()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>(JZ)V

    .line 110
    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 3
    .param p1, "count"    # I
    .param p2, "value"    # J

    .line 125
    invoke-static {p1, p2, p3}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_LLVector__SWIG_2(IJ)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>(JZ)V

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
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 61
    .local p1, "initialElements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Long;>;"
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>()V

    .line 62
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 63
    .local v1, "element":J
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->add(Ljava/lang/Long;)Z

    .line 64
    .end local v1    # "element":J
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method public constructor <init>(Lnet/openvpn/ovpn3/ClientAPI_LLVector;)V
    .locals 3
    .param p1, "other"    # Lnet/openvpn/ovpn3/ClientAPI_LLVector;

    .line 113
    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_LLVector;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_LLVector__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>(JZ)V

    .line 114
    return-void
.end method

.method public constructor <init>([J)V
    .locals 5
    .param p1, "initialElements"    # [J

    .line 52
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;-><init>()V

    .line 53
    array-length v0, p1

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->reserve(I)V

    .line 55
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-wide v2, p1, v1

    .line 56
    .local v2, "element":J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p0, v4}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->add(Ljava/lang/Long;)Z

    .line 55
    .end local v2    # "element":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method private doAdd(IJ)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "x"    # J

    .line 145
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    move-object v2, p0

    move v3, p1

    move-wide v4, p2

    .end local p1    # "index":I
    .end local p2    # "x":J
    .local v3, "index":I
    .local v4, "x":J
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doAdd__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_LLVector;IJ)V

    .line 146
    return-void
.end method

.method private doAdd(J)V
    .locals 2
    .param p1, "x"    # J

    .line 141
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doAdd__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_LLVector;J)V

    .line 142
    return-void
.end method

.method private doCapacity()I
    .locals 2

    .line 129
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doCapacity(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)I

    move-result v0

    return v0
.end method

.method private doGet(I)J
    .locals 2
    .param p1, "index"    # I

    .line 153
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doGet(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)J

    move-result-wide v0

    return-wide v0
.end method

.method private doRemove(I)J
    .locals 2
    .param p1, "index"    # I

    .line 149
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doRemove(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)J

    move-result-wide v0

    return-wide v0
.end method

.method private doRemoveRange(II)V
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 161
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doRemoveRange(JLnet/openvpn/ovpn3/ClientAPI_LLVector;II)V

    .line 162
    return-void
.end method

.method private doReserve(I)V
    .locals 2
    .param p1, "n"    # I

    .line 133
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doReserve(JLnet/openvpn/ovpn3/ClientAPI_LLVector;I)V

    .line 134
    return-void
.end method

.method private doSet(IJ)J
    .locals 6
    .param p1, "index"    # I
    .param p2, "val"    # J

    .line 157
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    move-object v2, p0

    move v3, p1

    move-wide v4, p2

    .end local p1    # "index":I
    .end local p2    # "val":J
    .local v3, "index":I
    .local v4, "val":J
    invoke-static/range {v0 .. v5}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doSet(JLnet/openvpn/ovpn3/ClientAPI_LLVector;IJ)J

    move-result-wide p1

    return-wide p1
.end method

.method private doSize()I
    .locals 2

    .line 137
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_doSize(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)I

    move-result v0

    return v0
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_LLVector;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_LLVector;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_LLVector;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_LLVector;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->delete()V

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
.method public add(ILjava/lang/Long;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "e"    # Ljava/lang/Long;

    .line 82
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    .line 83
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doAdd(IJ)V

    .line 84
    return-void
.end method

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
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->add(ILjava/lang/Long;)V

    return-void
.end method

.method public add(Ljava/lang/Long;)Z
    .locals 4
    .param p1, "e"    # Ljava/lang/Long;

    .line 76
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    .line 77
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doAdd(J)V

    .line 78
    return v1
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
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->add(Ljava/lang/Long;)Z

    move-result p1

    return p1
.end method

.method public capacity()I
    .locals 1

    .line 101
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doCapacity()I

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 2

    .line 121
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_clear(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)V

    .line 122
    return-void
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_LLVector(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_LLVector;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->delete()V

    .line 39
    return-void
.end method

.method public get(I)Ljava/lang/Long;
    .locals 2
    .param p1, "index"    # I

    .line 68
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doGet(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->get(I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public isEmpty()Z
    .locals 2

    .line 117
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_LLVector_isEmpty(JLnet/openvpn/ovpn3/ClientAPI_LLVector;)Z

    move-result v0

    return v0
.end method

.method public remove(I)Ljava/lang/Long;
    .locals 2
    .param p1, "index"    # I

    .line 87
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    .line 88
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doRemove(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->remove(I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected removeRange(II)V
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 92
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->modCount:I

    .line 93
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doRemoveRange(II)V

    .line 94
    return-void
.end method

.method public reserve(I)V
    .locals 0
    .param p1, "n"    # I

    .line 105
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doReserve(I)V

    .line 106
    return-void
.end method

.method public set(ILjava/lang/Long;)Ljava/lang/Long;
    .locals 2
    .param p1, "index"    # I
    .param p2, "e"    # Ljava/lang/Long;

    .line 72
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doSet(IJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
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
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->set(ILjava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public size()I
    .locals 1

    .line 97
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_LLVector;->doSize()I

    move-result v0

    return v0
.end method
