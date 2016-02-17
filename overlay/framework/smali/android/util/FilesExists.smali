.class public Landroid/util/FilesExists;
.super Ljava/lang/Object;
.source "FilesExists.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static filesExists(Ljava/lang/String;)Z
    .locals 4
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 12
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 13
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 19
    .end local v1    # "f":Ljava/io/File;
    :goto_0
    return v2

    .line 16
    :catch_0
    move-exception v0

    .line 17
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 19
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "f":Ljava/io/File;
    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method
