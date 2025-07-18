.class public final enum Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;
.super Ljava/lang/Enum;
.source "OpenVPNManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/core/OpenVPNManagement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SignaturePadding"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

.field public static final enum NO_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

.field public static final enum RSA_PKCS1_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

.field public static final enum RSA_PKCS1_PSS_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;


# direct methods
.method private static synthetic $values()[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;
    .locals 3

    .line 23
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->RSA_PKCS1_PSS_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    sget-object v1, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->RSA_PKCS1_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    sget-object v2, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->NO_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    filled-new-array {v0, v1, v2}, [Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 24
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    const-string v1, "RSA_PKCS1_PSS_PADDING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->RSA_PKCS1_PSS_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    .line 25
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    const-string v1, "RSA_PKCS1_PADDING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->RSA_PKCS1_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    .line 26
    new-instance v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    const-string v1, "NO_PADDING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->NO_PADDING:Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    .line 23
    invoke-static {}, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->$values()[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->$VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

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

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;
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

    .line 23
    const-class v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    return-object v0
.end method

.method public static values()[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;
    .locals 1

    .line 23
    sget-object v0, Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->$VALUES:[Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    invoke-virtual {v0}, [Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lde/blinkt/openvpn/core/OpenVPNManagement$SignaturePadding;

    return-object v0
.end method
