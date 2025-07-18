.class final enum Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;
.super Ljava/lang/Enum;
.source "DeviceStateReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/DeviceStateReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "connectState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

.field public static final enum DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

.field public static final enum PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

.field public static final enum SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;
    .locals 3

    .line 65
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v1, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    sget-object v2, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    filled-new-array {v0, v1, v2}, [Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 66
    new-instance v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    const-string v1, "SHOULDBECONNECTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->SHOULDBECONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 67
    new-instance v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    const-string v1, "PENDINGDISCONNECT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->PENDINGDISCONNECT:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 68
    new-instance v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    const-string v1, "DISCONNECTED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->DISCONNECTED:Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    .line 65
    invoke-static {}, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->$values()[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->$VALUES:[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

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

    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;
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

    .line 65
    const-class v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;
    .locals 1

    .line 65
    sget-object v0, Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->$VALUES:[Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/DeviceStateReceiver$connectState;

    return-object v0
.end method
