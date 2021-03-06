﻿CREATE TABLE [dbo].[d_crmcloudsync_ltf_survey_response] (
    [d_crmcloudsync_ltf_survey_response_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                               CHAR (32)       NOT NULL,
    [dim_crm_ltf_survey_response_key]       VARCHAR (32)    NULL,
    [ltf_survey_response_id]                VARCHAR (36)    NULL,
    [created_by_dim_crm_system_user_key]    VARCHAR (32)    NULL,
    [created_dim_date_key]                  VARCHAR (8)     NULL,
    [created_dim_time_key]                  INT             NULL,
    [created_on]                            DATETIME        NULL,
    [insert_user]                           VARCHAR (100)   NULL,
    [inserted_date_time]                    DATETIME        NULL,
    [inserted_dim_date_key]                 VARCHAR (8)     NULL,
    [inserted_dim_time_key]                 INT             NULL,
    [ltf_question]                          NVARCHAR (1000) NULL,
    [ltf_response]                          NVARCHAR (1000) NULL,
    [ltf_sequence]                          DECIMAL (18, 4) NULL,
    [ltf_survey]                            VARCHAR (36)    NULL,
    [ltf_survey_response]                   NVARCHAR (100)  NULL,
    [modified_by_dim_crm_system_user_key]   VARCHAR (32)    NULL,
    [modified_dim_date_key]                 VARCHAR (8)     NULL,
    [modified_dim_time_key]                 INT             NULL,
    [modified_on]                           DATETIME        NULL,
    [state_code]                            INT             NULL,
    [status_code]                           INT             NULL,
    [update_user]                           VARCHAR (50)    NULL,
    [updated_date_time]                     DATETIME        NULL,
    [updated_dim_date_key]                  VARCHAR (8)     NULL,
    [updated_dim_time_key]                  INT             NULL,
    [p_crmcloudsync_ltf_survey_response_id] BIGINT          NOT NULL,
    [deleted_flag]                          INT             NULL,
    [dv_load_date_time]                     DATETIME        NULL,
    [dv_load_end_date_time]                 DATETIME        NULL,
    [dv_batch_id]                           BIGINT          NOT NULL,
    [dv_inserted_date_time]                 DATETIME        NOT NULL,
    [dv_insert_user]                        VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                  DATETIME        NULL,
    [dv_update_user]                        VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

