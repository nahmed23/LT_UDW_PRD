﻿CREATE TABLE [dbo].[stage_hash_spabiz_STORE] (
    [stage_hash_spabiz_STORE_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                    CHAR (32)       NOT NULL,
    [ID]                         DECIMAL (26, 6) NULL,
    [EDITTIME]                   DATETIME        NULL,
    [QUICKID]                    CHAR (30)       NULL,
    [LOCKED]                     DECIMAL (26, 6) NULL,
    [Delete]                     DECIMAL (26, 6) NULL,
    [DELETEDATE]                 DATETIME        NULL,
    [NAME]                       VARCHAR (150)   NULL,
    [ADDRESS1]                   VARCHAR (360)   NULL,
    [ADDRESS2]                   VARCHAR (360)   NULL,
    [CITY]                       VARCHAR (60)    NULL,
    [STATE]                      VARCHAR (6)     NULL,
    [ZIP]                        VARCHAR (30)    NULL,
    [COUNTRY]                    VARCHAR (150)   NULL,
    [BACKUP]                     VARCHAR (150)   NULL,
    [TELEPHONE]                  VARCHAR (150)   NULL,
    [RETAILTAXID]                VARCHAR (150)   NULL,
    [STARTPERIOD]                DECIMAL (26, 6) NULL,
    [store_1Name]                VARCHAR (150)   NULL,
    [store_1Start]               VARCHAR (15)    NULL,
    [store_1End]                 VARCHAR (15)    NULL,
    [store_2Name]                VARCHAR (150)   NULL,
    [store_2Start]               VARCHAR (15)    NULL,
    [store_2End]                 VARCHAR (15)    NULL,
    [store_3Name]                VARCHAR (150)   NULL,
    [store_3Start]               VARCHAR (15)    NULL,
    [store_3End]                 VARCHAR (15)    NULL,
    [store_4Name]                VARCHAR (150)   NULL,
    [store_4Start]               VARCHAR (15)    NULL,
    [store_4End]                 VARCHAR (15)    NULL,
    [store_5Name]                VARCHAR (150)   NULL,
    [store_5Start]               VARCHAR (15)    NULL,
    [store_5End]                 VARCHAR (15)    NULL,
    [store_6Name]                VARCHAR (150)   NULL,
    [store_6Start]               VARCHAR (15)    NULL,
    [store_6End]                 VARCHAR (15)    NULL,
    [store_7Name]                VARCHAR (150)   NULL,
    [store_7Start]               VARCHAR (15)    NULL,
    [store_7End]                 VARCHAR (15)    NULL,
    [store_8Name]                VARCHAR (150)   NULL,
    [store_8Start]               VARCHAR (15)    NULL,
    [store_8End]                 VARCHAR (15)    NULL,
    [store_9Name]                VARCHAR (150)   NULL,
    [store_9Start]               VARCHAR (15)    NULL,
    [store_9End]                 VARCHAR (15)    NULL,
    [store_10Name]               VARCHAR (150)   NULL,
    [store_10Start]              VARCHAR (15)    NULL,
    [store_10End]                VARCHAR (15)    NULL,
    [store_11Name]               VARCHAR (150)   NULL,
    [store_11Start]              VARCHAR (15)    NULL,
    [store_11End]                VARCHAR (15)    NULL,
    [store_12Name]               VARCHAR (150)   NULL,
    [store_12Start]              VARCHAR (15)    NULL,
    [store_12End]                VARCHAR (15)    NULL,
    [store_13Name]               VARCHAR (150)   NULL,
    [store_13Start]              VARCHAR (15)    NULL,
    [store_13End]                VARCHAR (15)    NULL,
    [OPEN1]                      DECIMAL (26, 6) NULL,
    [OPEN2]                      DECIMAL (26, 6) NULL,
    [OPEN3]                      DECIMAL (26, 6) NULL,
    [OPEN4]                      DECIMAL (26, 6) NULL,
    [OPEN5]                      DECIMAL (26, 6) NULL,
    [OPEN6]                      DECIMAL (26, 6) NULL,
    [OPEN7]                      DECIMAL (26, 6) NULL,
    [AVAILABLE]                  DECIMAL (26, 6) NULL,
    [DDAY]                       DATETIME        NULL,
    [RECCNT]                     VARCHAR (765)   NULL,
    [DBVERSION]                  DECIMAL (26, 6) NULL,
    [HQPATH]                     VARCHAR (765)   NULL,
    [CASHCHANGE]                 DECIMAL (26, 6) NULL,
    [STORE_NUMBER]               DECIMAL (26, 6) NULL,
    [PAYMENTTECH]                DECIMAL (26, 6) NULL,
    [PAGERPORT]                  DECIMAL (26, 6) NULL,
    [STOREINFO]                  VARCHAR (4000)  NULL,
    [MERCHANTNUMBER]             VARCHAR (36)    NULL,
    [CLIENTNUMBER]               VARCHAR (12)    NULL,
    [POWERBOOKING]               DECIMAL (26, 6) NULL,
    [SBLOGONPATH]                VARCHAR (300)   NULL,
    [SCAT_STORENUM]              DECIMAL (26, 6) NULL,
    [WEBBOOK]                    DECIMAL (26, 6) NULL,
    [COUNTERID]                  DECIMAL (26, 6) NULL,
    [STOREID]                    DECIMAL (26, 6) NULL,
    [SQRFOOTAGE]                 DECIMAL (26, 6) NULL,
    [WEBVIEW]                    DECIMAL (26, 6) NULL,
    [ISMASTER]                   DECIMAL (26, 6) NULL,
    [dv_load_date_time]          DATETIME        NOT NULL,
    [dv_inserted_date_time]      DATETIME        NOT NULL,
    [dv_insert_user]             VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]       DATETIME        NULL,
    [dv_update_user]             VARCHAR (50)    NULL,
    [dv_batch_id]                BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

