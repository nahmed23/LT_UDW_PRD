﻿CREATE TABLE [dbo].[stage_hash_spabiz_TICKET] (
    [stage_hash_spabiz_TICKET_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                     CHAR (32)       NOT NULL,
    [ID]                          DECIMAL (26, 6) NULL,
    [COUNTERID]                   DECIMAL (26, 6) NULL,
    [STOREID]                     DECIMAL (26, 6) NULL,
    [EDITTIME]                    DATETIME        NULL,
    [CUSTID]                      DECIMAL (26, 6) NULL,
    [TICKETNUM]                   VARCHAR (150)   NULL,
    [TICKETID]                    VARCHAR (15)    NULL,
    [Date]                        DATETIME        NULL,
    [STAFFID]                     DECIMAL (26, 6) NULL,
    [VOIDERID]                    DECIMAL (26, 6) NULL,
    [VOIDREASONID]                DECIMAL (26, 6) NULL,
    [STATUS]                      DECIMAL (26, 6) NULL,
    [SALES_SUBTOTAL]              DECIMAL (26, 6) NULL,
    [SALES_TOTAL]                 DECIMAL (26, 6) NULL,
    [SALES_PRODUCTTOTAL]          DECIMAL (26, 6) NULL,
    [SALES_SERVICETOTAL]          DECIMAL (26, 6) NULL,
    [CASHCHANGE]                  DECIMAL (26, 6) NULL,
    [DISCOUNTTOTAL]               DECIMAL (26, 6) NULL,
    [DISCOUNT_SERVICE]            DECIMAL (26, 6) NULL,
    [DISCOUNT_PRODUCT]            DECIMAL (26, 6) NULL,
    [TAXTOTAL]                    DECIMAL (26, 6) NULL,
    [NODEID]                      DECIMAL (26, 6) NULL,
    [SHIFTID]                     DECIMAL (26, 6) NULL,
    [DAYID]                       DECIMAL (26, 6) NULL,
    [PERIODID]                    DECIMAL (26, 6) NULL,
    [SHIFTCREATEDID]              DECIMAL (26, 6) NULL,
    [APID]                        DECIMAL (26, 6) NULL,
    [CHECKINTIME]                 DATETIME        NULL,
    [LATE]                        DECIMAL (26, 6) NULL,
    [TIP]                         DECIMAL (26, 6) NULL,
    [USEDIMAGESCRIPT]             DECIMAL (26, 6) NULL,
    [CUSTBALANCE]                 DECIMAL (26, 6) NULL,
    [PAYTYPEID]                   DECIMAL (26, 6) NULL,
    [TIME]                        DATETIME        NULL,
    [NEXTSTAFFID]                 DECIMAL (26, 6) NULL,
    [CHECKINSTATUS]               DECIMAL (26, 6) NULL,
    [DISCOUNTDBL]                 DECIMAL (26, 6) NULL,
    [PERFORMEDVALUEADDEDSERV]     DECIMAL (26, 6) NULL,
    [PRODUCTONLY]                 DECIMAL (26, 6) NULL,
    [SERVICEONLY]                 DECIMAL (26, 6) NULL,
    [HASPRODUCT]                  DECIMAL (26, 6) NULL,
    [HASSERVICE]                  DECIMAL (26, 6) NULL,
    [HASONLYPRODUCT]              DECIMAL (26, 6) NULL,
    [HASONLYSERVICE]              DECIMAL (26, 6) NULL,
    [HASBOTH]                     DECIMAL (26, 6) NULL,
    [SALES_GIFTTOTAL]             DECIMAL (26, 6) NULL,
    [SALES_PACKAGETOTAL]          DECIMAL (26, 6) NULL,
    [SALES_SERIESTOTAL]           DECIMAL (26, 6) NULL,
    [STORE_NUMBER]                DECIMAL (26, 6) NULL,
    [NOTE]                        VARCHAR (1500)  NULL,
    [PROMESSAGEANSWER2]           DECIMAL (26, 6) NULL,
    [PROMESSAGE3]                 VARCHAR (300)   NULL,
    [PROMESSAGEANSWER3]           DECIMAL (26, 6) NULL,
    [PROMESSAGE]                  VARCHAR (300)   NULL,
    [PROMESSAGE1]                 VARCHAR (300)   NULL,
    [PROMESSAGEANSWER1]           DECIMAL (26, 6) NULL,
    [PROMESSAGE2]                 VARCHAR (300)   NULL,
    [PARTYID]                     DECIMAL (26, 6) NULL,
    [ISMASTERTICKET]              DECIMAL (26, 6) NULL,
    [PAYCOUNTER]                  DECIMAL (26, 6) NULL,
    [PROCESSEDON]                 DECIMAL (26, 6) NULL,
    [dv_load_date_time]           DATETIME        NOT NULL,
    [dv_inserted_date_time]       DATETIME        NOT NULL,
    [dv_insert_user]              VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]        DATETIME        NULL,
    [dv_update_user]              VARCHAR (50)    NULL,
    [dv_batch_id]                 BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

