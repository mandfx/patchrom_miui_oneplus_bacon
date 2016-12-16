.class public Lcom/android/settings_ex/applications/AppOpsSummary;
.super Lcom/android/settings_ex/InstrumentedFragment;
.source "AppOpsSummary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

.field private mContentContainer:Landroid/view/ViewGroup;

.field mCurPos:I

.field private mInflater:Landroid/view/LayoutInflater;

.field mPageNames:[Ljava/lang/CharSequence;

.field mPositionOffset:I

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mRootView:Landroid/view/View;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static synthetic -wrap0(Lcom/android/settings_ex/applications/AppOpsSummary;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->resetCounters()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/settings_ex/InstrumentedFragment;-><init>()V

    return-void
.end method

.method private filterTemplates([Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;)[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;
    .locals 6
    .param p1, "templates"    # [Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    .prologue
    const/4 v3, 0x0

    .line 178
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 179
    .local v1, "validTemplates":Ljava/util/List;, "Ljava/util/List<Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;>;"
    array-length v4, p1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_2

    aget-object v0, p1, v2

    .line 180
    .local v0, "template":Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;
    sget-object v5, Lcom/android/settings_ex/applications/AppOpsState;->SU_TEMPLATE:Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    if-ne v0, v5, :cond_0

    .line 181
    invoke-static {}, Lcom/android/settings_ex/DevelopmentSettings;->isRootForAppsEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 184
    :cond_0
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    .end local v0    # "template":Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;
    :cond_2
    new-array v2, v3, [Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    return-object v2
.end method

.method private resetAdapter()V
    .locals 3

    .prologue
    .line 121
    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1}, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;->getCurrentPage()I

    move-result v0

    .line 122
    .local v0, "curPos":I
    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 123
    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 124
    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 119
    return-void
.end method

.method private resetCounters()V
    .locals 3

    .prologue
    .line 222
    iget-object v1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    const-string/jumbo v2, "appops"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .line 223
    .local v0, "appOps":Landroid/app/AppOpsManager;
    if-nez v0, :cond_0

    .line 224
    return-void

    .line 226
    :cond_0
    invoke-virtual {v0}, Landroid/app/AppOpsManager;->resetCounters()V

    .line 228
    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->resetAdapter()V

    .line 220
    return-void
.end method

.method private resetCountersConfirm()V
    .locals 3

    .prologue
    .line 232
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 233
    const v1, 0x1080027

    .line 232
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 234
    const v1, 0x7f0c01d7

    .line 232
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 235
    const v1, 0x7f0c01d8

    .line 232
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 236
    new-instance v1, Lcom/android/settings_ex/applications/AppOpsSummary$1;

    invoke-direct {v1, p0}, Lcom/android/settings_ex/applications/AppOpsSummary$1;-><init>(Lcom/android/settings_ex/applications/AppOpsSummary;)V

    const v2, 0x104000a

    .line 232
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 243
    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 232
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 231
    return-void
.end method

.method private shouldShowSystemApps()Z
    .locals 3

    .prologue
    .line 194
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "show_system_apps"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 194
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private shouldShowUserApps()Z
    .locals 3

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "show_user_apps"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected getMetricsCategory()I
    .locals 1

    .prologue
    .line 72
    const/16 v0, 0xf

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 200
    invoke-super {p0, p1}, Lcom/android/settings_ex/InstrumentedFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 203
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    const-string/jumbo v1, "appops_manager"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    .line 205
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/applications/AppOpsSummary;->setHasOptionsMenu(Z)V

    .line 199
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const v2, 0x7f130317

    .line 210
    invoke-super {p0, p1, p2}, Lcom/android/settings_ex/InstrumentedFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 211
    const v0, 0x7f140001

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 212
    const v0, 0x7f130316

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->shouldShowUserApps()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 213
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10001c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 214
    invoke-interface {p1, v2}, Landroid/view/Menu;->removeItem(I)V

    .line 209
    :goto_0
    return-void

    .line 216
    :cond_0
    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->shouldShowSystemApps()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 130
    iput-object p1, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mInflater:Landroid/view/LayoutInflater;

    .line 132
    iget-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mInflater:Landroid/view/LayoutInflater;

    const v8, 0x7f04000f

    invoke-virtual {v7, v8, p2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 134
    .local v2, "rootView":Landroid/view/View;
    iput-object p2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mContentContainer:Landroid/view/ViewGroup;

    .line 135
    iput-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mRootView:Landroid/view/View;

    .line 137
    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0a0085

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v7

    iput-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    .line 139
    iput v9, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPositionOffset:I

    .line 141
    const/4 v3, -0x1

    .line 142
    .local v3, "specificTab":I
    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 143
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 144
    iget-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const-string/jumbo v8, "appops_tab"

    const-string/jumbo v9, ""

    invoke-virtual {v0, v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 145
    if-ltz v3, :cond_0

    .line 146
    iget-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    add-int/lit8 v8, v3, 0x1

    invoke-static {v7, v3, v8}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/CharSequence;

    iput-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    .line 147
    iput v3, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPositionOffset:I

    .line 151
    :cond_0
    const v7, 0x7f130020

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager;

    iput-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 152
    new-instance v7, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v8

    .line 153
    sget-object v9, Lcom/android/settings_ex/applications/AppOpsState;->ALL_TEMPLATES:[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    invoke-direct {p0, v9}, Lcom/android/settings_ex/applications/AppOpsSummary;->filterTemplates([Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;)[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;

    move-result-object v9

    .line 152
    invoke-direct {v7, p0, v8, v9}, Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;-><init>(Lcom/android/settings_ex/applications/AppOpsSummary;Landroid/app/FragmentManager;[Lcom/android/settings_ex/applications/AppOpsState$OpsTemplate;)V

    iput-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    .line 154
    iget-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v8, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v7, v8}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 155
    iget-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v8, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mAdapter:Lcom/android/settings_ex/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v7, v8}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 156
    const v7, 0x7f130021

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/PagerTabStrip;

    .line 158
    .local v4, "tabs":Landroid/support/v4/view/PagerTabStrip;
    invoke-virtual {v4}, Landroid/support/v4/view/PagerTabStrip;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    .line 159
    .local v5, "theme":Landroid/content/res/Resources$Theme;
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 160
    .local v6, "typedValue":Landroid/util/TypedValue;
    const v7, 0x1010435

    invoke-virtual {v5, v7, v6, v10}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 161
    iget v7, v6, Landroid/util/TypedValue;->resourceId:I

    if-eqz v7, :cond_2

    .line 162
    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, v6, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getColor(I)I

    move-result v1

    .line 164
    .local v1, "colorAccent":I
    :goto_0
    invoke-virtual {v4, v1}, Landroid/support/v4/view/PagerTabStrip;->setTabIndicatorColor(I)V

    .line 168
    instance-of v7, p2, Landroid/preference/PreferenceFrameLayout;

    if-eqz v7, :cond_1

    .line 169
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceFrameLayout$LayoutParams;

    iput-boolean v10, v7, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 172
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getActivity()Landroid/app/Activity;

    move-result-object v7

    iput-object v7, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    .line 174
    return-object v2

    .line 163
    .end local v1    # "colorAccent":I
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f0e0082

    invoke-virtual {v7, v8}, Landroid/content/Context;->getColor(I)I

    move-result v1

    .restart local v1    # "colorAccent":I
    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 249
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 270
    invoke-super {p0, p1}, Lcom/android/settings_ex/InstrumentedFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2

    .line 251
    :pswitch_0
    const-string/jumbo v1, "show_user_apps"

    .line 253
    .local v1, "prefNameUserApps":Ljava/lang/String;
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_0

    :goto_0
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 254
    iget-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v4, "show_user_apps"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 256
    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->resetAdapter()V

    .line 257
    return v3

    :cond_0
    move v2, v3

    .line 253
    goto :goto_0

    .line 259
    .end local v1    # "prefNameUserApps":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "show_system_apps"

    .line 261
    .local v0, "prefNameSysApps":Ljava/lang/String;
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_1

    :goto_1
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 262
    iget-object v2, p0, Lcom/android/settings_ex/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v4, "show_system_apps"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 264
    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->resetAdapter()V

    .line 265
    return v3

    :cond_1
    move v2, v3

    .line 261
    goto :goto_1

    .line 267
    .end local v0    # "prefNameSysApps":Ljava/lang/String;
    :pswitch_2
    invoke-direct {p0}, Lcom/android/settings_ex/applications/AppOpsSummary;->resetCountersConfirm()V

    .line 268
    return v3

    .line 249
    :pswitch_data_0
    .packed-switch 0x7f130316
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
