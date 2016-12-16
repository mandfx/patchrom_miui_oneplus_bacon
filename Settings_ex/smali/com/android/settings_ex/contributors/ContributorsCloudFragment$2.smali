.class Lcom/android/settings_ex/contributors/ContributorsCloudFragment$2;
.super Ljava/lang/Object;
.source "ContributorsCloudFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings_ex/contributors/ContributorsCloudFragment;->onLoadCloudDataSuccess(FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/contributors/ContributorsCloudFragment;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/contributors/ContributorsCloudFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/contributors/ContributorsCloudFragment;

    .prologue
    .line 395
    iput-object p1, p0, Lcom/android/settings_ex/contributors/ContributorsCloudFragment$2;->this$0:Lcom/android/settings_ex/contributors/ContributorsCloudFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 398
    iget-object v0, p0, Lcom/android/settings_ex/contributors/ContributorsCloudFragment$2;->this$0:Lcom/android/settings_ex/contributors/ContributorsCloudFragment;

    invoke-static {v0}, Lcom/android/settings_ex/contributors/ContributorsCloudFragment;->-get3(Lcom/android/settings_ex/contributors/ContributorsCloudFragment;)Lcom/android/settings_ex/contributors/ContributorsCloudViewController;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/settings_ex/contributors/ContributorsCloudViewController;->setZoomTransitionDuration(I)V

    .line 397
    return-void
.end method
