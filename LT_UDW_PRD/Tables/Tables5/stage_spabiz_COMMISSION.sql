﻿CREATE TABLE [dbo].[stage_spabiz_COMMISSION] (
    [stage_spabiz_COMMISSION_id] BIGINT          NOT NULL,
    [ID]                         DECIMAL (26, 6) NULL,
    [COUNTERID]                  DECIMAL (26, 6) NULL,
    [STOREID]                    DECIMAL (26, 6) NULL,
    [EDITTIME]                   DATETIME        NULL,
    [Delete]                     DECIMAL (26, 6) NULL,
    [DELETEDATE]                 DATETIME        NULL,
    [NAME]                       VARCHAR (150)   NULL,
    [USESLIDINGSCALE]            DECIMAL (26, 6) NULL,
    [LEVEL1VALUE]                DECIMAL (26, 6) NULL,
    [LEVEL1COMMISH]              DECIMAL (26, 6) NULL,
    [LEVEL2VALUE]                DECIMAL (26, 6) NULL,
    [LEVEL2COMMISH]              DECIMAL (26, 6) NULL,
    [LEVEL3VALUE]                DECIMAL (26, 6) NULL,
    [LEVEL3COMMISH]              DECIMAL (26, 6) NULL,
    [LEVEL4VALUE]                DECIMAL (26, 6) NULL,
    [LEVEL4COMMISH]              DECIMAL (26, 6) NULL,
    [LEVEL5VALUE]                DECIMAL (26, 6) NULL,
    [LEVEL5COMMISH]              DECIMAL (26, 6) NULL,
    [STORE_NUMBER]               DECIMAL (26, 6) NULL,
    [COMMISSIONBACKUPID]         DECIMAL (26, 6) NULL,
    [dv_batch_id]                BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

