﻿CREATE TABLE [dbo].[d_hybris_all_products] (
    [d_hybris_all_products_id]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                             CHAR (32)       NOT NULL,
    [dim_hybris_product_key]              CHAR (32)       NULL,
    [code]                                NVARCHAR (258)  NULL,
    [accept_lt_bucks_flag]                TINYINT         NULL,
    [active_catalog_version]              BIGINT          NULL,
    [auto_ship_flag]                      TINYINT         NULL,
    [caption]                             NVARCHAR (255)  NULL,
    [catalog_name]                        NVARCHAR (200)  NULL,
    [catalog_version]                     BIGINT          NULL,
    [catalog_version_name]                NVARCHAR (255)  NULL,
    [created_ts]                          DATETIME        NULL,
    [creation_time]                       DATETIME        NULL,
    [description]                         NVARCHAR (4000) NULL,
    [e_gift_card_flag]                    TINYINT         NULL,
    [ean]                                 NVARCHAR (255)  NULL,
    [electronic_shipping_flag]            TINYINT         NULL,
    [fulfillment_partner]                 NVARCHAR (255)  NULL,
    [lt_bucks_earned]                     DECIMAL (26, 6) NULL,
    [ltf_offer_flag]                      TINYINT         NULL,
    [ltf_only_product]                    TINYINT         NULL,
    [modified_time]                       DATETIME        NULL,
    [name]                                NVARCHAR (1545) NULL,
    [offer_external_link_flag]            TINYINT         NULL,
    [offer_link]                          NVARCHAR (1000) NULL,
    [offline_datetime]                    DATETIME        NULL,
    [online_datetime]                     DATETIME        NULL,
    [product_category]                    NVARCHAR (1545) NULL,
    [product_cost]                        DECIMAL (26, 6) NULL,
    [product_height]                      DECIMAL (26, 6) NULL,
    [product_length]                      DECIMAL (26, 6) NULL,
    [product_stock_level]                 INT             NULL,
    [product_stock_status]                NVARCHAR (255)  NULL,
    [product_sub_category]                NVARCHAR (1545) NULL,
    [product_type]                        VARCHAR (18)    NULL,
    [product_width]                       DECIMAL (26, 6) NULL,
    [summary]                             NVARCHAR (4000) NULL,
    [weight]                              DECIMAL (26, 6) NULL,
    [p_hybris_all_products_id]            BIGINT          NOT NULL,
    [deleted_flag]                        INT             NULL,
    [dv_load_date_time]                   DATETIME        NULL,
    [dv_load_end_date_time]               DATETIME        NULL,
    [dv_batch_id]                         BIGINT          NOT NULL,
    [dv_inserted_date_time]               DATETIME        NOT NULL,
    [dv_insert_user]                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                DATETIME        NULL,
    [dv_update_user]                      VARCHAR (50)    NULL,
    [default_dim_reporting_hierarchy_key] VARCHAR (32)    NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[d_hybris_all_products]([dv_batch_id] ASC);
