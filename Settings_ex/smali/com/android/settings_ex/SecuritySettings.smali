.class public Lcom/android/settings_ex/SecuritySettings;
.super Lcom/android/settings_ex/SettingsPreferenceFragment;
.source "SecuritySettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Lcom/android/settings_ex/search/Indexable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings_ex/SecuritySettings$SecuritySearchIndexProvider;
    }
.end annotation


# static fields
.field protected static final MY_USER_ID:I

.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings_ex/search/Indexable$SearchIndexProvider;

.field private static final SWITCH_PREFERENCE_KEYS:[Ljava/lang/String;

.field private static final TRUST_AGENT_INTENT:Landroid/content/Intent;


# instance fields
.field private mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

.field private mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mDirectlyShow:Landroid/preference/SwitchPreference;

.field private mFilterType:I

.field private mIsPrimary:Z

.field private mKeyStore:Landroid/security/KeyStore;

.field private mLockAfter:Landroid/preference/ListPreference;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mLockscreenDisabledPreference:Landroid/preference/Preference;

.field private mOwnerInfoPref:Landroid/preference/Preference;

.field private mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

.field private mResetCredentials:Landroid/preference/Preference;

.field private mShowPassword:Landroid/preference/SwitchPreference;

.field private mSmsSecurityCheck:Landroid/preference/ListPreference;

.field private mSubscriptionManager:Landroid/telephony/SubscriptionManager;

.field private mToggleAppInstallation:Landroid/preference/SwitchPreference;

.field private mTrustAgentClickIntent:Landroid/content/Intent;

.field private mVisibleDots:Landroid/preference/SwitchPreference;

.field private mVisibleErrorPattern:Landroid/preference/SwitchPreference;

.field private mVisiblePattern:Landroid/preference/SwitchPreference;

.field private mWarnInstallApps:Landroid/content/DialogInterface;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 85
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.service.trust.TrustAgentService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 84
    sput-object v0, Lcom/android/settings_ex/SecuritySettings;->TRUST_AGENT_INTENT:Landroid/content/Intent;

    .line 131
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "lock_after_timeout"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 132
    const-string/jumbo v1, "visiblepattern"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string/jumbo v1, "visible_error_pattern"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "visibledots"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string/jumbo v1, "directlyshow"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 133
    const-string/jumbo v1, "power_button_instantly_locks"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string/jumbo v1, "show_password"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string/jumbo v1, "toggle_install_applications"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 131
    sput-object v0, Lcom/android/settings_ex/SecuritySettings;->SWITCH_PREFERENCE_KEYS:[Ljava/lang/String;

    .line 138
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    sput v0, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    .line 927
    new-instance v0, Lcom/android/settings_ex/SecuritySettings$SecuritySearchIndexProvider;

    invoke-direct {v0}, Lcom/android/settings_ex/SecuritySettings$SecuritySearchIndexProvider;-><init>()V

    .line 926
    sput-object v0, Lcom/android/settings_ex/SecuritySettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings_ex/search/Indexable$SearchIndexProvider;

    .line 79
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;-><init>()V

    .line 171
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    .line 79
    return-void
.end method

.method private addTrustAgentSettings(Landroid/preference/PreferenceGroup;)V
    .locals 10
    .param p1, "securityCategory"    # Landroid/preference/PreferenceGroup;

    .prologue
    const/4 v9, 0x0

    .line 543
    iget-object v6, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    sget v7, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v6, v7}, Lcom/android/internal/widget/LockPatternUtils;->isSecure(I)Z

    move-result v2

    .line 545
    .local v2, "hasSecurity":Z
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v7, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget-object v8, p0, Lcom/android/settings_ex/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-static {v6, v7, v8}, Lcom/android/settings_ex/SecuritySettings;->getActiveTrustAgents(Landroid/content/pm/PackageManager;Lcom/android/internal/widget/LockPatternUtils;Landroid/app/admin/DevicePolicyManager;)Ljava/util/ArrayList;

    move-result-object v1

    .line 546
    .local v1, "agents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_2

    .line 547
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;

    .line 549
    .local v0, "agent":Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;
    new-instance v5, Landroid/preference/Preference;

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 550
    .local v5, "trustAgentPreference":Landroid/preference/Preference;
    const-string/jumbo v6, "trust_agent"

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 551
    iget-object v6, v0, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->title:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 552
    iget-object v6, v0, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->summary:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 554
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 555
    .local v4, "intent":Landroid/content/Intent;
    iget-object v6, v0, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 556
    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 557
    invoke-virtual {v5, v4}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 559
    invoke-virtual {p1, v5}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 561
    iget-boolean v6, v0, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->disabledByAdministrator:Z

    if-eqz v6, :cond_1

    .line 562
    invoke-virtual {v5, v9}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 563
    const v6, 0x7f0c0e10

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setSummary(I)V

    .line 546
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 564
    :cond_1
    if-nez v2, :cond_0

    .line 565
    invoke-virtual {v5, v9}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 566
    const v6, 0x7f0c057c

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_1

    .line 542
    .end local v0    # "agent":Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "trustAgentPreference":Landroid/preference/Preference;
    :cond_2
    return-void
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 43

    .prologue
    .line 253
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v27

    .line 254
    .local v27, "root":Landroid/preference/PreferenceScreen;
    if-eqz v27, :cond_0

    .line 255
    invoke-virtual/range {v27 .. v27}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 257
    :cond_0
    const v39, 0x7f080049

    move-object/from16 v0, p0

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addPreferencesFromResource(I)V

    .line 258
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v27

    .line 261
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    .line 264
    .local v24, "pm":Landroid/content/pm/PackageManager;
    sget v39, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    if-nez v39, :cond_12

    const/16 v39, 0x1

    :goto_0
    move/from16 v0, v39

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/settings_ex/SecuritySettings;->mIsPrimary:Z

    .line 266
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v39

    .line 267
    const-string/jumbo v40, "lockscreen_internally_enabled"

    const/16 v41, 0x1

    const/16 v42, 0x0

    .line 266
    invoke-static/range {v39 .. v42}, Lcyanogenmod/providers/CMSettings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v39

    .line 267
    const/16 v40, 0x1

    .line 266
    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_1

    .line 269
    new-instance v39, Landroid/preference/Preference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v40

    invoke-direct/range {v39 .. v40}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    move-object/from16 v39, v0

    const-string/jumbo v40, "lockscreen_enabled_internally"

    invoke-virtual/range {v39 .. v40}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    move-object/from16 v39, v0

    const v40, 0x7f0c02d7

    invoke-virtual/range {v39 .. v40}, Landroid/preference/Preference;->setTitle(I)V

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    move-object/from16 v39, v0

    const v40, 0x7f0c02d8

    invoke-virtual/range {v39 .. v40}, Landroid/preference/Preference;->setSummary(I)V

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    move-object/from16 v39, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 276
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    move/from16 v39, v0

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_13

    .line 277
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    move/from16 v39, v0

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-ne v0, v1, :cond_14

    const/16 v29, 0x1

    .line 278
    .local v29, "securityOrExternal":Z
    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    move/from16 v39, v0

    if-eqz v39, :cond_15

    .line 279
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    move/from16 v39, v0

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-ne v0, v1, :cond_16

    const/16 v20, 0x1

    .line 281
    .local v20, "lockscreenOrExternal":Z
    :goto_2
    if-eqz v20, :cond_2

    .line 283
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v40, v0

    invoke-static/range {v39 .. v40}, Lcom/android/settings_ex/SecuritySettings;->getResIdForLockUnlockScreen(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;)I

    move-result v26

    .line 284
    .local v26, "resid":I
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addPreferencesFromResource(I)V

    .line 286
    const-string/jumbo v39, "owner_info_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mOwnerInfoPref:Landroid/preference/Preference;

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mOwnerInfoPref:Landroid/preference/Preference;

    move-object/from16 v39, v0

    if-eqz v39, :cond_2

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mOwnerInfoPref:Landroid/preference/Preference;

    move-object/from16 v39, v0

    new-instance v40, Lcom/android/settings_ex/SecuritySettings$1;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/settings_ex/SecuritySettings$1;-><init>(Lcom/android/settings_ex/SecuritySettings;)V

    invoke-virtual/range {v39 .. v40}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 298
    .end local v26    # "resid":I
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/settings_ex/SecuritySettings;->mIsPrimary:Z

    move/from16 v39, v0

    if-eqz v39, :cond_3

    if-eqz v29, :cond_3

    .line 299
    invoke-static {}, Lcom/android/internal/widget/LockPatternUtils;->isDeviceEncryptionEnabled()Z

    move-result v39

    if-eqz v39, :cond_17

    .line 301
    const v39, 0x7f08004b

    move-object/from16 v0, p0

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addPreferencesFromResource(I)V

    .line 308
    :cond_3
    :goto_3
    if-eqz v20, :cond_8

    .line 311
    const-string/jumbo v39, "security_category"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v28

    .line 310
    check-cast v28, Landroid/preference/PreferenceGroup;

    .line 312
    .local v28, "securityCategory":Landroid/preference/PreferenceGroup;
    if-eqz v28, :cond_4

    .line 313
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->maybeAddFingerprintPreference(Landroid/preference/PreferenceGroup;)V

    .line 314
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addTrustAgentSettings(Landroid/preference/PreferenceGroup;)V

    .line 318
    :cond_4
    const-string/jumbo v39, "lock_after_timeout"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/ListPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    move-object/from16 v39, v0

    if-eqz v39, :cond_5

    .line 320
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->setupLockAfterPreference()V

    .line 321
    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 325
    :cond_5
    const-string/jumbo v39, "directlyshow"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mDirectlyShow:Landroid/preference/SwitchPreference;

    .line 328
    const-string/jumbo v39, "visiblepattern"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mVisiblePattern:Landroid/preference/SwitchPreference;

    .line 332
    const-string/jumbo v39, "visible_error_pattern"

    .line 331
    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/SwitchPreference;

    .line 335
    const-string/jumbo v39, "visibledots"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mVisibleDots:Landroid/preference/SwitchPreference;

    .line 339
    const-string/jumbo v39, "power_button_instantly_locks"

    .line 338
    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

    .line 340
    const-string/jumbo v39, "trust_agent"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v37

    .line 341
    .local v37, "trustAgentPreference":Landroid/preference/Preference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

    move-object/from16 v39, v0

    if-eqz v39, :cond_6

    .line 342
    if-eqz v37, :cond_6

    .line 343
    invoke-virtual/range {v37 .. v37}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v39

    invoke-interface/range {v39 .. v39}, Ljava/lang/CharSequence;->length()I

    move-result v39

    if-lez v39, :cond_6

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

    move-object/from16 v39, v0

    const/16 v40, 0x1

    move/from16 v0, v40

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v40, v0

    .line 346
    invoke-virtual/range {v37 .. v37}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v41

    const/16 v42, 0x0

    aput-object v41, v40, v42

    .line 345
    const v41, 0x7f0c0875

    .line 344
    move-object/from16 v0, p0

    move/from16 v1, v41

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/preference/SwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 351
    :cond_6
    const-string/jumbo v39, "general_category"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v11

    .line 350
    check-cast v11, Landroid/preference/PreferenceGroup;

    .line 352
    .local v11, "generalCategory":Landroid/preference/PreferenceGroup;
    const-string/jumbo v39, "org.cyanogenmod.livelockscreen"

    move-object/from16 v0, v24

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_7

    if-eqz v11, :cond_7

    invoke-static {}, Lcom/android/settings_ex/Utils;->isUserOwner()Z

    move-result v39

    if-eqz v39, :cond_7

    .line 353
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v39

    .line 354
    const v40, 0x7f10001a

    .line 353
    invoke-virtual/range {v39 .. v40}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v22

    .line 356
    .local v22, "moveToTop":Z
    if-eqz v22, :cond_18

    move-object/from16 v12, v27

    .line 357
    .local v12, "groupToAddTo":Landroid/preference/PreferenceGroup;
    :goto_4
    new-instance v19, Landroid/preference/Preference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getContext()Landroid/content/Context;

    move-result-object v39

    const/16 v40, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-direct {v0, v1, v2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 358
    .local v19, "liveLockPreference":Landroid/preference/Preference;
    new-instance v39, Landroid/content/Intent;

    const-string/jumbo v40, "cyanogenmod.intent.action.OPEN_LIVE_LOCKSCREEN_SETTINGS"

    invoke-direct/range {v39 .. v40}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 359
    const/16 v39, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOrder(I)V

    .line 360
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->setLiveLockScreenPreferenceTitleAndSummary(Landroid/preference/Preference;)V

    .line 361
    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 365
    .end local v12    # "groupToAddTo":Landroid/preference/PreferenceGroup;
    .end local v19    # "liveLockPreference":Landroid/preference/Preference;
    .end local v22    # "moveToTop":Z
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v39

    .line 366
    const v40, 0x11200bf

    .line 365
    invoke-virtual/range {v39 .. v40}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    .line 367
    .local v6, "blurSupported":Z
    if-nez v6, :cond_8

    if-eqz v11, :cond_8

    .line 368
    const-string/jumbo v39, "lock_screen_blur_enabled"

    move-object/from16 v0, v39

    invoke-virtual {v11, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 369
    .local v5, "blurEnabledPref":Landroid/preference/Preference;
    if-eqz v5, :cond_8

    invoke-virtual {v11, v5}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 373
    .end local v5    # "blurEnabledPref":Landroid/preference/Preference;
    .end local v6    # "blurSupported":Z
    .end local v11    # "generalCategory":Landroid/preference/PreferenceGroup;
    .end local v28    # "securityCategory":Landroid/preference/PreferenceGroup;
    .end local v37    # "trustAgentPreference":Landroid/preference/Preference;
    :cond_8
    if-eqz v29, :cond_10

    .line 375
    const v39, 0x7f08004e

    move-object/from16 v0, p0

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addPreferencesFromResource(I)V

    .line 379
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    const-string/jumbo v40, "carrier_config"

    invoke-virtual/range {v39 .. v40}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 378
    check-cast v7, Landroid/telephony/CarrierConfigManager;

    .line 380
    .local v7, "cfgMgr":Landroid/telephony/CarrierConfigManager;
    invoke-virtual {v7}, Landroid/telephony/CarrierConfigManager;->getConfig()Landroid/os/PersistableBundle;

    move-result-object v4

    .line 381
    .local v4, "b":Landroid/os/PersistableBundle;
    const-string/jumbo v39, "sim_lock"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v16

    check-cast v16, Landroid/preference/PreferenceGroup;

    .line 382
    .local v16, "iccLockGroup":Landroid/preference/PreferenceGroup;
    const-string/jumbo v39, "sim_lock_settings"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v15

    .line 384
    .local v15, "iccLock":Landroid/preference/Preference;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/settings_ex/SecuritySettings;->mIsPrimary:Z

    move/from16 v39, v0

    if-eqz v39, :cond_9

    .line 385
    const-string/jumbo v39, "hide_sim_lock_settings_bool"

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v39

    .line 384
    if-eqz v39, :cond_19

    .line 386
    :cond_9
    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 437
    :cond_a
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v39

    .line 438
    const-string/jumbo v40, "lock_to_app_enabled"

    const/16 v41, 0x0

    .line 437
    invoke-static/range {v39 .. v41}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v39

    if-eqz v39, :cond_b

    .line 439
    const-string/jumbo v39, "screen_pinning_settings"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    .line 440
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    const v41, 0x7f0c0dc6

    invoke-virtual/range {v40 .. v41}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 439
    invoke-virtual/range {v39 .. v40}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 444
    :cond_b
    const-string/jumbo v39, "android.hardware.telephony"

    move-object/from16 v0, v24

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v18

    .line 445
    .local v18, "isTelephony":Z
    if-eqz v18, :cond_c

    .line 446
    const-string/jumbo v39, "sms_security_check_limit"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/ListPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/lang/Integer;->intValue()I

    move-result v33

    .line 449
    .local v33, "smsSecurityCheck":I
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->updateSmsSecuritySummary(I)V

    .line 453
    .end local v33    # "smsSecurityCheck":I
    :cond_c
    const-string/jumbo v39, "show_password"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mShowPassword:Landroid/preference/SwitchPreference;

    .line 454
    const-string/jumbo v39, "credentials_reset"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    .line 457
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    const-string/jumbo v40, "user"

    invoke-virtual/range {v39 .. v40}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v38

    check-cast v38, Landroid/os/UserManager;

    .line 458
    .local v38, "um":Landroid/os/UserManager;
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    .line 459
    const-string/jumbo v39, "no_config_credentials"

    invoke-virtual/range {v38 .. v39}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_22

    .line 460
    const-string/jumbo v39, "credential_storage_type"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    .line 463
    .local v8, "credentialStorageType":Landroid/preference/Preference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/security/KeyStore;->isHardwareBacked()Z

    move-result v39

    if-eqz v39, :cond_21

    const v34, 0x7f0c0af4

    .line 465
    .local v34, "storageSummaryRes":I
    :goto_6
    move/from16 v0, v34

    invoke-virtual {v8, v0}, Landroid/preference/Preference;->setSummary(I)V

    .line 476
    .end local v8    # "credentialStorageType":Landroid/preference/Preference;
    .end local v34    # "storageSummaryRes":I
    :goto_7
    const-string/jumbo v39, "device_admin_category"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    .line 475
    check-cast v10, Landroid/preference/PreferenceGroup;

    .line 478
    .local v10, "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    const-string/jumbo v39, "toggle_install_applications"

    .line 477
    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    check-cast v39, Landroid/preference/SwitchPreference;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    move-object/from16 v39, v0

    invoke-direct/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->isNonMarketAppsAllowed()Z

    move-result v40

    invoke-virtual/range {v39 .. v40}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    move-object/from16 v40, v0

    sget v39, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual/range {v38 .. v39}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v39

    if-eqz v39, :cond_23

    const/16 v39, 0x0

    :goto_8
    move-object/from16 v0, v40

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    .line 483
    const-string/jumbo v39, "no_install_unknown_sources"

    invoke-virtual/range {v38 .. v39}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_d

    .line 484
    const-string/jumbo v39, "no_install_apps"

    invoke-virtual/range {v38 .. v39}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v39

    .line 483
    if-eqz v39, :cond_e

    .line 485
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    .line 490
    :cond_e
    const-string/jumbo v39, "advanced_security"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceGroup;

    .line 491
    .local v3, "advancedCategory":Landroid/preference/PreferenceGroup;
    if-eqz v3, :cond_f

    .line 492
    const-string/jumbo v39, "manage_trust_agents"

    move-object/from16 v0, v39

    invoke-virtual {v3, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v21

    .line 493
    .local v21, "manageAgents":Landroid/preference/Preference;
    if-eqz v21, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v39, v0

    sget v40, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual/range {v39 .. v40}, Lcom/android/internal/widget/LockPatternUtils;->isSecure(I)Z

    move-result v39

    if-eqz v39, :cond_24

    .line 502
    .end local v21    # "manageAgents":Landroid/preference/Preference;
    :cond_f
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Lcom/android/settings_ex/search/Index;->getInstance(Landroid/content/Context;)Lcom/android/settings_ex/search/Index;

    move-result-object v39

    .line 503
    const-class v40, Lcom/android/settings_ex/SecuritySettings;

    invoke-virtual/range {v40 .. v40}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v40

    const/16 v41, 0x1

    const/16 v42, 0x1

    .line 502
    invoke-virtual/range {v39 .. v42}, Lcom/android/settings_ex/search/Index;->updateFromClassNameResource(Ljava/lang/String;ZZ)V

    .line 505
    .end local v3    # "advancedCategory":Landroid/preference/PreferenceGroup;
    .end local v4    # "b":Landroid/os/PersistableBundle;
    .end local v7    # "cfgMgr":Landroid/telephony/CarrierConfigManager;
    .end local v10    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v15    # "iccLock":Landroid/preference/Preference;
    .end local v16    # "iccLockGroup":Landroid/preference/PreferenceGroup;
    .end local v18    # "isTelephony":Z
    .end local v38    # "um":Landroid/os/UserManager;
    :cond_10
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_a
    sget-object v39, Lcom/android/settings_ex/SecuritySettings;->SWITCH_PREFERENCE_KEYS:[Ljava/lang/String;

    move-object/from16 v0, v39

    array-length v0, v0

    move/from16 v39, v0

    move/from16 v0, v39

    if-ge v14, v0, :cond_25

    .line 506
    sget-object v39, Lcom/android/settings_ex/SecuritySettings;->SWITCH_PREFERENCE_KEYS:[Ljava/lang/String;

    aget-object v39, v39, v14

    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v25

    .line 507
    .local v25, "pref":Landroid/preference/Preference;
    if-eqz v25, :cond_11

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 505
    :cond_11
    add-int/lit8 v14, v14, 0x1

    goto :goto_a

    .line 264
    .end local v14    # "i":I
    .end local v20    # "lockscreenOrExternal":Z
    .end local v25    # "pref":Landroid/preference/Preference;
    .end local v29    # "securityOrExternal":Z
    :cond_12
    const/16 v39, 0x0

    goto/16 :goto_0

    .line 276
    :cond_13
    const/16 v29, 0x1

    .restart local v29    # "securityOrExternal":Z
    goto/16 :goto_1

    .line 277
    .end local v29    # "securityOrExternal":Z
    :cond_14
    const/16 v29, 0x0

    .restart local v29    # "securityOrExternal":Z
    goto/16 :goto_1

    .line 278
    :cond_15
    const/16 v20, 0x1

    .restart local v20    # "lockscreenOrExternal":Z
    goto/16 :goto_2

    .line 279
    .end local v20    # "lockscreenOrExternal":Z
    :cond_16
    const/16 v20, 0x0

    .restart local v20    # "lockscreenOrExternal":Z
    goto/16 :goto_2

    .line 304
    :cond_17
    const v39, 0x7f080054

    move-object/from16 v0, p0

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_3

    .line 356
    .restart local v11    # "generalCategory":Landroid/preference/PreferenceGroup;
    .restart local v22    # "moveToTop":Z
    .restart local v28    # "securityCategory":Landroid/preference/PreferenceGroup;
    .restart local v37    # "trustAgentPreference":Landroid/preference/Preference;
    :cond_18
    move-object v12, v11

    .restart local v12    # "groupToAddTo":Landroid/preference/PreferenceGroup;
    goto/16 :goto_4

    .line 388
    .end local v11    # "generalCategory":Landroid/preference/PreferenceGroup;
    .end local v12    # "groupToAddTo":Landroid/preference/PreferenceGroup;
    .end local v22    # "moveToTop":Z
    .end local v28    # "securityCategory":Landroid/preference/PreferenceGroup;
    .end local v37    # "trustAgentPreference":Landroid/preference/Preference;
    .restart local v4    # "b":Landroid/os/PersistableBundle;
    .restart local v7    # "cfgMgr":Landroid/telephony/CarrierConfigManager;
    .restart local v15    # "iccLock":Landroid/preference/Preference;
    .restart local v16    # "iccLockGroup":Landroid/preference/PreferenceGroup;
    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v35

    .line 389
    .local v35, "subMgr":Landroid/telephony/SubscriptionManager;
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v36

    .line 390
    .local v36, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual/range {v36 .. v36}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v23

    .line 391
    .local v23, "numPhones":I
    const/4 v13, 0x0

    .line 393
    .local v13, "hasAnySim":Z
    const/4 v14, 0x0

    .end local v13    # "hasAnySim":Z
    .restart local v14    # "i":I
    :goto_b
    move/from16 v0, v23

    if-ge v14, v0, :cond_1f

    .line 396
    const/16 v39, 0x1

    move/from16 v0, v23

    move/from16 v1, v39

    if-le v0, v1, :cond_1c

    .line 397
    move-object/from16 v0, v35

    invoke-virtual {v0, v14}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoForSimSlotIndex(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v32

    .line 398
    .local v32, "sir":Landroid/telephony/SubscriptionInfo;
    if-nez v32, :cond_1b

    .line 393
    .end local v32    # "sir":Landroid/telephony/SubscriptionInfo;
    :cond_1a
    :goto_c
    add-int/lit8 v14, v14, 0x1

    goto :goto_b

    .line 402
    .restart local v32    # "sir":Landroid/telephony/SubscriptionInfo;
    :cond_1b
    new-instance v25, Landroid/preference/Preference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    move-object/from16 v0, v25

    move-object/from16 v1, v39

    invoke-direct {v0, v1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 403
    .restart local v25    # "pref":Landroid/preference/Preference;
    invoke-virtual {v15}, Landroid/preference/Preference;->getOrder()I

    move-result v39

    move-object/from16 v0, v25

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOrder(I)V

    .line 404
    const/16 v39, 0x1

    move/from16 v0, v39

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v39, v0

    add-int/lit8 v40, v14, 0x1

    invoke-static/range {v40 .. v40}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v40

    const/16 v41, 0x0

    aput-object v40, v39, v41

    const v40, 0x7f0c0360

    move-object/from16 v0, p0

    move/from16 v1, v40

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v25

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 405
    invoke-virtual/range {v32 .. v32}, Landroid/telephony/SubscriptionInfo;->getDisplayName()Ljava/lang/CharSequence;

    move-result-object v39

    move-object/from16 v0, v25

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 407
    new-instance v17, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v39

    const-class v40, Lcom/android/settings_ex/IccLockSettings;

    move-object/from16 v0, v17

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 408
    .local v17, "intent":Landroid/content/Intent;
    const-string/jumbo v39, "slot_id"

    invoke-virtual/range {v32 .. v32}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v40

    move-object/from16 v0, v17

    move-object/from16 v1, v39

    move/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 409
    const-string/jumbo v39, "sub_display_name"

    .line 410
    invoke-virtual/range {v32 .. v32}, Landroid/telephony/SubscriptionInfo;->getDisplayName()Ljava/lang/CharSequence;

    move-result-object v40

    .line 409
    move-object/from16 v0, v17

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 411
    move-object/from16 v0, v25

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 413
    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 419
    .end local v17    # "intent":Landroid/content/Intent;
    .end local v32    # "sir":Landroid/telephony/SubscriptionInfo;
    :goto_d
    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/TelephonyManager;->hasIccCard(I)Z

    move-result v39

    or-int v13, v13, v39

    .line 421
    .local v13, "hasAnySim":Z
    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/TelephonyManager;->getSimState(I)I

    move-result v31

    .line 422
    .local v31, "simState":I
    const/16 v39, 0x1

    move/from16 v0, v31

    move/from16 v1, v39

    if-eq v0, v1, :cond_1e

    .line 423
    if-eqz v31, :cond_1e

    .line 424
    const/16 v39, 0x8

    move/from16 v0, v31

    move/from16 v1, v39

    if-eq v0, v1, :cond_1d

    const/16 v30, 0x1

    .line 425
    .local v30, "simPresent":Z
    :goto_e
    if-nez v30, :cond_1a

    .line 426
    const/16 v39, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_c

    .line 415
    .end local v13    # "hasAnySim":Z
    .end local v25    # "pref":Landroid/preference/Preference;
    .end local v30    # "simPresent":Z
    .end local v31    # "simState":I
    :cond_1c
    move-object/from16 v25, v15

    .restart local v25    # "pref":Landroid/preference/Preference;
    goto :goto_d

    .line 424
    .restart local v13    # "hasAnySim":Z
    .restart local v31    # "simState":I
    :cond_1d
    const/16 v30, 0x0

    .restart local v30    # "simPresent":Z
    goto :goto_e

    .line 422
    .end local v30    # "simPresent":Z
    :cond_1e
    const/16 v30, 0x0

    .restart local v30    # "simPresent":Z
    goto :goto_e

    .line 430
    .end local v13    # "hasAnySim":Z
    .end local v25    # "pref":Landroid/preference/Preference;
    .end local v30    # "simPresent":Z
    .end local v31    # "simState":I
    :cond_1f
    if-nez v13, :cond_20

    .line 431
    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_5

    .line 432
    :cond_20
    const/16 v39, 0x1

    move/from16 v0, v23

    move/from16 v1, v39

    if-le v0, v1, :cond_a

    .line 433
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_5

    .line 464
    .end local v14    # "i":I
    .end local v23    # "numPhones":I
    .end local v35    # "subMgr":Landroid/telephony/SubscriptionManager;
    .end local v36    # "tm":Landroid/telephony/TelephonyManager;
    .restart local v8    # "credentialStorageType":Landroid/preference/Preference;
    .restart local v18    # "isTelephony":Z
    .restart local v38    # "um":Landroid/os/UserManager;
    :cond_21
    const v34, 0x7f0c0af5

    .restart local v34    # "storageSummaryRes":I
    goto/16 :goto_6

    .line 468
    .end local v8    # "credentialStorageType":Landroid/preference/Preference;
    .end local v34    # "storageSummaryRes":I
    :cond_22
    const-string/jumbo v39, "credentials_management"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    .line 467
    check-cast v9, Landroid/preference/PreferenceGroup;

    .line 469
    .local v9, "credentialsManager":Landroid/preference/PreferenceGroup;
    const-string/jumbo v39, "credentials_reset"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 470
    const-string/jumbo v39, "credentials_install"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 471
    const-string/jumbo v39, "credential_storage_type"

    move-object/from16 v0, v27

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_7

    .line 482
    .end local v9    # "credentialsManager":Landroid/preference/PreferenceGroup;
    .restart local v10    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    :cond_23
    const/16 v39, 0x1

    goto/16 :goto_8

    .line 494
    .restart local v3    # "advancedCategory":Landroid/preference/PreferenceGroup;
    .restart local v21    # "manageAgents":Landroid/preference/Preference;
    :cond_24
    const/16 v39, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 495
    const v39, 0x7f0c057c

    move-object/from16 v0, v21

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    goto/16 :goto_9

    .line 510
    .end local v3    # "advancedCategory":Landroid/preference/PreferenceGroup;
    .end local v4    # "b":Landroid/os/PersistableBundle;
    .end local v7    # "cfgMgr":Landroid/telephony/CarrierConfigManager;
    .end local v10    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v15    # "iccLock":Landroid/preference/Preference;
    .end local v16    # "iccLockGroup":Landroid/preference/PreferenceGroup;
    .end local v18    # "isTelephony":Z
    .end local v21    # "manageAgents":Landroid/preference/Preference;
    .end local v38    # "um":Landroid/os/UserManager;
    .restart local v14    # "i":I
    :cond_25
    return-object v27
.end method

.method private disableUnusableTimeouts(J)V
    .locals 13
    .param p1, "maxTimeout"    # J

    .prologue
    const/4 v9, 0x0

    .line 701
    iget-object v8, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 702
    .local v0, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 703
    .local v7, "values":[Ljava/lang/CharSequence;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 704
    .local v2, "revisedEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 705
    .local v3, "revisedValues":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v8, v7

    if-ge v1, v8, :cond_1

    .line 706
    aget-object v8, v7, v1

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 707
    .local v4, "timeout":J
    cmp-long v8, v4, p1

    if-gtz v8, :cond_0

    .line 708
    aget-object v8, v0, v1

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 709
    aget-object v8, v7, v1

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 705
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 712
    .end local v4    # "timeout":J
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    array-length v10, v0

    if-ne v8, v10, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    array-length v10, v7

    if-eq v8, v10, :cond_3

    .line 713
    :cond_2
    iget-object v10, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    .line 714
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    .line 713
    invoke-virtual {v10, v8}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 715
    iget-object v10, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    .line 716
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    .line 715
    invoke-virtual {v10, v8}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 717
    iget-object v8, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 718
    .local v6, "userPreference":I
    int-to-long v10, v6

    cmp-long v8, v10, p1

    if-gtz v8, :cond_3

    .line 719
    iget-object v8, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 726
    .end local v6    # "userPreference":I
    :cond_3
    iget-object v10, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_4

    const/4 v8, 0x1

    :goto_1
    invoke-virtual {v10, v8}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 700
    return-void

    :cond_4
    move v8, v9

    .line 726
    goto :goto_1
.end method

.method protected static getActiveTrustAgents(Landroid/content/pm/PackageManager;Lcom/android/internal/widget/LockPatternUtils;Landroid/app/admin/DevicePolicyManager;)Ljava/util/ArrayList;
    .locals 10
    .param p0, "pm"    # Landroid/content/pm/PackageManager;
    .param p1, "utils"    # Lcom/android/internal/widget/LockPatternUtils;
    .param p2, "dpm"    # Landroid/app/admin/DevicePolicyManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/PackageManager;",
            "Lcom/android/internal/widget/LockPatternUtils;",
            "Landroid/app/admin/DevicePolicyManager;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 573
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 574
    .local v5, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;>;"
    sget-object v7, Lcom/android/settings_ex/SecuritySettings;->TRUST_AGENT_INTENT:Landroid/content/Intent;

    .line 575
    const/16 v8, 0x80

    .line 574
    invoke-virtual {p0, v7, v8}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 576
    .local v4, "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    sget v7, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {p1, v7}, Lcom/android/internal/widget/LockPatternUtils;->getEnabledTrustAgents(I)Ljava/util/List;

    move-result-object v1

    .line 578
    .local v1, "enabledTrustAgents":Ljava/util/List;, "Ljava/util/List<Landroid/content/ComponentName;>;"
    invoke-virtual {p2, v9}, Landroid/app/admin/DevicePolicyManager;->getKeyguardDisabledFeatures(Landroid/content/ComponentName;)I

    move-result v7

    and-int/lit8 v7, v7, 0x10

    if-eqz v7, :cond_1

    const/4 v0, 0x1

    .line 581
    .local v0, "disableTrustAgents":Z
    :goto_0
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 600
    :cond_0
    :goto_1
    return-object v5

    .line 578
    .end local v0    # "disableTrustAgents":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "disableTrustAgents":Z
    goto :goto_0

    .line 582
    :cond_2
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_0

    .line 583
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 584
    .local v3, "resolveInfo":Landroid/content/pm/ResolveInfo;
    iget-object v7, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-nez v7, :cond_4

    .line 582
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 585
    :cond_4
    invoke-static {v3, p0}, Lcom/android/settings_ex/TrustAgentUtils;->checkProvidePermission(Landroid/content/pm/ResolveInfo;Landroid/content/pm/PackageManager;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 587
    invoke-static {p0, v3}, Lcom/android/settings_ex/TrustAgentUtils;->getSettingsComponent(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;)Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;

    move-result-object v6

    .line 588
    .local v6, "trustAgentComponentInfo":Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;
    iget-object v7, v6, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->componentName:Landroid/content/ComponentName;

    if-eqz v7, :cond_3

    .line 590
    invoke-static {v3}, Lcom/android/settings_ex/TrustAgentUtils;->getComponentName(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v7

    .line 589
    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 591
    iget-object v7, v6, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->title:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    .line 588
    if-nez v7, :cond_3

    .line 592
    if-eqz v0, :cond_5

    .line 593
    invoke-static {v3}, Lcom/android/settings_ex/TrustAgentUtils;->getComponentName(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v7

    .line 592
    invoke-virtual {p2, v9, v7}, Landroid/app/admin/DevicePolicyManager;->getTrustAgentConfiguration(Landroid/content/ComponentName;Landroid/content/ComponentName;)Ljava/util/List;

    move-result-object v7

    if-nez v7, :cond_5

    .line 594
    const/4 v7, 0x1

    iput-boolean v7, v6, Lcom/android/settings_ex/TrustAgentUtils$TrustAgentComponentInfo;->disabledByAdministrator:Z

    .line 596
    :cond_5
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method protected static getResIdForLockUnlockScreen(Landroid/content/Context;Lcom/android/internal/widget/LockPatternUtils;)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "lockPatternUtils"    # Lcom/android/internal/widget/LockPatternUtils;

    .prologue
    .line 220
    const/4 v0, 0x0

    .line 221
    .local v0, "resid":I
    sget v1, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {p1, v1}, Lcom/android/internal/widget/LockPatternUtils;->isSecure(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 222
    sget v1, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {p1, v1}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 223
    const v0, 0x7f08004d

    .line 243
    :goto_0
    return v0

    .line 225
    :cond_0
    const v0, 0x7f08004a

    goto :goto_0

    .line 228
    :cond_1
    sget v1, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {p1, v1}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality(I)I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 230
    :sswitch_0
    const v0, 0x7f080050

    .line 231
    goto :goto_0

    .line 234
    :sswitch_1
    const v0, 0x7f080053

    .line 235
    goto :goto_0

    .line 239
    :sswitch_2
    const v0, 0x7f08004f

    .line 240
    goto :goto_0

    .line 228
    nop

    :sswitch_data_0
    .sparse-switch
        0x10000 -> :sswitch_0
        0x20000 -> :sswitch_1
        0x30000 -> :sswitch_1
        0x40000 -> :sswitch_2
        0x50000 -> :sswitch_2
        0x60000 -> :sswitch_2
    .end sparse-switch
.end method

.method private isNonMarketAppsAllowed()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 604
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 605
    const-string/jumbo v2, "install_non_market_apps"

    .line 604
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private maybeAddFingerprintPreference(Landroid/preference/PreferenceGroup;)V
    .locals 10
    .param p1, "securityCategory"    # Landroid/preference/PreferenceGroup;

    .prologue
    const/4 v9, 0x0

    .line 514
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    .line 515
    const-string/jumbo v7, "fingerprint"

    .line 514
    invoke-virtual {v6, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/fingerprint/FingerprintManager;

    .line 516
    .local v3, "fpm":Landroid/hardware/fingerprint/FingerprintManager;
    invoke-virtual {v3}, Landroid/hardware/fingerprint/FingerprintManager;->isHardwareDetected()Z

    move-result v6

    if-nez v6, :cond_0

    .line 517
    const-string/jumbo v6, "SecuritySettings"

    const-string/jumbo v7, "No fingerprint hardware detected!!"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    return-void

    .line 520
    :cond_0
    new-instance v2, Landroid/preference/Preference;

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 521
    .local v2, "fingerprintPreference":Landroid/preference/Preference;
    const-string/jumbo v6, "fingerprint_settings"

    invoke-virtual {v2, v6}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 522
    const v6, 0x7f0c04f8

    invoke-virtual {v2, v6}, Landroid/preference/Preference;->setTitle(I)V

    .line 523
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 524
    .local v4, "intent":Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/hardware/fingerprint/FingerprintManager;->getEnrolledFingerprints()Ljava/util/List;

    move-result-object v5

    .line 525
    .local v5, "items":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/fingerprint/Fingerprint;>;"
    if-eqz v5, :cond_1

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    .line 527
    .local v1, "fingerprintCount":I
    :goto_0
    if-lez v1, :cond_2

    .line 528
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    .line 530
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    .line 529
    const v8, 0x7f110004

    .line 528
    invoke-virtual {v6, v8, v1, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 531
    const-class v6, Lcom/android/settings_ex/fingerprint/FingerprintSettings;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 537
    .local v0, "clazz":Ljava/lang/String;
    :goto_1
    const-string/jumbo v6, "com.android.settings"

    invoke-virtual {v4, v6, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 538
    invoke-virtual {v2, v4}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 539
    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 513
    return-void

    .line 525
    .end local v0    # "clazz":Ljava/lang/String;
    .end local v1    # "fingerprintCount":I
    :cond_1
    const/4 v1, 0x0

    .restart local v1    # "fingerprintCount":I
    goto :goto_0

    .line 534
    :cond_2
    const v6, 0x7f0c04fd

    .line 533
    invoke-virtual {v2, v6}, Landroid/preference/Preference;->setSummary(I)V

    .line 535
    const-class v6, Lcom/android/settings_ex/fingerprint/FingerprintEnrollIntroduction;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "clazz":Ljava/lang/String;
    goto :goto_1
.end method

.method private setLiveLockScreenPreferenceTitleAndSummary(Landroid/preference/Preference;)V
    .locals 14
    .param p1, "pref"    # Landroid/preference/Preference;

    .prologue
    const/4 v13, 0x0

    .line 891
    const v11, 0x7f0c0384

    invoke-virtual {p0, v11}, Lcom/android/settings_ex/SecuritySettings;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 892
    .local v9, "title":Ljava/lang/String;
    const v11, 0x7f0c0385

    invoke-virtual {p0, v11}, Lcom/android/settings_ex/SecuritySettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 893
    .local v7, "summary":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 895
    .local v5, "pm":Landroid/content/pm/PackageManager;
    new-instance v11, Landroid/content/Intent;

    const-string/jumbo v12, "cyanogenmod.intent.action.OPEN_LIVE_LOCKSCREEN_SETTINGS"

    invoke-direct {v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 894
    invoke-virtual {v5, v11, v13}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 896
    .local v4, "infos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v4, :cond_1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_1

    .line 897
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "info$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 898
    .local v2, "info":Landroid/content/pm/ResolveInfo;
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-virtual {v11}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v11

    iget-object v12, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 900
    :try_start_0
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v11

    .line 901
    iget-object v12, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const/4 v13, 0x0

    .line 900
    invoke-virtual {v11, v12, v13}, Landroid/app/Activity;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 902
    .local v0, "ctx":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 903
    .local v6, "res":Landroid/content/res/Resources;
    const-string/jumbo v11, "live_lock_screen_title"

    const-string/jumbo v12, "string"

    .line 904
    iget-object v13, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 903
    invoke-virtual {v6, v11, v12, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 905
    .local v10, "titleId":I
    const-string/jumbo v11, "live_lock_screen_summary"

    const-string/jumbo v12, "string"

    .line 906
    iget-object v13, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 905
    invoke-virtual {v6, v11, v12, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 907
    .local v8, "summaryId":I
    if-eqz v10, :cond_1

    if-eqz v8, :cond_1

    .line 908
    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 909
    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 919
    .end local v0    # "ctx":Landroid/content/Context;
    .end local v2    # "info":Landroid/content/pm/ResolveInfo;
    .end local v3    # "info$iterator":Ljava/util/Iterator;
    .end local v6    # "res":Landroid/content/res/Resources;
    .end local v8    # "summaryId":I
    .end local v10    # "titleId":I
    :cond_1
    :goto_0
    invoke-virtual {p1, v9}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 920
    invoke-virtual {p1, v7}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 890
    return-void

    .line 911
    .restart local v2    # "info":Landroid/content/pm/ResolveInfo;
    .restart local v3    # "info$iterator":Ljava/util/Iterator;
    :catch_0
    move-exception v1

    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method private setNonMarketAppsAllowed(Z)V
    .locals 4
    .param p1, "enabled"    # Z

    .prologue
    .line 609
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    .line 610
    .local v0, "um":Landroid/os/UserManager;
    const-string/jumbo v1, "no_install_unknown_sources"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 611
    return-void

    .line 614
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "install_non_market_apps"

    .line 615
    if-eqz p1, :cond_1

    const/4 v1, 0x1

    .line 614
    :goto_0
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 608
    return-void

    .line 615
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setupLockAfterPreference()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 657
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 658
    const-string/jumbo v7, "lock_screen_lock_after_timeout"

    const-wide/16 v8, 0x1388

    .line 657
    invoke-static {v6, v7, v8, v9}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    .line 659
    .local v2, "currentTimeout":J
    iget-object v6, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 660
    iget-object v6, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v6, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 661
    iget-object v6, p0, Lcom/android/settings_ex/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/android/settings_ex/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v6, v11}, Landroid/app/admin/DevicePolicyManager;->getMaximumTimeToLock(Landroid/content/ComponentName;)J

    move-result-wide v0

    .line 663
    .local v0, "adminTimeout":J
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string/jumbo v7, "screen_off_timeout"

    invoke-static {v6, v7, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    .line 662
    invoke-static {v10, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    int-to-long v4, v6

    .line 664
    .local v4, "displayTimeout":J
    cmp-long v6, v0, v12

    if-lez v6, :cond_0

    .line 668
    sub-long v6, v0, v4

    invoke-static {v12, v13, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/android/settings_ex/SecuritySettings;->disableUnusableTimeouts(J)V

    .line 655
    :cond_0
    return-void

    .line 661
    .end local v0    # "adminTimeout":J
    .end local v4    # "displayTimeout":J
    :cond_1
    const-wide/16 v0, 0x0

    .restart local v0    # "adminTimeout":J
    goto :goto_0
.end method

.method private updateLockAfterPreferenceSummary()V
    .locals 14

    .prologue
    .line 674
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 675
    const-string/jumbo v10, "lock_screen_lock_after_timeout"

    const-wide/16 v12, 0x1388

    .line 674
    invoke-static {v9, v10, v12, v13}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    .line 676
    .local v2, "currentTimeout":J
    iget-object v9, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v9}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 677
    .local v1, "entries":[Ljava/lang/CharSequence;
    iget-object v9, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v9}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v8

    .line 678
    .local v8, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 679
    .local v0, "best":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v9, v8

    if-ge v4, v9, :cond_1

    .line 680
    aget-object v9, v8, v4

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 681
    .local v6, "timeout":J
    cmp-long v9, v2, v6

    if-ltz v9, :cond_0

    .line 682
    move v0, v4

    .line 679
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 686
    .end local v6    # "timeout":J
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v9

    const-string/jumbo v10, "trust_agent"

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 687
    .local v5, "preference":Landroid/preference/Preference;
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-lez v9, :cond_3

    .line 688
    aget-object v9, v8, v0

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-nez v9, :cond_2

    .line 689
    iget-object v9, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    .line 690
    invoke-virtual {v5}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    .line 689
    const v11, 0x7f0c04e5

    invoke-virtual {p0, v11, v10}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 672
    :goto_1
    return-void

    .line 692
    :cond_2
    iget-object v9, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    .line 693
    aget-object v11, v1, v0

    const/4 v12, 0x0

    aput-object v11, v10, v12

    invoke-virtual {v5}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v11

    const/4 v12, 0x1

    aput-object v11, v10, v12

    .line 692
    const v11, 0x7f0c04e6

    invoke-virtual {p0, v11, v10}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 696
    :cond_3
    iget-object v9, p0, Lcom/android/settings_ex/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    aget-object v11, v1, v0

    const/4 v12, 0x0

    aput-object v11, v10, v12

    const v11, 0x7f0c04e4

    invoke-virtual {p0, v11, v10}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateSmsSecuritySummary(I)V
    .locals 4
    .param p1, "selection"    # I

    .prologue
    const/4 v3, 0x0

    .line 649
    if-lez p1, :cond_0

    .line 650
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const v2, 0x7f0c0314

    invoke-virtual {p0, v2, v1}, Lcom/android/settings_ex/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 652
    .local v0, "message":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 648
    return-void

    .line 651
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    const v1, 0x7f0c0315

    invoke-virtual {p0, v1}, Lcom/android/settings_ex/SecuritySettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "message":Ljava/lang/String;
    goto :goto_0
.end method

.method private warnAppInstallation()V
    .locals 3

    .prologue
    .line 620
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 621
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c07d3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 620
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 622
    const v1, 0x1080027

    .line 620
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 623
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0884

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 620
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 624
    const v1, 0x1040013

    .line 620
    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 625
    const v1, 0x1040009

    .line 620
    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    .line 618
    return-void
.end method


# virtual methods
.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 880
    const v0, 0x7f0c0cc7

    return v0
.end method

.method protected getMetricsCategory()I
    .locals 1

    .prologue
    .line 177
    const/16 v0, 0x57

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, 0x0

    .line 820
    invoke-super {p0, p1, p2, p3}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 821
    const/16 v0, 0x7e

    if-ne p1, v0, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 822
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 823
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/SecuritySettings;->startActivity(Landroid/content/Intent;)V

    .line 824
    iput-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    .line 826
    :cond_0
    return-void

    .line 828
    :cond_1
    invoke-direct {p0}, Lcom/android/settings_ex/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 819
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 631
    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-ne p1, v1, :cond_0

    .line 632
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    const/4 v0, 0x1

    .line 633
    .local v0, "turnOn":Z
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/settings_ex/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    .line 634
    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    if-eqz v1, :cond_0

    .line 635
    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    invoke-virtual {v1, v0}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 630
    .end local v0    # "turnOn":Z
    :cond_0
    return-void

    .line 632
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "turnOn":Z
    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 182
    invoke-super {p0, p1}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 185
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 186
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    .line 187
    .local v1, "componentName":Landroid/content/ComponentName;
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    .line 188
    const-class v5, Lcom/android/settings_ex/Settings$LockScreenSettingsActivity;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 187
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 189
    const/4 v4, 0x0

    iput v4, p0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    .line 197
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 199
    .local v2, "extras":Landroid/os/Bundle;
    if-eqz v2, :cond_1

    const-string/jumbo v4, ":settings:show_fragment_args"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 200
    const-string/jumbo v4, ":settings:show_fragment_as_shortcut"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    .line 201
    const/4 v4, 0x2

    iput v4, p0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    .line 204
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v4

    iput-object v4, p0, Lcom/android/settings_ex/SecuritySettings;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    .line 206
    new-instance v4, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 208
    const-string/jumbo v4, "device_policy"

    invoke-virtual {p0, v4}, Lcom/android/settings_ex/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/admin/DevicePolicyManager;

    iput-object v4, p0, Lcom/android/settings_ex/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 210
    new-instance v4, Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/settings_ex/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v4, p0, Lcom/android/settings_ex/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

    .line 212
    if-eqz p1, :cond_2

    .line 213
    const-string/jumbo v4, "trust_agent_click_intent"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    .line 212
    if-eqz v4, :cond_2

    .line 214
    const-string/jumbo v4, "trust_agent_click_intent"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    iput-object v4, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    .line 181
    :cond_2
    return-void

    .line 191
    .end local v2    # "extras":Landroid/os/Bundle;
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 192
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 193
    const-string/jumbo v4, "filter_type"

    const/4 v5, 0x1

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/android/settings_ex/SecuritySettings;->mFilterType:I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 642
    invoke-super {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onDestroy()V

    .line 643
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-eqz v0, :cond_0

    .line 644
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    .line 641
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 11
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v8, 0x0

    .line 833
    const/4 v4, 0x1

    .line 834
    .local v4, "result":Z
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 835
    .local v2, "key":Ljava/lang/String;
    iget-object v7, p0, Lcom/android/settings_ex/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {v7}, Lcom/android/settings_ex/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v3

    .line 836
    .local v3, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    iget-object v7, p0, Lcom/android/settings_ex/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {v7}, Lcom/android/settings_ex/ChooseLockSettingsHelper;->cmUtils()Lorg/cyanogenmod/internal/util/CmLockPatternUtils;

    move-result-object v0

    .line 837
    .local v0, "cmLockPatternUtils":Lorg/cyanogenmod/internal/util/CmLockPatternUtils;
    const-string/jumbo v7, "lock_after_timeout"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 838
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 840
    .local v6, "timeout":I
    :try_start_0
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 841
    const-string/jumbo v8, "lock_screen_lock_after_timeout"

    .line 840
    invoke-static {v7, v8, v6}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 845
    :goto_0
    invoke-direct {p0}, Lcom/android/settings_ex/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 875
    .end local v6    # "timeout":I
    :cond_0
    :goto_1
    return v4

    .line 842
    .restart local v6    # "timeout":I
    :catch_0
    move-exception v1

    .line 843
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string/jumbo v7, "SecuritySettings"

    const-string/jumbo v8, "could not persist lockAfter timeout setting"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 846
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v6    # "timeout":I
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1
    const-string/jumbo v7, "directlyshow"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 847
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget v8, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v0, v7, v8}, Lorg/cyanogenmod/internal/util/CmLockPatternUtils;->setPassToSecurityView(ZI)V

    goto :goto_1

    .line 848
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_2
    const-string/jumbo v7, "visiblepattern"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 849
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget v8, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v3, v7, v8}, Lcom/android/internal/widget/LockPatternUtils;->setVisiblePatternEnabled(ZI)V

    goto :goto_1

    .line 850
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_3
    const-string/jumbo v7, "visible_error_pattern"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 851
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget v8, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v3, v7, v8}, Lcom/android/internal/widget/LockPatternUtils;->setShowErrorPath(ZI)V

    goto :goto_1

    .line 852
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_4
    const-string/jumbo v7, "visibledots"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 853
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget v8, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v3, v7, v8}, Lcom/android/internal/widget/LockPatternUtils;->setVisibleDotsEnabled(ZI)V

    goto :goto_1

    .line 854
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_5
    const-string/jumbo v7, "power_button_instantly_locks"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 855
    iget-object v7, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    sget v9, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v7, v8, v9}, Lcom/android/internal/widget/LockPatternUtils;->setPowerButtonInstantlyLocks(ZI)V

    goto :goto_1

    .line 856
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_6
    const-string/jumbo v7, "show_password"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 857
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string/jumbo v10, "show_password"

    move-object v7, p2

    .line 858
    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_7

    const/4 v7, 0x1

    .line 857
    :goto_2
    invoke-static {v9, v10, v7}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 859
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget v8, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v3, v7, v8}, Lcom/android/internal/widget/LockPatternUtils;->setVisiblePasswordEnabled(ZI)V

    goto/16 :goto_1

    .restart local p2    # "value":Ljava/lang/Object;
    :cond_7
    move v7, v8

    .line 858
    goto :goto_2

    .line 860
    :cond_8
    const-string/jumbo v7, "toggle_install_applications"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 861
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 862
    iget-object v7, p0, Lcom/android/settings_ex/SecuritySettings;->mToggleAppInstallation:Landroid/preference/SwitchPreference;

    invoke-virtual {v7, v8}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 863
    invoke-direct {p0}, Lcom/android/settings_ex/SecuritySettings;->warnAppInstallation()V

    .line 865
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 867
    :cond_9
    invoke-direct {p0, v8}, Lcom/android/settings_ex/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    goto/16 :goto_1

    .line 869
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_a
    const-string/jumbo v7, "sms_security_check_limit"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 870
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 871
    .local v5, "smsSecurityCheck":I
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string/jumbo v8, "sms_outgoing_check_max_count"

    invoke-static {v7, v8, v5}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 873
    invoke-direct {p0, v5}, Lcom/android/settings_ex/SecuritySettings;->updateSmsSecuritySummary(I)V

    goto/16 :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 10
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v9, 0x1

    const/4 v5, 0x0

    .line 786
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v8

    .line 787
    .local v8, "key":Ljava/lang/String;
    const-string/jumbo v0, "unlock_set_or_change"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 788
    const-string/jumbo v2, "com.android.settings.ChooseLockGeneric$ChooseLockGenericFragment"

    .line 789
    const v3, 0x7f0c053f

    const/16 v4, 0x7b

    move-object v0, p0

    move-object v1, p0

    .line 788
    invoke-virtual/range {v0 .. v5}, Lcom/android/settings_ex/SecuritySettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;IILandroid/os/Bundle;)Z

    .line 812
    :cond_0
    :goto_0
    return v9

    .line 790
    :cond_1
    const-string/jumbo v0, "trust_agent"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 792
    new-instance v7, Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v7, v0, p0}, Lcom/android/settings_ex/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 793
    .local v7, "helper":Lcom/android/settings_ex/ChooseLockSettingsHelper;
    invoke-virtual {p2}, Landroid/preference/Preference;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    .line 795
    invoke-virtual {p2}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    const/16 v1, 0x7e

    .line 794
    invoke-virtual {v7, v1, v0}, Lcom/android/settings_ex/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;)Z

    move-result v6

    .line 796
    .local v6, "confirmationLaunched":Z
    if-nez v6, :cond_0

    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 798
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/SecuritySettings;->startActivity(Landroid/content/Intent;)V

    .line 799
    iput-object v5, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    goto :goto_0

    .line 801
    .end local v6    # "confirmationLaunched":Z
    .end local v7    # "helper":Lcom/android/settings_ex/ChooseLockSettingsHelper;
    :cond_2
    const-string/jumbo v0, "lockscreen_enabled_internally"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 802
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 803
    const-string/jumbo v1, "lockscreen_internally_enabled"

    .line 804
    const/4 v2, -0x2

    .line 802
    invoke-static {v0, v1, v9, v2}, Lcyanogenmod/providers/CMSettings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 805
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 806
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mLockscreenDisabledPreference:Landroid/preference/Preference;

    .line 807
    const v1, 0x7f0c02d9

    .line 806
    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 810
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 739
    invoke-super {p0}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onResume()V

    .line 743
    invoke-direct {p0}, Lcom/android/settings_ex/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 745
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {v2}, Lcom/android/settings_ex/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v1

    .line 746
    .local v1, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings_ex/ChooseLockSettingsHelper;

    invoke-virtual {v2}, Lcom/android/settings_ex/ChooseLockSettingsHelper;->cmUtils()Lorg/cyanogenmod/internal/util/CmLockPatternUtils;

    move-result-object v0

    .line 747
    .local v0, "cmLockPatternUtils":Lorg/cyanogenmod/internal/util/CmLockPatternUtils;
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mDirectlyShow:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_0

    .line 748
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mDirectlyShow:Landroid/preference/SwitchPreference;

    sget v5, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v0, v5}, Lorg/cyanogenmod/internal/util/CmLockPatternUtils;->shouldPassToSecurityView(I)Z

    move-result v5

    invoke-virtual {v2, v5}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 750
    :cond_0
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisiblePattern:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_1

    .line 751
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisiblePattern:Landroid/preference/SwitchPreference;

    sget v5, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v1, v5}, Lcom/android/internal/widget/LockPatternUtils;->isVisiblePatternEnabled(I)Z

    move-result v5

    invoke-virtual {v2, v5}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 753
    :cond_1
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_2

    .line 754
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/SwitchPreference;

    sget v5, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v1, v5}, Lcom/android/internal/widget/LockPatternUtils;->isShowErrorPath(I)Z

    move-result v5

    invoke-virtual {v2, v5}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 756
    :cond_2
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisibleDots:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_3

    .line 757
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mVisibleDots:Landroid/preference/SwitchPreference;

    sget v5, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v1, v5}, Lcom/android/internal/widget/LockPatternUtils;->isVisibleDotsEnabled(I)Z

    move-result v5

    invoke-virtual {v2, v5}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 759
    :cond_3
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_4

    .line 760
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/SwitchPreference;

    .line 761
    sget v5, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    .line 760
    invoke-virtual {v1, v5}, Lcom/android/internal/widget/LockPatternUtils;->getPowerButtonInstantlyLocks(I)Z

    move-result v5

    invoke-virtual {v2, v5}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 764
    :cond_4
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mShowPassword:Landroid/preference/SwitchPreference;

    if-eqz v2, :cond_5

    .line 765
    iget-object v5, p0, Lcom/android/settings_ex/SecuritySettings;->mShowPassword:Landroid/preference/SwitchPreference;

    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 766
    const-string/jumbo v6, "show_password"

    .line 765
    invoke-static {v2, v6, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_7

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 769
    :cond_5
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    if-eqz v2, :cond_6

    .line 770
    iget-object v2, p0, Lcom/android/settings_ex/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    iget-object v5, p0, Lcom/android/settings_ex/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v5}, Landroid/security/KeyStore;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_8

    :goto_1
    invoke-virtual {v2, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 773
    :cond_6
    invoke-virtual {p0}, Lcom/android/settings_ex/SecuritySettings;->updateOwnerInfo()V

    .line 738
    return-void

    :cond_7
    move v2, v4

    .line 765
    goto :goto_0

    :cond_8
    move v4, v3

    .line 770
    goto :goto_1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 731
    invoke-super {p0, p1}, Lcom/android/settings_ex/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 732
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 733
    const-string/jumbo v0, "trust_agent_click_intent"

    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mTrustAgentClickIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 730
    :cond_0
    return-void
.end method

.method public updateOwnerInfo()V
    .locals 3

    .prologue
    .line 777
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mOwnerInfoPref:Landroid/preference/Preference;

    if-eqz v0, :cond_0

    .line 778
    iget-object v1, p0, Lcom/android/settings_ex/SecuritySettings;->mOwnerInfoPref:Landroid/preference/Preference;

    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    sget v2, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v0, v2}, Lcom/android/internal/widget/LockPatternUtils;->isOwnerInfoEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 779
    iget-object v0, p0, Lcom/android/settings_ex/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    sget v2, Lcom/android/settings_ex/SecuritySettings;->MY_USER_ID:I

    invoke-virtual {v0, v2}, Lcom/android/internal/widget/LockPatternUtils;->getOwnerInfo(I)Ljava/lang/String;

    move-result-object v0

    .line 778
    :goto_0
    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 776
    :cond_0
    return-void

    .line 780
    :cond_1
    const v0, 0x7f0c04eb

    invoke-virtual {p0, v0}, Lcom/android/settings_ex/SecuritySettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
