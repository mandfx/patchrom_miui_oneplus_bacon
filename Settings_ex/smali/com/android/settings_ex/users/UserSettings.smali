.class public Lcom/android/settings_ex/users/UserSettings;
.super Lcom/android/settings_ex/SettingsPreferenceFragment;
.source "UserSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/android/settings_ex/users/EditUserInfoController$OnContentChangedCallback;
.implements Lcom/android/settings_ex/search/Indexable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings_ex/users/UserSettings$UserCapabilities;,
        Lcom/android/settings_ex/users/UserSettings$1;,
        Lcom/android/settings_ex/users/UserSettings$2;,
        Lcom/android/settings_ex/users/UserSettings$3;
    }
.end annotation


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings_ex/search/Indexable$SearchIndexProvider;


# instance fields
.field private mAddUser:Landroid/preference/Preference;

.field private mAddedUserId:I

.field private mAddingUser:Z

.field private mDefaultIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

.field private mHandler:Landroid/os/Handler;

.field private mMePreference:Lcom/android/settings_ex/users/UserPreference;

.field private mNicknamePreference:Lcom/android/settings_ex/SelectableEditTextPreference;

.field private mRemovingUserId:I

.field private mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

.field private mUserChangeReceiver:Landroid/content/BroadcastReceiver;

.field private mUserIcons:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mUserListCategory:Landroid/preference/PreferenceGroup;

.field private final mUserLock:Ljava/lang/Object;

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method static synthetic -get0(Lcom/android/settings_ex/users/UserSettings;)I
    .locals 1

    iget v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddedUserId:I

    return v0
.end method

.method static synthetic -get1(Lcom/android/settings_ex/users/UserSettings;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/settings_ex/users/UserSettings;)I
    .locals 1

    iget v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/settings_ex/users/UserSettings;)Landroid/util/SparseArray;
    .locals 1

    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/settings_ex/users/UserSettings;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/settings_ex/users/UserSettings;)Landroid/os/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/settings_ex/users/UserSettings;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/settings_ex/users/UserSettings;I)I
    .locals 0

    iput p1, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/settings_ex/users/UserSettings;)Landroid/content/pm/UserInfo;
    .locals 1

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->createLimitedUser()Landroid/content/pm/UserInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/settings_ex/users/UserSettings;)Landroid/content/pm/UserInfo;
    .locals 1

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->createTrustedUser()Landroid/content/pm/UserInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap10(Lcom/android/settings_ex/users/UserSettings;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->removeUserNow()V

    return-void
.end method

.method static synthetic -wrap11(Lcom/android/settings_ex/users/UserSettings;I)V
    .locals 0
    .param p1, "userId"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->switchUserNow(I)V

    return-void
.end method

.method static synthetic -wrap12(Lcom/android/settings_ex/users/UserSettings;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->updateUserList()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/settings_ex/users/UserSettings;I)V
    .locals 0
    .param p1, "userType"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->addUserNow(I)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/settings_ex/users/UserSettings;Landroid/content/pm/UserInfo;)V
    .locals 0
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->assignProfilePhoto(Landroid/content/pm/UserInfo;)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/settings_ex/users/UserSettings;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->exitGuest()V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/settings_ex/users/UserSettings;Ljava/lang/String;)V
    .locals 0
    .param p1, "profileName"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->finishLoadProfile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/settings_ex/users/UserSettings;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->launchChooseLockscreen()V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/settings_ex/users/UserSettings;I)V
    .locals 0
    .param p1, "userType"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->onAddUserClicked(I)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/android/settings_ex/users/UserSettings;IZ)V
    .locals 0
    .param p1, "userId"    # I
    .param p2, "newUser"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/settings_ex/users/UserSettings;->onManageUserClicked(IZ)V

    return-void
.end method

.method static synthetic -wrap9(Lcom/android/settings_ex/users/UserSettings;I)V
    .locals 0
    .param p1, "userId"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->onUserCreated(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1072
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$3;

    invoke-direct {v0}, Lcom/android/settings_ex/users/UserSettings$3;-><init>()V

    .line 1071
    sput-object v0, Lcom/android/settings_ex/users/UserSettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings_ex/search/Indexable$SearchIndexProvider;

    .line 85
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;-><init>()V

    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    .line 134
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddedUserId:I

    .line 138
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    .line 140
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    .line 143
    new-instance v0, Lcom/android/settings_ex/users/EditUserInfoController;

    invoke-direct {v0}, Lcom/android/settings_ex/users/EditUserInfoController;-><init>()V

    .line 142
    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    .line 148
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings_ex/users/UserSettings$1;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mHandler:Landroid/os/Handler;

    .line 165
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$2;

    invoke-direct {v0, p0}, Lcom/android/settings_ex/users/UserSettings$2;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 85
    return-void
.end method

.method private addUserNow(I)V
    .locals 2
    .param p1, "userType"    # I

    .prologue
    .line 651
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 652
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z

    .line 654
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$13;

    invoke-direct {v0, p0, p1}, Lcom/android/settings_ex/users/UserSettings$13;-><init>(Lcom/android/settings_ex/users/UserSettings;I)V

    invoke-virtual {v0}, Lcom/android/settings_ex/users/UserSettings$13;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 650
    return-void

    .line 651
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private assignDefaultPhoto(Landroid/content/pm/UserInfo;)V
    .locals 3
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 874
    iget v1, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v1}, Lcom/android/settings_ex/Utils;->getDefaultUserIconAsBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 875
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    iget v2, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v2, v0}, Landroid/os/UserManager;->setUserIcon(ILandroid/graphics/Bitmap;)V

    .line 873
    return-void
.end method

.method private assignProfilePhoto(Landroid/content/pm/UserInfo;)V
    .locals 1
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 868
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/settings_ex/Utils;->copyMeProfilePhoto(Landroid/content/Context;Landroid/content/pm/UserInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 869
    invoke-direct {p0, p1}, Lcom/android/settings_ex/users/UserSettings;->assignDefaultPhoto(Landroid/content/pm/UserInfo;)V

    .line 867
    :cond_0
    return-void
.end method

.method private createAndSwitchToGuestUser()V
    .locals 6

    .prologue
    .line 938
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->findGuest()Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 939
    .local v0, "guest":Landroid/content/pm/UserInfo;
    if-eqz v0, :cond_0

    .line 940
    iget v2, v0, Landroid/content/pm/UserInfo;->id:I

    invoke-direct {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->switchUserNow(I)V

    .line 941
    return-void

    .line 943
    :cond_0
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 944
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c005f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 943
    invoke-virtual {v2, v3, v4}, Landroid/os/UserManager;->createGuest(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/UserInfo;

    move-result-object v1

    .line 945
    .local v1, "guestUser":Landroid/content/pm/UserInfo;
    if-eqz v1, :cond_1

    .line 946
    iget v2, v1, Landroid/content/pm/UserInfo;->id:I

    invoke-direct {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->switchUserNow(I)V

    .line 937
    :cond_1
    return-void
.end method

.method private createLimitedUser()Landroid/content/pm/UserInfo;
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v6, 0x0

    .line 397
    iget-object v7, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    .line 398
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0c0c77

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 399
    const/16 v9, 0x8

    .line 397
    invoke-virtual {v7, v8, v9}, Landroid/os/UserManager;->createSecondaryUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;

    move-result-object v3

    .line 400
    .local v3, "newUserInfo":Landroid/content/pm/UserInfo;
    iget v5, v3, Landroid/content/pm/UserInfo;->id:I

    .line 401
    .local v5, "userId":I
    new-instance v4, Landroid/os/UserHandle;

    invoke-direct {v4, v5}, Landroid/os/UserHandle;-><init>(I)V

    .line 402
    .local v4, "user":Landroid/os/UserHandle;
    iget-object v7, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    const-string/jumbo v8, "no_modify_accounts"

    invoke-virtual {v7, v8, v10, v4}, Landroid/os/UserManager;->setUserRestriction(Ljava/lang/String;ZLandroid/os/UserHandle;)V

    .line 405
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 406
    const-string/jumbo v8, "location_mode"

    .line 405
    invoke-static {v7, v8, v6, v5}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 407
    iget-object v7, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    const-string/jumbo v8, "no_share_location"

    invoke-virtual {v7, v8, v10, v4}, Landroid/os/UserManager;->setUserRestriction(Ljava/lang/String;ZLandroid/os/UserHandle;)V

    .line 408
    invoke-direct {p0, v3}, Lcom/android/settings_ex/users/UserSettings;->assignDefaultPhoto(Landroid/content/pm/UserInfo;)V

    .line 410
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 411
    .local v2, "am":Landroid/accounts/AccountManager;
    invoke-virtual {v2}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v1

    .line 412
    .local v1, "accounts":[Landroid/accounts/Account;
    if-eqz v1, :cond_0

    .line 413
    array-length v7, v1

    :goto_0
    if-ge v6, v7, :cond_0

    aget-object v0, v1, v6

    .line 414
    .local v0, "account":Landroid/accounts/Account;
    invoke-virtual {v2, v0, v4}, Landroid/accounts/AccountManager;->addSharedAccount(Landroid/accounts/Account;Landroid/os/UserHandle;)Z

    .line 413
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 417
    .end local v0    # "account":Landroid/accounts/Account;
    :cond_0
    return-object v3
.end method

.method private createTrustedUser()Landroid/content/pm/UserInfo;
    .locals 4

    .prologue
    .line 421
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    .line 422
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0c76

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 421
    invoke-virtual {v1, v2, v3}, Landroid/os/UserManager;->createSecondaryUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 423
    .local v0, "newUserInfo":Landroid/content/pm/UserInfo;
    if-eqz v0, :cond_0

    .line 424
    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->assignDefaultPhoto(Landroid/content/pm/UserInfo;)V

    .line 426
    :cond_0
    return-object v0
.end method

.method private encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 965
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/android/settings_exlib/drawable/CircleFramedDrawable;->getInstance(Landroid/content/Context;Landroid/graphics/Bitmap;)Lcom/android/settings_exlib/drawable/CircleFramedDrawable;

    move-result-object v0

    .line 966
    .local v0, "circled":Landroid/graphics/drawable/Drawable;
    return-object v0
.end method

.method private exitGuest()V
    .locals 1

    .prologue
    .line 692
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsGuest:Z

    if-nez v0, :cond_0

    .line 693
    return-void

    .line 695
    :cond_0
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->removeThisUser()V

    .line 690
    return-void
.end method

.method private findGuest()Landroid/content/pm/UserInfo;
    .locals 4

    .prologue
    .line 951
    iget-object v3, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v3}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v2

    .line 952
    .local v2, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "user$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/UserInfo;

    .line 953
    .local v0, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isGuest()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 954
    return-object v0

    .line 957
    .end local v0    # "user":Landroid/content/pm/UserInfo;
    :cond_1
    const/4 v3, 0x0

    return-object v3
.end method

.method private finishLoadProfile(Ljava/lang/String;)V
    .locals 5
    .param p1, "profileName"    # Ljava/lang/String;

    .prologue
    .line 333
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 334
    :cond_0
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const v4, 0x7f0c0c62

    invoke-virtual {p0, v4, v3}, Lcom/android/settings_ex/users/UserSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/settings_ex/users/UserPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 335
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    .line 336
    .local v1, "myUserId":I
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2, v1}, Landroid/os/UserManager;->getUserIcon(I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 337
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 338
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 339
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 332
    :cond_1
    return-void
.end method

.method private getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 879
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mDefaultIconDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 880
    const/16 v0, -0x2710

    invoke-static {v0}, Lcom/android/settings_ex/Utils;->getDefaultUserIconAsBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mDefaultIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 882
    :cond_0
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mDefaultIconDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private getMaxRealUsers()I
    .locals 6

    .prologue
    .line 834
    invoke-static {}, Landroid/os/UserManager;->getMaxSupportedUsers()I

    move-result v5

    add-int/lit8 v1, v5, 0x1

    .line 835
    .local v1, "maxUsersAndGuest":I
    iget-object v5, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v5}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v4

    .line 837
    .local v4, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    const/4 v0, 0x0

    .line 838
    .local v0, "managedProfiles":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "user$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    .line 839
    .local v2, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v2}, Landroid/content/pm/UserInfo;->isManagedProfile()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 840
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 843
    .end local v2    # "user":Landroid/content/pm/UserInfo;
    :cond_1
    sub-int v5, v1, v0

    return v5
.end method

.method private hasLockscreenSecurity()Z
    .locals 2

    .prologue
    .line 344
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 345
    .local v0, "lpu":Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->isSecure(I)Z

    move-result v1

    return v1
.end method

.method private isInitialized(Landroid/content/pm/UserInfo;)Z
    .locals 2
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    const/4 v0, 0x0

    .line 961
    iget v1, p1, Landroid/content/pm/UserInfo;->flags:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private launchChooseLockscreen()V
    .locals 3

    .prologue
    .line 349
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.app.action.SET_NEW_PASSWORD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 350
    .local v0, "chooseLockIntent":Landroid/content/Intent;
    const-string/jumbo v1, "minimum_quality"

    .line 351
    const/high16 v2, 0x10000

    .line 350
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 352
    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/android/settings_ex/users/UserSettings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 348
    return-void
.end method

.method private loadIconsAsync(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 847
    .local p1, "missingIcons":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$14;

    invoke-direct {v0, p0}, Lcom/android/settings_ex/users/UserSettings$14;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/util/List;

    .line 864
    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 847
    invoke-virtual {v0, v1}, Lcom/android/settings_ex/users/UserSettings$14;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 846
    return-void
.end method

.method private loadProfile()V
    .locals 2

    .prologue
    .line 308
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsGuest:Z

    if-eqz v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 311
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    const v1, 0x7f0c0c83

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/users/UserPreference;->setTitle(I)V

    .line 312
    return-void

    .line 315
    :cond_0
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$4;

    invoke-direct {v0, p0}, Lcom/android/settings_ex/users/UserSettings$4;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/users/UserSettings$4;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 307
    return-void
.end method

.method private onAddUserClicked(I)V
    .locals 3
    .param p1, "userType"    # I

    .prologue
    .line 369
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 370
    :try_start_0
    iget v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit v1

    .line 368
    return-void

    .line 371
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 373
    :pswitch_0
    const/4 v0, 0x2

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 369
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 376
    :pswitch_1
    :try_start_2
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->hasLockscreenSecurity()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 377
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->addUserNow(I)V

    goto :goto_0

    .line 379
    :cond_2
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 371
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onManageUserClicked(IZ)V
    .locals 8
    .param p1, "userId"    # I
    .param p2, "newUser"    # Z

    .prologue
    .line 430
    const/16 v0, -0xb

    if-ne p1, v0, :cond_0

    .line 431
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 432
    .local v2, "extras":Landroid/os/Bundle;
    const-string/jumbo v0, "guest_user"

    const/4 v1, 0x1

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 433
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/android/settings_ex/SettingsActivity;

    .line 434
    const-class v1, Lcom/android/settings_ex/users/UserDetailsSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 435
    const v3, 0x7f0c005f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 433
    invoke-virtual/range {v0 .. v6}, Lcom/android/settings_ex/SettingsActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 436
    return-void

    .line 438
    .end local v2    # "extras":Landroid/os/Bundle;
    :cond_0
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v0, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v7

    .line 439
    .local v7, "info":Landroid/content/pm/UserInfo;
    invoke-virtual {v7}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v0, :cond_2

    .line 440
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 441
    .restart local v2    # "extras":Landroid/os/Bundle;
    const-string/jumbo v0, "user_id"

    invoke-virtual {v2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 442
    const-string/jumbo v0, "new_user"

    invoke-virtual {v2, v0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 443
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/android/settings_ex/SettingsActivity;

    .line 444
    const-class v1, Lcom/android/settings_ex/users/RestrictedProfileSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 445
    const v3, 0x7f0c0ce0

    const/4 v4, 0x0

    .line 446
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 443
    invoke-virtual/range {v0 .. v6}, Lcom/android/settings_ex/SettingsActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 429
    .end local v2    # "extras":Landroid/os/Bundle;
    :cond_1
    :goto_0
    return-void

    .line 447
    :cond_2
    iget v0, v7, Landroid/content/pm/UserInfo;->id:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 449
    invoke-static {p0}, Lcom/android/settings_ex/OwnerInfoSettings;->show(Landroid/app/Fragment;)V

    goto :goto_0

    .line 450
    :cond_3
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v0, :cond_1

    .line 451
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 452
    .restart local v2    # "extras":Landroid/os/Bundle;
    const-string/jumbo v0, "user_id"

    invoke-virtual {v2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 453
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/android/settings_ex/SettingsActivity;

    .line 454
    const-class v1, Lcom/android/settings_ex/users/UserDetailsSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 457
    iget-object v4, v7, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    .line 456
    const/4 v3, -0x1

    .line 458
    const/4 v5, 0x0

    .line 459
    const/4 v6, 0x0

    .line 453
    invoke-virtual/range {v0 .. v6}, Lcom/android/settings_ex/SettingsActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    goto :goto_0
.end method

.method private onRemoveUserClicked(I)V
    .locals 3
    .param p1, "userId"    # I

    .prologue
    .line 388
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 389
    :try_start_0
    iget v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit v1

    .line 387
    return-void

    .line 390
    :cond_1
    :try_start_1
    iput p1, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    .line 391
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 388
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private onUserCreated(I)V
    .locals 1
    .param p1, "userId"    # I

    .prologue
    .line 464
    iput p1, p0, Lcom/android/settings_ex/users/UserSettings;->mAddedUserId:I

    .line 465
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v0, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 466
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V

    .line 463
    :goto_0
    return-void

    .line 468
    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V

    goto :goto_0
.end method

.method private removeThisUser()V
    .locals 3

    .prologue
    .line 642
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/app/IActivityManager;->switchUser(I)Z

    .line 643
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    .line 644
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    .line 643
    invoke-virtual {v1, v2}, Landroid/os/UserManager;->removeUser(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    :goto_0
    return-void

    .line 645
    :catch_0
    move-exception v0

    .line 646
    .local v0, "re":Landroid/os/RemoteException;
    const-string/jumbo v1, "UserSettings"

    const-string/jumbo v2, "Unable to remove self user"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private removeUserNow()V
    .locals 2

    .prologue
    .line 626
    iget v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 627
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->removeThisUser()V

    .line 625
    :goto_0
    return-void

    .line 629
    :cond_0
    new-instance v0, Lcom/android/settings_ex/users/UserSettings$12;

    invoke-direct {v0, p0}, Lcom/android/settings_ex/users/UserSettings$12;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    invoke-virtual {v0}, Lcom/android/settings_ex/users/UserSettings$12;->start()V

    goto :goto_0
.end method

.method private setPhotoId(Landroid/preference/Preference;Landroid/content/pm/UserInfo;)V
    .locals 3
    .param p1, "pref"    # Landroid/preference/Preference;
    .param p2, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 886
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    iget v2, p2, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 887
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 888
    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 885
    :cond_0
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 893
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/os/UserManager;->setUserName(ILjava/lang/String;)V

    .line 894
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mNicknamePreference:Lcom/android/settings_ex/SelectableEditTextPreference;

    invoke-virtual {v0, p1}, Lcom/android/settings_ex/SelectableEditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 895
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 892
    return-void
.end method

.method private switchUserNow(I)V
    .locals 2
    .param p1, "userId"    # I

    .prologue
    .line 681
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/app/IActivityManager;->switchUser(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 679
    :goto_0
    return-void

    .line 682
    :catch_0
    move-exception v0

    .local v0, "re":Landroid/os/RemoteException;
    goto :goto_0
.end method

.method private updateUserList()V
    .locals 22

    .prologue
    .line 699
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_0

    return-void

    .line 700
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/UserManager;->getUsers(Z)Ljava/util/List;

    move-result-object v20

    .line 701
    .local v20, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 703
    .local v2, "context":Landroid/content/Context;
    invoke-static {v2}, Lcom/android/settings_ex/Utils;->isVoiceCapable(Landroid/content/Context;)Z

    move-result v21

    .line 704
    .local v21, "voiceCapable":Z
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 705
    .local v10, "missingIcons":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 706
    .local v19, "userPreferences":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/settings_ex/users/UserPreference;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 708
    invoke-interface/range {v20 .. v20}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "user$iterator":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/pm/UserInfo;

    .line 709
    .local v15, "user":Landroid/content/pm/UserInfo;
    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isManagedProfile()Z

    move-result v3

    if-nez v3, :cond_1

    .line 714
    iget v3, v15, Landroid/content/pm/UserInfo;->id:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v4

    if-ne v3, v4, :cond_3

    .line 715
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    .line 743
    .local v1, "pref":Lcom/android/settings_ex/users/UserPreference;
    :goto_1
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/settings_ex/users/UserSettings;->isInitialized(Landroid/content/pm/UserInfo;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 744
    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 745
    const v3, 0x7f0c0c5f

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setSummary(I)V

    .line 752
    :cond_2
    :goto_2
    iget-object v3, v15, Landroid/content/pm/UserInfo;->iconPath:Ljava/lang/String;

    if-eqz v3, :cond_f

    .line 753
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    iget v4, v15, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_e

    .line 755
    iget v3, v15, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 756
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 716
    .end local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    :cond_3
    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isGuest()Z

    move-result v3

    if-nez v3, :cond_1

    .line 728
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v3, :cond_7

    .line 729
    if-nez v21, :cond_6

    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v14

    .line 730
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v3, :cond_9

    .line 731
    if-nez v21, :cond_4

    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v3

    if-eqz v3, :cond_8

    :cond_4
    const/4 v13, 0x0

    .line 732
    .local v13, "showDelete":Z
    :goto_4
    new-instance v1, Lcom/android/settings_ex/users/UserPreference;

    iget v4, v15, Landroid/content/pm/UserInfo;->id:I

    .line 733
    if-eqz v14, :cond_a

    move-object/from16 v5, p0

    .line 734
    :goto_5
    if-eqz v13, :cond_b

    move-object/from16 v6, p0

    .line 732
    :goto_6
    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/android/settings_ex/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 735
    .restart local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Lcom/android/settings_ex/users/UserPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 736
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v15, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setKey(Ljava/lang/String;)V

    .line 737
    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 738
    iget v3, v15, Landroid/content/pm/UserInfo;->id:I

    if-nez v3, :cond_5

    .line 739
    const v3, 0x7f0c0c61

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setSummary(I)V

    .line 741
    :cond_5
    iget-object v3, v15, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 729
    .end local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    .end local v13    # "showDelete":Z
    :cond_6
    const/4 v14, 0x1

    .local v14, "showSettings":Z
    goto :goto_3

    .line 728
    .end local v14    # "showSettings":Z
    :cond_7
    const/4 v14, 0x0

    .restart local v14    # "showSettings":Z
    goto :goto_3

    .line 731
    .end local v14    # "showSettings":Z
    :cond_8
    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isGuest()Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v13, 0x1

    .restart local v13    # "showDelete":Z
    goto :goto_4

    .line 730
    .end local v13    # "showDelete":Z
    :cond_9
    const/4 v13, 0x0

    .restart local v13    # "showDelete":Z
    goto :goto_4

    .line 733
    :cond_a
    const/4 v5, 0x0

    goto :goto_5

    .line 734
    :cond_b
    const/4 v6, 0x0

    goto :goto_6

    .line 747
    .end local v13    # "showDelete":Z
    .restart local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    :cond_c
    const v3, 0x7f0c0c5e

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setSummary(I)V

    goto/16 :goto_2

    .line 749
    :cond_d
    invoke-virtual {v15}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 750
    const v3, 0x7f0c0c5b

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setSummary(I)V

    goto/16 :goto_2

    .line 758
    :cond_e
    move-object/from16 v0, p0

    invoke-direct {v0, v1, v15}, Lcom/android/settings_ex/users/UserSettings;->setPhotoId(Landroid/preference/Preference;Landroid/content/pm/UserInfo;)V

    goto/16 :goto_0

    .line 762
    :cond_f
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 767
    .end local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    .end local v15    # "user":Landroid/content/pm/UserInfo;
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z

    if-eqz v3, :cond_11

    .line 768
    new-instance v1, Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x0

    .line 769
    const/16 v6, -0xa

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v1

    .line 768
    invoke-direct/range {v3 .. v8}, Lcom/android/settings_ex/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 770
    .restart local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setEnabled(Z)V

    .line 771
    const v3, 0x7f0c0c76

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setTitle(I)V

    .line 772
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 773
    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 776
    .end local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsGuest:Z

    if-nez v3, :cond_13

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddGuest:Z

    if-nez v3, :cond_12

    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->findGuest()Landroid/content/pm/UserInfo;

    move-result-object v3

    if-eqz v3, :cond_13

    .line 778
    :cond_12
    new-instance v1, Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    .line 780
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v3, :cond_15

    if-eqz v21, :cond_15

    move-object/from16 v7, p0

    .line 778
    :goto_7
    const/4 v5, 0x0

    .line 779
    const/16 v6, -0xb

    .line 781
    const/4 v8, 0x0

    move-object v3, v1

    .line 778
    invoke-direct/range {v3 .. v8}, Lcom/android/settings_ex/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 782
    .restart local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    const v3, 0x7f0c005f

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setTitle(I)V

    .line 783
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getEncircledDefaultIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 784
    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Lcom/android/settings_ex/users/UserPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 785
    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 789
    .end local v1    # "pref":Lcom/android/settings_ex/users/UserPreference;
    :cond_13
    sget-object v3, Lcom/android/settings_ex/users/UserPreference;->SERIAL_NUMBER_COMPARATOR:Ljava/util/Comparator;

    move-object/from16 v0, v19

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 791
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 794
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_14

    .line 795
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/settings_ex/users/UserSettings;->loadIconsAsync(Ljava/util/List;)V

    .line 798
    :cond_14
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    .line 799
    .local v12, "preferenceScreen":Landroid/preference/PreferenceScreen;
    invoke-virtual {v12}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 805
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddRestrictedProfile:Z

    if-eqz v3, :cond_16

    .line 806
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v3}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 807
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    const v4, 0x7fffffff

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceGroup;->setOrder(I)V

    .line 808
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v12, v3}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 809
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/settings_ex/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    .line 813
    .local v9, "groupToAddUsers":Landroid/preference/PreferenceGroup;
    :goto_8
    invoke-interface/range {v19 .. v19}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, "userPreference$iterator":Ljava/util/Iterator;
    :goto_9
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/android/settings_ex/users/UserPreference;

    .line 814
    .local v17, "userPreference":Lcom/android/settings_ex/users/UserPreference;
    const v3, 0x7fffffff

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/android/settings_ex/users/UserPreference;->setOrder(I)V

    .line 815
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_9

    .line 780
    .end local v9    # "groupToAddUsers":Landroid/preference/PreferenceGroup;
    .end local v12    # "preferenceScreen":Landroid/preference/PreferenceScreen;
    .end local v17    # "userPreference":Lcom/android/settings_ex/users/UserPreference;
    .end local v18    # "userPreference$iterator":Ljava/util/Iterator;
    :cond_15
    const/4 v7, 0x0

    goto/16 :goto_7

    .line 811
    .restart local v12    # "preferenceScreen":Landroid/preference/PreferenceScreen;
    :cond_16
    move-object v9, v12

    .restart local v9    # "groupToAddUsers":Landroid/preference/PreferenceGroup;
    goto :goto_8

    .line 819
    .restart local v18    # "userPreference$iterator":Ljava/util/Iterator;
    :cond_17
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v3, v3, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddUser:Z

    if-eqz v3, :cond_18

    .line 820
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v3}, Landroid/os/UserManager;->canAddMoreUsers()Z

    move-result v11

    .line 821
    .local v11, "moreUsers":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    const v4, 0x7fffffff

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setOrder(I)V

    .line 822
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    invoke-virtual {v12, v3}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 823
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    invoke-virtual {v3, v11}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 824
    if-nez v11, :cond_19

    .line 825
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getMaxRealUsers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f0c0c65

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v4}, Lcom/android/settings_ex/users/UserSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 698
    .end local v11    # "moreUsers":Z
    :cond_18
    :goto_a
    return-void

    .line 827
    .restart local v11    # "moreUsers":Z
    :cond_19
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_a
.end method


# virtual methods
.method public getHelpResource()I
    .locals 1

    .prologue
    .line 1008
    const v0, 0x7f0c0cc5

    return v0
.end method

.method protected getMetricsCategory()I
    .locals 1

    .prologue
    .line 182
    const/16 v0, 0x60

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 357
    invoke-super {p0, p1, p2, p3}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 359
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 360
    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->hasLockscreenSecurity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->addUserNow(I)V

    .line 356
    :cond_0
    :goto_0
    return-void

    .line 364
    :cond_1
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/settings_ex/users/EditUserInfoController;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 971
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/android/settings_ex/users/UserPreference;

    if-eqz v1, :cond_0

    .line 972
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v1}, Lcom/android/settings_ex/users/UserPreference;->getUserId()I

    move-result v0

    .line 973
    .local v0, "userId":I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 970
    .end local v0    # "userId":I
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 975
    .restart local v0    # "userId":I
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->onRemoveUserClicked(I)V

    goto :goto_0

    .line 978
    :pswitch_2
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/settings_ex/users/UserSettings;->onManageUserClicked(IZ)V

    goto :goto_0

    .line 973
    nop

    :pswitch_data_0
    .packed-switch 0x7f1301ae
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 187
    invoke-super {p0, p1}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 189
    if-eqz p1, :cond_2

    .line 190
    const-string/jumbo v0, "adding_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    const-string/jumbo v0, "adding_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddedUserId:I

    .line 193
    :cond_0
    const-string/jumbo v0, "removing_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 194
    const-string/jumbo v0, "removing_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    invoke-virtual {v0, p1}, Lcom/android/settings_ex/users/EditUserInfoController;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 198
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 199
    .local v1, "context":Landroid/content/Context;
    invoke-static {v1}, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->create(Landroid/content/Context;)Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    .line 200
    const-string/jumbo v0, "user"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    .line 201
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mEnabled:Z

    if-nez v0, :cond_3

    .line 202
    return-void

    .line 205
    :cond_3
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v3

    .line 207
    .local v3, "myUserId":I
    const v0, 0x7f080065

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->addPreferencesFromResource(I)V

    .line 208
    const-string/jumbo v0, "user_list"

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    .line 209
    new-instance v0, Lcom/android/settings_ex/users/UserPreference;

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/settings_ex/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    .line 212
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    const-string/jumbo v4, "user_me"

    invoke-virtual {v0, v4}, Lcom/android/settings_ex/users/UserPreference;->setKey(Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v0, p0}, Lcom/android/settings_ex/users/UserPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 214
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v0, :cond_4

    .line 215
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    const v4, 0x7f0c0c61

    invoke-virtual {v0, v4}, Lcom/android/settings_ex/users/UserPreference;->setSummary(I)V

    .line 217
    :cond_4
    const-string/jumbo v0, "user_add"

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    .line 219
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddUser:Z

    if-eqz v0, :cond_5

    .line 220
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 222
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddRestrictedProfile:Z

    if-nez v0, :cond_5

    .line 223
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    const v4, 0x7f0c0c5a

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setTitle(I)V

    .line 226
    :cond_5
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->loadProfile()V

    .line 227
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->setHasOptionsMenu(Z)V

    .line 228
    new-instance v7, Landroid/content/IntentFilter;

    const-string/jumbo v0, "android.intent.action.USER_REMOVED"

    invoke-direct {v7, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 229
    .local v7, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v0, "android.intent.action.USER_INFO_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 230
    iget-object v5, p0, Lcom/android/settings_ex/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    sget-object v6, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    .line 231
    iget-object v9, p0, Lcom/android/settings_ex/users/UserSettings;->mHandler:Landroid/os/Handler;

    move-object v4, v1

    move-object v8, v2

    .line 230
    invoke-virtual/range {v4 .. v9}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 186
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 23
    .param p1, "dialogId"    # I

    .prologue
    .line 481
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v17

    .line 482
    .local v17, "context":Landroid/content/Context;
    if-nez v17, :cond_0

    const/4 v5, 0x0

    return-object v5

    .line 483
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 621
    const/4 v5, 0x0

    return-object v5

    .line 486
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    .line 487
    new-instance v8, Lcom/android/settings_ex/users/UserSettings$5;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lcom/android/settings_ex/users/UserSettings$5;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 486
    invoke-static {v5, v7, v8}, Lcom/android/settings_ex/users/UserDialogs;->createRemoveDialog(Landroid/content/Context;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v18

    .line 493
    .local v18, "dlg":Landroid/app/Dialog;
    return-object v18

    .line 496
    .end local v18    # "dlg":Landroid/app/Dialog;
    :pswitch_1
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 497
    const v7, 0x7f0c0c72

    .line 496
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 498
    const v7, 0x104000a

    const/4 v8, 0x0

    .line 496
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    return-object v5

    .line 501
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    .line 502
    const/4 v7, 0x0

    .line 501
    invoke-virtual {v5, v7}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v21

    .line 504
    .local v21, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v5, "key_add_user_long_message_displayed"

    const/4 v7, 0x0

    .line 503
    move-object/from16 v0, v21

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    .line 505
    .local v19, "longMessageDisplayed":Z
    if-eqz v19, :cond_1

    .line 506
    const v20, 0x7f0c0c6c

    .line 508
    .local v20, "messageResId":I
    :goto_0
    const/4 v5, 0x2

    move/from16 v0, p1

    if-ne v0, v5, :cond_2

    .line 509
    const/16 v22, 0x1

    .line 510
    .local v22, "userType":I
    :goto_1
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 511
    const v7, 0x7f0c0c6a

    .line 510
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 514
    new-instance v7, Lcom/android/settings_ex/users/UserSettings$6;

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v19

    move-object/from16 v3, v21

    invoke-direct {v7, v0, v1, v2, v3}, Lcom/android/settings_ex/users/UserSettings$6;-><init>(Lcom/android/settings_ex/users/UserSettings;IZLandroid/content/SharedPreferences;)V

    .line 513
    const v8, 0x104000a

    .line 510
    invoke-virtual {v5, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 523
    const/high16 v7, 0x1040000

    const/4 v8, 0x0

    .line 510
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    .line 525
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 507
    .end local v18    # "dlg":Landroid/app/Dialog;
    .end local v20    # "messageResId":I
    .end local v22    # "userType":I
    :cond_1
    const v20, 0x7f0c0c6b

    .restart local v20    # "messageResId":I
    goto :goto_0

    .line 509
    :cond_2
    const/16 v22, 0x2

    .restart local v22    # "userType":I
    goto :goto_1

    .line 528
    .end local v19    # "longMessageDisplayed":Z
    .end local v20    # "messageResId":I
    .end local v21    # "preferences":Landroid/content/SharedPreferences;
    .end local v22    # "userType":I
    :pswitch_3
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 529
    const v7, 0x7f0c0c6d

    .line 528
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 530
    const v7, 0x7f0c0c6e

    .line 528
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 532
    new-instance v7, Lcom/android/settings_ex/users/UserSettings$7;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/settings_ex/users/UserSettings$7;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 531
    const v8, 0x7f0c0c70

    .line 528
    invoke-virtual {v5, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 537
    const v7, 0x7f0c0c71

    const/4 v8, 0x0

    .line 528
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    .line 539
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 542
    .end local v18    # "dlg":Landroid/app/Dialog;
    :pswitch_4
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 543
    const v7, 0x7f0c0c6f

    .line 542
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 545
    new-instance v7, Lcom/android/settings_ex/users/UserSettings$8;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/settings_ex/users/UserSettings$8;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 544
    const v8, 0x104000a

    .line 542
    invoke-virtual {v5, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 550
    const/high16 v7, 0x1040000

    const/4 v8, 0x0

    .line 542
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    .line 552
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 555
    .end local v18    # "dlg":Landroid/app/Dialog;
    :pswitch_5
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 556
    .local v6, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 557
    .local v15, "addUserItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v5, "title"

    const v7, 0x7f0c0c68

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/settings_ex/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string/jumbo v5, "summary"

    const v7, 0x7f0c0c66

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/settings_ex/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 560
    .local v14, "addProfileItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v5, "title"

    const v7, 0x7f0c0c69

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/settings_ex/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    const-string/jumbo v5, "summary"

    const v7, 0x7f0c0c67

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/settings_ex/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    invoke-interface {v6, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 563
    invoke-interface {v6, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    new-instance v16, Landroid/app/AlertDialog$Builder;

    invoke-direct/range {v16 .. v17}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 565
    .local v16, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v4, Landroid/widget/SimpleAdapter;

    invoke-virtual/range {v16 .. v16}, Landroid/app/AlertDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 567
    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/String;

    const-string/jumbo v7, "title"

    const/4 v9, 0x0

    aput-object v7, v8, v9

    const-string/jumbo v7, "summary"

    const/4 v9, 0x1

    aput-object v7, v8, v9

    .line 568
    const v7, 0x7f130005

    const v9, 0x7f13005f

    filled-new-array {v7, v9}, [I

    move-result-object v9

    .line 566
    const v7, 0x7f04013c

    .line 565
    invoke-direct/range {v4 .. v9}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 569
    .local v4, "adapter":Landroid/widget/SimpleAdapter;
    const v5, 0x7f0c0c64

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 571
    new-instance v5, Lcom/android/settings_ex/users/UserSettings$9;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/settings_ex/users/UserSettings$9;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 570
    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 579
    invoke-virtual/range {v16 .. v16}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    return-object v5

    .line 582
    .end local v4    # "adapter":Landroid/widget/SimpleAdapter;
    .end local v6    # "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v14    # "addProfileItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v15    # "addUserItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v16    # "builder":Landroid/app/AlertDialog$Builder;
    :pswitch_6
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 583
    const v7, 0x7f0c0c5c

    .line 582
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 585
    new-instance v7, Lcom/android/settings_ex/users/UserSettings$10;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/settings_ex/users/UserSettings$10;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 584
    const v8, 0x7f0c0c5d

    .line 582
    invoke-virtual {v5, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 591
    const/high16 v7, 0x1040000

    const/4 v8, 0x0

    .line 582
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    .line 593
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 596
    .end local v18    # "dlg":Landroid/app/Dialog;
    :pswitch_7
    new-instance v5, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 597
    const v7, 0x7f0c0c84

    .line 596
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 598
    const v7, 0x7f0c0c85

    .line 596
    invoke-virtual {v5, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 600
    new-instance v7, Lcom/android/settings_ex/users/UserSettings$11;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/settings_ex/users/UserSettings$11;-><init>(Lcom/android/settings_ex/users/UserSettings;)V

    .line 599
    const v8, 0x7f0c0c86

    .line 596
    invoke-virtual {v5, v8, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 606
    const/high16 v7, 0x1040000

    const/4 v8, 0x0

    .line 596
    invoke-virtual {v5, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    .line 608
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 611
    .end local v18    # "dlg":Landroid/app/Dialog;
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    .line 613
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v5}, Lcom/android/settings_ex/users/UserPreference;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 614
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v5}, Lcom/android/settings_ex/users/UserPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v10

    .line 617
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v13

    .line 615
    const v11, 0x7f0c04f0

    move-object/from16 v8, p0

    move-object/from16 v12, p0

    .line 611
    invoke-virtual/range {v7 .. v13}, Lcom/android/settings_ex/users/EditUserInfoController;->createDialog(Landroid/app/Fragment;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;ILcom/android/settings_ex/users/EditUserInfoController$OnContentChangedCallback;Landroid/os/UserHandle;)Landroid/app/Dialog;

    move-result-object v18

    .line 618
    .restart local v18    # "dlg":Landroid/app/Dialog;
    return-object v18

    .line 483
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 11
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 269
    const/4 v2, 0x0

    .line 270
    .local v2, "pos":I
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "user"

    invoke-virtual {v8, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/UserManager;

    .line 271
    .local v5, "um":Landroid/os/UserManager;
    iget-object v8, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v8, v8, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-nez v8, :cond_0

    const-string/jumbo v8, "no_remove_user"

    invoke-virtual {v5, v8}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 277
    :cond_0
    :goto_0
    iget-object v8, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v8, v8, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsOwner:Z

    if-eqz v8, :cond_1

    const-string/jumbo v8, "no_add_user"

    invoke-virtual {v5, v8}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 284
    :cond_1
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 268
    return-void

    .line 272
    :cond_2
    iget-object v8, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v8}, Landroid/os/UserManager;->getUserName()Ljava/lang/String;

    move-result-object v1

    .line 273
    .local v1, "nickname":Ljava/lang/String;
    const/4 v2, 0x1

    .line 274
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    new-array v9, v6, [Ljava/lang/Object;

    aput-object v1, v9, v7

    const v10, 0x7f0c0c74

    invoke-virtual {v8, v10, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 273
    invoke-interface {p1, v7, v6, v7, v8}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v4

    .line 275
    .local v4, "removeThisUser":Landroid/view/MenuItem;
    invoke-interface {v4, v7}, Landroid/view/MenuItem;->setShowAsAction(I)V

    goto :goto_0

    .line 278
    .end local v1    # "nickname":Ljava/lang/String;
    .end local v4    # "removeThisUser":Landroid/view/MenuItem;
    :cond_3
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .local v3, "pos":I
    const/4 v8, 0x2

    .line 279
    const v9, 0x7f0c0c75

    .line 278
    invoke-interface {p1, v7, v8, v2, v9}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 280
    .local v0, "allowAddOnLockscreen":Landroid/view/MenuItem;
    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 281
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 282
    const-string/jumbo v9, "add_users_when_locked"

    .line 281
    invoke-static {v8, v9, v7}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    if-ne v8, v6, :cond_4

    :goto_2
    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move v2, v3

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    goto :goto_1

    .end local v2    # "pos":I
    .restart local v3    # "pos":I
    :cond_4
    move v6, v7

    goto :goto_2
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 246
    invoke-super {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onDestroy()V

    .line 248
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 250
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 245
    return-void
.end method

.method public onDialogShowing()V
    .locals 0

    .prologue
    .line 474
    invoke-super {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onDialogShowing()V

    .line 476
    invoke-virtual {p0, p0}, Lcom/android/settings_ex/users/UserSettings;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 473
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 986
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 987
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/settings_ex/users/UserSettings;->mAddingUser:Z

    .line 988
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    .line 989
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->updateUserList()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 985
    return-void

    .line 986
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onLabelChanged(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "label"    # Ljava/lang/CharSequence;

    .prologue
    .line 1018
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v0, p1}, Lcom/android/settings_ex/users/UserPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 1017
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 289
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 290
    .local v1, "itemId":I
    if-ne v1, v4, :cond_0

    .line 291
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->onRemoveUserClicked(I)V

    .line 292
    return v4

    .line 293
    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 294
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    .line 295
    .local v0, "isChecked":Z
    invoke-virtual {p0}, Lcom/android/settings_ex/users/UserSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "add_users_when_locked"

    .line 296
    if-eqz v0, :cond_1

    move v2, v3

    .line 295
    :goto_0
    invoke-static {v5, v6, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 297
    if-eqz v0, :cond_2

    :goto_1
    invoke-interface {p1, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 298
    return v4

    :cond_1
    move v2, v4

    .line 296
    goto :goto_0

    :cond_2
    move v3, v4

    .line 297
    goto :goto_1

    .line 300
    .end local v0    # "isChecked":Z
    :cond_3
    invoke-super {p0, p1}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method

.method public onPhotoChanged(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "photo"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1013
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    invoke-virtual {v0, p1}, Lcom/android/settings_ex/users/UserPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 1012
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 995
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mNicknamePreference:Lcom/android/settings_ex/SelectableEditTextPreference;

    if-ne p1, v1, :cond_1

    move-object v0, p2

    .line 996
    check-cast v0, Ljava/lang/String;

    .line 997
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/settings_ex/users/UserSettings;->mNicknamePreference:Lcom/android/settings_ex/SelectableEditTextPreference;

    if-ne p1, v1, :cond_0

    if-eqz v0, :cond_0

    .line 998
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 999
    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->setUserName(Ljava/lang/String;)V

    .line 1001
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 1003
    .end local v0    # "value":Ljava/lang/String;
    :cond_1
    return v2
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 8
    .param p1, "pref"    # Landroid/preference/Preference;

    .prologue
    const/4 v3, 0x1

    const/4 v7, 0x0

    .line 900
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mMePreference:Lcom/android/settings_ex/users/UserPreference;

    if-ne p1, v2, :cond_3

    .line 901
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v2, v2, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mIsGuest:Z

    if-eqz v2, :cond_0

    .line 902
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V

    .line 903
    return v3

    .line 906
    :cond_0
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2}, Landroid/os/UserManager;->isLinkedUser()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 907
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-direct {p0, v2, v7}, Lcom/android/settings_ex/users/UserSettings;->onManageUserClicked(IZ)V

    .line 934
    .end local p1    # "pref":Landroid/preference/Preference;
    :cond_1
    :goto_0
    return v7

    .line 909
    .restart local p1    # "pref":Landroid/preference/Preference;
    :cond_2
    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V

    goto :goto_0

    .line 911
    :cond_3
    instance-of v2, p1, Lcom/android/settings_ex/users/UserPreference;

    if-eqz v2, :cond_6

    .line 912
    check-cast p1, Lcom/android/settings_ex/users/UserPreference;

    .end local p1    # "pref":Landroid/preference/Preference;
    invoke-virtual {p1}, Lcom/android/settings_ex/users/UserPreference;->getUserId()I

    move-result v1

    .line 913
    .local v1, "userId":I
    const/16 v2, -0xb

    if-ne v1, v2, :cond_4

    .line 914
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->createAndSwitchToGuestUser()V

    goto :goto_0

    .line 917
    :cond_4
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2, v1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 918
    .local v0, "user":Landroid/content/pm/UserInfo;
    invoke-direct {p0, v0}, Lcom/android/settings_ex/users/UserSettings;->isInitialized(Landroid/content/pm/UserInfo;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 919
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/settings_ex/users/UserSettings;->mHandler:Landroid/os/Handler;

    .line 920
    iget v4, v0, Landroid/content/pm/UserInfo;->id:I

    iget v5, v0, Landroid/content/pm/UserInfo;->serialNumber:I

    const/4 v6, 0x2

    .line 919
    invoke-virtual {v3, v6, v4, v5}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 922
    :cond_5
    invoke-direct {p0, v1}, Lcom/android/settings_ex/users/UserSettings;->switchUserNow(I)V

    goto :goto_0

    .line 925
    .end local v0    # "user":Landroid/content/pm/UserInfo;
    .end local v1    # "userId":I
    .restart local p1    # "pref":Landroid/preference/Preference;
    :cond_6
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    if-ne p1, v2, :cond_1

    .line 928
    iget-object v2, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v2, v2, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mCanAddRestrictedProfile:Z

    if-eqz v2, :cond_7

    .line 929
    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Lcom/android/settings_ex/users/UserSettings;->showDialog(I)V

    goto :goto_0

    .line 931
    :cond_7
    invoke-direct {p0, v3}, Lcom/android/settings_ex/users/UserSettings;->onAddUserClicked(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 236
    invoke-super {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onResume()V

    .line 238
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mUserCaps:Lcom/android/settings_ex/users/UserSettings$UserCapabilities;

    iget-boolean v0, v0, Lcom/android/settings_ex/users/UserSettings$UserCapabilities;->mEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 240
    :cond_0
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->loadProfile()V

    .line 241
    invoke-direct {p0}, Lcom/android/settings_ex/users/UserSettings;->updateUserList()V

    .line 235
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 255
    invoke-super {p0, p1}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 256
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    invoke-virtual {v0, p1}, Lcom/android/settings_ex/users/EditUserInfoController;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 257
    const-string/jumbo v0, "adding_user"

    iget v1, p0, Lcom/android/settings_ex/users/UserSettings;->mAddedUserId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 258
    const-string/jumbo v0, "removing_user"

    iget v1, p0, Lcom/android/settings_ex/users/UserSettings;->mRemovingUserId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 254
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 263
    iget-object v0, p0, Lcom/android/settings_ex/users/UserSettings;->mEditUserInfoController:Lcom/android/settings_ex/users/EditUserInfoController;

    invoke-virtual {v0}, Lcom/android/settings_ex/users/EditUserInfoController;->startingActivityForResult()V

    .line 264
    invoke-super {p0, p1, p2}, Lcom/android/settings_ex/SettingsPreferenceFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 262
    return-void
.end method
