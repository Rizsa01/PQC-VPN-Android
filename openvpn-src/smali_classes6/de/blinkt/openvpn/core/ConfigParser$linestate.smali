.class final enum Lde/blinkt/openvpn/core/ConfigParser$linestate;
.super Ljava/lang/Enum;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "linestate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/ConfigParser$linestate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/ConfigParser$linestate;

.field public static final enum done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

.field public static final enum initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

.field public static final enum readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

.field public static final enum reading_quoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

.field public static final enum reading_unquoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/ConfigParser$linestate;
    .locals 5

    .line 1080
    sget-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    sget-object v2, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_quoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    sget-object v3, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_unquoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    sget-object v4, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    filled-new-array {v0, v1, v2, v3, v4}, [Lde/blinkt/openvpn/core/ConfigParser$linestate;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1081
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const-string v1, "initial"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConfigParser$linestate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    .line 1082
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const-string v1, "readin_single_quote"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConfigParser$linestate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const-string v1, "reading_quoted"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConfigParser$linestate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_quoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const-string v1, "reading_unquoted"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConfigParser$linestate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_unquoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const-string v1, "done"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/ConfigParser$linestate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    .line 1080
    invoke-static {}, Lde/blinkt/openvpn/core/ConfigParser$linestate;->$values()[Lde/blinkt/openvpn/core/ConfigParser$linestate;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->$VALUES:[Lde/blinkt/openvpn/core/ConfigParser$linestate;

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

    .line 1080
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/ConfigParser$linestate;
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

    .line 1080
    const-class v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/ConfigParser$linestate;
    .locals 1

    .line 1080
    sget-object v0, Lde/blinkt/openvpn/core/ConfigParser$linestate;->$VALUES:[Lde/blinkt/openvpn/core/ConfigParser$linestate;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/ConfigParser$linestate;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/ConfigParser$linestate;

    return-object v0
.end method
