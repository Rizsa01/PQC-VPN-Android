.class public Lde/blinkt/openvpn/core/TrafficHistory;
.super Ljava/lang/Object;
.source "TrafficHistory.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;,
        Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/TrafficHistory;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERIODS_TO_KEEP:J = 0x5L

.field public static final TIME_PERIOD_HOURS:I = 0x36ee80

.field public static final TIME_PERIOD_MINTUES:I = 0xea60


# instance fields
.field private lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

.field private lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

.field private final trafficHistoryHours:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation
.end field

.field private final trafficHistoryMinutes:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation
.end field

.field private final trafficHistorySeconds:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/TrafficHistory$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/TrafficHistory;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    .line 27
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    .line 28
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    .line 35
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    .line 27
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    .line 28
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    .line 38
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 39
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 40
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iput-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 43
    return-void
.end method

.method private declared-synchronized addDataPoint(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)V
    .locals 10
    .param p1, "tdp"    # Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    monitor-enter p0

    .line 166
    :try_start_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 168
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    if-nez v0, :cond_0

    .line 169
    new-instance v1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-direct/range {v1 .. v8}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V

    iput-object v1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 170
    new-instance v2, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    invoke-direct/range {v2 .. v9}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V

    iput-object v2, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 173
    .end local p0    # "this":Lde/blinkt/openvpn/core/TrafficHistory;
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lde/blinkt/openvpn/core/TrafficHistory;->removeAndAverage(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    monitor-exit p0

    return-void

    .line 165
    .end local p1    # "tdp":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :catchall_0
    move-exception v0

    move-object p1, v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static getDummyList()Ljava/util/LinkedList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation

    .line 109
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 110
    .local v0, "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    new-instance v1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-direct/range {v1 .. v8}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 111
    return-object v0
.end method

.method private removeAndAverage(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Z)V
    .locals 13
    .param p1, "newTdp"    # Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    .param p2, "seconds"    # Z

    .line 177
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 178
    .local v0, "toRemove":Ljava/util/HashSet;, "Ljava/util/HashSet<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 184
    .local v1, "toAverage":Ljava/util/Vector;, "Ljava/util/Vector<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    if-eqz p2, :cond_0

    .line 185
    const-wide/32 v2, 0xea60

    .line 186
    .local v2, "timePeriod":J
    iget-object v4, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    .line 187
    .local v4, "tpList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    iget-object v5, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    .line 188
    .local v5, "nextList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    iget-object v6, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .local v6, "lastTsPeriod":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    goto :goto_0

    .line 190
    .end local v2    # "timePeriod":J
    .end local v4    # "tpList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    .end local v5    # "nextList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    .end local v6    # "lastTsPeriod":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :cond_0
    const-wide/32 v2, 0x36ee80

    .line 191
    .restart local v2    # "timePeriod":J
    iget-object v4, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    .line 192
    .restart local v4    # "tpList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    iget-object v5, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    .line 193
    .restart local v5    # "nextList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;>;"
    iget-object v6, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 196
    .restart local v6    # "lastTsPeriod":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :goto_0
    iget-wide v7, p1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    div-long/2addr v7, v2

    iget-wide v9, v6, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    div-long/2addr v9, v2

    cmp-long v7, v7, v9

    if-lez v7, :cond_4

    .line 197
    invoke-virtual {v5, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 199
    if-eqz p2, :cond_1

    .line 200
    iput-object p1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 201
    const/4 v7, 0x0

    invoke-direct {p0, p1, v7}, Lde/blinkt/openvpn/core/TrafficHistory;->removeAndAverage(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Z)V

    goto :goto_1

    .line 203
    :cond_1
    iput-object p1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 205
    :goto_1
    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 207
    .local v8, "tph":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    iget-wide v9, p1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    iget-wide v11, v8, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    sub-long/2addr v9, v11

    div-long/2addr v9, v2

    const-wide/16 v11, 0x5

    cmp-long v9, v9, v11

    if-ltz v9, :cond_2

    .line 208
    invoke-virtual {v0, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 209
    .end local v8    # "tph":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :cond_2
    goto :goto_2

    .line 210
    :cond_3
    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->removeAll(Ljava/util/Collection;)Z

    .line 212
    :cond_4
    return-void
.end method


# virtual methods
.method add(JJ)Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    .locals 8
    .param p1, "in"    # J
    .param p3, "out"    # J

    .line 158
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    move-wide v1, p1

    move-wide v3, p3

    .end local p1    # "in":J
    .end local p3    # "out":J
    .local v1, "in":J
    .local v3, "out":J
    invoke-direct/range {v0 .. v7}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V

    .line 160
    .local v0, "tdp":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    invoke-virtual {p0, v0}, Lde/blinkt/openvpn/core/TrafficHistory;->getLastDiff(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;

    move-result-object p1

    .line 161
    .local p1, "diff":Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    invoke-direct {p0, v0}, Lde/blinkt/openvpn/core/TrafficHistory;->addDataPoint(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)V

    .line 162
    return-object p1
.end method

.method public describeContents()I
    .locals 1

    .line 83
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized getHours()Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 97
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 97
    .end local p0    # "this":Lde/blinkt/openvpn/core/TrafficHistory;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getLastDiff(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
    .locals 9
    .param p1, "tdp"    # Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 62
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 63
    new-instance v1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-direct/range {v1 .. v8}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V

    .local v1, "lasttdp":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    goto :goto_0

    .line 66
    .end local v1    # "lasttdp":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :cond_0
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 68
    .restart local v1    # "lasttdp":Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    :goto_0
    if-nez p1, :cond_2

    .line 69
    move-object p1, v1

    .line 70
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    .line 71
    move-object v1, p1

    goto :goto_1

    .line 73
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object p1, v0

    check-cast p1, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 78
    :cond_2
    :goto_1
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;-><init>(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory-IA;)V

    return-object v0
.end method

.method public declared-synchronized getMinutes()Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 101
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 101
    .end local p0    # "this":Lde/blinkt/openvpn/core/TrafficHistory;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized getSeconds()Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 105
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 105
    .end local p0    # "this":Lde/blinkt/openvpn/core/TrafficHistory;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 88
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistorySeconds:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 89
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryMinutes:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 90
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->trafficHistoryHours:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 91
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastSecondUsedForMinute:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 92
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory;->lastMinuteUsedForHours:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 94
    return-void
.end method
