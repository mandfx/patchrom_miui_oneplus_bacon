.class public Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;
.super Lcom/android/vcard/VCardComposer;
.source "BluetoothPbapVcardComposer.java"


# static fields
.field public static final FILTER_ADR:J = 0x20L

.field public static final FILTER_AGENT:J = 0x8000L

.field public static final FILTER_BDAY:J = 0x10L

.field public static final FILTER_CATEGORIES:J = 0x1000000L

.field public static final FILTER_CLASS:J = 0x4000000L

.field public static final FILTER_EMAIL:J = 0x100L

.field public static final FILTER_FN:J = 0x2L

.field public static final FILTER_GEO:J = 0x800L

.field public static final FILTER_KEY:J = 0x400000L

.field public static final FILTER_LABEL:J = 0x40L

.field public static final FILTER_LOGO:J = 0x4000L

.field public static final FILTER_MAILER:J = 0x200L

.field public static final FILTER_N:J = 0x4L

.field public static final FILTER_NICKNAME:J = 0x800000L

.field public static final FILTER_NOTE:J = 0x20000L

.field public static final FILTER_ORG:J = 0x10000L

.field public static final FILTER_PHOTO:J = 0x8L

.field public static final FILTER_PROID:J = 0x2000000L

.field public static final FILTER_REV:J = 0x40000L

.field public static final FILTER_ROLE:J = 0x2000L

.field public static final FILTER_SORT_STRING:J = 0x8000000L

.field public static final FILTER_SOUND:J = 0x80000L

.field public static final FILTER_TEL:J = 0x80L

.field public static final FILTER_TITLE:J = 0x1000L

.field public static final FILTER_TZ:J = 0x400L

.field public static final FILTER_UID:J = 0x200000L

.field public static final FILTER_URL:J = 0x100000L

.field public static final FILTER_VERSION:J = 0x1L

.field public static final FILTER_X_IRMC_CALL_DATETIME:J = 0x10000000L

.field private static final LOG_TAG:Ljava/lang/String; = "BluetoothPbapVcardComposer"


# instance fields
.field private final mCharset:Ljava/lang/String;

.field private final mFilter:J

.field private final mVCardType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IJZ)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "vcardType"    # I
    .param p3, "filter"    # J
    .param p5, "careHandlerErrors"    # Z

    .prologue
    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, p2, v0, p5}, Lcom/android/vcard/VCardComposer;-><init>(Landroid/content/Context;ILjava/lang/String;Z)V

    .line 81
    iput p2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mVCardType:I

    .line 82
    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mCharset:Ljava/lang/String;

    .line 83
    iput-wide p3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    .line 84
    return-void
.end method


# virtual methods
.method public buildVCard(Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, "contentValuesListMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    const-wide/16 v5, 0x0

    .line 87
    if-nez p1, :cond_0

    .line 88
    const-string v1, "BluetoothPbapVcardComposer"

    const-string v2, "The given map is null. Ignore and return empty String"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const-string v1, ""

    .line 118
    :goto_0
    return-object v1

    .line 91
    :cond_0
    const-string v1, "BluetoothPbapVcardComposer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "buildVCard filter = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    new-instance v0, Lcom/android/vcard/VCardBuilder;

    iget v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mVCardType:I

    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mCharset:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/android/vcard/VCardBuilder;-><init>(ILjava/lang/String;)V

    .line 94
    .local v0, "builder":Lcom/android/vcard/VCardBuilder;
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x4

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-nez v1, :cond_1

    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x2

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_2

    .line 95
    :cond_1
    const-string v1, "vnd.android.cursor.item/name"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendNameProperties(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 97
    :cond_2
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/32 v3, 0x800000

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_3

    .line 98
    const-string v1, "vnd.android.cursor.item/nickname"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendNickNames(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 99
    :cond_3
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x80

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_4

    .line 100
    const-string v1, "vnd.android.cursor.item/phone_v2"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/vcard/VCardBuilder;->appendPhones(Ljava/util/List;Lcom/android/vcard/VCardPhoneNumberTranslationCallback;)Lcom/android/vcard/VCardBuilder;

    .line 101
    :cond_4
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x100

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_5

    .line 102
    const-string v1, "vnd.android.cursor.item/email_v2"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendEmails(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 103
    :cond_5
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x20

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_6

    .line 104
    const-string v1, "vnd.android.cursor.item/postal-address_v2"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendPostals(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 105
    :cond_6
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/32 v3, 0x10000

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_7

    .line 106
    const-string v1, "vnd.android.cursor.item/organization"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendOrganizations(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 108
    :cond_7
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/32 v3, 0x100000

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_8

    .line 109
    const-string v1, "vnd.android.cursor.item/website"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendWebsites(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 110
    :cond_8
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x8

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_9

    .line 111
    const-string v1, "vnd.android.cursor.item/photo"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendPhotos(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 112
    :cond_9
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/32 v3, 0x20000

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_a

    .line 113
    const-string v1, "vnd.android.cursor.item/note"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendNotes(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 114
    :cond_a
    iget-wide v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardComposer;->mFilter:J

    const-wide/16 v3, 0x10

    and-long/2addr v1, v3

    cmp-long v1, v1, v5

    if-eqz v1, :cond_b

    .line 115
    const-string v1, "vnd.android.cursor.item/contact_event"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/android/vcard/VCardBuilder;->appendEvents(Ljava/util/List;)Lcom/android/vcard/VCardBuilder;

    .line 118
    :cond_b
    invoke-virtual {v0}, Lcom/android/vcard/VCardBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method
