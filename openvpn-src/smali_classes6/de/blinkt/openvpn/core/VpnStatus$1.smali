.class synthetic Lde/blinkt/openvpn/core/VpnStatus$1;
.super Ljava/lang/Object;
.source "VpnStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/VpnStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$de$blinkt$openvpn$core$ConnectionStatus:[I

.field static final synthetic $SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 313
    invoke-static {}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->values()[Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I

    sget-object v2, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->noNetwork:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    :try_start_1
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I

    sget-object v2, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->screenOff:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->ordinal()I

    move-result v2

    const/4 v3, 0x2

    aput v3, v1, v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$OpenVPNManagement$pauseReason:[I

    sget-object v2, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->userPause:Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$pauseReason;->ordinal()I

    move-result v2

    const/4 v3, 0x3

    aput v3, v1, v2
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 80
    :goto_2
    invoke-static {}, Lde/blinkt/openvpn/core/ConnectionStatus;->values()[Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [I

    sput-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$ConnectionStatus:[I

    :try_start_3
    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$1;->$SwitchMap$de$blinkt$openvpn$core$ConnectionStatus:[I

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-virtual {v2}, Lde/blinkt/openvpn/core/ConnectionStatus;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_3
    return-void
.end method
