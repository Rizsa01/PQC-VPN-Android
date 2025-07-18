.class public final enum Lde/blinkt/openvpn/core/Connection$ProxyType;
.super Ljava/lang/Enum;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ProxyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/Connection$ProxyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/Connection$ProxyType;

.field public static final enum HTTP:Lde/blinkt/openvpn/core/Connection$ProxyType;

.field public static final enum NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

.field public static final enum ORBOT:Lde/blinkt/openvpn/core/Connection$ProxyType;

.field public static final enum SOCKS5:Lde/blinkt/openvpn/core/Connection$ProxyType;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/Connection$ProxyType;
    .locals 4

    .line 34
    sget-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

    sget-object v1, Lde/blinkt/openvpn/core/Connection$ProxyType;->HTTP:Lde/blinkt/openvpn/core/Connection$ProxyType;

    sget-object v2, Lde/blinkt/openvpn/core/Connection$ProxyType;->SOCKS5:Lde/blinkt/openvpn/core/Connection$ProxyType;

    sget-object v3, Lde/blinkt/openvpn/core/Connection$ProxyType;->ORBOT:Lde/blinkt/openvpn/core/Connection$ProxyType;

    filled-new-array {v0, v1, v2, v3}, [Lde/blinkt/openvpn/core/Connection$ProxyType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 35
    new-instance v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/Connection$ProxyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->NONE:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 36
    new-instance v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    const-string v1, "HTTP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/Connection$ProxyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->HTTP:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 37
    new-instance v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    const-string v1, "SOCKS5"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/Connection$ProxyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->SOCKS5:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 38
    new-instance v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    const-string v1, "ORBOT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/Connection$ProxyType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->ORBOT:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 34
    invoke-static {}, Lde/blinkt/openvpn/core/Connection$ProxyType;->$values()[Lde/blinkt/openvpn/core/Connection$ProxyType;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->$VALUES:[Lde/blinkt/openvpn/core/Connection$ProxyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/Connection$ProxyType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 34
    const-class v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/Connection$ProxyType;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/Connection$ProxyType;
    .locals 1

    .line 34
    sget-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->$VALUES:[Lde/blinkt/openvpn/core/Connection$ProxyType;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/Connection$ProxyType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/Connection$ProxyType;

    return-object v0
.end method
