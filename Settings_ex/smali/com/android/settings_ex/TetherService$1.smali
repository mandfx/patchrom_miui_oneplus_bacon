.class Lcom/android/settings_ex/TetherService$1;
.super Landroid/content/BroadcastReceiver;
.source "TetherService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings_ex/TetherService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/TetherService;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/TetherService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/TetherService;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 270
    invoke-static {}, Lcom/android/settings_ex/TetherService;->-get0()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "TetherService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Got provision result "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 272
    const v3, 0x1040097

    .line 271
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 274
    .local v1, "provisionResponse":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 275
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-get4(Lcom/android/settings_ex/TetherService;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 276
    const-string/jumbo v2, "TetherService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unexpected provision response "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    return-void

    .line 279
    :cond_1
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-get1(Lcom/android/settings_ex/TetherService;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v3}, Lcom/android/settings_ex/TetherService;->-get2(Lcom/android/settings_ex/TetherService;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 280
    .local v0, "checkType":I
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2, v5}, Lcom/android/settings_ex/TetherService;->-set2(Lcom/android/settings_ex/TetherService;Z)Z

    .line 281
    const-string/jumbo v2, "EntitlementResult"

    invoke-virtual {p2, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_4

    .line 282
    if-nez v0, :cond_2

    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-get3(Lcom/android/settings_ex/TetherService;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 283
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-wrap3(Lcom/android/settings_ex/TetherService;)V

    .line 284
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2, v5}, Lcom/android/settings_ex/TetherService;->-set1(Lcom/android/settings_ex/TetherService;Z)Z

    .line 300
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-get2(Lcom/android/settings_ex/TetherService;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Lcom/android/settings_ex/TetherService;->-set0(Lcom/android/settings_ex/TetherService;I)I

    move-result v2

    iget-object v3, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v3}, Lcom/android/settings_ex/TetherService;->-get1(Lcom/android/settings_ex/TetherService;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v2, v3, :cond_5

    .line 302
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-virtual {v2}, Lcom/android/settings_ex/TetherService;->stopSelf()V

    .line 269
    .end local v0    # "checkType":I
    :cond_3
    :goto_1
    return-void

    .line 287
    .restart local v0    # "checkType":I
    :cond_4
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 289
    :pswitch_0
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-wrap2(Lcom/android/settings_ex/TetherService;)V

    goto :goto_0

    .line 292
    :pswitch_1
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-wrap0(Lcom/android/settings_ex/TetherService;)V

    goto :goto_0

    .line 295
    :pswitch_2
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v2}, Lcom/android/settings_ex/TetherService;->-wrap1(Lcom/android/settings_ex/TetherService;)V

    goto :goto_0

    .line 305
    :cond_5
    iget-object v2, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    iget-object v3, p0, Lcom/android/settings_ex/TetherService$1;->this$0:Lcom/android/settings_ex/TetherService;

    invoke-static {v3}, Lcom/android/settings_ex/TetherService;->-get2(Lcom/android/settings_ex/TetherService;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/android/settings_ex/TetherService;->-wrap4(Lcom/android/settings_ex/TetherService;I)V

    goto :goto_1

    .line 287
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
