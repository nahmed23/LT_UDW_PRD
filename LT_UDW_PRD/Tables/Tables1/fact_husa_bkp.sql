﻿CREATE TABLE [dbo].[fact_husa_bkp] (
    [fact_healthcheckusa_allocated_transaction_item_id]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [allocated_dim_club_key]                                                     VARCHAR (32)    NULL,
    [allocated_month_starting_dim_date_key]                                      VARCHAR (8)     NULL,
    [allocated_recalculate_through_datetime]                                     DATETIME        NULL,
    [allocated_recalculate_through_dim_date_key]                                 VARCHAR (8)     NULL,
    [dim_club_key]                                                               CHAR (32)       NULL,
    [dim_healthcheckusa_product_key]                                             CHAR (32)       NULL,
    [discount_amount]                                                            DECIMAL (26, 6) NULL,
    [fact_healthcheckusa_allocated_transaction_item_key]                         CHAR (32)       NULL,
    [gl_club_id]                                                                 INT             NULL,
    [order_for_employee_flag]                                                    CHAR (1)        NULL,
    [order_number]                                                               INT             NULL,
    [original_currency_code]                                                     CHAR (3)        NULL,
    [product_sku]                                                                INT             NULL,
    [refund_flag]                                                                CHAR (1)        NULL,
    [sales_amount]                                                               DECIMAL (26, 6) NULL,
    [sales_dim_employee_key]                                                     CHAR (32)       NULL,
    [sales_quantity]                                                             INT             NULL,
    [transaction_date]                                                           DATETIME        NULL,
    [transaction_post_dim_date_key]                                              INT             NULL,
    [transaction_reporting_dim_club_key]                                         CHAR (32)       NULL,
    [transaction_reporting_local_currency_dim_plan_exchange_rate_key]            CHAR (32)       NULL,
    [transaction_reporting_local_currency_monthly_average_dim_exchange_rate_key] CHAR (32)       NULL,
    [transaction_type]                                                           VARCHAR (100)   NULL,
    [udw_inserted_dim_date_key]                                                  CHAR (8)        NULL,
    [usd_dim_plan_exchange_rate_key]                                             CHAR (32)       NULL,
    [usd_monthly_average_dim_exchange_rate_key]                                  CHAR (32)       NULL,
    [dv_load_date_time]                                                          DATETIME        NULL,
    [dv_load_end_date_time]                                                      DATETIME        NULL,
    [dv_batch_id]                                                                BIGINT          NOT NULL,
    [dv_inserted_date_time]                                                      DATETIME        NOT NULL,
    [dv_insert_user]                                                             VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                                       DATETIME        NULL,
    [dv_update_user]                                                             VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);

