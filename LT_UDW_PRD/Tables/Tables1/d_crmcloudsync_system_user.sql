﻿CREATE TABLE [dbo].[d_crmcloudsync_system_user] (
    [d_crmcloudsync_system_user_id]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)      NOT NULL,
    [dim_crm_system_user_key]         VARCHAR (32)   NULL,
    [system_user_id]                  VARCHAR (36)   NULL,
    [business_unit_id]                VARCHAR (36)   NULL,
    [business_unit_id_name]           NVARCHAR (160) NULL,
    [dim_crm_ltf_club_key]            VARCHAR (32)   NULL,
    [dim_crm_modified_key]            VARCHAR (32)   NULL,
    [dim_mms_employee_key]            VARCHAR (32)   NULL,
    [disabled_reason]                 NVARCHAR (500) NULL,
    [employee_id]                     NVARCHAR (100) NULL,
    [first_name]                      NVARCHAR (64)  NULL,
    [full_name]                       NVARCHAR (200) NULL,
    [inserted_date_time]              DATETIME       NULL,
    [inserted_dim_date_key]           VARCHAR (8)    NULL,
    [inserted_dim_time_key]           INT            NULL,
    [internal_email_address]          NVARCHAR (100) NULL,
    [is_disabled]                     BIT            NULL,
    [is_disabled_flag]                CHAR (1)       NULL,
    [is_disabled_name]                NVARCHAR (255) NULL,
    [job_title]                       NVARCHAR (100) NULL,
    [last_name]                       NVARCHAR (64)  NULL,
    [ltf_club_id]                     VARCHAR (36)   NULL,
    [ltf_club_id_name]                NVARCHAR (100) NULL,
    [middle_name]                     NVARCHAR (50)  NULL,
    [modified_by_name]                NVARCHAR (200) NULL,
    [modified_dim_date_key]           VARCHAR (8)    NULL,
    [modified_dim_time_key]           INT            NULL,
    [modified_on]                     DATETIME       NULL,
    [overridden_created_dim_date_key] VARCHAR (8)    NULL,
    [overridden_created_dim_time_key] INT            NULL,
    [overridden_created_on]           DATETIME       NULL,
    [queue_id]                        VARCHAR (36)   NULL,
    [queue_id_name]                   NVARCHAR (400) NULL,
    [salutation]                      NVARCHAR (20)  NULL,
    [title]                           NVARCHAR (128) NULL,
    [updated_date_time]               DATETIME       NULL,
    [updated_dim_date_key]            VARCHAR (8)    NULL,
    [updated_dim_time_key]            INT            NULL,
    [utc_conversion_time_zone_code]   INT            NULL,
    [p_crmcloudsync_system_user_id]   BIGINT         NOT NULL,
    [deleted_flag]                    INT            NULL,
    [dv_load_date_time]               DATETIME       NULL,
    [dv_load_end_date_time]           DATETIME       NULL,
    [dv_batch_id]                     BIGINT         NOT NULL,
    [dv_inserted_date_time]           DATETIME       NOT NULL,
    [dv_insert_user]                  VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]            DATETIME       NULL,
    [dv_update_user]                  VARCHAR (50)   NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

