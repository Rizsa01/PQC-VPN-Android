.class public final Lde/blinkt/openvpn/R$styleable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/blinkt/openvpn/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final FileSelectLayout:[I

.field public static final FileSelectLayout_certificate:I = 0x0

.field public static final FileSelectLayout_fileTitle:I = 0x1

.field public static final FileSelectLayout_showClear:I = 0x2

.field public static final PagerSlidingTabStrip:[I

.field public static final PagerSlidingTabStrip_pstsDividerColor:I = 0x0

.field public static final PagerSlidingTabStrip_pstsDividerPadding:I = 0x1

.field public static final PagerSlidingTabStrip_pstsDividerWidth:I = 0x2

.field public static final PagerSlidingTabStrip_pstsIndicatorColor:I = 0x3

.field public static final PagerSlidingTabStrip_pstsIndicatorHeight:I = 0x4

.field public static final PagerSlidingTabStrip_pstsPaddingMiddle:I = 0x5

.field public static final PagerSlidingTabStrip_pstsScrollOffset:I = 0x6

.field public static final PagerSlidingTabStrip_pstsShouldExpand:I = 0x7

.field public static final PagerSlidingTabStrip_pstsTabBackground:I = 0x8

.field public static final PagerSlidingTabStrip_pstsTabPaddingLeftRight:I = 0x9

.field public static final PagerSlidingTabStrip_pstsTextAllCaps:I = 0xa

.field public static final PagerSlidingTabStrip_pstsTextAlpha:I = 0xb

.field public static final PagerSlidingTabStrip_pstsTextSelectedAlpha:I = 0xc

.field public static final PagerSlidingTabStrip_pstsTextSelectedStyle:I = 0xd

.field public static final PagerSlidingTabStrip_pstsTextStyle:I = 0xe

.field public static final PagerSlidingTabStrip_pstsUnderlineColor:I = 0xf

.field public static final PagerSlidingTabStrip_pstsUnderlineHeight:I = 0x10


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const v0, 0x7f0401f0

    const v1, 0x7f040409

    const v2, 0x7f0400b5

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lde/blinkt/openvpn/R$styleable;->FileSelectLayout:[I

    const/16 v0, 0x11

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lde/blinkt/openvpn/R$styleable;->PagerSlidingTabStrip:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f0403ba
        0x7f0403bb
        0x7f0403bc
        0x7f0403bd
        0x7f0403be
        0x7f0403bf
        0x7f0403c0
        0x7f0403c1
        0x7f0403c2
        0x7f0403c3
        0x7f0403c4
        0x7f0403c5
        0x7f0403c6
        0x7f0403c7
        0x7f0403c8
        0x7f0403c9
        0x7f0403ca
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
