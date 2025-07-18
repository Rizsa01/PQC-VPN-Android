.class public final Lnet/openvpn/ovpn3/DnsServer$Transport;
.super Ljava/lang/Object;
.source "DnsServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/openvpn/ovpn3/DnsServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Transport"
.end annotation


# static fields
.field public static final HTTPS:Lnet/openvpn/ovpn3/DnsServer$Transport;

.field public static final Plain:Lnet/openvpn/ovpn3/DnsServer$Transport;

.field public static final TLS:Lnet/openvpn/ovpn3/DnsServer$Transport;

.field public static final Unset:Lnet/openvpn/ovpn3/DnsServer$Transport;

.field private static swigNext:I

.field private static swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;


# instance fields
.field private final swigName:Ljava/lang/String;

.field private final swigValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 164
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Transport;

    const-string v1, "Unset"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Transport;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->Unset:Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 165
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Transport;

    const-string v1, "Plain"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Transport;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->Plain:Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 166
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Transport;

    const-string v1, "HTTPS"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Transport;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->HTTPS:Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 167
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Transport;

    const-string v1, "TLS"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Transport;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->TLS:Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 203
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->Unset:Lnet/openvpn/ovpn3/DnsServer$Transport;

    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->Plain:Lnet/openvpn/ovpn3/DnsServer$Transport;

    sget-object v2, Lnet/openvpn/ovpn3/DnsServer$Transport;->HTTPS:Lnet/openvpn/ovpn3/DnsServer$Transport;

    sget-object v3, Lnet/openvpn/ovpn3/DnsServer$Transport;->TLS:Lnet/openvpn/ovpn3/DnsServer$Transport;

    filled-new-array {v0, v1, v2, v3}, [Lnet/openvpn/ovpn3/DnsServer$Transport;

    move-result-object v0

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 204
    const/4 v0, 0x0

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigNext:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "swigName"    # Ljava/lang/String;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigName:Ljava/lang/String;

    .line 188
    sget v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigNext:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigNext:I

    iput v0, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    .line 189
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "swigName"    # Ljava/lang/String;
    .param p2, "swigValue"    # I

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigName:Ljava/lang/String;

    .line 193
    iput p2, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    .line 194
    add-int/lit8 v0, p2, 0x1

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigNext:I

    .line 195
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lnet/openvpn/ovpn3/DnsServer$Transport;)V
    .locals 1
    .param p1, "swigName"    # Ljava/lang/String;
    .param p2, "swigEnum"    # Lnet/openvpn/ovpn3/DnsServer$Transport;

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigName:Ljava/lang/String;

    .line 199
    iget v0, p2, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    iput v0, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    .line 200
    iget v0, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigNext:I

    .line 201
    return-void
.end method

.method public static swigToEnum(I)Lnet/openvpn/ovpn3/DnsServer$Transport;
    .locals 3
    .param p0, "swigValue"    # I

    .line 178
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    array-length v0, v0

    if-ge p0, v0, :cond_0

    if-ltz p0, :cond_0

    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    aget-object v0, v0, p0

    iget v0, v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    if-ne v0, p0, :cond_0

    .line 179
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    aget-object v0, v0, p0

    return-object v0

    .line 180
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 181
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    aget-object v1, v1, v0

    iget v1, v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    if-ne v1, p0, :cond_1

    .line 182
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Transport;

    aget-object v1, v1, v0

    return-object v1

    .line 180
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 183
    .end local v0    # "i":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No enum "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lnet/openvpn/ovpn3/DnsServer$Transport;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final swigValue()I
    .locals 1

    .line 170
    iget v0, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 174
    iget-object v0, p0, Lnet/openvpn/ovpn3/DnsServer$Transport;->swigName:Ljava/lang/String;

    return-object v0
.end method
