.class Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter$2;
.super Ljava/lang/Object;
.source "LiveLockScreenSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;

.field final synthetic val$row:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;Landroid/view/View;)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;
    .param p2, "val$row"    # Landroid/view/View;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter$2;->this$1:Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;

    iput-object p2, p0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter$2;->val$row:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 240
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter$2;->this$1:Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;

    iget-object v0, v0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter;->this$0:Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings;

    invoke-static {v0}, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings;->-get0(Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings;)Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenBackend;

    move-result-object v1

    .line 241
    iget-object v0, p0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenInfoAdapter$2;->val$row:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenBackend$LiveLockScreenInfo;

    .line 240
    invoke-virtual {v1, v0}, Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenBackend;->launchSettings(Lcom/android/settings_ex/cyanogenmod/LiveLockScreenSettings$LiveLockScreenBackend$LiveLockScreenInfo;)V

    .line 239
    return-void
.end method
