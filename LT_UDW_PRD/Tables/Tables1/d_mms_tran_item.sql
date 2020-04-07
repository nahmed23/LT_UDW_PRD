﻿CREATE TABLE [dbo].[d_mms_tran_item] (
    [d_mms_tran_item_id]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                             CHAR (32)       NOT NULL,
    [fact_mms_sales_transaction_item_key] CHAR (32)       NULL,
    [tran_item_id]                        INT             NULL,
    [bundle_dim_mms_product_key]          CHAR (32)       NULL,
    [bundle_product_id]                   INT             NULL,
    [club_id]                             INT             NULL,
    [dim_club_key]                        CHAR (32)       NULL,
    [dim_mms_product_key]                 CHAR (32)       NULL,
    [external_item_id]                    VARCHAR (50)    NULL,
    [fact_mms_sales_transaction_key]      CHAR (32)       NULL,
    [inserted_date_time]                  DATETIME        NULL,
    [inserted_dim_date_key]               CHAR (8)        NULL,
    [inserted_dim_time_key]               CHAR (8)        NULL,
    [item_lt_bucks_amount]                DECIMAL (26, 6) NULL,
    [item_lt_bucks_sales_tax]             DECIMAL (26, 6) NULL,
    [mms_tran_id]                         INT             NULL,
    [product_id]                          INT             NULL,
    [sales_amount_gross]                  DECIMAL (26, 6) NULL,
    [sales_discount_dollar_amount]        DECIMAL (26, 6) NULL,
    [sales_dollar_amount]                 DECIMAL (26, 6) NULL,
    [sales_quantity]                      INT             NULL,
    [sales_tax_amount]                    DECIMAL (26, 6) NULL,
    [sold_not_serviced_flag]              CHAR (1)        NULL,
    [transaction_source]                  VARCHAR (50)    NULL,
    [updated_date_time]                   DATETIME        NULL,
    [updated_dim_date_key]                CHAR (8)        NULL,
    [updated_dim_time_key]                CHAR (8)        NULL,
    [p_mms_tran_item_id]                  BIGINT          NOT NULL,
    [deleted_flag]                        INT             NULL,
    [dv_load_date_time]                   DATETIME        NULL,
    [dv_load_end_date_time]               DATETIME        NULL,
    [dv_batch_id]                         BIGINT          NOT NULL,
    [dv_inserted_date_time]               DATETIME        NOT NULL,
    [dv_insert_user]                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                DATETIME        NULL,
    [dv_update_user]                      VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

