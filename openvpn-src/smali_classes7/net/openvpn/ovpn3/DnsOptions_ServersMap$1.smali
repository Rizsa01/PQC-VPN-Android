.class Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;
.super Ljava/lang/Object;
.source "DnsOptions_ServersMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/openvpn/ovpn3/DnsOptions_ServersMap;->entrySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/Integer;",
        "Lnet/openvpn/ovpn3/DnsServer;",
        ">;"
    }
.end annotation


# instance fields
.field private iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

.field final synthetic this$0:Lnet/openvpn/ovpn3/DnsOptions_ServersMap;


# direct methods
.method static bridge synthetic -$$Nest$minit(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Ljava/util/Map$Entry;
    .locals 0

    invoke-direct {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->init(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Lnet/openvpn/ovpn3/DnsOptions_ServersMap;)V
    .locals 0
    .param p1, "this$0"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->this$0:Lnet/openvpn/ovpn3/DnsOptions_ServersMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private init(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Ljava/util/Map$Entry;
    .locals 0
    .param p1, "iterator"    # Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;",
            ")",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Integer;",
            "Lnet/openvpn/ovpn3/DnsServer;",
            ">;"
        }
    .end annotation

    .line 115
    iput-object p1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    .line 116
    return-object p0
.end method


# virtual methods
.method public getKey()Ljava/lang/Integer;
    .locals 1

    .line 120
    iget-object v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetKey(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .line 111
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->getKey()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .line 111
    invoke-virtual {p0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->getValue()Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Lnet/openvpn/ovpn3/DnsServer;
    .locals 1

    .line 124
    iget-object v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 111
    check-cast p1, Lnet/openvpn/ovpn3/DnsServer;

    invoke-virtual {p0, p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->setValue(Lnet/openvpn/ovpn3/DnsServer;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object p1

    return-object p1
.end method

.method public setValue(Lnet/openvpn/ovpn3/DnsServer;)Lnet/openvpn/ovpn3/DnsServer;
    .locals 2
    .param p1, "newValue"    # Lnet/openvpn/ovpn3/DnsServer;

    .line 128
    iget-object v0, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    invoke-static {v0}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$mgetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;)Lnet/openvpn/ovpn3/DnsServer;

    move-result-object v0

    .line 129
    .local v0, "oldValue":Lnet/openvpn/ovpn3/DnsServer;
    iget-object v1, p0, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$1;->iterator:Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;

    invoke-static {v1, p1}, Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;->-$$Nest$msetValue(Lnet/openvpn/ovpn3/DnsOptions_ServersMap$Iterator;Lnet/openvpn/ovpn3/DnsServer;)V

    .line 130
    return-object v0
.end method
