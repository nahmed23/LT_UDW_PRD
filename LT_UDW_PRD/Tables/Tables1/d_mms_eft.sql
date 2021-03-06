﻿CREATE TABLE [dbo].[d_mms_eft] (
    [d_mms_eft_id]                  BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                       CHAR (32)       NOT NULL,
    [eft_id]                        INT             NULL,
    [account_number]                VARCHAR (50)    NULL,
    [account_owner]                 VARCHAR (50)    NULL,
    [d_mms_eft_return_code_bk_hash] VARCHAR (32)    NULL,
    [dim_mms_member_key]            VARCHAR (32)    NULL,
    [dim_mms_membership_key]        VARCHAR (32)    NULL,
    [dues_amount_used_for_products] DECIMAL (26, 6) NULL,
    [eft_amount]                    DECIMAL (26, 6) NULL,
    [eft_amount_products]           DECIMAL (26, 6) NULL,
    [eft_date]                      DATETIME        NULL,
    [eft_dim_date_key]              VARCHAR (8)     NULL,
    [eft_dim_time_key]              INT             NULL,
    [eft_return_code_id]            INT             NULL,
    [expiration_date]               DATETIME        NULL,
    [expiration_dim_date_key]       VARCHAR (8)     NULL,
    [expiration_dim_time_key]       INT             NULL,
    [fact_mms_payment_key]          VARCHAR (32)    NULL,
    [inserted_date_time]            DATETIME        NULL,
    [inserted_dim_date_key]         VARCHAR (8)     NULL,
    [inserted_dim_time_key]         INT             NULL,
    [job_task_id]                   INT             NULL,
    [masked_account_number]         VARCHAR (50)    NULL,
    [masked_account_number64]       VARCHAR (19)    NULL,
    [member_id]                     INT             NULL,
    [membership_id]                 INT             NULL,
    [order_number]                  VARCHAR (15)    NULL,
    [payment_id]                    INT             NULL,
    [return_code]                   VARCHAR (10)    NULL,
    [routing_number]                VARCHAR (9)     NULL,
    [token]                         VARCHAR (30)    NULL,
    [updated_date_time]             DATETIME        NULL,
    [updated_dim_date_key]          VARCHAR (8)     NULL,
    [updated_dim_time_key]          INT             NULL,
    [val_eft_account_type_id]       TINYINT         NULL,
    [val_eft_status_id]             TINYINT         NULL,
    [val_eft_type_id]               TINYINT         NULL,
    [val_payment_type_id]           TINYINT         NULL,
    [p_mms_eft_id]                  BIGINT          NOT NULL,
    [deleted_flag]                  INT             NULL,
    [dv_load_date_time]             DATETIME        NULL,
    [dv_load_end_date_time]         DATETIME        NULL,
    [dv_batch_id]                   BIGINT          NOT NULL,
    [dv_inserted_date_time]         DATETIME        NOT NULL,
    [dv_insert_user]                VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]          DATETIME        NULL,
    [dv_update_user]                VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

