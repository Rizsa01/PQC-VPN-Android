.class Lde/blinkt/openvpn/core/ConnectionStatus$1;
.super Ljava/lang/Object;
.source "ConnectionStatus.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/ConnectionStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lde/blinkt/openvpn/core/ConnectionStatus;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/ConnectionStatus;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .line 39
    invoke-static {}, Lde/blinkt/openvpn/core/ConnectionStatus;->values()[Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aget-object v0, v0, v1

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

    .line 36
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/ConnectionStatus$1;->createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lde/blinkt/openvpn/core/ConnectionStatus;
    .locals 1
    .param p1, "size"    # I

    .line 44
    new-array v0, p1, [Lde/blinkt/openvpn/core/ConnectionStatus;

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

    .line 36
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/ConnectionStatus$1;->newArray(I)[Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object p1

    return-object p1
.end method
