﻿CREATE TABLE [dbo].[fact_magento_tran_item] (
    [fact_magento_tran_item_id]                                                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [allocated_amount]                                                           DECIMAL (12, 2) NULL,
    [allocated_datetime]                                                         DATETIME        NULL,
    [allocated_dim_club_key]                                                     VARCHAR (32)    NULL,
    [allocated_dim_date_key]                                                     VARCHAR (8)     NULL,
    [allocated_month_starting_dim_date_key]                                      VARCHAR (8)     NULL,
    [allocated_recalculate_through_datetime]                                     DATETIME        NULL,
    [allocated_recalculate_through_dim_date_key]                                 VARCHAR (8)     NULL,
    [batch_number]                                                               INT             NULL,
    [canceled_datetime]                                                          DATETIME        NULL,
    [canceled_dim_date_key]                                                      VARCHAR (8)     NULL,
    [cc_last_4]                                                                  INT             NULL,
    [credit_tran_id]                                                             INT             NULL,
    [dim_club_key]                                                               VARCHAR (32)    NULL,
    [dim_employee_key]                                                           VARCHAR (32)    NULL,
    [dim_magento_customer_key]                                                   VARCHAR (32)    NULL,
    [dim_magento_product_key]                                                    VARCHAR (32)    NULL,
    [dim_mms_member_key]                                                         VARCHAR (32)    NULL,
    [dim_mms_membership_key]                                                     VARCHAR (32)    NULL,
    [employee_id]                                                                INT             NULL,
    [fulfillment_partner]                                                        VARCHAR (255)   NULL,
    [is_autoship]                                                                INT             NULL,
    [item_status]                                                                VARCHAR (255)   NULL,
    [items_invoiced]                                                             DECIMAL (12, 4) NULL,
    [manufacturer]                                                               VARCHAR (255)   NULL,
    [member_id]                                                                  INT             NULL,
    [order_datetime]                                                             DATETIME        NULL,
    [order_dim_date_key]                                                         VARCHAR (8)     NULL,
    [order_id]                                                                   INT             NULL,
    [order_item_id]                                                              INT             NULL,
    [order_number]                                                               VARCHAR (32)    NULL,
    [order_status]                                                               VARCHAR (50)    NULL,
    [original_currency_code]                                                     VARCHAR (3)     NULL,
    [payment_type]                                                               VARCHAR (50)    NULL,
    [payroll_amount]                                                             DECIMAL (26, 6) NULL,
    [payroll_dim_club_key]                                                       VARCHAR (32)    NULL,
    [product_cost]                                                               DECIMAL (12, 2) NULL,
    [product_price]                                                              DECIMAL (12, 2) NULL,
    [refund_datetime]                                                            DATETIME        NULL,
    [refund_dim_date_key]                                                        VARCHAR (8)     NULL,
    [refund_flag]                                                                CHAR (1)        NULL,
    [refund_number]                                                              VARCHAR (50)    NULL,
    [shipment_datetime]                                                          DATETIME        NULL,
    [shipment_dim_date_key]                                                      VARCHAR (8)     NULL,
    [shipping_amount]                                                            DECIMAL (12, 2) NULL,
    [shipping_state]                                                             VARCHAR (50)    NULL,
    [shipping_tax_amount]                                                        DECIMAL (12, 2) NULL,
    [transaction_amount]                                                         DECIMAL (12, 2) NULL,
    [transaction_bucks_amount]                                                   DECIMAL (12, 2) NULL,
    [transaction_discount_amount]                                                DECIMAL (12, 2) NULL,
    [transaction_item_amount]                                                    DECIMAL (12, 2) NULL,
    [transaction_quantity]                                                       INT             NULL,
    [transaction_reporting_dim_club_key]                                         VARCHAR (32)    NULL,
    [transaction_reporting_local_currency_monthly_average_dim_exchange_rate_key] VARCHAR (32)    NULL,
    [transaction_tax_amount]                                                     DECIMAL (12, 2) NULL,
    [udw_inserted_datetime]                                                      DATETIME        NULL,
    [udw_inserted_dim_date_key]                                                  VARCHAR (8)     NULL,
    [unique_key]                                                                 VARCHAR (33)    NULL,
    [usd_daily_dim_exchange_rate_key]                                            VARCHAR (32)    NULL,
    [usd_dim_plan_exchange_rate_key]                                             VARCHAR (32)    NULL,
    [usd_monthly_average_dim_exchange_rate_key]                                  VARCHAR (32)    NULL,
    [voucher_code]                                                               VARCHAR (255)   NULL,
    [dv_load_date_time]                                                          DATETIME        NULL,
    [dv_load_end_date_time]                                                      DATETIME        NULL,
    [dv_batch_id]                                                                BIGINT          NOT NULL,
    [dv_inserted_date_time]                                                      DATETIME        NOT NULL,
    [dv_insert_user]                                                             VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                                       DATETIME        NULL,
    [dv_update_user]                                                             VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = REPLICATE);

