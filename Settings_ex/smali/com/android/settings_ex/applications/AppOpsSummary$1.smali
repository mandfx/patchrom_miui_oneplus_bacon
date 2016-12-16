.class Lcom/android/settings_ex/applications/AppOpsSummary$1;
.super Ljava/lang/Object;
.source "AppOpsSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings_ex/applications/AppOpsSummary;->resetCountersConfirm()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/applications/AppOpsSummary;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/applications/AppOpsSummary;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/settings_ex/applications/AppOpsSummary;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/android/settings_ex/applications/AppOpsSummary$1;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 240
    iget-object v0, p0, Lcom/android/settings_ex/applications/AppOpsSummary$1;->this$0:Lcom/android/settings_ex/applications/AppOpsSummary;

    invoke-static {v0}, Lcom/android/settings_ex/applications/AppOpsSummary;->-wrap0(Lcom/android/settings_ex/applications/AppOpsSummary;)V

    .line 239
    return-void
.end method
