﻿CREATE TABLE [dbo].[stage_hash_mms_ThirdPartyPOSPayment] (
    [stage_hash_mms_ThirdPartyPOSPayment_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                CHAR (32)    NOT NULL,
    [ThirdPartyPOSPaymentID]                 INT          NULL,
    [ValPaymentStatusID]                     TINYINT      NULL,
    [OfflineAuthFlag]                        BIT          NULL,
    [LTFTranDateTime]                        DATETIME     NULL,
    [UTCLTFTranDateTime]                     DATETIME     NULL,
    [LTFTranDateTimeZone]                    VARCHAR (4)  NULL,
    [POSTranDateTime]                        DATETIME     NULL,
    [UTCPOSTranDateTime]                     DATETIME     NULL,
    [POSTranDateTimeZone]                    VARCHAR (4)  NULL,
    [POSUniqueTranID]                        VARCHAR (15) NULL,
    [POSUniqueTranIDLabel]                   VARCHAR (25) NULL,
    [InsertedDateTime]                       DATETIME     NULL,
    [UpdatedDateTime]                        DATETIME     NULL,
    [dv_load_date_time]                      DATETIME     NOT NULL,
    [dv_inserted_date_time]                  DATETIME     NOT NULL,
    [dv_insert_user]                         VARCHAR (50) NOT NULL,
    [dv_updated_date_time]                   DATETIME     NULL,
    [dv_update_user]                         VARCHAR (50) NULL,
    [dv_batch_id]                            BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

