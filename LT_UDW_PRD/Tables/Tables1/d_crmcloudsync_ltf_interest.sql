﻿CREATE TABLE [dbo].[d_crmcloudsync_ltf_interest] (
    [d_crmcloudsync_ltf_interest_id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                       CHAR (32)      NOT NULL,
    [dim_crm_ltf_interest_key]                      VARCHAR (32)   NULL,
    [ltf_interest_id]                               VARCHAR (36)   NULL,
    [created_by_dim_crm_system_user_key]            VARCHAR (32)   NULL,
    [created_by_name]                               NVARCHAR (200) NULL,
    [created_by_yomi_name]                          NVARCHAR (200) NULL,
    [created_dim_date_key]                          VARCHAR (8)    NULL,
    [created_dim_time_key]                          INT            NULL,
    [created_on]                                    DATETIME       NULL,
    [created_on_behalf_by_dim_crm_system_user_key]  VARCHAR (32)   NULL,
    [created_on_behalf_by_name]                     NVARCHAR (200) NULL,
    [created_on_behalf_by_yomi_name]                NVARCHAR (200) NULL,
    [import_sequence_number]                        INT            NULL,
    [insert_user]                                   VARCHAR (100)  NULL,
    [inserted_date_time]                            DATETIME       NULL,
    [inserted_dim_date_key]                         VARCHAR (8)    NULL,
    [inserted_dim_time_key]                         INT            NULL,
    [juniors_only_flag]                             CHAR (1)       NULL,
    [ltf_club_element_1]                            NVARCHAR (100) NULL,
    [ltf_club_element_2]                            NVARCHAR (100) NULL,
    [ltf_club_element_3]                            NVARCHAR (100) NULL,
    [ltf_interest_group]                            INT            NULL,
    [ltf_juniors_only]                              BIT            NULL,
    [ltf_mms_id]                                    NVARCHAR (10)  NULL,
    [ltf_name]                                      NVARCHAR (100) NULL,
    [ltf_shortlist]                                 BIT            NULL,
    [modified_by_dim_crm_system_user_key]           VARCHAR (32)   NULL,
    [modified_by_name]                              NVARCHAR (200) NULL,
    [modified_by_yomi_name]                         NVARCHAR (200) NULL,
    [modified_dim_date_key]                         VARCHAR (8)    NULL,
    [modified_dim_time_key]                         INT            NULL,
    [modified_on]                                   DATETIME       NULL,
    [modified_on_behalf_by_dim_crm_system_user_key] VARCHAR (32)   NULL,
    [modified_on_behalf_by_name]                    NVARCHAR (200) NULL,
    [modified_on_behalf_by_yomi_name]               NVARCHAR (200) NULL,
    [organization_id]                               VARCHAR (36)   NULL,
    [organization_id_name]                          NVARCHAR (160) NULL,
    [overridden_created_dim_date_key]               VARCHAR (8)    NULL,
    [overridden_created_dim_time_key]               INT            NULL,
    [overridden_created_on]                         DATETIME       NULL,
    [shortlist_flag]                                CHAR (1)       NULL,
    [state_code]                                    INT            NULL,
    [state_code_name]                               NVARCHAR (255) NULL,
    [status_code]                                   INT            NULL,
    [status_code_name]                              NVARCHAR (255) NULL,
    [time_zone_rule_version_number]                 INT            NULL,
    [update_user]                                   VARCHAR (50)   NULL,
    [updated_date_time]                             DATETIME       NULL,
    [updated_dim_date_key]                          VARCHAR (8)    NULL,
    [updated_dim_time_key]                          INT            NULL,
    [utc_conversion_time_zone_code]                 INT            NULL,
    [version_number]                                BIGINT         NULL,
    [p_crmcloudsync_ltf_interest_id]                BIGINT         NOT NULL,
    [deleted_flag]                                  INT            NULL,
    [dv_load_date_time]                             DATETIME       NULL,
    [dv_load_end_date_time]                         DATETIME       NULL,
    [dv_batch_id]                                   BIGINT         NOT NULL,
    [dv_inserted_date_time]                         DATETIME       NOT NULL,
    [dv_insert_user]                                VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]                          DATETIME       NULL,
    [dv_update_user]                                VARCHAR (50)   NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

