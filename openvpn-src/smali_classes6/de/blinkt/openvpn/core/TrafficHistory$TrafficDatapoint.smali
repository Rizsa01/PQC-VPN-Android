.class public Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;
.super Ljava/lang/Object;
.source "TrafficHistory.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/TrafficHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TrafficDatapoint"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final in:J

.field public final out:J

.field public final timestamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 132
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(JJJ)V
    .locals 0
    .param p1, "inBytes"    # J
    .param p3, "outBytes"    # J
    .param p5, "timestamp"    # J

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-wide p1, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    .line 118
    iput-wide p3, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    .line 119
    iput-wide p5, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    .line 120
    return-void
.end method

.method synthetic constructor <init>(JJJLde/blinkt/openvpn/core/TrafficHistory-IA;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(JJJ)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    .line 128
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    .line 129
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    .line 130
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lde/blinkt/openvpn/core/TrafficHistory-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 151
    iget-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->timestamp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 152
    iget-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->in:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 153
    iget-wide v0, p0, Lde/blinkt/openvpn/core/TrafficHistory$TrafficDatapoint;->out:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 154
    return-void
.end method
