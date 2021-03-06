﻿CREATE TABLE [dbo].[stage_hash_mms_DrawerActivity] (
    [stage_hash_mms_DrawerActivity_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                          CHAR (32)      NOT NULL,
    [DrawerActivityID]                 INT            NULL,
    [DrawerID]                         INT            NULL,
    [OpenDateTime]                     DATETIME       NULL,
    [CloseDateTime]                    DATETIME       NULL,
    [OpenEmployeeID]                   INT            NULL,
    [CloseEmployeeID]                  INT            NULL,
    [ValDrawerStatusID]                INT            NULL,
    [UTCOpenDateTime]                  DATETIME       NULL,
    [OpenDateTimeZone]                 VARCHAR (4)    NULL,
    [UTCCloseDateTime]                 DATETIME       NULL,
    [CloseDateTimeZone]                VARCHAR (4)    NULL,
    [InsertedDateTime]                 DATETIME       NULL,
    [UpdatedDateTime]                  DATETIME       NULL,
    [PendDateTime]                     DATETIME       NULL,
    [PendEmployeeID]                   INT            NULL,
    [PendDateTimeZone]                 VARCHAR (4)    NULL,
    [UTCPendDateTime]                  DATETIME       NULL,
    [ClosingComments]                  NVARCHAR (527) NULL,
    [dv_load_date_time]                DATETIME       NOT NULL,
    [dv_inserted_date_time]            DATETIME       NOT NULL,
    [dv_insert_user]                   VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]             DATETIME       NULL,
    [dv_update_user]                   VARCHAR (50)   NULL,
    [dv_batch_id]                      BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

