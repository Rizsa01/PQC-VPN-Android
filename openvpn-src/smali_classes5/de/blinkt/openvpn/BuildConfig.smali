.class public final Lde/blinkt/openvpn/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static final APPLICATION_ID:Ljava/lang/String; = "de.blinkt.openvpn"

.field public static final BUILD_TYPE:Ljava/lang/String; = "debug"

.field public static final DEBUG:Z

.field public static final FLAVOR:Ljava/lang/String; = "skeletonOvpn2"

.field public static final FLAVOR_implementation:Ljava/lang/String; = "skeleton"

.field public static final FLAVOR_ovpnimpl:Ljava/lang/String; = "ovpn2"

.field public static final VERSION_CODE:I = 0xd8

.field public static final VERSION_NAME:Ljava/lang/String; = "0.7.61-o2"

.field public static final openvpn3:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "true"

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lde/blinkt/openvpn/BuildConfig;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
