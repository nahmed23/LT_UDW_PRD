﻿CREATE TABLE [dbo].[stage_hash_mms_PackageSession] (
    [stage_hash_mms_PackageSession_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                          CHAR (32)      NOT NULL,
    [PackageSessionID]                 INT            NULL,
    [PackageID]                        INT            NULL,
    [CreatedDateTime]                  DATETIME       NULL,
    [UTCCreatedDateTime]               DATETIME       NULL,
    [CreatedDateTimeZone]              VARCHAR (4)    NULL,
    [ModifiedDateTime]                 DATETIME       NULL,
    [UTCModifiedDateTime]              DATETIME       NULL,
    [ModifiedDateTimeZone]             VARCHAR (4)    NULL,
    [DeliveredDateTime]                DATETIME       NULL,
    [UTCDeliveredDateTime]             DATETIME       NULL,
    [DeliveredDateTimeZone]            VARCHAR (4)    NULL,
    [CreatedEmployeeID]                INT            NULL,
    [ModifiedEmployeeID]               INT            NULL,
    [DeliveredEmployeeID]              INT            NULL,
    [ClubID]                           INT            NULL,
    [SessionPrice]                     NUMERIC (9, 4) NULL,
    [Comment]                          VARCHAR (255)  NULL,
    [InsertedDateTime]                 DATETIME       NULL,
    [UpdatedDateTime]                  DATETIME       NULL,
    [MMSTranID]                        INT            NULL,
    [dv_load_date_time]                DATETIME       NOT NULL,
    [dv_inserted_date_time]            DATETIME       NOT NULL,
    [dv_insert_user]                   VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]             DATETIME       NULL,
    [dv_update_user]                   VARCHAR (50)   NULL,
    [dv_batch_id]                      BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

