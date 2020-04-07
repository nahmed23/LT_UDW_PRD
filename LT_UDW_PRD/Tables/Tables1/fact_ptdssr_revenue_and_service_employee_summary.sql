﻿CREATE TABLE [dbo].[fact_ptdssr_revenue_and_service_employee_summary] (
    [fact_ptdssr_revenue_and_service_employee_summary_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [club_goal]                                           DECIMAL (26, 2) NULL,
    [dim_club_key]                                        VARCHAR (32)    NULL,
    [dim_employee_key]                                    VARCHAR (32)    NULL,
    [dim_reporting_hierarchy_key]                         VARCHAR (32)    NULL,
    [forecast_amount]                                     DECIMAL (26, 2) NULL,
    [month_to_date_delivered_session_price]               DECIMAL (26, 2) NULL,
    [month_to_date_item_amount]                           DECIMAL (26, 2) NULL,
    [month_to_date_session_adjustment_amount]             DECIMAL (26, 2) NULL,
    [month_to_date_session_adjustment_count]              INT             NULL,
    [month_to_date_session_delivered_amount]              DECIMAL (26, 2) NULL,
    [month_to_date_session_delivered_count]               INT             NULL,
    [month_to_date_session_sales_amount]                  DECIMAL (26, 2) NULL,
    [month_to_date_session_sales_count]                   INT             NULL,
    [one_on_one_product_grouping]                         VARCHAR (50)    NULL,
    [ptdssr_category]                                     VARCHAR (10)    NULL,
    [ptdssr_row_label]                                    VARCHAR (500)   NULL,
    [report_date_delivered_session_price]                 DECIMAL (26, 2) NULL,
    [report_date_dim_date_key]                            VARCHAR (8)     NULL,
    [report_date_is_last_day_in_month_indicator]          VARCHAR (1)     NULL,
    [report_date_item_amount]                             DECIMAL (26, 2) NULL,
    [report_date_session_adjustment_amount]               DECIMAL (26, 2) NULL,
    [report_date_session_adjustment_count]                INT             NULL,
    [report_date_session_delivered_amount]                DECIMAL (26, 2) NULL,
    [report_date_session_delivered_count]                 INT             NULL,
    [report_date_session_outstanding_amount]              DECIMAL (26, 2) NULL,
    [report_date_session_outstanding_count]               INT             NULL,
    [report_date_session_sales_amount]                    DECIMAL (26, 2) NULL,
    [report_date_session_sales_count]                     INT             NULL,
    [reporting_data_source]                               VARCHAR (50)    NULL,
    [dv_load_date_time]                                   DATETIME        NULL,
    [dv_load_end_date_time]                               DATETIME        NULL,
    [dv_batch_id]                                         BIGINT          NOT NULL,
    [dv_inserted_date_time]                               DATETIME        NOT NULL,
    [dv_insert_user]                                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                DATETIME        NULL,
    [dv_update_user]                                      VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = REPLICATE);

