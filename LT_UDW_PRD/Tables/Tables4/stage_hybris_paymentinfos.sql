﻿CREATE TABLE [dbo].[stage_hybris_paymentinfos] (
    [stage_hybris_paymentinfos_id] BIGINT         NOT NULL,
    [hjmpTS]                       BIGINT         NULL,
    [TypePkString]                 BIGINT         NULL,
    [PK]                           BIGINT         NULL,
    [createdTS]                    DATETIME       NULL,
    [modifiedTS]                   DATETIME       NULL,
    [OwnerPkString]                BIGINT         NULL,
    [aCLTS]                        INT            NULL,
    [propTS]                       INT            NULL,
    [userpk]                       BIGINT         NULL,
    [p_issuenumber]                INT            NULL,
    [p_bank]                       NVARCHAR (255) NULL,
    [p_ccowner]                    NVARCHAR (255) NULL,
    [p_subscriptionid]             NVARCHAR (255) NULL,
    [p_bankidnumber]               NVARCHAR (255) NULL,
    [p_validfrommonth]             NVARCHAR (255) NULL,
    [p_saved]                      TINYINT        NULL,
    [p_baowner]                    NVARCHAR (255) NULL,
    [p_number]                     NVARCHAR (255) NULL,
    [p_validfromyear]              NVARCHAR (255) NULL,
    [p_validtoyear]                NVARCHAR (255) NULL,
    [p_billingaddress]             BIGINT         NULL,
    [p_accountnumber]              NVARCHAR (255) NULL,
    [p_validtomonth]               NVARCHAR (255) NULL,
    [code]                         NVARCHAR (255) NULL,
    [p_type]                       BIGINT         NULL,
    [p_mockedflag]                 TINYINT        NULL,
    [p_nickname]                   NVARCHAR (255) NULL,
    [originalpk]                   BIGINT         NULL,
    [duplicate]                    TINYINT        NULL,
    [p_ltfcriteria]                NVARCHAR (255) NULL,
    [p_creditcardtoken]            NVARCHAR (255) NULL,
    [p_subscriptionvalidated]      TINYINT        NULL,
    [p_paymentid]                  NVARCHAR (255) NULL,
    [p_payerid]                    NVARCHAR (255) NULL,
    [p_token]                      NVARCHAR (255) NULL,
    [p_payer]                      NVARCHAR (255) NULL,
    [dv_batch_id]                  BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);
