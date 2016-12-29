.class public Lcom/android/incallui/ProximitySensor;
.super Ljava/lang/Object;
.source "ProximitySensor.java"

# interfaces
.implements Lcom/android/incallui/AudioModeProvider$AudioModeListener;
.implements Lcom/android/incallui/InCallPresenter$InCallStateListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mAudioModeProvider:Lcom/android/incallui/AudioModeProvider;

.field private mContext:Landroid/content/Context;

.field private mDialpadVisible:Z

.field private mIsHardKeyboardOpen:Z

.field private mIsPhoneOffhook:Z

.field private mIsVideoMode:Z

.field private final mPowerManager:Landroid/os/PowerManager;

.field private mUiShowing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/android/incallui/ProximitySensor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/incallui/ProximitySensor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/incallui/AudioModeProvider;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "audioModeProvider"    # Lcom/android/incallui/AudioModeProvider;

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-boolean v0, p0, Lcom/android/incallui/ProximitySensor;->mUiShowing:Z

    .line 46
    iput-boolean v0, p0, Lcom/android/incallui/ProximitySensor;->mIsPhoneOffhook:Z

    .line 48
    iput-boolean v0, p0, Lcom/android/incallui/ProximitySensor;->mIsVideoMode:Z

    .line 56
    iput-object p1, p0, Lcom/android/incallui/ProximitySensor;->mContext:Landroid/content/Context;

    .line 57
    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/android/incallui/ProximitySensor;->mPowerManager:Landroid/os/PowerManager;

    .line 58
    iput-object p2, p0, Lcom/android/incallui/ProximitySensor;->mAudioModeProvider:Lcom/android/incallui/AudioModeProvider;

    .line 59
    iget-object v0, p0, Lcom/android/incallui/ProximitySensor;->mAudioModeProvider:Lcom/android/incallui/AudioModeProvider;

    invoke-virtual {v0, p0}, Lcom/android/incallui/AudioModeProvider;->addListener(Lcom/android/incallui/AudioModeProvider$AudioModeListener;)V

    .line 60
    return-void
.end method

.method private isSmartCoverClosed()Z
    .locals 1

    .prologue
    .line 218
    invoke-static {}, Lcom/android/incallui/util/SmartCoverUtil;->supportSmartCover()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/incallui/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/incallui/util/SmartCoverUtil;->isSmartCoverClosed(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private declared-synchronized updateProximitySensorMode()V
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 163
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/android/incallui/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5}, Landroid/provider/MiuiSettings$Telephony;->isProximitySensorEnable(Landroid/content/ContentResolver;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 165
    .local v1, "enableProximityWakeLock":Z
    if-nez v1, :cond_0

    .line 215
    :goto_0
    monitor-exit p0

    return-void

    .line 168
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/android/incallui/ProximitySensor;->mAudioModeProvider:Lcom/android/incallui/AudioModeProvider;

    invoke-virtual {v5}, Lcom/android/incallui/AudioModeProvider;->getAudioMode()I

    move-result v0

    .line 173
    .local v0, "audioMode":I
    const/4 v5, 0x4

    if-eq v5, v0, :cond_1

    const/16 v5, 0x8

    if-eq v5, v0, :cond_1

    const/4 v5, 0x2

    if-eq v5, v0, :cond_1

    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mIsHardKeyboardOpen:Z

    if-eqz v5, :cond_2

    :cond_1
    move v2, v3

    .line 178
    .local v2, "screenOnImmediately":Z
    :goto_1
    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mUiShowing:Z

    if-nez v5, :cond_3

    move v5, v3

    :goto_2
    or-int/2addr v2, v5

    .line 184
    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mDialpadVisible:Z

    or-int/2addr v2, v5

    .line 186
    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mIsVideoMode:Z

    or-int/2addr v2, v5

    .line 188
    const-string v5, "screenonImmediately: "

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {p0, v5, v6}, Lcom/android/incallui/Log;->v(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    invoke-static {p0}, Lcom/google/common/base/Objects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v6

    const-string v7, "keybrd"

    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mIsHardKeyboardOpen:Z

    if-eqz v5, :cond_4

    move v5, v3

    :goto_3
    invoke-virtual {v6, v7, v5}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v6

    const-string v7, "dpad"

    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mDialpadVisible:Z

    if-eqz v5, :cond_5

    move v5, v3

    :goto_4
    invoke-virtual {v6, v7, v5}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v6

    const-string v7, "offhook"

    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mIsPhoneOffhook:Z

    if-eqz v5, :cond_6

    move v5, v3

    :goto_5
    invoke-virtual {v6, v7, v5}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v6

    const-string v7, "ui"

    iget-boolean v5, p0, Lcom/android/incallui/ProximitySensor;->mUiShowing:Z

    if-eqz v5, :cond_7

    move v5, v3

    :goto_6
    invoke-virtual {v6, v7, v5}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v5

    const-string v6, "aud"

    invoke-static {v0}, Landroid/telecom/AudioState;->audioRouteToString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v5

    const-string v6, "isVideo"

    iget-boolean v7, p0, Lcom/android/incallui/ProximitySensor;->mIsVideoMode:Z

    if-eqz v7, :cond_8

    :goto_7
    invoke-virtual {v5, v6, v3}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/base/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 199
    iget-boolean v3, p0, Lcom/android/incallui/ProximitySensor;->mIsPhoneOffhook:Z

    if-eqz v3, :cond_a

    if-nez v2, :cond_a

    .line 200
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->isSmartCoverClosed()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 201
    const-string v3, "In small window, turning off proximity sensor"

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 202
    invoke-static {}, Lcom/android/incallui/TelecomAdapter;->getInstance()Lcom/android/incallui/TelecomAdapter;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/android/incallui/TelecomAdapter;->turnOffProximitySensor(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 163
    .end local v0    # "audioMode":I
    .end local v1    # "enableProximityWakeLock":Z
    .end local v2    # "screenOnImmediately":Z
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .restart local v0    # "audioMode":I
    .restart local v1    # "enableProximityWakeLock":Z
    :cond_2
    move v2, v4

    .line 173
    goto :goto_1

    .restart local v2    # "screenOnImmediately":Z
    :cond_3
    move v5, v4

    .line 178
    goto :goto_2

    :cond_4
    move v5, v4

    .line 190
    goto :goto_3

    :cond_5
    move v5, v4

    goto :goto_4

    :cond_6
    move v5, v4

    goto :goto_5

    :cond_7
    move v5, v4

    goto :goto_6

    :cond_8
    move v3, v4

    goto :goto_7

    .line 204
    :cond_9
    :try_start_2
    const-string v3, "Turning on proximity sensor"

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    invoke-static {}, Lcom/android/incallui/TelecomAdapter;->getInstance()Lcom/android/incallui/TelecomAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/incallui/TelecomAdapter;->turnOnProximitySensor()V

    goto/16 :goto_0

    .line 210
    :cond_a
    const-string v3, "Turning off proximity sensor"

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 213
    invoke-static {}, Lcom/android/incallui/TelecomAdapter;->getInstance()Lcom/android/incallui/TelecomAdapter;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/android/incallui/TelecomAdapter;->turnOffProximitySensor(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method


# virtual methods
.method public isScreenReallyOff()Z
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/incallui/ProximitySensor;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAudioMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->updateProximitySensorMode()V

    .line 100
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v0, 0x1

    .line 111
    iget v1, p1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/incallui/ProximitySensor;->mIsHardKeyboardOpen:Z

    .line 114
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->updateProximitySensorMode()V

    .line 115
    return-void

    .line 111
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onInCallShowing(Z)V
    .locals 0
    .param p1, "showing"    # Z

    .prologue
    .line 121
    iput-boolean p1, p0, Lcom/android/incallui/ProximitySensor;->mUiShowing:Z

    .line 122
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->updateProximitySensorMode()V

    .line 123
    return-void
.end method

.method public onMute(Z)V
    .locals 0
    .param p1, "muted"    # Z

    .prologue
    .line 92
    return-void
.end method

.method public onStateChange(Lcom/android/incallui/InCallPresenter$InCallState;Lcom/android/incallui/InCallPresenter$InCallState;Lcom/android/incallui/CallList;)V
    .locals 5
    .param p1, "oldState"    # Lcom/android/incallui/InCallPresenter$InCallState;
    .param p2, "newState"    # Lcom/android/incallui/InCallPresenter$InCallState;
    .param p3, "callList"    # Lcom/android/incallui/CallList;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 76
    sget-object v4, Lcom/android/incallui/InCallPresenter$InCallState;->INCALL:Lcom/android/incallui/InCallPresenter$InCallState;

    if-ne v4, p2, :cond_3

    invoke-virtual {p3}, Lcom/android/incallui/CallList;->hasLiveCall()Z

    move-result v4

    if-eqz v4, :cond_3

    move v0, v2

    .line 77
    .local v0, "hasOngoingCall":Z
    :goto_0
    sget-object v4, Lcom/android/incallui/InCallPresenter$InCallState;->OUTGOING:Lcom/android/incallui/InCallPresenter$InCallState;

    if-eq v4, p2, :cond_0

    if-eqz v0, :cond_4

    :cond_0
    move v1, v2

    .line 79
    .local v1, "isOffhook":Z
    :goto_1
    iget-boolean v2, p0, Lcom/android/incallui/ProximitySensor;->mIsPhoneOffhook:Z

    if-ne v1, v2, :cond_1

    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->isSmartCoverClosed()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 80
    :cond_1
    iput-boolean v1, p0, Lcom/android/incallui/ProximitySensor;->mIsPhoneOffhook:Z

    .line 82
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->updateProximitySensorMode()V

    .line 84
    :cond_2
    return-void

    .end local v0    # "hasOngoingCall":Z
    .end local v1    # "isOffhook":Z
    :cond_3
    move v0, v3

    .line 76
    goto :goto_0

    .restart local v0    # "hasOngoingCall":Z
    :cond_4
    move v1, v3

    .line 77
    goto :goto_1
.end method

.method public onSupportedAudioMode(I)V
    .locals 0
    .param p1, "modeMask"    # I

    .prologue
    .line 88
    return-void
.end method

.method public onVideoMode(Z)V
    .locals 0
    .param p1, "isVideoMode"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lcom/android/incallui/ProximitySensor;->mIsVideoMode:Z

    .line 139
    invoke-direct {p0}, Lcom/android/incallui/ProximitySensor;->updateProximitySensorMode()V

    .line 140
    return-void
.end method

.method public tearDown()V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/incallui/ProximitySensor;->mAudioModeProvider:Lcom/android/incallui/AudioModeProvider;

    invoke-virtual {v0, p0}, Lcom/android/incallui/AudioModeProvider;->removeListener(Lcom/android/incallui/AudioModeProvider$AudioModeListener;)V

    .line 65
    invoke-static {}, Lcom/android/incallui/TelecomAdapter;->getInstance()Lcom/android/incallui/TelecomAdapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/incallui/TelecomAdapter;->turnOffProximitySensor(Z)V

    .line 66
    return-void
.end method
