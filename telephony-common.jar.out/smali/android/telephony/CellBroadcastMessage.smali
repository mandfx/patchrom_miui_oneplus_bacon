.class public Landroid/telephony/CellBroadcastMessage;
.super Ljava/lang/Object;
.source "CellBroadcastMessage.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/telephony/CellBroadcastMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final SMS_CB_MESSAGE_EXTRA:Ljava/lang/String; = "com.android.cellbroadcastreceiver.SMS_CB_MESSAGE"


# instance fields
.field private final mDeliveryTime:J

.field private mIsRead:Z

.field private final mSmsCbMessage:Landroid/telephony/SmsCbMessage;

.field private mSubId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 110
    new-instance v0, Landroid/telephony/CellBroadcastMessage$1;

    invoke-direct {v0}, Landroid/telephony/CellBroadcastMessage$1;-><init>()V

    sput-object v0, Landroid/telephony/CellBroadcastMessage;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput v0, p0, Landroid/telephony/CellBroadcastMessage;->mSubId:I

    .line 90
    new-instance v1, Landroid/telephony/SmsCbMessage;

    invoke-direct {v1, p1}, Landroid/telephony/SmsCbMessage;-><init>(Landroid/os/Parcel;)V

    iput-object v1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/telephony/CellBroadcastMessage;->mSubId:I

    .line 94
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Landroid/telephony/CellBroadcastMessage$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Landroid/telephony/CellBroadcastMessage$1;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Landroid/telephony/CellBroadcastMessage;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/telephony/SmsCbMessage;)V
    .locals 3
    .param p1, "message"    # Landroid/telephony/SmsCbMessage;

    .prologue
    const/4 v2, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput v2, p0, Landroid/telephony/CellBroadcastMessage;->mSubId:I

    .line 78
    iput-object p1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    .line 80
    iput-boolean v2, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    .line 81
    return-void
.end method

.method private constructor <init>(Landroid/telephony/SmsCbMessage;JZ)V
    .locals 1
    .param p1, "message"    # Landroid/telephony/SmsCbMessage;
    .param p2, "deliveryTime"    # J
    .param p4, "isRead"    # Z

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Landroid/telephony/CellBroadcastMessage;->mSubId:I

    .line 84
    iput-object p1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    .line 85
    iput-wide p2, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    .line 86
    iput-boolean p4, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    .line 87
    return-void
.end method

.method public static createFromCursor(Landroid/database/Cursor;)Landroid/telephony/CellBroadcastMessage;
    .locals 42
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 130
    const-string v22, "geo_scope"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 132
    .local v14, "geoScope":I
    const-string v22, "serial_number"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 134
    .local v15, "serialNum":I
    const-string v22, "service_category"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v17

    .line 136
    .local v17, "category":I
    const-string v22, "language"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 138
    .local v18, "language":Ljava/lang/String;
    const-string v22, "body"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 140
    .local v19, "body":Ljava/lang/String;
    const-string v22, "format"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 142
    .local v13, "format":I
    const-string v22, "priority"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 146
    .local v20, "priority":I
    const-string v22, "plmn"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v38

    .line 147
    .local v38, "plmnColumn":I
    const/16 v22, -0x1

    move/from16 v0, v38

    move/from16 v1, v22

    if-eq v0, v1, :cond_0

    move-object/from16 v0, p0

    move/from16 v1, v38

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_0

    .line 148
    move-object/from16 v0, p0

    move/from16 v1, v38

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    .line 154
    .local v37, "plmn":Ljava/lang/String;
    :goto_0
    const-string v22, "lac"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v36

    .line 155
    .local v36, "lacColumn":I
    const/16 v22, -0x1

    move/from16 v0, v36

    move/from16 v1, v22

    if-eq v0, v1, :cond_1

    move-object/from16 v0, p0

    move/from16 v1, v36

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_1

    .line 156
    move-object/from16 v0, p0

    move/from16 v1, v36

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v35

    .line 162
    .local v35, "lac":I
    :goto_1
    const-string v22, "cid"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v24

    .line 163
    .local v24, "cidColumn":I
    const/16 v22, -0x1

    move/from16 v0, v24

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_2

    .line 164
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    .line 169
    .local v23, "cid":I
    :goto_2
    new-instance v16, Landroid/telephony/SmsCbLocation;

    move-object/from16 v0, v16

    move-object/from16 v1, v37

    move/from16 v2, v35

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Landroid/telephony/SmsCbLocation;-><init>(Ljava/lang/String;II)V

    .line 172
    .local v16, "location":Landroid/telephony/SmsCbLocation;
    const-string v22, "etws_warning_type"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v33

    .line 174
    .local v33, "etwsWarningTypeColumn":I
    const/16 v22, -0x1

    move/from16 v0, v33

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_3

    .line 175
    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v39

    .line 176
    .local v39, "warningType":I
    new-instance v21, Landroid/telephony/SmsCbEtwsInfo;

    const/16 v22, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v39

    move/from16 v2, v22

    move/from16 v3, v40

    move-object/from16 v4, v41

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/telephony/SmsCbEtwsInfo;-><init>(IZZ[B)V

    .line 182
    .end local v39    # "warningType":I
    .local v21, "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    :goto_3
    const-string v22, "cmas_message_class"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v27

    .line 184
    .local v27, "cmasMessageClassColumn":I
    const/16 v22, -0x1

    move/from16 v0, v27

    move/from16 v1, v22

    if-eq v0, v1, :cond_9

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_9

    .line 185
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 188
    .local v6, "messageClass":I
    const-string v22, "cmas_category"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v25

    .line 190
    .local v25, "cmasCategoryColumn":I
    const/16 v22, -0x1

    move/from16 v0, v25

    move/from16 v1, v22

    if-eq v0, v1, :cond_4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_4

    .line 191
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 197
    .local v7, "cmasCategory":I
    :goto_4
    const-string v22, "cmas_response_type"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v28

    .line 199
    .local v28, "cmasResponseTypeColumn":I
    const/16 v22, -0x1

    move/from16 v0, v28

    move/from16 v1, v22

    if-eq v0, v1, :cond_5

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_5

    .line 200
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 206
    .local v8, "responseType":I
    :goto_5
    const-string v22, "cmas_severity"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v29

    .line 208
    .local v29, "cmasSeverityColumn":I
    const/16 v22, -0x1

    move/from16 v0, v29

    move/from16 v1, v22

    if-eq v0, v1, :cond_6

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_6

    .line 209
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 215
    .local v9, "severity":I
    :goto_6
    const-string v22, "cmas_urgency"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v30

    .line 217
    .local v30, "cmasUrgencyColumn":I
    const/16 v22, -0x1

    move/from16 v0, v30

    move/from16 v1, v22

    if-eq v0, v1, :cond_7

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_7

    .line 218
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 224
    .local v10, "urgency":I
    :goto_7
    const-string v22, "cmas_certainty"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v26

    .line 226
    .local v26, "cmasCertaintyColumn":I
    const/16 v22, -0x1

    move/from16 v0, v26

    move/from16 v1, v22

    if-eq v0, v1, :cond_8

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-nez v22, :cond_8

    .line 227
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 232
    .local v11, "certainty":I
    :goto_8
    new-instance v5, Landroid/telephony/SmsCbCmasInfo;

    invoke-direct/range {v5 .. v11}, Landroid/telephony/SmsCbCmasInfo;-><init>(IIIIII)V

    .line 238
    .end local v6    # "messageClass":I
    .end local v7    # "cmasCategory":I
    .end local v8    # "responseType":I
    .end local v9    # "severity":I
    .end local v10    # "urgency":I
    .end local v11    # "certainty":I
    .end local v25    # "cmasCategoryColumn":I
    .end local v26    # "cmasCertaintyColumn":I
    .end local v28    # "cmasResponseTypeColumn":I
    .end local v29    # "cmasSeverityColumn":I
    .end local v30    # "cmasUrgencyColumn":I
    .local v5, "cmasInfo":Landroid/telephony/SmsCbCmasInfo;
    :goto_9
    new-instance v12, Landroid/telephony/SmsCbMessage;

    move-object/from16 v22, v5

    invoke-direct/range {v12 .. v22}, Landroid/telephony/SmsCbMessage;-><init>(IIILandroid/telephony/SmsCbLocation;ILjava/lang/String;Ljava/lang/String;ILandroid/telephony/SmsCbEtwsInfo;Landroid/telephony/SmsCbCmasInfo;)V

    .line 241
    .local v12, "msg":Landroid/telephony/SmsCbMessage;
    const-string v22, "date"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v31

    .line 243
    .local v31, "deliveryTime":J
    const-string v22, "read"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    if-eqz v22, :cond_a

    const/16 v34, 0x1

    .line 246
    .local v34, "isRead":Z
    :goto_a
    new-instance v22, Landroid/telephony/CellBroadcastMessage;

    move-object/from16 v0, v22

    move-wide/from16 v1, v31

    move/from16 v3, v34

    invoke-direct {v0, v12, v1, v2, v3}, Landroid/telephony/CellBroadcastMessage;-><init>(Landroid/telephony/SmsCbMessage;JZ)V

    return-object v22

    .line 150
    .end local v5    # "cmasInfo":Landroid/telephony/SmsCbCmasInfo;
    .end local v12    # "msg":Landroid/telephony/SmsCbMessage;
    .end local v16    # "location":Landroid/telephony/SmsCbLocation;
    .end local v21    # "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    .end local v23    # "cid":I
    .end local v24    # "cidColumn":I
    .end local v27    # "cmasMessageClassColumn":I
    .end local v31    # "deliveryTime":J
    .end local v33    # "etwsWarningTypeColumn":I
    .end local v34    # "isRead":Z
    .end local v35    # "lac":I
    .end local v36    # "lacColumn":I
    .end local v37    # "plmn":Ljava/lang/String;
    :cond_0
    const/16 v37, 0x0

    .restart local v37    # "plmn":Ljava/lang/String;
    goto/16 :goto_0

    .line 158
    .restart local v36    # "lacColumn":I
    :cond_1
    const/16 v35, -0x1

    .restart local v35    # "lac":I
    goto/16 :goto_1

    .line 166
    .restart local v24    # "cidColumn":I
    :cond_2
    const/16 v23, -0x1

    .restart local v23    # "cid":I
    goto/16 :goto_2

    .line 178
    .restart local v16    # "location":Landroid/telephony/SmsCbLocation;
    .restart local v33    # "etwsWarningTypeColumn":I
    :cond_3
    const/16 v21, 0x0

    .restart local v21    # "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    goto/16 :goto_3

    .line 193
    .restart local v6    # "messageClass":I
    .restart local v25    # "cmasCategoryColumn":I
    .restart local v27    # "cmasMessageClassColumn":I
    :cond_4
    const/4 v7, -0x1

    .restart local v7    # "cmasCategory":I
    goto/16 :goto_4

    .line 202
    .restart local v28    # "cmasResponseTypeColumn":I
    :cond_5
    const/4 v8, -0x1

    .restart local v8    # "responseType":I
    goto/16 :goto_5

    .line 211
    .restart local v29    # "cmasSeverityColumn":I
    :cond_6
    const/4 v9, -0x1

    .restart local v9    # "severity":I
    goto/16 :goto_6

    .line 220
    .restart local v30    # "cmasUrgencyColumn":I
    :cond_7
    const/4 v10, -0x1

    .restart local v10    # "urgency":I
    goto :goto_7

    .line 229
    .restart local v26    # "cmasCertaintyColumn":I
    :cond_8
    const/4 v11, -0x1

    .restart local v11    # "certainty":I
    goto :goto_8

    .line 235
    .end local v6    # "messageClass":I
    .end local v7    # "cmasCategory":I
    .end local v8    # "responseType":I
    .end local v9    # "severity":I
    .end local v10    # "urgency":I
    .end local v11    # "certainty":I
    .end local v25    # "cmasCategoryColumn":I
    .end local v26    # "cmasCertaintyColumn":I
    .end local v28    # "cmasResponseTypeColumn":I
    .end local v29    # "cmasSeverityColumn":I
    .end local v30    # "cmasUrgencyColumn":I
    :cond_9
    const/4 v5, 0x0

    .restart local v5    # "cmasInfo":Landroid/telephony/SmsCbCmasInfo;
    goto :goto_9

    .line 243
    .restart local v12    # "msg":Landroid/telephony/SmsCbMessage;
    .restart local v31    # "deliveryTime":J
    :cond_a
    const/16 v34, 0x0

    goto :goto_a
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    return v0
.end method

.method public getCmasMessageClass()I
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->isCmasMessage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getCmasWarningInfo()Landroid/telephony/SmsCbCmasInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getMessageClass()I

    move-result v0

    .line 382
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getCmasWarningInfo()Landroid/telephony/SmsCbCmasInfo;
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getCmasWarningInfo()Landroid/telephony/SmsCbCmasInfo;

    move-result-object v0

    return-object v0
.end method

.method public getContentValues()Landroid/content/ContentValues;
    .locals 8

    .prologue
    const/4 v7, -0x1

    .line 254
    new-instance v1, Landroid/content/ContentValues;

    const/16 v5, 0x10

    invoke-direct {v1, v5}, Landroid/content/ContentValues;-><init>(I)V

    .line 255
    .local v1, "cv":Landroid/content/ContentValues;
    iget-object v4, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    .line 256
    .local v4, "msg":Landroid/telephony/SmsCbMessage;
    const-string v5, "geo_scope"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getGeographicalScope()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 257
    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getLocation()Landroid/telephony/SmsCbLocation;

    move-result-object v3

    .line 258
    .local v3, "location":Landroid/telephony/SmsCbLocation;
    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getPlmn()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 259
    const-string v5, "plmn"

    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getPlmn()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    :cond_0
    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getLac()I

    move-result v5

    if-eq v5, v7, :cond_1

    .line 262
    const-string v5, "lac"

    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getLac()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 264
    :cond_1
    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getCid()I

    move-result v5

    if-eq v5, v7, :cond_2

    .line 265
    const-string v5, "cid"

    invoke-virtual {v3}, Landroid/telephony/SmsCbLocation;->getCid()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 267
    :cond_2
    const-string v5, "serial_number"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getSerialNumber()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 268
    const-string v5, "service_category"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getServiceCategory()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 269
    const-string v5, "language"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getLanguageCode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const-string v5, "body"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    const-string v5, "date"

    iget-wide v6, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 272
    const-string v5, "read"

    iget-boolean v6, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 273
    const-string v5, "format"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getMessageFormat()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 274
    const-string v5, "priority"

    invoke-virtual {v4}, Landroid/telephony/SmsCbMessage;->getMessagePriority()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 276
    iget-object v5, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v5}, Landroid/telephony/SmsCbMessage;->getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;

    move-result-object v2

    .line 277
    .local v2, "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    if-eqz v2, :cond_3

    .line 278
    const-string v5, "etws_warning_type"

    invoke-virtual {v2}, Landroid/telephony/SmsCbEtwsInfo;->getWarningType()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 281
    :cond_3
    iget-object v5, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v5}, Landroid/telephony/SmsCbMessage;->getCmasWarningInfo()Landroid/telephony/SmsCbCmasInfo;

    move-result-object v0

    .line 282
    .local v0, "cmasInfo":Landroid/telephony/SmsCbCmasInfo;
    if-eqz v0, :cond_4

    .line 283
    const-string v5, "cmas_message_class"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getMessageClass()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 284
    const-string v5, "cmas_category"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getCategory()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 285
    const-string v5, "cmas_response_type"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getResponseType()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 286
    const-string v5, "cmas_severity"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getSeverity()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 287
    const-string v5, "cmas_urgency"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getUrgency()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 288
    const-string v5, "cmas_certainty"

    invoke-virtual {v0}, Landroid/telephony/SmsCbCmasInfo;->getCertainty()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 291
    :cond_4
    return-object v1
.end method

.method public getDateString(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 422
    const v0, 0x80b11

    .line 425
    .local v0, "flags":I
    iget-wide v1, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    invoke-static {p1, v1, v2, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDeliveryTime()J
    .locals 2

    .prologue
    .line 311
    iget-wide v0, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    return-wide v0
.end method

.method public getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;

    move-result-object v0

    return-object v0
.end method

.method public getLanguageCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 303
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getLanguageCode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessageBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSerialNumber()I
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getSerialNumber()I

    move-result v0

    return v0
.end method

.method public getServiceCategory()I
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->getServiceCategory()I

    move-result v0

    return v0
.end method

.method public getSpokenDateString(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 434
    const/16 v0, 0x11

    .line 435
    .local v0, "flags":I
    iget-wide v1, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    invoke-static {p1, v1, v2, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSubId()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public isCmasMessage()Z
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->isCmasMessage()Z

    move-result v0

    return v0
.end method

.method public isEmergencyAlertMessage()Z
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->isEmergencyMessage()Z

    move-result v0

    return v0
.end method

.method public isEtwsEmergencyUserAlert()Z
    .locals 2

    .prologue
    .line 402
    iget-object v1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v1}, Landroid/telephony/SmsCbMessage;->getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;

    move-result-object v0

    .line 403
    .local v0, "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/SmsCbEtwsInfo;->isEmergencyUserAlert()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isEtwsMessage()Z
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->isEtwsMessage()Z

    move-result v0

    return v0
.end method

.method public isEtwsPopupAlert()Z
    .locals 2

    .prologue
    .line 392
    iget-object v1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v1}, Landroid/telephony/SmsCbMessage;->getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;

    move-result-object v0

    .line 393
    .local v0, "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/SmsCbEtwsInfo;->isPopupAlert()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isEtwsTestMessage()Z
    .locals 3

    .prologue
    .line 411
    iget-object v1, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v1}, Landroid/telephony/SmsCbMessage;->getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;

    move-result-object v0

    .line 412
    .local v0, "etwsInfo":Landroid/telephony/SmsCbEtwsInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/SmsCbEtwsInfo;->getWarningType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isPublicAlertMessage()Z
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0}, Landroid/telephony/SmsCbMessage;->isEmergencyMessage()Z

    move-result v0

    return v0
.end method

.method public isRead()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    return v0
.end method

.method public setIsRead(Z)V
    .locals 0
    .param p1, "isRead"    # Z

    .prologue
    .line 299
    iput-boolean p1, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    .line 300
    return-void
.end method

.method public setSubId(I)V
    .locals 0
    .param p1, "subId"    # I

    .prologue
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 104
    iget-object v0, p0, Landroid/telephony/CellBroadcastMessage;->mSmsCbMessage:Landroid/telephony/SmsCbMessage;

    invoke-virtual {v0, p1, p2}, Landroid/telephony/SmsCbMessage;->writeToParcel(Landroid/os/Parcel;I)V

    .line 105
    iget-wide v0, p0, Landroid/telephony/CellBroadcastMessage;->mDeliveryTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 106
    iget-boolean v0, p0, Landroid/telephony/CellBroadcastMessage;->mIsRead:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 107
    iget v0, p0, Landroid/telephony/CellBroadcastMessage;->mSubId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 108
    return-void

    .line 106
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
