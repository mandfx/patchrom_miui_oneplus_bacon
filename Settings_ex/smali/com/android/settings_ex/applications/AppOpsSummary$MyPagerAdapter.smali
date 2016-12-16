.class Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;
.super Landroid/support/v13/app/FragmentPagerAdapter;
.source "AppOpsSummary.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings_ex/applications/AppOpsSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPagerAdapter"
.end annotation


# instance fields
.field private mPageTemplates:[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

.field final synthetic this$0:Lcom/android/settings_ex/applications/AppOpsSummary;


# direct methods
.method public constructor <init>(Lcom/android/settings_ex/applications/AppOpsSummary;Landroid/app/FragmentManager;[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/applications/AppOpsSummary;
    .param p2, "fm"    # Landroid/app/FragmentManager;
    .param p3, "templates"    # [Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    .line 79
    invoke-direct {p0, p2}, Landroid/support/v13/app/FragmentPagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 80
    iput-object p3, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->mPageTemplates:[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    .line 78
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    iget-object v0, v0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    array-length v0, v0

    return v0
.end method

.method public getCurrentPage()I
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    iget v0, v0, Lcom/android/settings_ex/applications/AppOpsSummary;->mCurPos:I

    return v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 85
    new-instance v0, Lcom/android/settings_ex/applications/AppOpsCategory;

    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->mPageTemplates:[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    iget-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    iget v2, v2, Lcom/android/settings_ex/applications/AppOpsSummary;->mPositionOffset:I

    add-int/2addr v2, p1

    aget-object v1, v1, v2

    invoke-direct {v0, v1}, Lcom/android/settings_ex/applications/AppOpsCategory;-><init>(Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;)V

    return-object v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    iget-object v0, v0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 113
    if-nez p1, :cond_0

    .line 112
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 99
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    iput p1, v0, Lcom/android/settings_ex/applications/AppOpsSummary;->mCurPos:I

    .line 103
    return-void
.end method
