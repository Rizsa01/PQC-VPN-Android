.class public final enum Lde/blinkt/openvpn/core/ConnectionStatus;
.super Ljava/lang/Enum;
.source "ConnectionStatus.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/ConnectionStatus;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lde/blinkt/openvpn/core/ConnectionStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum LEVEL_AUTH_FAILED:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_CONNECTING_NO_SERVER_REPLY_YET:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_CONNECTING_SERVER_REPLIED:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_NONETWORK:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_START:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_VPNPAUSED:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum LEVEL_WAITING_FOR_USER_INPUT:Lde/blinkt/openvpn/core/ConnectionStatus;

.field public static final enum UNKNOWN_LEVEL:Lde/blinkt/openvpn/core/ConnectionStatus;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/ConnectionStatus;
    .locals 10

    .line 14
    sget-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v1, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_VPNPAUSED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v2, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_SERVER_REPLIED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v3, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_NO_SERVER_REPLY_YET:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v4, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NONETWORK:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v5, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v6, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_START:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v7, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_AUTH_FAILED:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v8, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_WAITING_FOR_USER_INPUT:Lde/blinkt/openvpn/core/ConnectionStatus;

    sget-object v9, Lde/blinkt/openvpn/core/ConnectionStatus;->UNKNOWN_LEVEL:Lde/blinkt/openvpn/core/ConnectionStatus;

    filled-new-array/range {v0 .. v9}, [Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 15
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_CONNECTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 16
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_VPNPAUSED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_VPNPAUSED:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 17
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_CONNECTING_SERVER_REPLIED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_SERVER_REPLIED:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 18
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_CONNECTING_NO_SERVER_REPLY_YET"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_CONNECTING_NO_SERVER_REPLY_YET:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 19
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_NONETWORK"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NONETWORK:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 20
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_NOTCONNECTED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_NOTCONNECTED:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 21
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_START"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_START:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 22
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_AUTH_FAILED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_AUTH_FAILED:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 23
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "LEVEL_WAITING_FOR_USER_INPUT"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->LEVEL_WAITING_FOR_USER_INPUT:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 24
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    const-string v1, "UNKNOWN_LEVEL"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConnectionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->UNKNOWN_LEVEL:Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 14
    invoke-static {}, Lde/blinkt/openvpn/core/ConnectionStatus;->$values()[Lde/blinkt/openvpn/core/ConnectionStatus;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->$VALUES:[Lde/blinkt/openvpn/core/ConnectionStatus;

    .line 36
    new-instance v0, Lde/blinkt/openvpn/core/ConnectionStatus$1;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/ConnectionStatus$1;-><init>()V

    sput-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->CREATOR:Landroid/os/Parcelable$Creator;

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

    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/ConnectionStatus;
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

    .line 14
    const-class v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/ConnectionStatus;
    .locals 1

    .line 14
    sget-object v0, Lde/blinkt/openvpn/core/ConnectionStatus;->$VALUES:[Lde/blinkt/openvpn/core/ConnectionStatus;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/ConnectionStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/ConnectionStatus;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 28
    invoke-virtual {p0}, Lde/blinkt/openvpn/core/ConnectionStatus;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 29
    return-void
.end method
