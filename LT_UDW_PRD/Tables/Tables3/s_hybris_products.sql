﻿CREATE TABLE [dbo].[s_hybris_products] (
    [s_hybris_products_id]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                    CHAR (32)       NOT NULL,
    [hjmpts]                     BIGINT          NULL,
    [products_pk]                BIGINT          NULL,
    [created_ts]                 DATETIME        NULL,
    [modified_ts]                DATETIME        NULL,
    [acl_ts]                     INT             NULL,
    [prop_ts]                    INT             NULL,
    [p_manufacturer_aid]         NVARCHAR (255)  NULL,
    [p_normal]                   VARCHAR (8000)  NULL,
    [p_number]                   INT             NULL,
    [p_auto_thumb_nails]         VARCHAR (8000)  NULL,
    [p_erp_group_supplier]       NVARCHAR (255)  NULL,
    [code]                       NVARCHAR (255)  NULL,
    [p_product_width]            DECIMAL (26, 6) NULL,
    [p_offline_date]             DATETIME        NULL,
    [p_detail]                   VARCHAR (8000)  NULL,
    [p_electronic_shipping_flag] TINYINT         NULL,
    [p_order]                    INT             NULL,
    [p_offer_external_link_flag] TINYINT         NULL,
    [p_swatch_colour]            NVARCHAR (255)  NULL,
    [p_gift_card_flag]           TINYINT         NULL,
    [p_start_line_number]        INT             NULL,
    [p_number_content_units]     DECIMAL (26, 6) NULL,
    [p_data_sheet]               VARCHAR (8000)  NULL,
    [p_denomination]             INT             NULL,
    [p_delivery_time]            DECIMAL (26, 6) NULL,
    [p_mobile_product_flag]      TINYINT         NULL,
    [p_max_order_quantity]       INT             NULL,
    [p_product_length]           DECIMAL (26, 6) NULL,
    [p_manufacturer_name]        NVARCHAR (255)  NULL,
    [p_end_line_number]          INT             NULL,
    [p_thumb_nails]              VARCHAR (8000)  NULL,
    [p_min_order_quantity]       INT             NULL,
    [p_product_height]           DECIMAL (26, 6) NULL,
    [p_free_usps_shipping_flag]  TINYINT         NULL,
    [p_ean]                      NVARCHAR (255)  NULL,
    [p_e_gift_cards]             VARCHAR (8000)  NULL,
    [p_logo]                     VARCHAR (8000)  NULL,
    [p_auto_shipflag]            TINYINT         NULL,
    [p_order_quantity_interval]  INT             NULL,
    [p_others]                   VARCHAR (8000)  NULL,
    [p_e_gift_card_flag]         TINYINT         NULL,
    [p_gallery_images]           VARCHAR (8000)  NULL,
    [p_online_date]              DATETIME        NULL,
    [p_ltf_offer_flag]           TINYINT         NULL,
    [p_genders]                  VARCHAR (8000)  NULL,
    [p_product_cost]             DECIMAL (26, 6) NULL,
    [p_price_quantity]           DECIMAL (26, 6) NULL,
    [p_weight]                   DECIMAL (26, 6) NULL,
    [p_erp_group_buyer]          NVARCHAR (255)  NULL,
    [p_ltf_only_product]         TINYINT         NULL,
    [p_supplier_alternative_aid] NVARCHAR (255)  NULL,
    [p_lt_bucks_amount]          DECIMAL (26, 6) NULL,
    [p_lt_bucks_flag]            TINYINT         NULL,
    [p_canadian_product]         TINYINT         NULL,
    [p_external_redeem_flag]     TINYINT         NULL,
    [p_mms_product_id]           INT             NULL,
    [p_email_template_id]        NVARCHAR (255)  NULL,
    [p_display_number]           INT             NULL,
    [p_region_id]                NVARCHAR (255)  NULL,
    [p_rev_category_id]          NVARCHAR (255)  NULL,
    [p_cost_center_id]           NVARCHAR (255)  NULL,
    [p_item_description]         NVARCHAR (255)  NULL,
    [p_offering_id]              NVARCHAR (255)  NULL,
    [p_line_company]             NVARCHAR (255)  NULL,
    [p_spend_category_id]        NVARCHAR (255)  NULL,
    [p_ma_local_flag]            TINYINT         NULL,
    [p_fulfillment_product_id]   NVARCHAR (255)  NULL,
    [p_type_descriptor]          NVARCHAR (255)  NULL,
    [p_barcode]                  TINYINT         NULL,
    [p_searchable]               TINYINT         NULL,
    [p_product_messages]         VARCHAR (8000)  NULL,
    [p_occasions]                VARCHAR (8000)  NULL,
    [p_is_giftable]              TINYINT         NULL,
    [p_mms_recurrent]            TINYINT         NULL,
    [p_allow_member_selection]   TINYINT         NULL,
    [dv_load_date_time]          DATETIME        NOT NULL,
    [dv_r_load_source_id]        BIGINT          NOT NULL,
    [dv_inserted_date_time]      DATETIME        NOT NULL,
    [dv_insert_user]             VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]       DATETIME        NULL,
    [dv_update_user]             VARCHAR (50)    NULL,
    [dv_hash]                    CHAR (32)       NOT NULL,
    [dv_batch_id]                BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_s_hybris_products]
    ON [dbo].[s_hybris_products]([bk_hash] ASC, [s_hybris_products_id] ASC);

