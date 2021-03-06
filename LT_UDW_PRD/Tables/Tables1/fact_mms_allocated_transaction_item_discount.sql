﻿CREATE TABLE [dbo].[fact_mms_allocated_transaction_item_discount] (
    [accumulated_ratio_flag]                                         CHAR (1)        NULL,
    [allocated_discount_amount]                                      DECIMAL (26, 6) NULL,
    [allocated_month_ending_dim_date_key]                            CHAR (8)        NULL,
    [allocated_month_starting_dim_date_key]                          CHAR (8)        NULL,
    [allocation_rule_set]                                            VARCHAR (60)    NULL,
    [automated_refund_flag]                                          CHAR (1)        NULL,
    [dim_club_key]                                                   CHAR (32)       NULL,
    [dim_mms_member_key]                                             CHAR (32)       NULL,
    [dim_mms_pricing_discount_key]                                   CHAR (32)       NULL,
    [dim_mms_product_key]                                            CHAR (32)       NULL,
    [dim_reporting_hierarchy_key]                                    CHAR (32)       NULL,
    [discount_amount]                                                DECIMAL (26, 6) NULL,
    [fact_mms_allocated_transaction_item_discount_key]               CHAR (32)       NULL,
    [original_currency_code]                                         CHAR (3)        NULL,
    [primary_sales_dim_employee_key]                                 CHAR (32)       NULL,
    [reporting_local_currency_dim_plan_exchange_rate_key]            CHAR (32)       NULL,
    [reporting_local_currency_monthly_average_dim_exchange_rate_key] CHAR (32)       NULL,
    [secondary_sales_dim_employee_key]                               CHAR (32)       NULL,
    [tran_item_id]                                                   INT             NULL,
    [transaction_post_dim_date_key]                                  CHAR (8)        NULL,
    [transaction_post_dim_time_key]                                  CHAR (8)        NULL,
    [usd_dim_plan_exchange_rate_key]                                 CHAR (32)       NULL,
    [usd_monthly_average_dim_exchange_rate_key]                      CHAR (32)       NULL,
    [dv_load_date_time]                                              DATETIME        NULL,
    [dv_load_end_date_time]                                          DATETIME        NULL,
    [dv_batch_id]                                                    BIGINT          NOT NULL,
    [dv_inserted_date_time]                                          DATETIME        NOT NULL,
    [dv_insert_user]                                                 VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                           DATETIME        NULL,
    [dv_update_user]                                                 VARCHAR (50)    NULL,
    [fact_mms_allocated_transaction_item_discount_id]                BIGINT          NOT NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([fact_mms_allocated_transaction_item_discount_key]));

