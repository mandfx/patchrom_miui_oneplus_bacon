.class public final Lcom/android/incallui/TelecomAdapter;
.super Ljava/lang/Object;
.source "TelecomAdapter.java"


# static fields
.field private static sInstance:Lcom/android/incallui/TelecomAdapter;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mPhone:Landroid/telecom/Phone;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static getInstance()Lcom/android/incallui/TelecomAdapter;
    .locals 2

    .prologue
    .line 40
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 41
    sget-object v0, Lcom/android/incallui/TelecomAdapter;->sInstance:Lcom/android/incallui/TelecomAdapter;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/android/incallui/TelecomAdapter;

    invoke-direct {v0}, Lcom/android/incallui/TelecomAdapter;-><init>()V

    sput-object v0, Lcom/android/incallui/TelecomAdapter;->sInstance:Lcom/android/incallui/TelecomAdapter;

    .line 44
    :cond_0
    sget-object v0, Lcom/android/incallui/TelecomAdapter;->sInstance:Lcom/android/incallui/TelecomAdapter;

    return-object v0

    .line 40
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;
    .locals 2
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {}, Lcom/android/incallui/CallList;->getInstance()Lcom/android/incallui/CallList;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/incallui/CallList;->getCallById(Ljava/lang/String;)Lcom/android/incallui/Call;

    move-result-object v0

    .line 66
    .local v0, "call":Lcom/android/incallui/Call;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/android/incallui/Call;->getTelecommCall()Landroid/telecom/Call;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method addCall()V
    .locals 4

    .prologue
    .line 240
    iget-object v2, p0, Lcom/android/incallui/TelecomAdapter;->mContext:Landroid/content/Context;

    if-eqz v2, :cond_0

    .line 241
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.DIAL"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 242
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 247
    const-string v2, "add_call_mode"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 249
    :try_start_0
    const-string v2, "Sending the add Call intent"

    invoke-static {p0, v2}, Lcom/android/incallui/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 250
    iget-object v2, p0, Lcom/android/incallui/TelecomAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 251
    .restart local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "Activity for adding calls isn\'t found."

    invoke-static {p0, v2, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public answerCall(Ljava/lang/String;I)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "videoState"    # I

    .prologue
    .line 70
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 71
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 72
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {v0, p2}, Landroid/telecom/Call;->answer(I)V

    .line 80
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 75
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error answerCall, call not in call list: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 78
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error answerCall, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method canAddCall()Z
    .locals 1

    .prologue
    .line 319
    const/4 v0, 0x1

    return v0
.end method

.method public clearPhone()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    .line 62
    return-void
.end method

.method public disconnectCall(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 105
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 106
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {v0}, Landroid/telecom/Call;->disconnect()V

    .line 114
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 109
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error disconnectCall, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 112
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error disconnectCall, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method holdCall(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 118
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 119
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 120
    invoke-virtual {v0}, Landroid/telecom/Call;->hold()V

    .line 127
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 122
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error holdCall, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 125
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error holdCall, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method merge(Ljava/lang/String;)V
    .locals 5
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 196
    iget-object v3, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v3, :cond_3

    .line 197
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 198
    .local v0, "call":Landroid/telecom/Call;
    if-nez v0, :cond_1

    .line 199
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error merge, call not in call list "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 214
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_0
    :goto_0
    return-void

    .line 202
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_1
    invoke-virtual {v0}, Landroid/telecom/Call;->getConferenceableCalls()Ljava/util/List;

    move-result-object v2

    .line 203
    .local v2, "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/Call;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 204
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telecom/Call;

    invoke-virtual {v0, v3}, Landroid/telecom/Call;->conference(Landroid/telecom/Call;)V

    goto :goto_0

    .line 206
    :cond_2
    invoke-virtual {v0}, Landroid/telecom/Call;->getDetails()Landroid/telecom/Call$Details;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telecom/Call$Details;->getCallCapabilities()I

    move-result v1

    .line 207
    .local v1, "capabilities":I
    and-int/lit8 v3, v1, 0x4

    if-eqz v3, :cond_0

    .line 208
    invoke-virtual {v0}, Landroid/telecom/Call;->mergeConference()V

    goto :goto_0

    .line 212
    .end local v0    # "call":Landroid/telecom/Call;
    .end local v1    # "capabilities":I
    .end local v2    # "conferenceable":Ljava/util/List;, "Ljava/util/List<Landroid/telecom/Call;>;"
    :cond_3
    const-string v3, "error merge, mPhone is null."

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method mute(Z)V
    .locals 1
    .param p1, "shouldMute"    # Z

    .prologue
    .line 143
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    invoke-virtual {v0, p1}, Landroid/telecom/Phone;->setMuted(Z)V

    .line 148
    :goto_0
    return-void

    .line 146
    :cond_0
    const-string v0, "error mute, mPhone is null"

    invoke-static {p0, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method phoneAccountSelected(Ljava/lang/String;Landroid/telecom/PhoneAccountHandle;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "accountHandle"    # Landroid/telecom/PhoneAccountHandle;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_2

    .line 301
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 302
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_1

    .line 303
    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Landroid/telecom/Call;->phoneAccountSelected(Landroid/telecom/PhoneAccountHandle;Z)V

    .line 311
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    if-nez p2, :cond_0

    .line 312
    const-string v1, "error phoneAccountSelected, accountHandle is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    :cond_0
    return-void

    .line 305
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error phoneAccountSelected, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 308
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_2
    const-string v1, "error phoneAccountSelected, mAdapter is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public playDtmfTone(Ljava/lang/String;C)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "digit"    # C

    .prologue
    .line 261
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 262
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 263
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {v0, p2}, Landroid/telecom/Call;->playDtmfTone(C)V

    .line 271
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 266
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error playDtmfTone, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 269
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error playDtmfTone, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method postDialContinue(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "proceed"    # Z

    .prologue
    .line 287
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 288
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 289
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {v0, p2}, Landroid/telecom/Call;->postDialContinue(Z)V

    .line 297
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 292
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error postDialContinue, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 295
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error postDialContinue, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public rejectCall(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;
    .param p2, "rejectWithMessage"    # Z
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 92
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 93
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {v0, p2, p3}, Landroid/telecom/Call;->reject(ZLjava/lang/String;)V

    .line 101
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 96
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error rejectCall, call not in call list: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 99
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error rejectCall, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method separateCall(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 183
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 184
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 185
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0}, Landroid/telecom/Call;->splitFromConference()V

    .line 193
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 188
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error separateCall, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 191
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error separateCall, mPhone is null."

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAudioRoute(I)V
    .locals 1
    .param p1, "route"    # I

    .prologue
    .line 151
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    invoke-virtual {v0, p1}, Landroid/telecom/Phone;->setAudioRoute(I)V

    .line 156
    :goto_0
    return-void

    .line 154
    :cond_0
    const-string v0, "error setAudioRoute, mPhone is null"

    invoke-static {p0, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/android/incallui/TelecomAdapter;->mContext:Landroid/content/Context;

    .line 52
    return-void
.end method

.method public setPhone(Landroid/telecom/Phone;)V
    .locals 0
    .param p1, "phone"    # Landroid/telecom/Phone;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    .line 57
    return-void
.end method

.method public stopDtmfTone(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 274
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 275
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 276
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {v0}, Landroid/telecom/Call;->stopDtmfTone()V

    .line 284
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 279
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error stopDtmfTone, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error stopDtmfTone, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method swap(Ljava/lang/String;)V
    .locals 5
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v3, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v3, :cond_3

    .line 218
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v1

    .line 219
    .local v1, "call":Landroid/telecom/Call;
    if-nez v1, :cond_0

    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error swap, call not in call list "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 237
    .end local v1    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 223
    .restart local v1    # "call":Landroid/telecom/Call;
    :cond_0
    invoke-virtual {v1}, Landroid/telecom/Call;->getDetails()Landroid/telecom/Call$Details;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telecom/Call$Details;->getCallCapabilities()I

    move-result v2

    .line 224
    .local v2, "capabilities":I
    and-int/lit8 v3, v2, 0x8

    if-eqz v3, :cond_1

    .line 225
    invoke-virtual {v1}, Landroid/telecom/Call;->swapConference()V

    goto :goto_0

    .line 227
    :cond_1
    invoke-static {}, Lcom/android/incallui/CallList;->getInstance()Lcom/android/incallui/CallList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/incallui/CallList;->getBackgroundCall()Lcom/android/incallui/Call;

    move-result-object v0

    .line 228
    .local v0, "bgCall":Lcom/android/incallui/Call;
    if-eqz v0, :cond_2

    .line 229
    invoke-virtual {v0}, Lcom/android/incallui/Call;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/incallui/TelecomAdapter;->unholdCall(Ljava/lang/String;)V

    goto :goto_0

    .line 231
    :cond_2
    const-string v3, "error swap, background call is null "

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 235
    .end local v0    # "bgCall":Lcom/android/incallui/Call;
    .end local v1    # "call":Landroid/telecom/Call;
    .end local v2    # "capabilities":I
    :cond_3
    const-string v3, "Error swap, mPhone is null."

    invoke-static {p0, v3}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method switchToOtherActiveSub(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "subId"    # Ljava/lang/String;
    .param p2, "retainLch"    # Z

    .prologue
    .line 175
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v0, :cond_0

    .line 180
    :goto_0
    return-void

    .line 178
    :cond_0
    const-string v0, "error switchToOtherActiveSub, mPhone is null"

    invoke-static {p0, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method turnOffProximitySensor(Z)V
    .locals 1
    .param p1, "screenOnImmediately"    # Z

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    invoke-virtual {v0, p1}, Landroid/telecom/Phone;->setProximitySensorOff(Z)V

    .line 172
    :goto_0
    return-void

    .line 170
    :cond_0
    const-string v0, "error setProximitySensorOff, mPhone is null"

    invoke-static {p0, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method turnOnProximitySensor()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    invoke-virtual {v0}, Landroid/telecom/Phone;->setProximitySensorOn()V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    const-string v0, "error setProximitySensorOn, mPhone is null"

    invoke-static {p0, v0}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method unholdCall(Ljava/lang/String;)V
    .locals 3
    .param p1, "callId"    # Ljava/lang/String;

    .prologue
    .line 130
    iget-object v1, p0, Lcom/android/incallui/TelecomAdapter;->mPhone:Landroid/telecom/Phone;

    if-eqz v1, :cond_1

    .line 131
    invoke-direct {p0, p1}, Lcom/android/incallui/TelecomAdapter;->getTelecommCallById(Ljava/lang/String;)Landroid/telecom/Call;

    move-result-object v0

    .line 132
    .local v0, "call":Landroid/telecom/Call;
    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {v0}, Landroid/telecom/Call;->unhold()V

    .line 140
    .end local v0    # "call":Landroid/telecom/Call;
    :goto_0
    return-void

    .line 135
    .restart local v0    # "call":Landroid/telecom/Call;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error unholdCall, call not in call list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 138
    .end local v0    # "call":Landroid/telecom/Call;
    :cond_1
    const-string v1, "error unholdCall, mPhone is null"

    invoke-static {p0, v1}, Lcom/android/incallui/Log;->e(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
