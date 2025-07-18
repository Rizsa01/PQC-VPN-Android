.class public final Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;
.super Ljava/lang/Object;
.source "ActivityPqcVpnBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final buttonConnect:Landroid/widget/Button;

.field public final buttonDisconnect:Landroid/widget/Button;

.field public final buttonSelectFolder:Landroid/widget/Button;

.field public final labelPqcKem:Landroid/widget/TextView;

.field private final rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final spinnerPqcKem:Landroid/widget/Spinner;

.field public final textStatus:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/Spinner;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "rootView"    # Landroidx/constraintlayout/widget/ConstraintLayout;
    .param p2, "buttonConnect"    # Landroid/widget/Button;
    .param p3, "buttonDisconnect"    # Landroid/widget/Button;
    .param p4, "buttonSelectFolder"    # Landroid/widget/Button;
    .param p5, "labelPqcKem"    # Landroid/widget/TextView;
    .param p6, "spinnerPqcKem"    # Landroid/widget/Spinner;
    .param p7, "textStatus"    # Landroid/widget/TextView;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 46
    iput-object p2, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonConnect:Landroid/widget/Button;

    .line 47
    iput-object p3, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonDisconnect:Landroid/widget/Button;

    .line 48
    iput-object p4, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->buttonSelectFolder:Landroid/widget/Button;

    .line 49
    iput-object p5, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->labelPqcKem:Landroid/widget/TextView;

    .line 50
    iput-object p6, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->spinnerPqcKem:Landroid/widget/Spinner;

    .line 51
    iput-object p7, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->textStatus:Landroid/widget/TextView;

    .line 52
    return-void
.end method

.method public static bind(Landroid/view/View;)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;
    .locals 10
    .param p0, "rootView"    # Landroid/view/View;

    .line 81
    const v0, 0x7f09006a

    .line 82
    .local v0, "id":I
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/Button;

    .line 83
    .local v4, "buttonConnect":Landroid/widget/Button;
    if-eqz v4, :cond_5

    .line 87
    const v0, 0x7f09006b

    .line 88
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/Button;

    .line 89
    .local v5, "buttonDisconnect":Landroid/widget/Button;
    if-eqz v5, :cond_4

    .line 93
    const v0, 0x7f09006c

    .line 94
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/Button;

    .line 95
    .local v6, "buttonSelectFolder":Landroid/widget/Button;
    if-eqz v6, :cond_3

    .line 99
    const v0, 0x7f0900f3

    .line 100
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    .line 101
    .local v7, "labelPqcKem":Landroid/widget/TextView;
    if-eqz v7, :cond_2

    .line 105
    const v0, 0x7f0901af

    .line 106
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/Spinner;

    .line 107
    .local v8, "spinnerPqcKem":Landroid/widget/Spinner;
    if-eqz v8, :cond_1

    .line 111
    const v0, 0x7f0901de

    .line 112
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/TextView;

    .line 113
    .local v9, "textStatus":Landroid/widget/TextView;
    if-eqz v9, :cond_0

    .line 117
    new-instance v2, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v9}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/Spinner;Landroid/widget/TextView;)V

    return-object v2

    .line 114
    :cond_0
    goto :goto_0

    .line 108
    .end local v9    # "textStatus":Landroid/widget/TextView;
    :cond_1
    goto :goto_0

    .line 102
    .end local v8    # "spinnerPqcKem":Landroid/widget/Spinner;
    :cond_2
    goto :goto_0

    .line 96
    .end local v7    # "labelPqcKem":Landroid/widget/TextView;
    :cond_3
    goto :goto_0

    .line 90
    .end local v6    # "buttonSelectFolder":Landroid/widget/Button;
    :cond_4
    goto :goto_0

    .line 84
    .end local v5    # "buttonDisconnect":Landroid/widget/Button;
    :cond_5
    nop

    .line 120
    .end local v4    # "buttonConnect":Landroid/widget/Button;
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 62
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 68
    const v0, 0x7f0c001c

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 69
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 70
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 72
    :cond_0
    invoke-static {v0}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->bind(Landroid/view/View;)Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 1

    .line 57
    iget-object v0, p0, Lde/blinkt/openvpn/databinding/ActivityPqcVpnBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object v0
.end method
