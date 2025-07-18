.class Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;
.super Ljava/lang/Object;
.source "DeviceStateReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/DeviceStateReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Datapoint"
.end annotation


# instance fields
.field data:J

.field timestamp:J


# direct methods
.method private constructor <init>(JJ)V
    .locals 0
    .param p1, "t"    # J
    .param p3, "d"    # J

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-wide p1, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;->timestamp:J

    .line 74
    iput-wide p3, p0, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;->data:J

    .line 75
    return-void
.end method

.method synthetic constructor <init>(JJLde/blinkt/openvpn/core/DeviceStateReceiver-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lde/blinkt/openvpn/core/DeviceStateReceiver$Datapoint;-><init>(JJ)V

    return-void
.end method
