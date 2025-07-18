.class public final enum Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
.super Ljava/lang/Enum;
.source "VpnStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/VpnStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/VpnStatus$LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field public static final enum DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field public static final enum ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field public static final enum INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field public static final enum VERBOSE:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

.field public static final enum WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;


# instance fields
.field protected mValue:I


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .locals 5

    .line 155
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    sget-object v1, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    sget-object v2, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    sget-object v3, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->VERBOSE:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    sget-object v4, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    filled-new-array {v0, v1, v2, v3, v4}, [Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 156
    new-instance v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v1, "INFO"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 157
    new-instance v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const/4 v1, -0x2

    const-string v2, "ERROR"

    const/4 v4, 0x1

    invoke-direct {v0, v2, v4, v1}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 158
    new-instance v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v1, "WARNING"

    invoke-direct {v0, v1, v3, v4}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 159
    new-instance v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v1, "VERBOSE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->VERBOSE:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 160
    new-instance v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    const-string v1, "DEBUG"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    .line 155
    invoke-static {}, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->$values()[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->$VALUES:[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 164
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 165
    iput p3, p0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->mValue:I

    .line 166
    return-void
.end method

.method public static getEnumByValue(I)Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .locals 1
    .param p0, "value"    # I

    .line 173
    packed-switch p0, :pswitch_data_0

    .line 186
    :pswitch_0
    const/4 v0, 0x0

    return-object v0

    .line 183
    :pswitch_1
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->DEBUG:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0

    .line 181
    :pswitch_2
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->VERBOSE:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0

    .line 175
    :pswitch_3
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->INFO:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0

    .line 179
    :pswitch_4
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->WARNING:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0

    .line 177
    :pswitch_5
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->ERROR:Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
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

    .line 155
    const-class v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;
    .locals 1

    .line 155
    sget-object v0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->$VALUES:[Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/VpnStatus$LogLevel;

    return-object v0
.end method


# virtual methods
.method public getInt()I
    .locals 1

    .line 169
    iget v0, p0, Lde/blinkt/openvpn/core/VpnStatus$LogLevel;->mValue:I

    return v0
.end method
