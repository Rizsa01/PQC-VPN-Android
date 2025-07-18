.class public final enum Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
.super Ljava/lang/Enum;
.source "OpenVPNManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNManagement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "pauseReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

.field public static final enum noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

.field public static final enum screenOff:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

.field public static final enum userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
    .locals 3

    .line 16
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    sget-object v1, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    sget-object v2, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->screenOff:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    filled-new-array {v0, v1, v2}, [Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 17
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    const-string v1, "noNetwork"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 18
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    const-string v1, "userPause"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 19
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    const-string v1, "screenOff"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->screenOff:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    .line 16
    invoke-static {}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->$values()[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->$VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

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

    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
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

    .line 16
    const-class v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;
    .locals 1

    .line 16
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->$VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    return-object v0
.end method
