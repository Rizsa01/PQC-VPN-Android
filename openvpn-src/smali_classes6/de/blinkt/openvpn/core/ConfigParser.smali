.class public Lde/blinkt/openvpn/core/ConfigParser;
.super Ljava/lang/Object;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;,
        Lde/blinkt/openvpn/core/ConfigParser$linestate;
    }
.end annotation


# static fields
.field public static final CONVERTED_PROFILE:Ljava/lang/String; = "converted Profile"


# instance fields
.field private auth_user_pass_file:Ljava/lang/String;

.field private final connectionOptions:[Ljava/lang/String;

.field private connectionOptionsSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final ignoreOptions:[Ljava/lang/String;

.field private final ignoreOptionsWithArg:[[Ljava/lang/String;

.field private meta:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private options:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Vector<",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation
.end field

.field final unsupportedOptions:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 26

    .line 24
    move-object/from16 v0, p0

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "config"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "tls-server"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    iput-object v2, v0, Lde/blinkt/openvpn/core/ConfigParser;->unsupportedOptions:[Ljava/lang/String;

    .line 35
    const/16 v2, 0x34

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "tls-client"

    aput-object v3, v2, v4

    const-string v3, "allow-recursive-routing"

    aput-object v3, v2, v5

    const-string v3, "askpass"

    aput-object v3, v2, v1

    const-string v3, "auth-nocache"

    const/4 v6, 0x3

    aput-object v3, v2, v6

    const-string v3, "up"

    const/4 v7, 0x4

    aput-object v3, v2, v7

    const-string v3, "down"

    const/4 v8, 0x5

    aput-object v3, v2, v8

    const-string v3, "route-up"

    const/4 v9, 0x6

    aput-object v3, v2, v9

    const-string v3, "ipchange"

    const/4 v10, 0x7

    aput-object v3, v2, v10

    const-string v3, "route-pre-down"

    const/16 v11, 0x8

    aput-object v3, v2, v11

    const-string v3, "auth-user-pass-verify"

    const/16 v12, 0x9

    aput-object v3, v2, v12

    const-string v3, "block-outside-dns"

    const/16 v13, 0xa

    aput-object v3, v2, v13

    const-string v3, "client-cert-not-required"

    const/16 v14, 0xb

    aput-object v3, v2, v14

    const-string v3, "dhcp-release"

    const/16 v15, 0xc

    aput-object v3, v2, v15

    const-string v3, "dhcp-renew"

    const/16 v16, 0xd

    aput-object v3, v2, v16

    const-string v3, "dh"

    const/16 v17, 0xe

    aput-object v3, v2, v17

    const-string v3, "group"

    const/16 v18, 0xf

    aput-object v3, v2, v18

    const-string v3, "ip-win32"

    const/16 v19, 0x10

    aput-object v3, v2, v19

    const-string v3, "ifconfig-nowarn"

    const/16 v20, 0x11

    aput-object v3, v2, v20

    const-string v3, "management-hold"

    const/16 v21, 0x12

    aput-object v3, v2, v21

    const-string v3, "management"

    const/16 v22, 0x13

    aput-object v3, v2, v22

    const-string v3, "management-client"

    const/16 v23, 0x14

    aput-object v3, v2, v23

    const/16 v3, 0x15

    const-string v24, "management-query-remote"

    aput-object v24, v2, v3

    const/16 v3, 0x16

    const-string v24, "management-query-passwords"

    aput-object v24, v2, v3

    const/16 v3, 0x17

    const-string v24, "management-query-proxy"

    aput-object v24, v2, v3

    const/16 v3, 0x18

    const-string v24, "management-external-key"

    aput-object v24, v2, v3

    const/16 v3, 0x19

    const-string v24, "management-forget-disconnect"

    aput-object v24, v2, v3

    const/16 v3, 0x1a

    const-string v24, "management-signal"

    aput-object v24, v2, v3

    const/16 v3, 0x1b

    const-string v24, "management-log-cache"

    aput-object v24, v2, v3

    const/16 v3, 0x1c

    const-string v24, "management-up-down"

    aput-object v24, v2, v3

    const/16 v3, 0x1d

    const-string v24, "management-client-user"

    aput-object v24, v2, v3

    const/16 v3, 0x1e

    const-string v24, "management-client-group"

    aput-object v24, v2, v3

    const/16 v3, 0x1f

    const-string v24, "pause-exit"

    aput-object v24, v2, v3

    const/16 v3, 0x20

    const-string v24, "preresolve"

    aput-object v24, v2, v3

    const/16 v3, 0x21

    const-string v24, "plugin"

    aput-object v24, v2, v3

    const/16 v3, 0x22

    const-string v24, "machine-readable-output"

    aput-object v24, v2, v3

    const/16 v3, 0x23

    const-string v24, "persist-key"

    aput-object v24, v2, v3

    const/16 v3, 0x24

    const-string v24, "push"

    aput-object v24, v2, v3

    const/16 v3, 0x25

    const-string v24, "register-dns"

    aput-object v24, v2, v3

    const/16 v3, 0x26

    const-string v24, "route-delay"

    aput-object v24, v2, v3

    const/16 v3, 0x27

    const-string v24, "route-gateway"

    aput-object v24, v2, v3

    const/16 v3, 0x28

    const-string v24, "route-metric"

    aput-object v24, v2, v3

    const/16 v3, 0x29

    const-string v24, "route-method"

    aput-object v24, v2, v3

    const/16 v3, 0x2a

    const-string v24, "status"

    aput-object v24, v2, v3

    const/16 v3, 0x2b

    const-string v24, "script-security"

    aput-object v24, v2, v3

    const/16 v3, 0x2c

    const-string v24, "show-net-up"

    aput-object v24, v2, v3

    const/16 v3, 0x2d

    const-string v24, "suppress-timestamps"

    aput-object v24, v2, v3

    const/16 v3, 0x2e

    const-string v24, "tap-sleep"

    aput-object v24, v2, v3

    const/16 v3, 0x2f

    const-string v24, "tmp-dir"

    aput-object v24, v2, v3

    const/16 v3, 0x30

    const-string v24, "tun-ipv6"

    aput-object v24, v2, v3

    const/16 v3, 0x31

    const-string v24, "topology"

    aput-object v24, v2, v3

    const/16 v3, 0x32

    const-string v24, "user"

    aput-object v24, v2, v3

    const/16 v3, 0x33

    const-string v24, "win-sys"

    aput-object v24, v2, v3

    iput-object v2, v0, Lde/blinkt/openvpn/core/ConfigParser;->ignoreOptions:[Ljava/lang/String;

    .line 88
    new-array v2, v10, [[Ljava/lang/String;

    new-array v3, v1, [Ljava/lang/String;

    const-string v24, "setenv"

    aput-object v24, v3, v4

    const-string v25, "IV_GUI_VER"

    aput-object v25, v3, v5

    aput-object v3, v2, v4

    new-array v3, v1, [Ljava/lang/String;

    aput-object v24, v3, v4

    const-string v25, "IV_SSO"

    aput-object v25, v3, v5

    aput-object v3, v2, v5

    new-array v3, v1, [Ljava/lang/String;

    aput-object v24, v3, v4

    const-string v25, "IV_PLAT_VER"

    aput-object v25, v3, v5

    aput-object v3, v2, v1

    new-array v3, v1, [Ljava/lang/String;

    aput-object v24, v3, v4

    const-string v25, "IV_OPENVPN_GUI_VERSION"

    aput-object v25, v3, v5

    aput-object v3, v2, v6

    new-array v3, v1, [Ljava/lang/String;

    const-string v25, "engine"

    aput-object v25, v3, v4

    const-string v25, "dynamic"

    aput-object v25, v3, v5

    aput-object v3, v2, v7

    new-array v3, v1, [Ljava/lang/String;

    aput-object v24, v3, v4

    const-string v24, "CLIENT_CERT"

    aput-object v24, v3, v5

    aput-object v3, v2, v8

    new-array v3, v1, [Ljava/lang/String;

    const-string v24, "resolv-retry"

    aput-object v24, v3, v4

    const-string v24, "60"

    aput-object v24, v3, v5

    aput-object v3, v2, v9

    iput-object v2, v0, Lde/blinkt/openvpn/core/ConfigParser;->ignoreOptionsWithArg:[[Ljava/lang/String;

    .line 98
    const/16 v2, 0x19

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "local"

    aput-object v3, v2, v4

    const-string v3, "remote"

    aput-object v3, v2, v5

    const-string v3, "float"

    aput-object v3, v2, v1

    const-string v1, "port"

    aput-object v1, v2, v6

    const-string v1, "connect-retry"

    aput-object v1, v2, v7

    const-string v1, "connect-timeout"

    aput-object v1, v2, v8

    const-string v1, "connect-retry-max"

    aput-object v1, v2, v9

    const-string v1, "link-mtu"

    aput-object v1, v2, v10

    const-string v1, "tun-mtu"

    aput-object v1, v2, v11

    const-string v1, "tun-mtu-extra"

    aput-object v1, v2, v12

    const-string v1, "fragment"

    aput-object v1, v2, v13

    const-string v1, "mtu-disc"

    aput-object v1, v2, v14

    const-string v1, "local-port"

    aput-object v1, v2, v15

    const-string v1, "remote-port"

    aput-object v1, v2, v16

    const-string v1, "bind"

    aput-object v1, v2, v17

    const-string v1, "nobind"

    aput-object v1, v2, v18

    const-string v1, "proto"

    aput-object v1, v2, v19

    const-string v1, "http-proxy"

    aput-object v1, v2, v20

    const-string v1, "http-proxy-retry"

    aput-object v1, v2, v21

    const-string v1, "http-proxy-timeout"

    aput-object v1, v2, v22

    const-string v1, "http-proxy-option"

    aput-object v1, v2, v23

    const/16 v1, 0x15

    const-string v3, "socks-proxy"

    aput-object v3, v2, v1

    const/16 v1, 0x16

    const-string v3, "socks-proxy-retry"

    aput-object v3, v2, v1

    const/16 v1, 0x17

    const-string v3, "http-proxy-user-pass"

    aput-object v3, v2, v1

    const/16 v1, 0x18

    const-string v3, "explicit-exit-notify"

    aput-object v3, v2, v1

    iput-object v2, v0, Lde/blinkt/openvpn/core/ConfigParser;->connectionOptions:[Ljava/lang/String;

    .line 125
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, v0, Lde/blinkt/openvpn/core/ConfigParser;->connectionOptions:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lde/blinkt/openvpn/core/ConfigParser;->connectionOptionsSet:Ljava/util/HashSet;

    .line 127
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, v0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    .line 128
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, v0, Lde/blinkt/openvpn/core/ConfigParser;->meta:Ljava/util/HashMap;

    return-void
.end method

.method private checkIgnoreAndInvalidOptions(Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 6
    .param p1, "np"    # Lde/blinkt/openvpn/core/VpnProfile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 981
    iget-object v0, p0, Lde/blinkt/openvpn/core/ConfigParser;->unsupportedOptions:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 982
    .local v4, "option":Ljava/lang/String;
    iget-object v5, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 981
    .end local v4    # "option":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 983
    .restart local v4    # "option":Ljava/lang/String;
    :cond_0
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v1, "Unsupported Option %s encountered in config file. Aborting"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 985
    .end local v4    # "option":Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Lde/blinkt/openvpn/core/ConfigParser;->ignoreOptions:[Ljava/lang/String;

    array-length v1, v0

    :goto_1
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 987
    .local v3, "option":Ljava/lang/String;
    iget-object v4, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 985
    .end local v3    # "option":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 990
    :cond_2
    const/4 v0, 0x0

    .line 991
    .local v0, "customOptions":Z
    iget-object v1, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 993
    .local v2, "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Vector;

    .line 994
    .local v4, "optionsline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {p0, v4}, Lde/blinkt/openvpn/core/ConfigParser;->ignoreThisOption(Ljava/util/Vector;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 995
    const/4 v0, 0x1

    .line 997
    .end local v4    # "optionsline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3
    goto :goto_3

    .line 998
    .end local v2    # "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_4
    goto :goto_2

    .line 999
    :cond_5
    if-eqz v0, :cond_7

    .line 1000
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "# These options found in the config file do not map to config settings:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 1003
    iget-object v1, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 1005
    .restart local v2    # "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v2}, Lde/blinkt/openvpn/core/ConfigParser;->getOptionStrings(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p1, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    .line 1007
    .end local v2    # "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    goto :goto_4

    .line 1008
    :cond_6
    const/4 v1, 0x1

    iput-boolean v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mUseCustomConfig:Z

    .line 1011
    :cond_7
    return-void
.end method

.method private checkRedirectParameters(Lde/blinkt/openvpn/core/VpnProfile;Ljava/util/Vector;Z)V
    .locals 7
    .param p1, "np"    # Lde/blinkt/openvpn/core/VpnProfile;
    .param p3, "defaultRoute"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/blinkt/openvpn/core/VpnProfile;",
            "Ljava/util/Vector<",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;>;Z)V"
        }
    .end annotation

    .line 946
    .local p2, "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    const/4 v0, 0x0

    .line 947
    .local v0, "noIpv4":Z
    const/4 v1, 0x1

    if-eqz p3, :cond_5

    .line 949
    invoke-virtual {p2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Vector;

    .line 950
    .local v3, "redirect":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_1
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 951
    invoke-virtual {v3, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "block-local"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 952
    const/4 v5, 0x0

    iput-boolean v5, p1, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    goto :goto_2

    .line 953
    :cond_0
    invoke-virtual {v3, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "unblock-local"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 954
    iput-boolean v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mAllowLocalLAN:Z

    goto :goto_2

    .line 955
    :cond_1
    invoke-virtual {v3, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "!ipv4"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 956
    const/4 v0, 0x1

    goto :goto_2

    .line 957
    :cond_2
    invoke-virtual {v3, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "ipv6"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 958
    iput-boolean v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoutev6:Z

    .line 950
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v3    # "redirect":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v4    # "i":I
    :cond_4
    goto :goto_0

    .line 960
    :cond_5
    if-eqz p3, :cond_6

    if-nez v0, :cond_6

    .line 961
    iput-boolean v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mUseDefaultRoute:Z

    .line 962
    :cond_6
    return-void
.end method

.method private checkinlinefile(Ljava/util/Vector;Ljava/io/BufferedReader;)V
    .locals 9
    .param p2, "br"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/BufferedReader;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 216
    .local p1, "args":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "arg0":Ljava/lang/String;
    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 219
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 220
    .local v2, "argname":Ljava/lang/String;
    const-string v4, "[[INLINE]]"

    .line 222
    .local v4, "inlinefile":Ljava/lang/String;
    const-string v5, "</%s>"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 224
    .local v5, "endtag":Ljava/lang/String;
    :goto_0
    invoke-virtual {p2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 225
    .local v6, "line":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 228
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, "\n"

    if-eqz v7, :cond_1

    .line 229
    nop

    .line 236
    .end local v6    # "line":Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 237
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    invoke-virtual {v4, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 239
    :cond_0
    invoke-virtual {p1}, Ljava/util/Vector;->clear()V

    .line 240
    invoke-virtual {p1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 241
    invoke-virtual {p1, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 231
    .restart local v6    # "line":Ljava/lang/String;
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 232
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 234
    .end local v6    # "line":Ljava/lang/String;
    goto :goto_0

    .line 226
    .restart local v6    # "line":Ljava/lang/String;
    :cond_2
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v3, "No endtag </%s> for starttag <%s> found"

    filled-new-array {v2, v2}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v3, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 244
    .end local v2    # "argname":Ljava/lang/String;
    .end local v4    # "inlinefile":Ljava/lang/String;
    .end local v5    # "endtag":Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    :cond_3
    :goto_1
    return-void
.end method

.method private fixup(Lde/blinkt/openvpn/core/VpnProfile;)V
    .locals 2
    .param p1, "np"    # Lde/blinkt/openvpn/core/VpnProfile;

    .line 1051
    iget-object v0, p1, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    iget-object v1, p1, Lde/blinkt/openvpn/core/VpnProfile;->mServerName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1052
    const-string v0, ""

    iput-object v0, p1, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 1054
    :cond_0
    return-void
.end method

.method private getAllOption(Ljava/lang/String;II)Ljava/util/Vector;
    .locals 6
    .param p1, "option"    # Ljava/lang/String;
    .param p2, "minarg"    # I
    .param p3, "maxarg"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Ljava/util/Vector<",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 1065
    iget-object v0, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    .line 1066
    .local v0, "args":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-nez v0, :cond_0

    .line 1067
    const/4 v1, 0x0

    return-object v1

    .line 1069
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 1071
    .local v2, "optionline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v4, p2, 0x1

    if-lt v3, v4, :cond_1

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v4, p3, 0x1

    if-gt v3, v4, :cond_1

    .end local v2    # "optionline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_0

    .line 1072
    .restart local v2    # "optionline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 1073
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {p1, v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v3

    .line 1072
    const-string v4, "Option %s has %d parameters, expected between %d and %d"

    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1074
    .local v1, "err":Ljava/lang/String;
    new-instance v3, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    invoke-direct {v3, v1}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1076
    .end local v1    # "err":Ljava/lang/String;
    .end local v2    # "optionline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_2
    iget-object v1, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    return-object v0
.end method

.method private getOption(Ljava/lang/String;II)Ljava/util/Vector;
    .locals 2
    .param p1, "option"    # Ljava/lang/String;
    .param p2, "minarg"    # I
    .param p3, "maxarg"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 1057
    invoke-direct {p0, p1, p2, p3}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v0

    .line 1058
    .local v0, "alloptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-nez v0, :cond_0

    .line 1059
    const/4 v1, 0x0

    return-object v1

    .line 1061
    :cond_0
    invoke-virtual {v0}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Vector;

    return-object v1
.end method

.method private getOptionStrings(Ljava/util/Vector;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector<",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1033
    .local p1, "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    const-string v0, ""

    .line 1034
    .local v0, "custom":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 1035
    .local v2, "optionsline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {p0, v2}, Lde/blinkt/openvpn/core/ConfigParser;->ignoreThisOption(Ljava/util/Vector;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1037
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 1038
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "extra-certs"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1039
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v3, v5}, Lde/blinkt/openvpn/core/VpnProfile;->insertFileData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 1041
    :cond_0
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1042
    .local v4, "arg":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v4}, Lde/blinkt/openvpn/core/VpnProfile;->openVpnEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v4    # "arg":Ljava/lang/String;
    goto :goto_1

    .line 1043
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1046
    .end local v2    # "optionsline":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_2
    :goto_2
    goto/16 :goto_0

    .line 1047
    :cond_3
    return-object v0
.end method

.method private isUdpProto(Ljava/lang/String;)Z
    .locals 3
    .param p1, "proto"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 966
    const-string v0, "udp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "udp4"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "udp6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 968
    :cond_0
    const-string v0, "tcp-client"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 969
    const-string v0, "tcp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 970
    const-string v0, "tcp4"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 971
    const-string v0, "tcp4-client"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 972
    const-string v0, "tcp6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 973
    const-string v0, "tcp6-client"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 976
    :cond_1
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported option to --proto "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 974
    :cond_2
    :goto_0
    const/4 v0, 0x0

    .local v0, "isudp":Z
    goto :goto_2

    .line 967
    .end local v0    # "isudp":Z
    :cond_3
    :goto_1
    const/4 v0, 0x1

    .line 977
    .restart local v0    # "isudp":Z
    :goto_2
    return v0
.end method

.method private join(Ljava/lang/String;Ljava/util/Vector;)Ljava/lang/String;
    .locals 2
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 816
    .local p2, "str":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-le v0, v1, :cond_0

    .line 817
    invoke-static {p1, p2}, Lde/blinkt/openvpn/core/ConfigParser$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 819
    :cond_0
    invoke-static {p1, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parseConnection(Ljava/lang/String;Lde/blinkt/openvpn/core/Connection;)Landroidx/core/util/Pair;
    .locals 3
    .param p1, "connection"    # Ljava/lang/String;
    .param p2, "defaultValues"    # Lde/blinkt/openvpn/core/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lde/blinkt/openvpn/core/Connection;",
            ")",
            "Landroidx/core/util/Pair<",
            "Lde/blinkt/openvpn/core/Connection;",
            "[",
            "Lde/blinkt/openvpn/core/Connection;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 826
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/ConfigParser;-><init>()V

    .line 827
    .local v0, "connectionParser":Lde/blinkt/openvpn/core/ConfigParser;
    new-instance v1, Ljava/io/StringReader;

    const-string v2, "[[INLINE]]"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 828
    .local v1, "reader":Ljava/io/StringReader;
    invoke-virtual {v0, v1}, Lde/blinkt/openvpn/core/ConfigParser;->parseConfig(Ljava/io/Reader;)V

    .line 830
    invoke-direct {v0, p2}, Lde/blinkt/openvpn/core/ConfigParser;->parseConnectionOptions(Lde/blinkt/openvpn/core/Connection;)Landroidx/core/util/Pair;

    move-result-object v2

    .line 832
    .local v2, "conn":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    return-object v2
.end method

.method private parseConnectionOptions(Lde/blinkt/openvpn/core/Connection;)Landroidx/core/util/Pair;
    .locals 18
    .param p1, "connDefault"    # Lde/blinkt/openvpn/core/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/blinkt/openvpn/core/Connection;",
            ")",
            "Landroidx/core/util/Pair<",
            "Lde/blinkt/openvpn/core/Connection;",
            "[",
            "Lde/blinkt/openvpn/core/Connection;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 837
    move-object/from16 v1, p0

    if-eqz p1, :cond_0

    .line 839
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lde/blinkt/openvpn/core/Connection;->clone()Lde/blinkt/openvpn/core/Connection;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 843
    .local v0, "conn":Lde/blinkt/openvpn/core/Connection;
    move-object v2, v0

    goto :goto_0

    .line 840
    .end local v0    # "conn":Lde/blinkt/openvpn/core/Connection;
    :catch_0
    move-exception v0

    .line 841
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    .line 842
    const/4 v2, 0x0

    return-object v2

    .line 845
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :cond_0
    new-instance v0, Lde/blinkt/openvpn/core/Connection;

    invoke-direct {v0}, Lde/blinkt/openvpn/core/Connection;-><init>()V

    move-object v2, v0

    .line 847
    .local v2, "conn":Lde/blinkt/openvpn/core/Connection;
    :goto_0
    const-string v0, "port"

    const/4 v3, 0x1

    invoke-direct {v1, v0, v3, v3}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 848
    .local v4, "port":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_1

    .line 849
    invoke-virtual {v4, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 852
    :cond_1
    const-string v0, "rport"

    invoke-direct {v1, v0, v3, v3}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 853
    .local v5, "rport":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v5, :cond_2

    .line 854
    invoke-virtual {v5, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 857
    :cond_2
    const-string v0, "proto"

    invoke-direct {v1, v0, v3, v3}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v6

    .line 858
    .local v6, "proto":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v6, :cond_3

    .line 859
    invoke-virtual {v6, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lde/blinkt/openvpn/core/ConfigParser;->isUdpProto(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v2, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 862
    :cond_3
    const-string v0, "connect-timeout"

    invoke-direct {v1, v0, v3, v3}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 863
    .local v7, "connectTimeout":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v7, :cond_4

    .line 865
    :try_start_1
    invoke-virtual {v7, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v2, Lde/blinkt/openvpn/core/Connection;->mConnectTimeout:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 870
    goto :goto_1

    .line 866
    :catch_1
    move-exception v0

    .line 867
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    new-instance v8, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    .line 868
    invoke-virtual {v7, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v9

    filled-new-array {v3, v9}, [Ljava/lang/Object;

    move-result-object v3

    .line 867
    const-string v9, "Argument to connect-timeout (%s) must to be an integer: %s"

    invoke-static {v9, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v3}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v8

    .line 873
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    :cond_4
    :goto_1
    const-string v0, "socks-proxy"

    const/4 v8, 0x2

    invoke-direct {v1, v0, v3, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v9

    .line 874
    .local v9, "proxy":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-nez v9, :cond_5

    .line 875
    const-string v10, "http-proxy"

    invoke-direct {v1, v10, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v9

    .line 877
    :cond_5
    const/4 v10, 0x3

    if-eqz v9, :cond_7

    .line 878
    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 879
    sget-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->SOCKS5:Lde/blinkt/openvpn/core/Connection$ProxyType;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 881
    const-string v0, "1080"

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    goto :goto_2

    .line 883
    :cond_6
    sget-object v0, Lde/blinkt/openvpn/core/Connection$ProxyType;->HTTP:Lde/blinkt/openvpn/core/Connection$ProxyType;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mProxyType:Lde/blinkt/openvpn/core/Connection$ProxyType;

    .line 886
    :goto_2
    invoke-virtual {v9, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mProxyName:Ljava/lang/String;

    .line 887
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v0

    if-lt v0, v10, :cond_7

    .line 888
    invoke-virtual {v9, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lde/blinkt/openvpn/core/Connection;->mProxyPort:Ljava/lang/String;

    .line 891
    :cond_7
    const-string v0, "http-proxy-user-pass"

    invoke-direct {v1, v0, v3, v3}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v11

    .line 892
    .local v11, "httpproxyauthhttp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v11, :cond_8

    .line 893
    invoke-virtual {v11, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v0}, Lde/blinkt/openvpn/core/ConfigParser;->useEmbbedHttpAuth(Lde/blinkt/openvpn/core/Connection;Ljava/lang/String;)V

    .line 897
    :cond_8
    const-string v0, "remote"

    invoke-direct {v1, v0, v3, v10}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v0

    .line 901
    .local v0, "remotes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    new-instance v12, Ljava/util/Vector;

    invoke-direct {v12}, Ljava/util/Vector;-><init>()V

    .line 903
    .local v12, "optionsToRemove":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v13, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v13}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Map$Entry;

    .line 904
    .local v14, "option":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;>;"
    if-nez p1, :cond_9

    iget-object v15, v1, Lde/blinkt/openvpn/core/ConfigParser;->connectionOptionsSet:Ljava/util/HashSet;

    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 905
    :cond_9
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v2, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Vector;

    invoke-direct {v1, v15}, Lde/blinkt/openvpn/core/ConfigParser;->getOptionStrings(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v2, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    .line 906
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v12, v8}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 908
    .end local v14    # "option":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;>;"
    :cond_a
    const/4 v8, 0x2

    goto :goto_3

    .line 909
    :cond_b
    invoke-virtual {v12}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 910
    .local v13, "o":Ljava/lang/String;
    iget-object v14, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v14, v13}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 912
    .end local v13    # "o":Ljava/lang/String;
    :cond_c
    iget-object v8, v2, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    if-eqz v8, :cond_d

    iget-object v8, v2, Lde/blinkt/openvpn/core/Connection;->mCustomConfiguration:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    const-string v13, ""

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_d

    .line 913
    iput-boolean v3, v2, Lde/blinkt/openvpn/core/Connection;->mUseCustomConfig:Z

    .line 916
    :cond_d
    if-nez v0, :cond_e

    .line 917
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    move-object v0, v8

    goto :goto_5

    .line 916
    :cond_e
    move-object v8, v0

    .line 919
    .end local v0    # "remotes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v8, "remotes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :goto_5
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v0

    new-array v13, v0, [Lde/blinkt/openvpn/core/Connection;

    .line 922
    .local v13, "connections":[Lde/blinkt/openvpn/core/Connection;
    const/4 v0, 0x0

    .line 923
    .local v0, "i":I
    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    move v15, v0

    .end local v0    # "i":I
    .local v15, "i":I
    :goto_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/util/Vector;

    .line 925
    .local v3, "remote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :try_start_2
    invoke-virtual {v2}, Lde/blinkt/openvpn/core/Connection;->clone()Lde/blinkt/openvpn/core/Connection;

    move-result-object v0

    aput-object v0, v13, v15
    :try_end_2
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 928
    goto :goto_7

    .line 926
    :catch_2
    move-exception v0

    .line 927
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    .line 929
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :goto_7
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_8

    .line 931
    :pswitch_0
    aget-object v0, v13, v15

    invoke-virtual {v3, v10}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v10, v17

    check-cast v10, Ljava/lang/String;

    invoke-direct {v1, v10}, Lde/blinkt/openvpn/core/ConfigParser;->isUdpProto(Ljava/lang/String;)Z

    move-result v10

    iput-boolean v10, v0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    .line 933
    :pswitch_1
    aget-object v0, v13, v15

    const/4 v10, 0x2

    invoke-virtual {v3, v10}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v10, v16

    check-cast v10, Ljava/lang/String;

    iput-object v10, v0, Lde/blinkt/openvpn/core/Connection;->mServerPort:Ljava/lang/String;

    .line 935
    :pswitch_2
    aget-object v0, v13, v15

    const/4 v10, 0x1

    invoke-virtual {v3, v10}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v10, v16

    check-cast v10, Ljava/lang/String;

    iput-object v10, v0, Lde/blinkt/openvpn/core/Connection;->mServerName:Ljava/lang/String;

    .line 937
    :goto_8
    nop

    .end local v3    # "remote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    add-int/lit8 v15, v15, 0x1

    .line 938
    const/4 v3, 0x1

    const/4 v10, 0x3

    goto :goto_6

    .line 940
    :cond_f
    invoke-static {v2, v13}, Landroidx/core/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroidx/core/util/Pair;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseline(Ljava/lang/String;)Ljava/util/Vector;
    .locals 11
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 259
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 261
    .local v0, "parameters":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 262
    return-object v0

    .line 265
    :cond_0
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    .line 266
    .local v1, "state":Lde/blinkt/openvpn/core/ConfigParser$linestate;
    const/4 v2, 0x0

    .line 267
    .local v2, "backslash":Z
    const/4 v3, 0x0

    .line 269
    .local v3, "out":C
    const/4 v4, 0x0

    .line 270
    .local v4, "pos":I
    const-string v5, ""

    .line 275
    .local v5, "currentarg":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 276
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .local v6, "in":C
    goto :goto_1

    .line 278
    .end local v6    # "in":C
    :cond_1
    const/4 v6, 0x0

    .line 280
    .restart local v6    # "in":C
    :goto_1
    const/16 v7, 0x5c

    if-nez v2, :cond_2

    if-ne v6, v7, :cond_2

    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    if-eq v1, v8, :cond_2

    .line 281
    const/4 v2, 0x1

    goto/16 :goto_4

    .line 283
    :cond_2
    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    const/16 v9, 0x27

    const/16 v10, 0x22

    if-ne v1, v8, :cond_6

    .line 284
    invoke-direct {p0, v6}, Lde/blinkt/openvpn/core/ConfigParser;->space(C)Z

    move-result v8

    if-nez v8, :cond_c

    .line 285
    const/16 v8, 0x3b

    if-eq v6, v8, :cond_11

    const/16 v8, 0x23

    if-ne v6, v8, :cond_3

    .line 286
    goto/16 :goto_5

    .line 287
    :cond_3
    if-nez v2, :cond_4

    if-ne v6, v10, :cond_4

    .line 288
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_quoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 289
    :cond_4
    if-nez v2, :cond_5

    if-ne v6, v9, :cond_5

    .line 290
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 292
    :cond_5
    move v3, v6

    .line 293
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_unquoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 296
    :cond_6
    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_unquoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    if-ne v1, v8, :cond_8

    .line 297
    if-nez v2, :cond_7

    invoke-direct {p0, v6}, Lde/blinkt/openvpn/core/ConfigParser;->space(C)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 298
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 300
    :cond_7
    move v3, v6

    goto :goto_2

    .line 301
    :cond_8
    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->reading_quoted:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    if-ne v1, v8, :cond_a

    .line 302
    if-nez v2, :cond_9

    if-ne v6, v10, :cond_9

    .line 303
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 305
    :cond_9
    move v3, v6

    goto :goto_2

    .line 306
    :cond_a
    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->readin_single_quote:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    if-ne v1, v8, :cond_c

    .line 307
    if-ne v6, v9, :cond_b

    .line 308
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    goto :goto_2

    .line 310
    :cond_b
    move v3, v6

    .line 313
    :cond_c
    :goto_2
    sget-object v8, Lde/blinkt/openvpn/core/ConfigParser$linestate;->done:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    if-ne v1, v8, :cond_d

    .line 315
    sget-object v1, Lde/blinkt/openvpn/core/ConfigParser$linestate;->initial:Lde/blinkt/openvpn/core/ConfigParser$linestate;

    .line 316
    invoke-virtual {v0, v5}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 317
    const-string v5, ""

    .line 318
    const/4 v3, 0x0

    .line 321
    :cond_d
    if-eqz v2, :cond_f

    if-eqz v3, :cond_f

    .line 322
    if-eq v3, v7, :cond_f

    if-eq v3, v10, :cond_f

    invoke-direct {p0, v3}, Lde/blinkt/openvpn/core/ConfigParser;->space(C)Z

    move-result v7

    if-eqz v7, :cond_e

    goto :goto_3

    .line 323
    :cond_e
    new-instance v7, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v8, "Options warning: Bad backslash (\'\\\') usage"

    invoke-direct {v7, v8}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 326
    :cond_f
    :goto_3
    const/4 v2, 0x0

    .line 330
    :goto_4
    if-eqz v3, :cond_10

    .line 331
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 333
    .end local v6    # "in":C
    :cond_10
    add-int/lit8 v6, v4, 0x1

    .end local v4    # "pos":I
    .local v6, "pos":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v4, v7, :cond_12

    move v4, v6

    .line 335
    .end local v6    # "pos":I
    .restart local v4    # "pos":I
    :cond_11
    :goto_5
    return-object v0

    .line 333
    .end local v4    # "pos":I
    .restart local v6    # "pos":I
    :cond_12
    move v4, v6

    goto/16 :goto_0
.end method

.method private parsemeta(Ljava/lang/String;)Ljava/util/Vector;
    .locals 3
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 207
    const-string v0, "#\\sOVPN_ACCESS_SERVER_"

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    .line 208
    .local v0, "meta":Ljava/lang/String;
    const-string v2, "="

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 209
    .local v1, "parts":[Ljava/lang/String;
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 210
    .local v2, "rval":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-static {v2, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 211
    return-object v2
.end method

.method private space(C)Z
    .locals 1
    .param p1, "c"    # C

    .line 253
    invoke-static {p1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static useEmbbedHttpAuth(Lde/blinkt/openvpn/core/Connection;Ljava/lang/String;)V
    .locals 4
    .param p0, "c"    # Lde/blinkt/openvpn/core/Connection;
    .param p1, "inlinedata"    # Ljava/lang/String;

    .line 141
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "data":Ljava/lang/String;
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "parts":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    .line 144
    const/4 v2, 0x0

    aget-object v2, v1, v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthUser:Ljava/lang/String;

    .line 145
    const/4 v2, 0x1

    aget-object v3, v1, v2

    iput-object v3, p0, Lde/blinkt/openvpn/core/Connection;->mProxyAuthPassword:Ljava/lang/String;

    .line 146
    iput-boolean v2, p0, Lde/blinkt/openvpn/core/Connection;->mUseProxyAuth:Z

    .line 148
    :cond_0
    return-void
.end method

.method public static useEmbbedUserAuth(Lde/blinkt/openvpn/core/VpnProfile;Ljava/lang/String;)V
    .locals 4
    .param p0, "np"    # Lde/blinkt/openvpn/core/VpnProfile;
    .param p1, "inlinedata"    # Ljava/lang/String;

    .line 132
    invoke-static {p1}, Lde/blinkt/openvpn/core/VpnProfile;->getEmbeddedContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "data":Ljava/lang/String;
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "parts":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    .line 135
    const/4 v2, 0x0

    aget-object v2, v1, v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 136
    const/4 v2, 0x1

    aget-object v2, v1, v2

    iput-object v2, p0, Lde/blinkt/openvpn/core/VpnProfile;->mPassword:Ljava/lang/String;

    .line 138
    :cond_0
    return-void
.end method


# virtual methods
.method public convertProfile()Lde/blinkt/openvpn/core/VpnProfile;
    .locals 56
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 341
    move-object/from16 v1, p0

    const-string v2, "Could not parse netmask of route "

    const/4 v0, 0x1

    .line 342
    .local v0, "noauthtypeset":Z
    new-instance v3, Lde/blinkt/openvpn/core/VpnProfile;

    const-string v4, "converted Profile"

    invoke-direct {v3, v4}, Lde/blinkt/openvpn/core/VpnProfile;-><init>(Ljava/lang/String;)V

    .line 344
    .local v3, "np":Lde/blinkt/openvpn/core/VpnProfile;
    invoke-virtual {v3}, Lde/blinkt/openvpn/core/VpnProfile;->clearDefaults()V

    .line 346
    iget-object v4, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    const-string v5, "client"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    const-string v6, "pull"

    const/4 v7, 0x1

    if-nez v4, :cond_0

    iget-object v4, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 347
    :cond_0
    iput-boolean v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUsePull:Z

    .line 348
    iget-object v4, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    iget-object v4, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    :cond_1
    const-string v4, "secret"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v7, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 353
    .local v4, "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v6, 0x4

    const/4 v8, 0x3

    if-eqz v4, :cond_3

    .line 354
    iput v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 355
    const/4 v0, 0x0

    .line 356
    iput-boolean v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 357
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iput-object v9, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthFilename:Ljava/lang/String;

    .line 358
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v9

    if-ne v9, v8, :cond_2

    .line 359
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iput-object v9, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 363
    :cond_2
    move v9, v0

    goto :goto_0

    .line 353
    :cond_3
    move v9, v0

    .line 363
    .end local v0    # "noauthtypeset":Z
    .local v9, "noauthtypeset":Z
    :goto_0
    const-string v0, "route"

    invoke-direct {v1, v0, v7, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v10

    .line 364
    .local v10, "routes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    const-string v0, " "

    if-eqz v10, :cond_8

    .line 365
    const-string v11, ""

    .line 366
    .local v11, "routeopt":Ljava/lang/String;
    const-string v12, ""

    .line 367
    .local v12, "routeExcluded":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_7

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Vector;

    .line 368
    .local v14, "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v15, "255.255.255.255"

    .line 369
    .local v15, "netmask":Ljava/lang/String;
    const-string v16, "vpn_gateway"

    .line 371
    .local v16, "gateway":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/util/Vector;->size()I

    move-result v7

    if-lt v7, v8, :cond_4

    .line 372
    invoke-virtual {v14, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Ljava/lang/String;

    .line 373
    :cond_4
    invoke-virtual {v14}, Ljava/util/Vector;->size()I

    move-result v7

    if-lt v7, v6, :cond_5

    .line 374
    invoke-virtual {v14, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v16, v7

    check-cast v16, Ljava/lang/String;

    move-object/from16 v7, v16

    goto :goto_2

    .line 373
    :cond_5
    move-object/from16 v7, v16

    .line 376
    .end local v16    # "gateway":Ljava/lang/String;
    .local v7, "gateway":Ljava/lang/String;
    :goto_2
    const/4 v8, 0x1

    invoke-virtual {v14, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v8, v18

    check-cast v8, Ljava/lang/String;

    .line 378
    .local v8, "net":Ljava/lang/String;
    :try_start_0
    new-instance v5, Lde/blinkt/openvpn/core/CIDRIP;

    invoke-direct {v5, v8, v15}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .local v5, "cidr":Lde/blinkt/openvpn/core/CIDRIP;
    const-string v6, "net_gateway"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 380
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_2

    move-object/from16 v20, v4

    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v20, "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :try_start_1
    invoke-virtual {v5}, Lde/blinkt/openvpn/core/CIDRIP;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v12, v4

    .end local v12    # "routeExcluded":Ljava/lang/String;
    .local v4, "routeExcluded":Ljava/lang/String;
    goto :goto_3

    .line 382
    .end local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v4, "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v12    # "routeExcluded":Ljava/lang/String;
    :cond_6
    move-object/from16 v20, v4

    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v5}, Lde/blinkt/openvpn/core/CIDRIP;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-object v11, v4

    .line 389
    .end local v5    # "cidr":Lde/blinkt/openvpn/core/CIDRIP;
    :goto_3
    nop

    .line 391
    .end local v7    # "gateway":Ljava/lang/String;
    .end local v8    # "net":Ljava/lang/String;
    .end local v14    # "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v15    # "netmask":Ljava/lang/String;
    move-object/from16 v4, v20

    const/4 v5, 0x2

    const/4 v6, 0x4

    const/4 v7, 0x1

    const/4 v8, 0x3

    goto/16 :goto_1

    .line 385
    .restart local v7    # "gateway":Ljava/lang/String;
    .restart local v8    # "net":Ljava/lang/String;
    .restart local v14    # "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v15    # "netmask":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_4

    .line 383
    :catch_1
    move-exception v0

    goto :goto_5

    .line 385
    .end local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catch_2
    move-exception v0

    move-object/from16 v20, v4

    .line 388
    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v0, "ne":Ljava/lang/NumberFormatException;
    .restart local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_4
    new-instance v4, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 383
    .end local v0    # "ne":Ljava/lang/NumberFormatException;
    .end local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catch_3
    move-exception v0

    move-object/from16 v20, v4

    .line 384
    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v0, "aioob":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_5
    new-instance v4, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 392
    .end local v0    # "aioob":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v7    # "gateway":Ljava/lang/String;
    .end local v8    # "net":Ljava/lang/String;
    .end local v14    # "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v15    # "netmask":Ljava/lang/String;
    .end local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_7
    move-object/from16 v20, v4

    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iput-object v11, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutes:Ljava/lang/String;

    .line 393
    iput-object v12, v3, Lde/blinkt/openvpn/core/VpnProfile;->mExcludedRoutes:Ljava/lang/String;

    goto :goto_6

    .line 364
    .end local v11    # "routeopt":Ljava/lang/String;
    .end local v12    # "routeExcluded":Ljava/lang/String;
    .end local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_8
    move-object/from16 v20, v4

    .line 396
    .end local v4    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v20    # "secret":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_6
    const-string v2, "route-ipv6"

    const/4 v4, 0x4

    const/4 v8, 0x1

    invoke-direct {v1, v2, v8, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 397
    .local v2, "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v2, :cond_a

    .line 398
    const-string v4, ""

    .line 399
    .local v4, "customIPv6Routes":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Vector;

    .line 400
    .local v6, "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 401
    .end local v6    # "route":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_7

    .line 403
    :cond_9
    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCustomRoutesv6:Ljava/lang/String;

    .line 406
    .end local v4    # "customIPv6Routes":Ljava/lang/String;
    :cond_a
    const-string v4, "route-nopull"

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 407
    .local v4, "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_b

    .line 408
    const/4 v8, 0x1

    iput-boolean v8, v3, Lde/blinkt/openvpn/core/VpnProfile;->mRoutenopull:Z

    goto :goto_8

    .line 407
    :cond_b
    const/4 v8, 0x1

    .line 411
    :goto_8
    const-string v6, "tls-auth"

    const/4 v7, 0x2

    invoke-direct {v1, v6, v8, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v6

    .line 412
    .local v6, "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v6, :cond_e

    .line 413
    invoke-virtual {v6}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_9
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Vector;

    .line 414
    .local v8, "tlsauth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v8, :cond_d

    .line 415
    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    const-string v13, "[inline]"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_c

    .line 416
    invoke-virtual {v8, v11}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    iput-object v12, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthFilename:Ljava/lang/String;

    .line 417
    iput-boolean v11, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 419
    :cond_c
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v11

    const/4 v12, 0x3

    if-ne v11, v12, :cond_d

    .line 420
    const/4 v11, 0x2

    invoke-virtual {v8, v11}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    iput-object v12, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 422
    .end local v8    # "tlsauth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_d
    goto :goto_9

    .line 425
    :cond_e
    const-string v7, "key-direction"

    const/4 v8, 0x1

    invoke-direct {v1, v7, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 426
    .local v7, "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v7, :cond_f

    .line 427
    invoke-virtual {v7, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    iput-object v11, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 429
    :cond_f
    const/4 v11, 0x2

    new-array v12, v11, [Ljava/lang/String;

    const-string v13, "tls-crypt"

    aput-object v13, v12, v5

    const-string v13, "tls-crypt-v2"

    aput-object v13, v12, v8

    move v13, v5

    :goto_a
    if-ge v13, v11, :cond_11

    aget-object v11, v12, v13

    .line 430
    .local v11, "crypt":Ljava/lang/String;
    invoke-direct {v1, v11, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v14

    .line 431
    .local v14, "tlscrypt":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v14, :cond_10

    .line 432
    iput-boolean v8, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseTLSAuth:Z

    .line 433
    invoke-virtual {v14, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    iput-object v15, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthFilename:Ljava/lang/String;

    .line 434
    iput-object v11, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTLSAuthDirection:Ljava/lang/String;

    .line 429
    .end local v11    # "crypt":Ljava/lang/String;
    .end local v14    # "tlscrypt":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_10
    add-int/lit8 v13, v13, 0x1

    const/4 v8, 0x1

    const/4 v11, 0x2

    goto :goto_a

    .line 438
    :cond_11
    const-string v8, "redirect-gateway"

    const/4 v11, 0x7

    invoke-direct {v1, v8, v5, v11}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v8

    .line 439
    .local v8, "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v8, :cond_12

    .line 440
    const/4 v12, 0x1

    invoke-direct {v1, v3, v8, v12}, Lde/blinkt/openvpn/core/ConfigParser;->checkRedirectParameters(Lde/blinkt/openvpn/core/VpnProfile;Ljava/util/Vector;Z)V

    .line 443
    :cond_12
    const-string v12, "redirect-private"

    const/4 v13, 0x5

    invoke-direct {v1, v12, v5, v13}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v12

    .line 444
    .local v12, "redirectPrivate":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v12, :cond_13

    .line 445
    invoke-direct {v1, v3, v12, v5}, Lde/blinkt/openvpn/core/ConfigParser;->checkRedirectParameters(Lde/blinkt/openvpn/core/VpnProfile;Ljava/util/Vector;Z)V

    .line 447
    :cond_13
    const-string v14, "dev"

    const/4 v15, 0x1

    invoke-direct {v1, v14, v15, v15}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v14

    .line 448
    .local v14, "dev":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v11, "dev-type"

    invoke-direct {v1, v11, v15, v15}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v11

    .line 450
    .local v11, "devtype":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v13, "tun"

    if-eqz v11, :cond_14

    invoke-virtual {v11, v15}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v15, v23

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_16

    :cond_14
    if-eqz v14, :cond_15

    .line 451
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v15, v23

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_16

    :cond_15
    if-nez v11, :cond_69

    if-nez v14, :cond_69

    .line 458
    :cond_16
    const-string v13, "mssfix"

    const/4 v15, 0x2

    invoke-direct {v1, v13, v5, v15}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v13

    .line 460
    .local v13, "mssfix":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v13, :cond_19

    .line 461
    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v5

    if-lt v5, v15, :cond_17

    .line 463
    const/4 v15, 0x1

    :try_start_2
    invoke-virtual {v13, v15}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_4

    .line 466
    goto :goto_b

    .line 464
    :catch_4
    move-exception v0

    .line 465
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v15, "Argument to --mssfix has to be an integer"

    invoke-direct {v5, v15}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 468
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_17
    const/16 v5, 0x5aa

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mMssFix:I

    .line 471
    :goto_b
    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v5

    const/4 v15, 0x3

    if-lt v5, v15, :cond_19

    const/4 v15, 0x2

    invoke-virtual {v13, v15}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v15, "mtu"

    invoke-virtual {v5, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    goto :goto_c

    .line 472
    :cond_18
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v5, "Second argument to --mssfix unkonwn"

    invoke-direct {v0, v5}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 477
    :cond_19
    :goto_c
    const-string v5, "tun-mtu"

    const/4 v15, 0x1

    invoke-direct {v1, v5, v15, v15}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 479
    .local v5, "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v5, :cond_1a

    .line 481
    :try_start_3
    invoke-virtual {v5, v15}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    iput v15, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTunMtu:I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_5

    .line 484
    goto :goto_d

    .line 482
    :catch_5
    move-exception v0

    .line 483
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    new-instance v15, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    move-object/from16 v16, v0

    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .local v16, "e":Ljava/lang/NumberFormatException;
    const-string v0, "Argument to --tun-mtu has to be an integer"

    invoke-direct {v15, v0}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v15

    .line 488
    .end local v16    # "e":Ljava/lang/NumberFormatException;
    :cond_1a
    :goto_d
    const-string v15, "mode"

    move-object/from16 v24, v2

    const/4 v2, 0x1

    .end local v2    # "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v24, "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    invoke-direct {v1, v15, v2, v2}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v15

    .line 489
    .local v15, "mode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v15, :cond_1c

    .line 490
    invoke-virtual {v15, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v25

    move-object/from16 v2, v25

    check-cast v2, Ljava/lang/String;

    move-object/from16 v25, v4

    .end local v4    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v25, "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v4, "p2p"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    goto :goto_e

    .line 491
    :cond_1b
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v2, "Invalid mode for --mode specified, need p2p"

    invoke-direct {v0, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 489
    .end local v25    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_1c
    move-object/from16 v25, v4

    .line 495
    .end local v4    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v25    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_e
    const-string v2, "dhcp-option"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 496
    .local v2, "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v2, :cond_21

    .line 497
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_20

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    move-object/from16 v27, v2

    .end local v2    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v27, "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    move-object/from16 v2, v26

    check-cast v2, Ljava/util/Vector;

    .line 498
    .local v2, "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    move-object/from16 v26, v4

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v28

    move-object/from16 v4, v28

    check-cast v4, Ljava/lang/String;

    .line 499
    .local v4, "type":Ljava/lang/String;
    move-object/from16 v28, v5

    const/4 v5, 0x2

    .end local v5    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v28, "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v2, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v5, v18

    check-cast v5, Ljava/lang/String;

    .line 500
    .local v5, "arg":Ljava/lang/String;
    move-object/from16 v30, v6

    .end local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v30, "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    const-string v6, "DOMAIN"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 501
    const/4 v6, 0x2

    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v29

    move-object/from16 v6, v29

    check-cast v6, Ljava/lang/String;

    iput-object v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mSearchDomain:Ljava/lang/String;

    goto :goto_10

    .line 502
    :cond_1d
    const-string v6, "DNS"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 503
    const/4 v6, 0x1

    iput-boolean v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mOverrideDNS:Z

    .line 504
    iget-object v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    move-object/from16 v29, v2

    .end local v2    # "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v29, "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    sget-object v2, Lde/blinkt/openvpn/core/VpnProfile;->DEFAULT_DNS1:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 505
    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDNS1:Ljava/lang/String;

    .line 506
    const-string v2, ""

    iput-object v2, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    goto :goto_10

    .line 509
    :cond_1e
    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDNS2:Ljava/lang/String;

    goto :goto_10

    .line 502
    .end local v29    # "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v2    # "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_1f
    move-object/from16 v29, v2

    .line 511
    .end local v2    # "dhcpoption":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v4    # "type":Ljava/lang/String;
    .end local v5    # "arg":Ljava/lang/String;
    :goto_10
    move-object/from16 v4, v26

    move-object/from16 v2, v27

    move-object/from16 v5, v28

    move-object/from16 v6, v30

    goto :goto_f

    .line 497
    .end local v27    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v28    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v2, "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v5, "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_20
    move-object/from16 v27, v2

    move-object/from16 v28, v5

    move-object/from16 v30, v6

    .end local v2    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v5    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v27    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v28    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    goto :goto_11

    .line 496
    .end local v27    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v28    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v2    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v5    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_21
    move-object/from16 v27, v2

    move-object/from16 v28, v5

    move-object/from16 v30, v6

    .line 514
    .end local v2    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v5    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v27    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v28    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :goto_11
    const-string v2, "ifconfig"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 515
    .local v2, "ifconfig":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v2, :cond_22

    .line 517
    :try_start_4
    new-instance v4, Lde/blinkt/openvpn/core/CIDRIP;

    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v6, 0x2

    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v26

    move-object/from16 v6, v26

    check-cast v6, Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Lde/blinkt/openvpn/core/CIDRIP;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    .local v4, "cidr":Lde/blinkt/openvpn/core/CIDRIP;
    invoke-virtual {v4}, Lde/blinkt/openvpn/core/CIDRIP;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mIPv4Address:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_6

    .line 521
    .end local v4    # "cidr":Lde/blinkt/openvpn/core/CIDRIP;
    goto :goto_12

    .line 519
    :catch_6
    move-exception v0

    .line 520
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    new-instance v4, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not pase ifconfig IP address: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 525
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    :cond_22
    :goto_12
    const-string v4, "remote-random-hostname"

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_23

    .line 526
    const/4 v6, 0x1

    iput-boolean v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseRandomHostname:Z

    goto :goto_13

    .line 525
    :cond_23
    const/4 v6, 0x1

    .line 528
    :goto_13
    const-string v4, "float"

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_24

    .line 529
    iput-boolean v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseFloat:Z

    .line 531
    :cond_24
    const-string v4, "comp-lzo"

    invoke-direct {v1, v4, v5, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_25

    .line 532
    iput-boolean v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseLzo:Z

    .line 534
    :cond_25
    const-string v4, "ncp-ciphers"

    invoke-direct {v1, v4, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 535
    .local v4, "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v5, "data-ciphers"

    invoke-direct {v1, v5, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 536
    .local v5, "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    move-object/from16 v26, v2

    .end local v2    # "ifconfig":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v26, "ifconfig":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v2, "cipher"

    invoke-direct {v1, v2, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 538
    .local v2, "cipher":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v2, :cond_26

    .line 539
    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v6, v17

    check-cast v6, Ljava/lang/String;

    iput-object v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCipher:Ljava/lang/String;

    .line 541
    :cond_26
    if-eqz v5, :cond_27

    .line 543
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v6, v17

    check-cast v6, Ljava/lang/String;

    iput-object v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    goto :goto_14

    .line 545
    :cond_27
    if-eqz v4, :cond_28

    .line 547
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v6, v17

    check-cast v6, Ljava/lang/String;

    iput-object v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mDataCiphers:Ljava/lang/String;

    .line 549
    :cond_28
    :goto_14
    const-string v6, "tls-cert-profile"

    move-object/from16 v31, v2

    const/4 v2, 0x1

    .end local v2    # "cipher":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v31, "cipher":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v6, v2, v2}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v6

    .line 550
    .local v6, "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v2, "legacy"

    if-eqz v6, :cond_2c

    .line 552
    move-object/from16 v29, v4

    const/4 v4, 0x1

    .end local v4    # "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v29, "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v6, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move/from16 v32, v4

    move-object/from16 v4, v17

    check-cast v4, Ljava/lang/String;

    .line 553
    .local v4, "profile":Ljava/lang/String;
    move-object/from16 v33, v5

    move-object/from16 v34, v6

    const/4 v5, 0x4

    .end local v5    # "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v6    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v33, "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v34, "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-array v6, v5, [Ljava/lang/String;

    const-string v17, "insecure"

    const/16 v23, 0x0

    aput-object v17, v6, v23

    const-string v17, "preferred"

    aput-object v17, v6, v32

    const/16 v18, 0x2

    aput-object v2, v6, v18

    const-string v19, "suiteb"

    const/16 v16, 0x3

    aput-object v19, v6, v16

    move-object/from16 v32, v6

    const/4 v6, 0x0

    :goto_15
    if-ge v6, v5, :cond_2a

    aget-object v5, v32, v6

    .line 554
    .local v5, "choice":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-eqz v35, :cond_29

    .line 555
    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    .line 556
    goto :goto_16

    .line 553
    .end local v5    # "choice":Ljava/lang/String;
    :cond_29
    add-int/lit8 v6, v6, 0x1

    const/4 v5, 0x4

    goto :goto_15

    .line 559
    :cond_2a
    :goto_16
    iget-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mTlSCertProfile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2b

    goto :goto_17

    .line 561
    :cond_2b
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid tls-cert-profile \'"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\'"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 550
    .end local v29    # "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v33    # "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v34    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v4, "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v5, "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v6    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_2c
    move-object/from16 v29, v4

    move-object/from16 v33, v5

    move-object/from16 v34, v6

    .line 565
    .end local v4    # "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v5    # "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v6    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v29    # "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v33    # "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v34    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_17
    const-string v4, "provider"

    const/16 v5, 0x9

    const/4 v6, 0x1

    invoke-direct {v1, v4, v6, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 566
    .local v4, "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_31

    .line 568
    invoke-virtual {v4, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    .line 569
    .local v5, "providers":Ljava/lang/String;
    const-string v6, "legacy:default"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2d

    const-string v6, "default:legacy"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 570
    :cond_2d
    const/4 v6, 0x1

    iput-boolean v6, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 572
    :cond_2e
    invoke-virtual {v4}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_18
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_30

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    move-object/from16 v35, v4

    .end local v4    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v35, "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    move-object/from16 v4, v32

    check-cast v4, Ljava/lang/String;

    .line 574
    .local v4, "prov":Ljava/lang/String;
    move-object/from16 v32, v5

    .end local v5    # "providers":Ljava/lang/String;
    .local v32, "providers":Ljava/lang/String;
    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 576
    const/4 v5, 0x1

    iput-boolean v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUseLegacyProvider:Z

    .line 578
    .end local v4    # "prov":Ljava/lang/String;
    :cond_2f
    move-object/from16 v5, v32

    move-object/from16 v4, v35

    goto :goto_18

    .line 572
    .end local v32    # "providers":Ljava/lang/String;
    .end local v35    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v4, "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v5    # "providers":Ljava/lang/String;
    :cond_30
    move-object/from16 v35, v4

    move-object/from16 v32, v5

    .end local v4    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v5    # "providers":Ljava/lang/String;
    .restart local v32    # "providers":Ljava/lang/String;
    .restart local v35    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_19

    .line 566
    .end local v32    # "providers":Ljava/lang/String;
    .end local v35    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_31
    move-object/from16 v35, v4

    .line 582
    .end local v4    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v35    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_19
    const-string v2, "compat-mode"

    const/4 v6, 0x1

    invoke-direct {v1, v2, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 583
    .local v2, "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v2, :cond_32

    .line 585
    new-instance v4, Ljava/util/Scanner;

    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 586
    .local v4, "versionScanner":Ljava/util/Scanner;
    const-string v5, "\\."

    invoke-virtual {v4, v5}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 587
    invoke-virtual {v4}, Ljava/util/Scanner;->nextInt()I

    move-result v5

    .line 588
    .local v5, "major":I
    invoke-virtual {v4}, Ljava/util/Scanner;->nextInt()I

    move-result v6

    .line 589
    .local v6, "minor":I
    invoke-virtual {v4}, Ljava/util/Scanner;->nextInt()I

    move-result v32

    .line 591
    .local v32, "patch":I
    move-object/from16 v36, v2

    .end local v2    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v36, "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    mul-int/lit16 v2, v5, 0x2710

    mul-int/lit8 v37, v6, 0x64

    add-int v2, v2, v37

    add-int v2, v2, v32

    iput v2, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCompatMode:I

    goto :goto_1a

    .line 583
    .end local v4    # "versionScanner":Ljava/util/Scanner;
    .end local v5    # "major":I
    .end local v6    # "minor":I
    .end local v32    # "patch":I
    .end local v36    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v2    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_32
    move-object/from16 v36, v2

    .line 594
    .end local v2    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v36    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_1a
    const-string v2, "auth"

    const/4 v6, 0x1

    invoke-direct {v1, v2, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 595
    .local v2, "auth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v2, :cond_33

    .line 596
    invoke-virtual {v2, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuth:Ljava/lang/String;

    .line 599
    :cond_33
    const-string v4, "ca"

    invoke-direct {v1, v4, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 600
    .local v4, "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_34

    .line 601
    invoke-virtual {v4, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCaFilename:Ljava/lang/String;

    .line 604
    :cond_34
    const-string v5, "peer-fingerprint"

    invoke-direct {v1, v5, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 605
    .local v5, "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    const-string v6, "\n"

    move-object/from16 v32, v2

    .end local v2    # "auth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v32, "auth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v2, "[[INLINE]]"

    if-eqz v5, :cond_37

    .line 607
    move-object/from16 v37, v4

    const/4 v4, 0x1

    .end local v4    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v37, "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCheckPeerFingerprint:Z

    .line 608
    invoke-virtual {v5}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v38

    :goto_1b
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_36

    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v39, v5

    .end local v5    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v39, "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    move-object/from16 v5, v17

    check-cast v5, Ljava/util/Vector;

    .line 610
    .local v5, "fp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v5, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_35

    .line 611
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v41, v7

    .end local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v41, "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v40

    move-object/from16 v7, v40

    check-cast v7, Ljava/lang/String;

    move-object/from16 v40, v8

    .end local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v40, "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    goto :goto_1c

    .line 613
    .end local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_35
    move-object/from16 v41, v7

    move-object/from16 v40, v8

    .end local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPeerFingerPrints:Ljava/lang/String;

    .line 614
    .end local v5    # "fp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_1c
    move-object/from16 v5, v39

    move-object/from16 v8, v40

    move-object/from16 v7, v41

    const/4 v4, 0x1

    goto :goto_1b

    .line 608
    .end local v39    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v5, "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_36
    move-object/from16 v39, v5

    move-object/from16 v41, v7

    move-object/from16 v40, v8

    .end local v5    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v39    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_1d

    .line 605
    .end local v37    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v39    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v5    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_37
    move-object/from16 v37, v4

    move-object/from16 v39, v5

    move-object/from16 v41, v7

    move-object/from16 v40, v8

    .line 618
    .end local v4    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v5    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v37    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v39    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_1d
    const-string v4, "cert"

    const/4 v8, 0x1

    invoke-direct {v1, v4, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 619
    .local v4, "cert":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_38

    .line 620
    invoke-virtual {v4, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mClientCertFilename:Ljava/lang/String;

    .line 621
    const/4 v5, 0x0

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 622
    const/4 v9, 0x0

    .line 624
    :cond_38
    const-string v5, "key"

    const/4 v8, 0x1

    invoke-direct {v1, v5, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 625
    .local v5, "key":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v5, :cond_39

    .line 626
    invoke-virtual {v5, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    iput-object v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mClientKeyFilename:Ljava/lang/String;

    .line 628
    :cond_39
    const-string v7, "pkcs12"

    invoke-direct {v1, v7, v8, v8}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 629
    .local v7, "pkcs12":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v7, :cond_3a

    .line 630
    invoke-virtual {v7, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v38

    move-object/from16 v8, v38

    check-cast v8, Ljava/lang/String;

    iput-object v8, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPKCS12Filename:Ljava/lang/String;

    .line 631
    const/4 v8, 0x2

    iput v8, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 632
    const/4 v9, 0x0

    .line 635
    :cond_3a
    const-string v8, "cryptoapicert"

    move-object/from16 v38, v4

    const/4 v4, 0x1

    .end local v4    # "cert":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v38, "cert":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v8, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v8

    .line 636
    .local v8, "cryptoapicert":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v8, :cond_3b

    .line 637
    const/4 v4, 0x2

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 638
    const/4 v9, 0x0

    goto :goto_1e

    .line 636
    :cond_3b
    const/4 v4, 0x2

    .line 641
    :goto_1e
    move-object/from16 v42, v5

    .end local v5    # "key":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v42, "key":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v5, "compat-names"

    move-object/from16 v43, v7

    const/4 v7, 0x1

    .end local v7    # "pkcs12":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v43, "pkcs12":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v5, v7, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 642
    .local v5, "compatnames":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v4, "no-name-remapping"

    invoke-direct {v1, v4, v7, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 643
    .local v4, "nonameremapping":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    move-object/from16 v44, v4

    .end local v4    # "nonameremapping":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v44, "nonameremapping":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const-string v4, "tls-remote"

    invoke-direct {v1, v4, v7, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 644
    .local v4, "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_3f

    .line 645
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v7, v17

    check-cast v7, Ljava/lang/String;

    iput-object v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 646
    const/4 v7, 0x1

    iput-boolean v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 647
    const/4 v7, 0x0

    iput v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    .line 649
    if-eqz v5, :cond_3c

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v7

    move-object/from16 v45, v4

    const/4 v4, 0x2

    .end local v4    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v45, "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-gt v7, v4, :cond_3d

    goto :goto_1f

    .end local v45    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3c
    move-object/from16 v45, v4

    .end local v4    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v45    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_1f
    if-eqz v44, :cond_3e

    .line 651
    :cond_3d
    const/4 v4, 0x1

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    goto :goto_20

    .line 649
    :cond_3e
    const/4 v4, 0x1

    goto :goto_20

    .line 644
    .end local v45    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v4    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3f
    move-object/from16 v45, v4

    move v4, v7

    .line 654
    .end local v4    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v45    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_20
    const-string v7, "verify-x509-name"

    move-object/from16 v46, v5

    const/4 v5, 0x2

    .end local v5    # "compatnames":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v46, "compatnames":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v7, v4, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 655
    .local v7, "verifyx509name":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v7, :cond_44

    .line 656
    invoke-virtual {v7, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Ljava/lang/String;

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteCN:Ljava/lang/String;

    .line 657
    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCheckRemoteCN:Z

    .line 658
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v4

    const/4 v5, 0x2

    if-le v4, v5, :cond_43

    .line 659
    invoke-virtual {v7, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "name"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 660
    const/4 v4, 0x3

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    goto :goto_21

    .line 661
    :cond_40
    const/4 v4, 0x2

    invoke-virtual {v7, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v4, "subject"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 662
    const/4 v4, 0x2

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    goto :goto_21

    .line 663
    :cond_41
    const/4 v4, 0x2

    invoke-virtual {v7, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v4, "name-prefix"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 664
    const/4 v4, 0x4

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    goto :goto_21

    .line 666
    :cond_42
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown parameter to verify-x509-name: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x2

    invoke-virtual {v7, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 668
    :cond_43
    move v4, v5

    iput v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mX509AuthType:I

    .line 673
    :cond_44
    :goto_21
    const-string v4, "x509-username-field"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 674
    .local v4, "x509usernamefield":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_45

    .line 675
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Ljava/lang/String;

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mx509UsernameField:Ljava/lang/String;

    .line 679
    :cond_45
    const-string v5, "verb"

    move-object/from16 v47, v4

    const/4 v4, 0x1

    .end local v4    # "x509usernamefield":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v47, "x509usernamefield":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v5, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 680
    .local v5, "verb":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v5, :cond_46

    .line 681
    invoke-virtual {v5, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Ljava/lang/String;

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mVerb:Ljava/lang/String;

    .line 685
    :cond_46
    const-string v4, "nobind"

    move-object/from16 v48, v5

    const/4 v5, 0x0

    .end local v5    # "verb":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v48, "verb":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_47

    .line 686
    const/4 v4, 0x1

    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mNobind:Z

    goto :goto_22

    .line 685
    :cond_47
    const/4 v4, 0x1

    .line 688
    :goto_22
    const-string v4, "persist-tun"

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_48

    .line 689
    const/4 v4, 0x1

    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPersistTun:Z

    goto :goto_23

    .line 688
    :cond_48
    const/4 v4, 0x1

    .line 691
    :goto_23
    const-string v4, "push-peer-info"

    invoke-direct {v1, v4, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    if-eqz v4, :cond_49

    .line 692
    const/4 v4, 0x1

    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mPushPeerInfo:Z

    goto :goto_24

    .line 691
    :cond_49
    const/4 v4, 0x1

    .line 694
    :goto_24
    const-string v5, "connect-retry"

    move-object/from16 v19, v7

    const/4 v7, 0x2

    .end local v7    # "verifyx509name":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v19, "verifyx509name":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v5, v4, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v5

    .line 695
    .local v5, "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v5, :cond_4a

    .line 696
    invoke-virtual {v5, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v4, v18

    check-cast v4, Ljava/lang/String;

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetry:Ljava/lang/String;

    .line 697
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    if-le v4, v7, :cond_4a

    .line 698
    invoke-virtual {v5, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMaxTime:Ljava/lang/String;

    .line 701
    :cond_4a
    const-string v4, "connect-retry-max"

    const/4 v7, 0x1

    invoke-direct {v1, v4, v7, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 702
    .local v4, "connectretrymax":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_4b

    .line 703
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v7, v17

    check-cast v7, Ljava/lang/String;

    iput-object v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnectRetryMax:Ljava/lang/String;

    .line 705
    :cond_4b
    const-string v7, "remote-cert-tls"

    move-object/from16 v50, v4

    const/4 v4, 0x1

    .end local v4    # "connectretrymax":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v50, "connectretrymax":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v7, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 706
    .local v7, "remotetls":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    if-eqz v7, :cond_4d

    .line 707
    const/4 v4, 0x0

    invoke-virtual {v7, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v49

    move-object/from16 v4, v49

    check-cast v4, Ljava/util/Vector;

    move-object/from16 v49, v5

    const/4 v5, 0x1

    .end local v5    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v49, "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "server"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 708
    const/4 v4, 0x1

    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mExpectTLSCert:Z

    goto :goto_25

    .line 710
    :cond_4c
    const/4 v4, 0x1

    iget-object v5, v1, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    const-string v4, "remotetls"

    invoke-virtual {v5, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25

    .line 706
    .end local v49    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v5    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_4d
    move-object/from16 v49, v5

    .line 712
    .end local v5    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v49    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_25
    const-string v4, "auth-user-pass"

    move-object/from16 v51, v7

    const/4 v5, 0x0

    const/4 v7, 0x1

    .end local v7    # "remotetls":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v51, "remotetls":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    invoke-direct {v1, v4, v5, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v4

    .line 714
    .local v4, "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v4, :cond_52

    .line 715
    if-eqz v9, :cond_4e

    .line 716
    const/4 v7, 0x3

    iput v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    goto :goto_26

    .line 717
    :cond_4e
    iget v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    if-nez v7, :cond_4f

    .line 718
    const/4 v7, 0x5

    iput v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    goto :goto_26

    .line 719
    :cond_4f
    iget v7, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    const/4 v5, 0x2

    if-ne v7, v5, :cond_50

    .line 720
    const/4 v5, 0x7

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthenticationType:I

    .line 722
    :cond_50
    :goto_26
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    const/4 v7, 0x1

    if-le v5, v7, :cond_53

    .line 723
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_51

    .line 724
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v1, Lde/blinkt/openvpn/core/ConfigParser;->auth_user_pass_file:Ljava/lang/String;

    .line 725
    :cond_51
    const/4 v2, 0x0

    iput-object v2, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 726
    invoke-virtual {v4, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Lde/blinkt/openvpn/core/ConfigParser;->useEmbbedUserAuth(Lde/blinkt/openvpn/core/VpnProfile;Ljava/lang/String;)V

    goto :goto_27

    .line 714
    :cond_52
    const/4 v7, 0x1

    .line 730
    :cond_53
    :goto_27
    const-string v2, "auth-retry"

    invoke-direct {v1, v2, v7, v7}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 731
    .local v2, "authretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v2, :cond_57

    .line 732
    invoke-virtual {v2, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v7, "none"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_54

    .line 733
    const/4 v5, 0x0

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    const/4 v5, 0x2

    goto :goto_28

    .line 734
    :cond_54
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v7, "nointeract"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_55

    .line 735
    const/4 v5, 0x2

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    goto :goto_28

    .line 736
    :cond_55
    const/4 v5, 0x2

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v7, v18

    check-cast v7, Ljava/lang/String;

    const-string v5, "interact"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_56

    .line 737
    const/4 v5, 0x2

    iput v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mAuthRetry:I

    goto :goto_28

    .line 739
    :cond_56
    const/4 v5, 0x2

    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown parameter to auth-retry: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 731
    :cond_57
    const/4 v5, 0x2

    .line 743
    :goto_28
    const-string v7, "crl-verify"

    move-object/from16 v21, v2

    const/4 v2, 0x1

    .end local v2    # "authretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v21, "authretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v1, v7, v2, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v7

    .line 744
    .local v7, "crlfile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v7, :cond_59

    .line 746
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v2

    const/4 v5, 0x3

    if-ne v2, v5, :cond_58

    const/4 v5, 0x2

    invoke-virtual {v7, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v5, "dir"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 747
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {v1, v0, v7}, Lde/blinkt/openvpn/core/ConfigParser;->join(Ljava/lang/String;Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCustomConfigOptions:Ljava/lang/String;

    goto :goto_29

    .line 750
    :cond_58
    const/4 v6, 0x1

    invoke-virtual {v7, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v3, Lde/blinkt/openvpn/core/VpnProfile;->mCrlFilename:Ljava/lang/String;

    .line 755
    :cond_59
    :goto_29
    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lde/blinkt/openvpn/core/ConfigParser;->parseConnectionOptions(Lde/blinkt/openvpn/core/Connection;)Landroidx/core/util/Pair;

    move-result-object v0

    .line 756
    .local v0, "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    iget-object v2, v0, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, [Lde/blinkt/openvpn/core/Connection;

    iput-object v2, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 758
    const-string v2, "connection"

    const/4 v6, 0x1

    invoke-direct {v1, v2, v6, v6}, Lde/blinkt/openvpn/core/ConfigParser;->getAllOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v2

    .line 760
    .local v2, "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    iget-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v5, v5

    if-lez v5, :cond_5b

    if-nez v2, :cond_5a

    goto :goto_2a

    .line 761
    :cond_5a
    new-instance v5, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v6, "Using a <connection> block and --remote is not allowed."

    invoke-direct {v5, v6}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 764
    :cond_5b
    :goto_2a
    if-eqz v2, :cond_5e

    .line 765
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v5, v5, [Lde/blinkt/openvpn/core/Connection;

    iput-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    .line 767
    const/4 v5, 0x0

    .line 768
    .local v5, "connIndex":I
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v22, v2

    .end local v2    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v22, "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    move-object/from16 v2, v16

    check-cast v2, Ljava/util/Vector;

    .line 769
    .local v2, "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    nop

    .line 770
    move-object/from16 v16, v4

    const/4 v4, 0x1

    .end local v4    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v16, "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v2, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Ljava/lang/String;

    move-object/from16 v53, v2

    .end local v2    # "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v53, "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v2, v0, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lde/blinkt/openvpn/core/Connection;

    invoke-direct {v1, v4, v2}, Lde/blinkt/openvpn/core/ConfigParser;->parseConnection(Ljava/lang/String;Lde/blinkt/openvpn/core/Connection;)Landroidx/core/util/Pair;

    move-result-object v2

    .line 772
    .local v2, "connectionBlockConnection":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    iget-object v4, v2, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, [Lde/blinkt/openvpn/core/Connection;

    array-length v4, v4

    move-object/from16 v54, v0

    const/4 v0, 0x1

    .end local v0    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .local v54, "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    if-ne v4, v0, :cond_5c

    .line 774
    iget-object v0, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    iget-object v4, v2, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, [Lde/blinkt/openvpn/core/Connection;

    const/16 v23, 0x0

    aget-object v4, v4, v23

    aput-object v4, v0, v5

    .line 775
    nop

    .end local v2    # "connectionBlockConnection":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .end local v53    # "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    add-int/lit8 v5, v5, 0x1

    .line 776
    move-object/from16 v4, v16

    move-object/from16 v2, v22

    move-object/from16 v0, v54

    goto :goto_2b

    .line 773
    .restart local v2    # "connectionBlockConnection":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .restart local v53    # "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_5c
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v4, "A <connection> block must have exactly one remote"

    invoke-direct {v0, v4}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 768
    .end local v16    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v22    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v53    # "conn":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v54    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .restart local v0    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .local v2, "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v4    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_5d
    move-object/from16 v54, v0

    move-object/from16 v22, v2

    move-object/from16 v16, v4

    .end local v0    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .end local v2    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v4    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v16    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v22    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v54    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    goto :goto_2c

    .line 764
    .end local v5    # "connIndex":I
    .end local v16    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v22    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v54    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .restart local v0    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .restart local v2    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v4    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_5e
    move-object/from16 v54, v0

    move-object/from16 v22, v2

    move-object/from16 v16, v4

    .line 778
    .end local v0    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .end local v2    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v4    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v16    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v22    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v54    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    :goto_2c
    const-string v0, "remote-random"

    const/4 v5, 0x0

    invoke-direct {v1, v0, v5, v5}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v0

    if-eqz v0, :cond_5f

    .line 779
    const/4 v4, 0x1

    iput-boolean v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mRemoteRandom:Z

    goto :goto_2d

    .line 778
    :cond_5f
    const/4 v4, 0x1

    .line 781
    :goto_2d
    const-string v0, "proto-force"

    invoke-direct {v1, v0, v4, v4}, Lde/blinkt/openvpn/core/ConfigParser;->getOption(Ljava/lang/String;II)Ljava/util/Vector;

    move-result-object v0

    .line 782
    .local v0, "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v0, :cond_64

    .line 784
    invoke-virtual {v0, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 785
    .local v2, "protoToDisable":Ljava/lang/String;
    const-string v4, "udp"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 786
    const/4 v4, 0x1

    .local v4, "disableUDP":Z
    goto :goto_2e

    .line 787
    .end local v4    # "disableUDP":Z
    :cond_60
    const-string v4, "tcp"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_63

    .line 788
    const/4 v4, 0x0

    .line 792
    .restart local v4    # "disableUDP":Z
    :goto_2e
    iget-object v5, v3, Lde/blinkt/openvpn/core/VpnProfile;->mConnections:[Lde/blinkt/openvpn/core/Connection;

    array-length v6, v5

    move-object/from16 v52, v0

    const/4 v0, 0x0

    .end local v0    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v52, "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_2f
    if-ge v0, v6, :cond_62

    move/from16 v53, v0

    aget-object v0, v5, v53

    .line 793
    .local v0, "conn":Lde/blinkt/openvpn/core/Connection;
    move-object/from16 v55, v2

    .end local v2    # "protoToDisable":Ljava/lang/String;
    .local v55, "protoToDisable":Ljava/lang/String;
    iget-boolean v2, v0, Lde/blinkt/openvpn/core/Connection;->mUseUdp:Z

    if-ne v2, v4, :cond_61

    .line 794
    const/4 v2, 0x0

    iput-boolean v2, v0, Lde/blinkt/openvpn/core/Connection;->mEnabled:Z

    .line 792
    .end local v0    # "conn":Lde/blinkt/openvpn/core/Connection;
    :cond_61
    add-int/lit8 v0, v53, 0x1

    move-object/from16 v2, v55

    goto :goto_2f

    .end local v55    # "protoToDisable":Ljava/lang/String;
    .restart local v2    # "protoToDisable":Ljava/lang/String;
    :cond_62
    move-object/from16 v55, v2

    .end local v2    # "protoToDisable":Ljava/lang/String;
    .restart local v55    # "protoToDisable":Ljava/lang/String;
    goto :goto_30

    .line 790
    .end local v4    # "disableUDP":Z
    .end local v52    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v55    # "protoToDisable":Ljava/lang/String;
    .local v0, "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v2    # "protoToDisable":Ljava/lang/String;
    :cond_63
    move-object/from16 v52, v0

    move-object/from16 v55, v2

    .end local v0    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v2    # "protoToDisable":Ljava/lang/String;
    .restart local v52    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v55    # "protoToDisable":Ljava/lang/String;
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v2, "Unknown protocol %s in proto-force"

    filled-new-array/range {v55 .. v55}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 782
    .end local v52    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v55    # "protoToDisable":Ljava/lang/String;
    .restart local v0    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_64
    move-object/from16 v52, v0

    .line 798
    .end local v0    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v52    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_30
    const/4 v4, 0x2

    new-array v0, v4, [Ljava/lang/String;

    const-string v2, "PROFILE"

    const/16 v23, 0x0

    aput-object v2, v0, v23

    const-string v2, "FRIENDLY_NAME"

    const/16 v17, 0x1

    aput-object v2, v0, v17

    move/from16 v5, v23

    :goto_31
    if-ge v5, v4, :cond_67

    aget-object v2, v0, v5

    .line 799
    .local v2, "as_name_directive":Ljava/lang/String;
    iget-object v6, v1, Lde/blinkt/openvpn/core/ConfigParser;->meta:Ljava/util/HashMap;

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Vector;

    .line 800
    .local v6, "friendlyname":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v6, :cond_65

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v4

    move-object/from16 v23, v0

    const/4 v0, 0x1

    if-le v4, v0, :cond_66

    .line 801
    invoke-virtual {v6, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, v3, Lde/blinkt/openvpn/core/VpnProfile;->mName:Ljava/lang/String;

    goto :goto_32

    .line 800
    :cond_65
    move-object/from16 v23, v0

    .line 798
    .end local v2    # "as_name_directive":Ljava/lang/String;
    .end local v6    # "friendlyname":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_66
    :goto_32
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, v23

    const/4 v4, 0x2

    goto :goto_31

    .line 805
    :cond_67
    iget-object v0, v1, Lde/blinkt/openvpn/core/ConfigParser;->meta:Ljava/util/HashMap;

    const-string v2, "USERNAME"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    .line 806
    .local v0, "ocusername":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-eqz v0, :cond_68

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_68

    .line 807
    invoke-virtual {v0, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v3, Lde/blinkt/openvpn/core/VpnProfile;->mUsername:Ljava/lang/String;

    .line 809
    :cond_68
    invoke-direct {v1, v3}, Lde/blinkt/openvpn/core/ConfigParser;->checkIgnoreAndInvalidOptions(Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 810
    invoke-direct {v1, v3}, Lde/blinkt/openvpn/core/ConfigParser;->fixup(Lde/blinkt/openvpn/core/VpnProfile;)V

    .line 812
    return-object v3

    .line 451
    .end local v0    # "ocusername":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v13    # "mssfix":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v15    # "mode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v16    # "authuser":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v19    # "verifyx509name":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v21    # "authretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v22    # "connectionBlocks":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v24    # "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v25    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v26    # "ifconfig":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v27    # "dhcpoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v28    # "tunmtu":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v29    # "ncp_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v31    # "cipher":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v32    # "auth":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v33    # "data_ciphers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v34    # "tls_cert_profile":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v35    # "provider":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v36    # "compatmode":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v37    # "ca":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v38    # "cert":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v39    # "peerfp":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v42    # "key":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v43    # "pkcs12":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v44    # "nonameremapping":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v45    # "tlsremote":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v46    # "compatnames":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v47    # "x509usernamefield":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v48    # "verb":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v49    # "connectretry":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v50    # "connectretrymax":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v51    # "remotetls":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v52    # "protoforce":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v54    # "conns":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Lde/blinkt/openvpn/core/Connection;[Lde/blinkt/openvpn/core/Connection;>;"
    .local v2, "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v4, "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v6, "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .local v7, "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v8, "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    :cond_69
    move-object/from16 v24, v2

    move-object/from16 v25, v4

    move-object/from16 v30, v6

    move-object/from16 v41, v7

    move-object/from16 v40, v8

    .line 455
    .end local v2    # "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v4    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v6    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .end local v7    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v24    # "routesV6":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v25    # "routeNoPull":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v30    # "tlsauthoptions":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v40    # "defgw":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Vector<Ljava/lang/String;>;>;"
    .restart local v41    # "direction":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v0, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v2, "Sorry. Only tun mode is supported. See the FAQ for more detail"

    invoke-direct {v0, v2}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAuthUserPassFile()Ljava/lang/String;
    .locals 1

    .line 247
    iget-object v0, p0, Lde/blinkt/openvpn/core/ConfigParser;->auth_user_pass_file:Ljava/lang/String;

    return-object v0
.end method

.method ignoreThisOption(Ljava/util/Vector;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1014
    .local p1, "option":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/blinkt/openvpn/core/ConfigParser;->ignoreOptionsWithArg:[[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_4

    aget-object v4, v0, v3

    .line 1016
    .local v4, "ignoreOption":[Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v5

    array-length v6, v4

    if-ge v5, v6, :cond_0

    .line 1017
    goto :goto_2

    .line 1019
    :cond_0
    const/4 v5, 0x1

    .line 1020
    .local v5, "ignore":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    array-length v7, v4

    if-ge v6, v7, :cond_2

    .line 1021
    aget-object v7, v4, v6

    invoke-virtual {p1, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1022
    const/4 v5, 0x0

    .line 1020
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1024
    .end local v6    # "i":I
    :cond_2
    if-eqz v5, :cond_3

    .line 1025
    const/4 v0, 0x1

    return v0

    .line 1014
    .end local v4    # "ignoreOption":[Ljava/lang/String;
    .end local v5    # "ignore":Z
    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1028
    :cond_4
    return v2
.end method

.method public parseConfig(Ljava/io/Reader;)V
    .locals 8
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;
        }
    .end annotation

    .line 152
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v0, "optionAliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "server-poll-timeout"

    const-string v2, "timeout-connect"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 157
    .local v1, "br":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 160
    .local v2, "lineno":I
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 161
    .local v3, "line":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    .line 162
    if-nez v3, :cond_0

    .line 163
    nop

    .line 203
    .end local v3    # "line":Ljava/lang/String;
    nop

    .line 204
    return-void

    .line 165
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    .line 166
    const-string v5, "PK\u0003\u0004"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "PK\u0007\u00008"

    .line 167
    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 170
    const-string v5, "\ufeff"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 171
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    goto :goto_1

    .line 168
    :cond_1
    new-instance v4, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    const-string v5, "Input looks like a ZIP Archive. Import is only possible for OpenVPN config files (.ovpn/.conf)"

    invoke-direct {v4, v5}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    .end local v0    # "optionAliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v2    # "lineno":I
    .end local p1    # "reader":Ljava/io/Reader;
    throw v4

    .line 176
    .restart local v0    # "optionAliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v2    # "lineno":I
    .restart local p1    # "reader":Ljava/io/Reader;
    :cond_2
    :goto_1
    const-string v4, "# OVPN_ACCESS_SERVER_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_3

    .line 177
    invoke-direct {p0, v3}, Lde/blinkt/openvpn/core/ConfigParser;->parsemeta(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 178
    .local v4, "metaarg":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    iget-object v6, p0, Lde/blinkt/openvpn/core/ConfigParser;->meta:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    goto :goto_0

    .line 181
    .end local v4    # "metaarg":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3
    invoke-direct {p0, v3}, Lde/blinkt/openvpn/core/ConfigParser;->parseline(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 183
    .local v4, "args":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v6

    if-nez v6, :cond_4

    .line 184
    goto :goto_0

    .line 187
    :cond_4
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "--"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 188
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/Vector;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 190
    :cond_5
    invoke-direct {p0, v4, v1}, Lde/blinkt/openvpn/core/ConfigParser;->checkinlinefile(Ljava/util/Vector;Ljava/io/BufferedReader;)V

    .line 192
    invoke-virtual {v4, v5}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 193
    .local v5, "optionname":Ljava/lang/String;
    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_6

    .line 194
    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v5, v6

    .line 196
    :cond_6
    iget-object v6, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 197
    iget-object v6, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v6, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_7
    iget-object v6, p0, Lde/blinkt/openvpn/core/ConfigParser;->options:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Vector;

    invoke-virtual {v6, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    nop

    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "args":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v5    # "optionname":Ljava/lang/String;
    goto/16 :goto_0

    .line 201
    :catch_0
    move-exception v3

    .line 202
    .local v3, "memoryError":Ljava/lang/OutOfMemoryError;
    new-instance v4, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "File too large to parse: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/OutOfMemoryError;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lde/blinkt/openvpn/core/ConfigParser$ConfigParseError;-><init>(Ljava/lang/String;)V

    throw v4
.end method
