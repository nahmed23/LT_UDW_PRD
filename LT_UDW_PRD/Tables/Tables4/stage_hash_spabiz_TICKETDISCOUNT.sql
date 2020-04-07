﻿CREATE TABLE [dbo].[stage_hash_spabiz_TICKETDISCOUNT] (
    [stage_hash_spabiz_TICKETDISCOUNT_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                             CHAR (32)       NOT NULL,
    [ID]                                  DECIMAL (26, 6) NULL,
    [COUNTERID]                           DECIMAL (26, 6) NULL,
    [STOREID]                             DECIMAL (26, 6) NULL,
    [EDITTIME]                            DATETIME        NULL,
    [TICKETID]                            DECIMAL (26, 6) NULL,
    [Date]                                DATETIME        NULL,
    [CUSTID]                              DECIMAL (26, 6) NULL,
    [DISCOUNTID]                          DECIMAL (26, 6) NULL,
    [AMOUNT]                              DECIMAL (26, 6) NULL,
    [PERCENT]                             DECIMAL (26, 6) NULL,
    [STATUS]                              DECIMAL (26, 6) NULL,
    [SHIFTID]                             DECIMAL (26, 6) NULL,
    [DAYID]                               DECIMAL (26, 6) NULL,
    [PERIODID]                            DECIMAL (26, 6) NULL,
    [DOUBLEIT]                            DECIMAL (26, 6) NULL,
    [PRODUCTID]                           DECIMAL (26, 6) NULL,
    [STORE_NUMBER]                        DECIMAL (26, 6) NULL,
    [GLACCOUNT]                           VARCHAR (45)    NULL,
    [CREATEDBYSTAFF]                      DECIMAL (26, 6) NULL,
    [dv_load_date_time]                   DATETIME        NOT NULL,
    [dv_inserted_date_time]               DATETIME        NOT NULL,
    [dv_insert_user]                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                DATETIME        NULL,
    [dv_update_user]                      VARCHAR (50)    NULL,
    [dv_batch_id]                         BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
