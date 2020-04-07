﻿CREATE TABLE [dbo].[d_exerp_message] (
    [d_exerp_message_id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                       CHAR (32)      NOT NULL,
    [message_id]                    VARCHAR (4000) NULL,
    [creation_dim_date_key]         CHAR (8)       NULL,
    [creation_dim_time_key]         CHAR (8)       NULL,
    [d_exerp_center_bk_hash]        CHAR (32)      NULL,
    [d_mms_company_bk_hash]         CHAR (32)      NULL,
    [delivered_by_dim_employee_key] CHAR (32)      NULL,
    [delivery_dim_date_key]         CHAR (8)       NULL,
    [delivery_dim_time_key]         CHAR (8)       NULL,
    [delivery_method]               VARCHAR (4000) NULL,
    [dim_mms_member_key]            VARCHAR (32)   NULL,
    [ets]                           BIGINT         NULL,
    [from_dim_employee_key]         CHAR (32)      NULL,
    [message_category]              VARCHAR (4000) NULL,
    [message_channel]               VARCHAR (4000) NULL,
    [message_subject]               VARCHAR (4000) NULL,
    [message_type]                  VARCHAR (4000) NULL,
    [ref_id]                        VARCHAR (4000) NULL,
    [ref_type]                      VARCHAR (4000) NULL,
    [template_id]                   VARCHAR (4000) NULL,
    [p_exerp_message_id]            BIGINT         NOT NULL,
    [deleted_flag]                  INT            NULL,
    [dv_load_date_time]             DATETIME       NULL,
    [dv_load_end_date_time]         DATETIME       NULL,
    [dv_batch_id]                   BIGINT         NOT NULL,
    [dv_inserted_date_time]         DATETIME       NOT NULL,
    [dv_insert_user]                VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]          DATETIME       NULL,
    [dv_update_user]                VARCHAR (50)   NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));
