.class Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;
.super Ljava/lang/Object;
.source "TrafficHistory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/TrafficHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LastDiff"
.end annotation


# instance fields
.field private final lasttdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

.field private final tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;


# direct methods
.method private constructor <init>(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)V
    .locals 0
    .param p1, "lasttdp"    # Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
    .param p2, "tdp"    # Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-object p1, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->lasttdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 221
    iput-object p2, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    .line 222
    return-void
.end method

.method synthetic constructor <init>(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;-><init>(Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;)V

    return-void
.end method


# virtual methods
.method public getDiffIn()J
    .locals 4

    .line 229
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v0, v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    iget-object v2, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->lasttdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v2, v2, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDiffOut()J
    .locals 4

    .line 225
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v0, v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    iget-object v2, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->lasttdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v2, v2, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getIn()J
    .locals 2

    .line 233
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v0, v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    return-wide v0
.end method

.method public getOut()J
    .locals 2

    .line 237
    iget-object v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$LastDiff;->tdp:Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;

    iget-wide v0, v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    return-wide v0
.end method
