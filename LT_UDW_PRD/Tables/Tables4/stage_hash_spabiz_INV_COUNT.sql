﻿CREATE TABLE [dbo].[stage_hash_spabiz_INV_COUNT] (
    [stage_hash_spabiz_INV_COUNT_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                        CHAR (32)       NOT NULL,
    [ID]                             DECIMAL (26, 6) NULL,
    [COUNTERID]                      DECIMAL (26, 6) NULL,
    [NUM]                            VARCHAR (150)   NULL,
    [CYCLEID]                        DECIMAL (26, 6) NULL,
    [COUNTID]                        DECIMAL (26, 6) NULL,
    [STATUS]                         DECIMAL (26, 6) NULL,
    [NOCYCLE]                        DECIMAL (26, 6) NULL,
    [DATEEXPECTED]                   DATETIME        NULL,
    [DATESTARTED]                    DATETIME        NULL,
    [Date]                           DATETIME        NULL,
    [STAFFID]                        DECIMAL (26, 6) NULL,
    [COUNTCHECKEDBY]                 DECIMAL (26, 6) NULL,
    [ENTEREDBY]                      DECIMAL (26, 6) NULL,
    [ENTERCHECKEDBY]                 DECIMAL (26, 6) NULL,
    [STARTRANGE]                     VARCHAR (150)   NULL,
    [ENDRANGE]                       VARCHAR (150)   NULL,
    [SORTCOUNTBY]                    DECIMAL (26, 6) NULL,
    [NAME]                           VARCHAR (150)   NULL,
    [ITEMTYPE]                       DECIMAL (26, 6) NULL,
    [TOTALSKUS]                      DECIMAL (26, 6) NULL,
    [NUMADJUSTED]                    DECIMAL (26, 6) NULL,
    [INVEFFECT]                      DECIMAL (26, 6) NULL,
    [EXTRA]                          VARCHAR (3000)  NULL,
    [EDITTIME]                       DATETIME        NULL,
    [ADJNUM]                         VARCHAR (150)   NULL,
    [STORE_NUMBER]                   DECIMAL (26, 6) NULL,
    [STOREID]                        DECIMAL (26, 6) NULL,
    [dv_load_date_time]              DATETIME        NOT NULL,
    [dv_inserted_date_time]          DATETIME        NOT NULL,
    [dv_insert_user]                 VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]           DATETIME        NULL,
    [dv_update_user]                 VARCHAR (50)    NULL,
    [dv_batch_id]                    BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
