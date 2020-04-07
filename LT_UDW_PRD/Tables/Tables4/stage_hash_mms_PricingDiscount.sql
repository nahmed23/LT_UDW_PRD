﻿CREATE TABLE [dbo].[stage_hash_mms_PricingDiscount] (
    [stage_hash_mms_PricingDiscount_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                           CHAR (32)       NOT NULL,
    [PricingDiscountID]                 INT             NULL,
    [SalesPromotionID]                  INT             NULL,
    [ValDiscountTypeID]                 TINYINT         NULL,
    [DiscountValue]                     DECIMAL (10, 2) NULL,
    [ValDiscountApplicationTypeID]      TINYINT         NULL,
    [SalesCommissionPercent]            DECIMAL (6, 2)  NULL,
    [ValDiscountCombineRuleID]          TINYINT         NULL,
    [AvailableForAllProductsFlag]       BIT             NULL,
    [AllProductsDiscountUseLimit]       INT             NULL,
    [InsertedDateTime]                  DATETIME        NULL,
    [UpdatedDateTime]                   DATETIME        NULL,
    [ServiceCommissionPercent]          DECIMAL (6, 2)  NULL,
    [EffectiveFromDateTime]             DATETIME        NULL,
    [EffectiveThruDateTime]             DATETIME        NULL,
    [Description]                       VARCHAR (50)    NULL,
    [MustBuyAllFlag]                    BIT             NULL,
    [BundleDiscountFlag]                BIT             NULL,
    [ProductAddedFromDate]              DATETIME        NULL,
    [ProductAddedToDate]                DATETIME        NULL,
    [dv_load_date_time]                 DATETIME        NOT NULL,
    [dv_inserted_date_time]             DATETIME        NOT NULL,
    [dv_insert_user]                    VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]              DATETIME        NULL,
    [dv_update_user]                    VARCHAR (50)    NULL,
    [dv_batch_id]                       BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
