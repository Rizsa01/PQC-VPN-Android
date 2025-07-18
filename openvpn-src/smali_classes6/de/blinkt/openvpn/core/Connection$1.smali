.class Lde/blinkt/openvpn/core/Connection$1;
.super Ljava/lang/Object;
.source "Connection.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lde/blinkt/openvpn/core/Connection;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/Connection;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .line 87
    new-instance v0, Lde/blinkt/openvpn/core/Connection;

    invoke-direct {v0, p1}, Lde/blinkt/openvpn/core/Connection;-><init>(Landroid/os/Parcel;)V

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

    .line 84
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/Connection$1;->createFromParcel(Landroid/os/Parcel;)Lde/blinkt/openvpn/core/Connection;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lde/blinkt/openvpn/core/Connection;
    .locals 1
    .param p1, "size"    # I

    .line 92
    new-array v0, p1, [Lde/blinkt/openvpn/core/Connection;

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

    .line 84
    invoke-virtual {p0, p1}, Lde/blinkt/openvpn/core/Connection$1;->newArray(I)[Lde/blinkt/openvpn/core/Connection;

    move-result-object p1

    return-object p1
.end method
