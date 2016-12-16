.class Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;
.super Landroid/database/ContentObserver;
.source "SavedAccessPointsWifiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;
    .param p2, "$anonymous0"    # Landroid/os/Handler;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;->this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 2
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;->this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;

    invoke-static {v0}, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;->-get1(Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;)Lcom/android/settings_ex/DraggableSortListView;

    move-result-object v1

    iget-object v0, p0, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;->this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;

    invoke-static {v0}, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;->-wrap0(Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/android/settings_ex/DraggableSortListView;->setDropListener(Lcom/android/settings_ex/DraggableSortListView$DropListener;)V

    .line 106
    iget-object v0, p0, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;->this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;

    invoke-virtual {v0}, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 104
    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings$2;->this$0:Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;

    invoke-static {v0}, Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;->-get0(Lcom/android/settings_ex/wifi/SavedAccessPointsWifiSettings;)Lcom/android/settings_ex/DraggableSortListView$DropListener;

    move-result-object v0

    goto :goto_0
.end method
