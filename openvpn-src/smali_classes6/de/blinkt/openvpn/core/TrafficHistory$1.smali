.class Lde/blinkt/openvpn/core/TrafficHistory$1;
.super Ljava/lang/Object;
.source "TrafficHistory.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/TrafficHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lde/blinkt/openvpn/core/TrafficHistory;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/TrafficHistory;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 48
    new-instance v0, Lde/blinkt/openvpn/core/TrafficHistory;

    invoke-direct {v0, p1}, Lde/blinkt/openvpn/core/TrafficHistory;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 45
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/TrafficHistory$1;->createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/TrafficHistory;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lde/blinkt/openvpn/core/TrafficHistory;
    .locals 1
    .param p1, "size"    # I

    .line 53
    new-array v0, p1, [Lde/blinkt/openvpn/core/TrafficHistory;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 45
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/TrafficHistory$1;->newArray(I)[Lde/blinkt/openvpn/core/TrafficHistory;

    move-result-object p1

    return-object p1
.end method
