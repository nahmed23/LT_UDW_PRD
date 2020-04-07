﻿CREATE TABLE [dbo].[stage_hybris_basestore] (
    [stage_hybris_basestore_id]      BIGINT          NOT NULL,
    [hjmpTS]                         BIGINT          NULL,
    [createdTS]                      DATETIME        NULL,
    [modifiedTS]                     DATETIME        NULL,
    [TypePkString]                   BIGINT          NULL,
    [OwnerPkString]                  BIGINT          NULL,
    [PK]                             BIGINT          NULL,
    [p_uid]                          NVARCHAR (255)  NULL,
    [p_storelocatordistanceunit]     BIGINT          NULL,
    [p_net]                          TINYINT         NULL,
    [p_taxgroup]                     BIGINT          NULL,
    [p_defaultlanguage]              BIGINT          NULL,
    [p_defaultcurrency]              BIGINT          NULL,
    [p_defaultdeliveryorigin]        BIGINT          NULL,
    [p_solrfacetsearchconfiguration] BIGINT          NULL,
    [p_submitorderprocesscode]       NVARCHAR (255)  NULL,
    [p_createreturnprocesscode]      NVARCHAR (255)  NULL,
    [p_externaltaxenabled]           TINYINT         NULL,
    [p_pickupinstoremode]            BIGINT          NULL,
    [p_maxradiusforpossearch]        DECIMAL (26, 6) NULL,
    [p_customerallowedtoignoresugge] TINYINT         NULL,
    [p_paymentprovider]              NVARCHAR (255)  NULL,
    [p_expresscheckoutenabled]       TINYINT         NULL,
    [p_taxestimationenabled]         TINYINT         NULL,
    [p_checkoutflowgroup]            NVARCHAR (255)  NULL,
    [p_defaultatpformula]            BIGINT          NULL,
    [p_sourcingconfig]               BIGINT          NULL,
    [aCLTS]                          BIGINT          NULL,
    [propTS]                         BIGINT          NULL,
    [dv_batch_id]                    BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

