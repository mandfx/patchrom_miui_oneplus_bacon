.class Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;
.super Ljava/lang/Object;
.source "ButtonBacklightBrightness.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->-get3(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)Landroid/widget/SeekBar;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 145
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->-get0(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->-get0(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;->reset()V

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->-get1(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$2;->this$0:Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;->-get1(Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness;)Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/settings_ex/cyanogenmod/ButtonBacklightBrightness$BrightnessControl;->reset()V

    .line 143
    :cond_1
    return-void
.end method
