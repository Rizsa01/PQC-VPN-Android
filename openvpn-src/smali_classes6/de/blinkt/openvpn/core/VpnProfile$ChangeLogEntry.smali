.class Lde/blinkt/openvpn/core/VpnProfile$ChangeLogEntry;
.super Ljava/lang/Object;
.source "VpnProfile.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/VpnProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ChangeLogEntry"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x53b76fc020cf1e9aL


# instance fields
.field public message:Ljava/lang/String;

.field public time:J


# direct methods
.method constructor <init>()V
    .locals 0

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
