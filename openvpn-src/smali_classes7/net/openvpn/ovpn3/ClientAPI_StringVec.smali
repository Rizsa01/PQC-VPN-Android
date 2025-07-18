.class public Lnet/openvpn/ovpn3/ClientAPI_StringVec;
.super Ljava/util/AbstractList;
.source "ClientAPI_StringVec.java"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/String;",
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
    invoke-static {}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_StringVec__SWIG_0()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>(JZ)V

    .line 110
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 3
    .param p1, "count"    # I
    .param p2, "value"    # Ljava/lang/String;

    .line 125
    invoke-static {p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_StringVec__SWIG_2(ILjava/lang/String;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>(JZ)V

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
    iput-boolean p3, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCMemOwn:Z

    .line 17
    iput-wide p1, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 61
    .local p1, "initialElements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>()V

    .line 62
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 63
    .local v1, "element":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->add(Ljava/lang/String;)Z

    .line 64
    .end local v1    # "element":Ljava/lang/String;
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method public constructor <init>(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)V
    .locals 3
    .param p1, "other"    # Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    .line 113
    invoke-static {p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->getCPtr(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->new_ClientAPI_StringVec__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>(JZ)V

    .line 114
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 3
    .param p1, "initialElements"    # [Ljava/lang/String;

    .line 52
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;-><init>()V

    .line 53
    array-length v0, p1

    invoke-virtual {p0, v0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->reserve(I)V

    .line 55
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 56
    .local v2, "element":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->add(Ljava/lang/String;)Z

    .line 55
    .end local v2    # "element":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method private doAdd(ILjava/lang/String;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "x"    # Ljava/lang/String;

    .line 145
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doAdd__SWIG_1(JLnet/openvpn/ovpn3/ClientAPI_StringVec;ILjava/lang/String;)V

    .line 146
    return-void
.end method

.method private doAdd(Ljava/lang/String;)V
    .locals 2
    .param p1, "x"    # Ljava/lang/String;

    .line 141
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doAdd__SWIG_0(JLnet/openvpn/ovpn3/ClientAPI_StringVec;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method private doCapacity()I
    .locals 2

    .line 129
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doCapacity(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)I

    move-result v0

    return v0
.end method

.method private doGet(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 153
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doGet(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private doRemove(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .line 149
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doRemove(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private doRemoveRange(II)V
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 161
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doRemoveRange(JLnet/openvpn/ovpn3/ClientAPI_StringVec;II)V

    .line 162
    return-void
.end method

.method private doReserve(I)V
    .locals 2
    .param p1, "n"    # I

    .line 133
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doReserve(JLnet/openvpn/ovpn3/ClientAPI_StringVec;I)V

    .line 134
    return-void
.end method

.method private doSet(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I
    .param p2, "val"    # Ljava/lang/String;

    .line 157
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0, p1, p2}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doSet(JLnet/openvpn/ovpn3/ClientAPI_StringVec;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private doSize()I
    .locals 2

    .line 137
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_doSize(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)I

    move-result v0

    return v0
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    .line 21
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/ClientAPI_StringVec;)J
    .locals 4
    .param p0, "obj"    # Lnet/openvpn/ovpn3/ClientAPI_StringVec;

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .local v0, "ptr":J
    if-eqz p0, :cond_1

    .line 27
    iget-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCMemOwn:Z

    if-eqz v2, :cond_0

    .line 29
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    .line 30
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCMemOwn:Z

    .line 31
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->delete()V

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
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->add(ILjava/lang/String;)V

    return-void
.end method

.method public add(ILjava/lang/String;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "e"    # Ljava/lang/String;

    .line 82
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    .line 83
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doAdd(ILjava/lang/String;)V

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
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->add(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public add(Ljava/lang/String;)Z
    .locals 2
    .param p1, "e"    # Ljava/lang/String;

    .line 76
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    .line 77
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doAdd(Ljava/lang/String;)V

    .line 78
    return v1
.end method

.method public capacity()I
    .locals 1

    .line 101
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doCapacity()I

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 2

    .line 121
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_clear(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)V

    .line 122
    return-void
.end method

.method public declared-synchronized delete()V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 43
    iget-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCMemOwn:Z

    if-eqz v0, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCMemOwn:Z

    .line 45
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1}, Lnet/openvpn/ovpn3/ovpncliJNI;->delete_ClientAPI_StringVec(J)V

    .line 47
    .end local p0    # "this":Lnet/openvpn/ovpn3/ClientAPI_StringVec;
    :cond_0
    iput-wide v2, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J
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
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->delete()V

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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->get(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 68
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doGet(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    .line 117
    iget-wide v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->swigCPtr:J

    invoke-static {v0, v1, p0}, Lnet/openvpn/ovpn3/ovpncliJNI;->ClientAPI_StringVec_isEmpty(JLnet/openvpn/ovpn3/ClientAPI_StringVec;)Z

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
    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->remove(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public remove(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 87
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    .line 88
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doRemove(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected removeRange(II)V
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 92
    iget v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->modCount:I

    .line 93
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doRemoveRange(II)V

    .line 94
    return-void
.end method

.method public reserve(I)V
    .locals 0
    .param p1, "n"    # I

    .line 105
    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doReserve(I)V

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
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->set(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public set(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .param p2, "e"    # Ljava/lang/String;

    .line 72
    invoke-direct {p0, p1, p2}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doSet(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 97
    invoke-direct {p0}, Lnet/openvpn/ovpn3/ClientAPI_StringVec;->doSize()I

    move-result v0

    return v0
.end method
