﻿CREATE TABLE [dbo].[s_hybris_seven_day_orders] (
    [s_hybris_seven_day_orders_id]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)       NOT NULL,
    [order_code]                      NVARCHAR (255)  NULL,
    [order_entry_entry_number]        INT             NULL,
    [order_entry_tracking_number]     NVARCHAR (255)  NULL,
    [order_entry_settlement_datetime] DATETIME        NULL,
    [order_datetime]                  DATETIME        NULL,
    [order_entry_shipping_cost]       DECIMAL (8, 2)  NULL,
    [order_entry_total_tax]           DECIMAL (8, 2)  NULL,
    [order_auto_ship_flag]            TINYINT         NULL,
    [order_entry_product_code]        NVARCHAR (258)  NULL,
    [order_entry_product_name]        NVARCHAR (255)  NULL,
    [order_entry_product_description] NVARCHAR (4000) NULL,
    [order_entry_quantity]            INT             NULL,
    [order_entry_base_price]          DECIMAL (8, 2)  NULL,
    [order_entry_total_price]         DECIMAL (8, 2)  NULL,
    [order_entry_total_discounts]     DECIMAL (8, 2)  NULL,
    [order_entry_refund_status]       NVARCHAR (255)  NULL,
    [order_entry_refund_datetime]     DATETIME        NULL,
    [order_entry_refund_amount]       DECIMAL (8, 2)  NULL,
    [refund_reason]                   NVARCHAR (255)  NULL,
    [customer_name]                   NVARCHAR (255)  NULL,
    [customer_email]                  NVARCHAR (255)  NULL,
    [customer_group]                  NVARCHAR (255)  NULL,
    [method_of_pay]                   NVARCHAR (255)  NULL,
    [fulfillment_partner]             NVARCHAR (255)  NULL,
    [selected_club]                   NVARCHAR (255)  NULL,
    [lt_bucks_earned]                 DECIMAL (26, 6) NULL,
    [capture_lt_bucks]                DECIMAL (26, 6) NULL,
    [capture_amex]                    DECIMAL (26, 6) NULL,
    [capture_discover]                DECIMAL (26, 6) NULL,
    [capture_master]                  DECIMAL (26, 6) NULL,
    [capture_visa]                    DECIMAL (26, 6) NULL,
    [capture_paypal]                  DECIMAL (26, 6) NULL,
    [refund_lt_bucks]                 DECIMAL (26, 6) NULL,
    [refund_amex]                     DECIMAL (26, 6) NULL,
    [refund_discover]                 DECIMAL (26, 6) NULL,
    [refund_master]                   DECIMAL (26, 6) NULL,
    [refund_visa]                     DECIMAL (26, 6) NULL,
    [refund_paypal]                   DECIMAL (26, 6) NULL,
    [ord_stat]                        NVARCHAR (255)  NULL,
    [oe_stat]                         NVARCHAR (255)  NULL,
    [oe_settlement_flag]              TINYINT         NULL,
    [dv_load_date_time]               DATETIME        NOT NULL,
    [dv_r_load_source_id]             BIGINT          NOT NULL,
    [dv_inserted_date_time]           DATETIME        NOT NULL,
    [dv_insert_user]                  VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]            DATETIME        NULL,
    [dv_update_user]                  VARCHAR (50)    NULL,
    [dv_hash]                         CHAR (32)       NOT NULL,
    [dv_deleted]                      BIT             DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                     BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_hybris_seven_day_orders]([dv_batch_id] ASC);

