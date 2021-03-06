﻿CREATE TABLE [dbo].[stage_hash_mms_ReimbursementProgramIdentifierFormat] (
    [stage_hash_mms_ReimbursementProgramIdentifierFormat_id] BIGINT        IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                                CHAR (32)     NOT NULL,
    [ReimbursementProgramIdentifierFormatID]                 INT           NULL,
    [ReimbursementProgramID]                                 INT           NULL,
    [Description]                                            VARCHAR (50)  NULL,
    [ActiveFlag]                                             BIT           NULL,
    [InsertedDateTime]                                       DATETIME      NULL,
    [UpdatedDateTime]                                        DATETIME      NULL,
    [ImageURL]                                               VARCHAR (250) NULL,
    [ImageDescription]                                       VARCHAR (250) NULL,
    [SortOrder]                                              INT           NULL,
    [ValProgramIdentifierValidationClassID]                  TINYINT       NULL,
    [dv_load_date_time]                                      DATETIME      NOT NULL,
    [dv_inserted_date_time]                                  DATETIME      NOT NULL,
    [dv_insert_user]                                         VARCHAR (50)  NOT NULL,
    [dv_updated_date_time]                                   DATETIME      NULL,
    [dv_update_user]                                         VARCHAR (50)  NULL,
    [dv_batch_id]                                            BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

