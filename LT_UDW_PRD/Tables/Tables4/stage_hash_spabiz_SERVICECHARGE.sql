﻿CREATE TABLE [dbo].[stage_hash_spabiz_SERVICECHARGE] (
    [stage_hash_spabiz_SERVICECHARGE_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                            CHAR (32)       NOT NULL,
    [ID]                                 DECIMAL (26, 6) NULL,
    [COUNTERID]                          DECIMAL (26, 6) NULL,
    [STOREID]                            DECIMAL (26, 6) NULL,
    [EDITTIME]                           DATETIME        NULL,
    [Delete]                             DECIMAL (26, 6) NULL,
    [DELETEDATE]                         DATETIME        NULL,
    [NAME]                               VARCHAR (300)   NULL,
    [QUICKID]                            VARCHAR (150)   NULL,
    [DISPLAYNAME]                        VARCHAR (150)   NULL,
    [STORE_NUMBER]                       DECIMAL (26, 6) NULL,
    [PAYCOMMISSION]                      DECIMAL (26, 6) NULL,
    [ENABLED]                            DECIMAL (26, 6) NULL,
    [ENABLEDTEXT]                        VARCHAR (30)    NULL,
    [TAXABLE]                            DECIMAL (26, 6) NULL,
    [AMOUNT]                             DECIMAL (26, 6) NULL,
    [DOLLARPERCENT]                      DECIMAL (26, 6) NULL,
    [STAFFID]                            DECIMAL (26, 6) NULL,
    [GLACCT]                             VARCHAR (150)   NULL,
    [COMPUTEDON]                         DECIMAL (26, 6) NULL,
    [dv_load_date_time]                  DATETIME        NOT NULL,
    [dv_inserted_date_time]              DATETIME        NOT NULL,
    [dv_insert_user]                     VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]               DATETIME        NULL,
    [dv_update_user]                     VARCHAR (50)    NULL,
    [dv_batch_id]                        BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
