.class public final Lnet/openvpn/ovpn3/DnsServer$Security;
.super Ljava/lang/Object;
.source "DnsServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/openvpn/ovpn3/DnsServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Security"
.end annotation


# static fields
.field public static final No:Lnet/openvpn/ovpn3/DnsServer$Security;

.field public static final Optional:Lnet/openvpn/ovpn3/DnsServer$Security;

.field public static final Unset:Lnet/openvpn/ovpn3/DnsServer$Security;

.field public static final Yes:Lnet/openvpn/ovpn3/DnsServer$Security;

.field private static swigNext:I

.field private static swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;


# instance fields
.field private final swigName:Ljava/lang/String;

.field private final swigValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 118
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Security;

    const-string v1, "Unset"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Security;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->Unset:Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 119
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Security;

    const-string v1, "No"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Security;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->No:Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 120
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Security;

    const-string v1, "Yes"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Security;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->Yes:Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 121
    new-instance v0, Lnet/openvpn/ovpn3/DnsServer$Security;

    const-string v1, "Optional"

    invoke-direct {v0, v1}, Lnet/openvpn/ovpn3/DnsServer$Security;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->Optional:Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 157
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->Unset:Lnet/openvpn/ovpn3/DnsServer$Security;

    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Security;->No:Lnet/openvpn/ovpn3/DnsServer$Security;

    sget-object v2, Lnet/openvpn/ovpn3/DnsServer$Security;->Yes:Lnet/openvpn/ovpn3/DnsServer$Security;

    sget-object v3, Lnet/openvpn/ovpn3/DnsServer$Security;->Optional:Lnet/openvpn/ovpn3/DnsServer$Security;

    filled-new-array {v0, v1, v2, v3}, [Lnet/openvpn/ovpn3/DnsServer$Security;

    move-result-object v0

    sput-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 158
    const/4 v0, 0x0

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigNext:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "swigName"    # Ljava/lang/String;

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigName:Ljava/lang/String;

    .line 142
    sget v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigNext:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lnet/openvpn/ovpn3/DnsServer$Security;->swigNext:I

    iput v0, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    .line 143
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "swigName"    # Ljava/lang/String;
    .param p2, "swigValue"    # I

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigName:Ljava/lang/String;

    .line 147
    iput p2, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    .line 148
    add-int/lit8 v0, p2, 0x1

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigNext:I

    .line 149
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lnet/openvpn/ovpn3/DnsServer$Security;)V
    .locals 1
    .param p1, "swigName"    # Ljava/lang/String;
    .param p2, "swigEnum"    # Lnet/openvpn/ovpn3/DnsServer$Security;

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigName:Ljava/lang/String;

    .line 153
    iget v0, p2, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    iput v0, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    .line 154
    iget v0, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigNext:I

    .line 155
    return-void
.end method

.method public static swigToEnum(I)Lnet/openvpn/ovpn3/DnsServer$Security;
    .locals 3
    .param p0, "swigValue"    # I

    .line 132
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    array-length v0, v0

    if-ge p0, v0, :cond_0

    if-ltz p0, :cond_0

    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    aget-object v0, v0, p0

    iget v0, v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    if-ne v0, p0, :cond_0

    .line 133
    sget-object v0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    aget-object v0, v0, p0

    return-object v0

    .line 134
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 135
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    aget-object v1, v1, v0

    iget v1, v1, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    if-ne v1, p0, :cond_1

    .line 136
    sget-object v1, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValues:[Lnet/openvpn/ovpn3/DnsServer$Security;

    aget-object v1, v1, v0

    return-object v1

    .line 134
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 137
    .end local v0    # "i":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No enum "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lnet/openvpn/ovpn3/DnsServer$Security;

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

    .line 124
    iget v0, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lnet/openvpn/ovpn3/DnsServer$Security;->swigName:Ljava/lang/String;

    return-object v0
.end method
