﻿CREATE TABLE [dbo].[stage_hash_boss_asiclassr] (
    [stage_hash_boss_asiclassr_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                      CHAR (32)       NOT NULL,
    [classr_dept]                  INT             NULL,
    [classr_class]                 INT             NULL,
    [classr_desc]                  CHAR (30)       NULL,
    [classr_tax_code]              CHAR (1)        NULL,
    [classr_unit_order]            INT             NULL,
    [classr_unit_sale]             INT             NULL,
    [classr_comm_part]             CHAR (1)        NULL,
    [classr_comm_percent]          DECIMAL (5, 3)  NULL,
    [classr_comm_amt]              DECIMAL (10, 2) NULL,
    [classr_promo_part]            CHAR (1)        NULL,
    [classr_suggestion]            CHAR (48)       NULL,
    [classr_size_name]             CHAR (25)       NULL,
    [classr_color_name]            CHAR (25)       NULL,
    [classr_style_name]            CHAR (25)       NULL,
    [classr_type]                  CHAR (1)        NULL,
    [classr_gl_acct]               CHAR (4)        NULL,
    [classr_future_acct]           CHAR (4)        NULL,
    [classr_tax_rate]              DECIMAL (4, 3)  NULL,
    [classr_interest_id]           INT             NULL,
    [classr_bill_hrs]              CHAR (1)        NULL,
    [classr_id]                    INT             NULL,
    [classr_format_id]             INT             NULL,
    [classr_web_publish]           CHAR (1)        NULL,
    [classr_sort_order]            INT             NULL,
    [classr_created_at]            DATETIME        NULL,
    [classr_updated_at]            DATETIME        NULL,
    [classr_grace_days]            INT             NULL,
    [dv_load_date_time]            DATETIME        NOT NULL,
    [dv_updated_date_time]         DATETIME        NULL,
    [dv_update_user]               VARCHAR (50)    NULL,
    [dv_batch_id]                  BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

