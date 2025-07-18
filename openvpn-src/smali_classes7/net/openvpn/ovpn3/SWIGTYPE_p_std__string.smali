.class public Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;
.super Ljava/lang/Object;
.source "SWIGTYPE_p_std__string.java"


# instance fields
.field private transient swigCPtr:J


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;->swigCPtr:J

    .line 20
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 0
    .param p1, "cPtr"    # J
    .param p3, "futureUse"    # Z

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-wide p1, p0, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;->swigCPtr:J

    .line 16
    return-void
.end method

.method protected static getCPtr(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;

    .line 23
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;->swigCPtr:J

    :goto_0
    return-wide v0
.end method

.method protected static swigRelease(Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;)J
    .locals 2
    .param p0, "obj"    # Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;

    .line 27
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lnet/openvpn/ovpn3/SWIGTYPE_p_std__string;->swigCPtr:J

    :goto_0
    return-wide v0
.end method
