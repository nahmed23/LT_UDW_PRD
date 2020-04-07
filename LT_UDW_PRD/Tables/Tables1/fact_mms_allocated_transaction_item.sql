﻿CREATE TABLE [dbo].[fact_mms_allocated_transaction_item] (
    [accumulated_ratio_flag]                                         CHAR (1)        NULL,
    [adjustment_flag]                                                CHAR (1)        NULL,
    [allocated_amount]                                               DECIMAL (26, 6) NULL,
    [allocated_month_ending_dim_date_key]                            CHAR (8)        NULL,
    [allocated_month_starting_dim_date_key]                          CHAR (8)        NULL,
    [allocated_quantity]                                             INT             NULL,
    [allocation_rule_set]                                            VARCHAR (60)    NULL,
    [automated_refund_flag]                                          CHAR (1)        NULL,
    [charge_flag]                                                    CHAR (1)        NULL,
    [commissioned_sales_transaction_flag]                            CHAR (1)        NULL,
    [corporate_transfer_amount]                                      DECIMAL (26, 6) NULL,
    [description]                                                    VARCHAR (100)   NULL,
    [dim_club_key]                                                   CHAR (32)       NULL,
    [dim_mms_member_key]                                             CHAR (32)       NULL,
    [dim_mms_product_key]                                            CHAR (32)       NULL,
    [dim_mms_transaction_reason_key]                                 CHAR (32)       NULL,
    [dim_reporting_hierarchy_key]                                    CHAR (32)       NULL,
    [fact_mms_allocated_transaction_item_key]                        CHAR (32)       NULL,
    [mms_tran_id]                                                    INT             NULL,
    [original_currency_code]                                         CHAR (3)        NULL,
    [primary_sales_dim_employee_key]                                 CHAR (32)       NULL,
    [refund_flag]                                                    CHAR (1)        NULL,
    [reporting_local_currency_dim_plan_exchange_rate_key]            CHAR (32)       NULL,
    [reporting_local_currency_monthly_average_dim_exchange_rate_key] CHAR (32)       NULL,
    [sale_flag]                                                      CHAR (1)        NULL,
    [secondary_sales_dim_employee_key]                               CHAR (32)       NULL,
    [sold_not_serviced_flag]                                         CHAR (1)        NULL,
    [tran_item_id]                                                   INT             NULL,
    [transaction_amount]                                             DECIMAL (26, 6) NULL,
    [transaction_discount_dollar_amount]                             DECIMAL (26, 6) NULL,
    [transaction_post_dim_date_key]                                  CHAR (8)        NULL,
    [transaction_post_dim_time_key]                                  CHAR (8)        NULL,
    [transaction_quantity]                                           INT             NULL,
    [usd_dim_plan_exchange_rate_key]                                 CHAR (32)       NULL,
    [usd_monthly_average_dim_exchange_rate_key]                      CHAR (32)       NULL,
    [dv_load_date_time]                                              DATETIME        NULL,
    [dv_load_end_date_time]                                          DATETIME        NULL,
    [dv_batch_id]                                                    BIGINT          NOT NULL,
    [dv_inserted_date_time]                                          DATETIME        NOT NULL,
    [dv_insert_user]                                                 VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                           DATETIME        NULL,
    [dv_update_user]                                                 VARCHAR (50)    NULL,
    [fact_mms_allocated_transaction_item_id]                         BIGINT          NOT NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([fact_mms_allocated_transaction_item_key]));

