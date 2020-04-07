﻿CREATE TABLE [dbo].[fact_mms_sales_transaction_item] (
    [fact_mms_sales_transaction_item_id]                                              BIGINT          IDENTITY (1, 1) NOT NULL,
    [active_transaction_flag]                                                         CHAR (1)        NULL,
    [automated_refund_flag]                                                           CHAR (1)        NULL,
    [corporate_rate_count]                                                            INT             NULL,
    [dim_club_key]                                                                    CHAR (32)       NULL,
    [dim_mms_drawer_activity_key]                                                     CHAR (32)       NULL,
    [dim_mms_member_key]                                                              CHAR (32)       NULL,
    [dim_mms_membership_key]                                                          CHAR (32)       NULL,
    [dim_mms_product_key]                                                             CHAR (32)       NULL,
    [dim_mms_reimbursement_program_key]                                               CHAR (32)       NULL,
    [dim_mms_transaction_reason_key]                                                  CHAR (32)       NULL,
    [external_item_id]                                                                VARCHAR (50)    NULL,
    [fact_mms_sales_transaction_item_key]                                             CHAR (32)       NULL,
    [fact_mms_sales_transaction_key]                                                  CHAR (32)       NULL,
    [inserted_date_time]                                                              DATETIME        NULL,
    [inserted_dim_date_key]                                                           CHAR (8)        NULL,
    [inserted_dim_time_key]                                                           CHAR (8)        NULL,
    [item_lt_bucks_amount]                                                            DECIMAL (26, 6) NULL,
    [item_lt_bucks_sales_tax]                                                         DECIMAL (26, 6) NULL,
    [membership_adjustment_flag]                                                      CHAR (1)        NULL,
    [membership_charge_flag]                                                          CHAR (1)        NULL,
    [membership_id]                                                                   INT             NULL,
    [mms_tran_id]                                                                     INT             NULL,
    [month_ending_post_dim_date_key]                                                  CHAR (8)        NULL,
    [original_currency_code]                                                          CHAR (3)        NULL,
    [original_fact_mms_sales_transaction_key]                                         CHAR (32)       NULL,
    [original_mms_tran_id]                                                            INT             NULL,
    [pos_flag]                                                                        CHAR (1)        NULL,
    [post_dim_date_key]                                                               CHAR (8)        NULL,
    [post_dim_time_key]                                                               CHAR (8)        NULL,
    [primary_sales_dim_employee_key]                                                  CHAR (32)       NULL,
    [receipt_comment]                                                                 VARCHAR (255)   NULL,
    [receipt_number]                                                                  VARCHAR (50)    NULL,
    [refund_flag]                                                                     CHAR (1)        NULL,
    [reversal_flag]                                                                   CHAR (1)        NULL,
    [sales_amount_gross]                                                              DECIMAL (26, 6) NULL,
    [sales_channel_dim_description_key]                                               VARCHAR (255)   NULL,
    [sales_discount_dollar_amount]                                                    DECIMAL (26, 6) NULL,
    [sales_dollar_amount]                                                             DECIMAL (26, 6) NULL,
    [sales_entered_dim_employee_key]                                                  CHAR (32)       NULL,
    [sales_quantity]                                                                  INT             NULL,
    [sales_tax_amount]                                                                DECIMAL (26, 6) NULL,
    [secondary_sales_dim_employee_key]                                                CHAR (32)       NULL,
    [sold_not_serviced_flag]                                                          CHAR (1)        NULL,
    [tran_item_id]                                                                    INT             NULL,
    [transaction_edited_flag]                                                         CHAR (1)        NULL,
    [transaction_reporting_dim_club_key]                                              CHAR (32)       NULL,
    [transaction_reporting_local_currency_monthly_average_dim_exchange_rate_key]      CHAR (32)       NULL,
    [transaction_reporting_local_currency_monthly_average_dim_plan_exchange_rate_key] CHAR (32)       NULL,
    [transaction_source]                                                              VARCHAR (50)    NULL,
    [udw_inserted_dim_date_key]                                                       CHAR (8)        NULL,
    [updated_date_time]                                                               DATETIME        NULL,
    [updated_dim_date_key]                                                            CHAR (8)        NULL,
    [updated_dim_time_key]                                                            CHAR (8)        NULL,
    [usd_dim_plan_exchange_rate_key]                                                  CHAR (32)       NULL,
    [usd_monthly_average_dim_exchange_rate_key]                                       CHAR (32)       NULL,
    [void_comment]                                                                    VARCHAR (50)    NULL,
    [void_dim_date_key]                                                               CHAR (8)        NULL,
    [void_dim_employee_key]                                                           CHAR (32)       NULL,
    [void_dim_time_key]                                                               INT             NULL,
    [voided_flag]                                                                     CHAR (1)        NULL,
    [dv_load_date_time]                                                               DATETIME        NULL,
    [dv_load_end_date_time]                                                           DATETIME        NULL,
    [dv_batch_id]                                                                     BIGINT          NOT NULL,
    [dv_inserted_date_time]                                                           DATETIME        NOT NULL,
    [dv_insert_user]                                                                  VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                                            DATETIME        NULL,
    [dv_update_user]                                                                  VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([fact_mms_sales_transaction_item_key]));
