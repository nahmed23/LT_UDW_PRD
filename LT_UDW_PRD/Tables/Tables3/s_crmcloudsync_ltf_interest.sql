﻿CREATE TABLE [dbo].[s_crmcloudsync_ltf_interest] (
    [s_crmcloudsync_ltf_interest_id]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)      NOT NULL,
    [created_by_name]                 NVARCHAR (200) NULL,
    [created_by_yomi_name]            NVARCHAR (200) NULL,
    [created_on]                      DATETIME       NULL,
    [created_on_behalf_by_name]       NVARCHAR (200) NULL,
    [created_on_behalf_by_yomi_name]  NVARCHAR (200) NULL,
    [import_sequence_number]          INT            NULL,
    [ltf_interest_id]                 VARCHAR (36)   NULL,
    [ltf_name]                        NVARCHAR (100) NULL,
    [modified_by_name]                NVARCHAR (200) NULL,
    [modified_by_yomi_name]           NVARCHAR (200) NULL,
    [modified_on]                     DATETIME       NULL,
    [modified_on_behalf_by_name]      NVARCHAR (200) NULL,
    [modified_on_behalf_by_yomi_name] NVARCHAR (200) NULL,
    [organization_id_name]            NVARCHAR (160) NULL,
    [overridden_created_on]           DATETIME       NULL,
    [state_code_name]                 NVARCHAR (255) NULL,
    [status_code_name]                NVARCHAR (255) NULL,
    [time_zone_rule_version_number]   INT            NULL,
    [utc_conversion_time_zone_code]   INT            NULL,
    [inserted_date_time]              DATETIME       NULL,
    [insert_user]                     VARCHAR (100)  NULL,
    [updated_date_time]               DATETIME       NULL,
    [update_user]                     VARCHAR (50)   NULL,
    [ltf_shortlist]                   BIT            NULL,
    [ltf_interest_group]              INT            NULL,
    [ltf_club_element_1]              NVARCHAR (100) NULL,
    [ltf_club_element_2]              NVARCHAR (100) NULL,
    [ltf_club_element_3]              NVARCHAR (100) NULL,
    [ltf_juniors_only]                BIT            NULL,
    [dv_load_date_time]               DATETIME       NOT NULL,
    [dv_r_load_source_id]             BIGINT         NOT NULL,
    [dv_inserted_date_time]           DATETIME       NOT NULL,
    [dv_insert_user]                  VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]            DATETIME       NULL,
    [dv_update_user]                  VARCHAR (50)   NULL,
    [dv_hash]                         CHAR (32)      NOT NULL,
    [dv_batch_id]                     BIGINT         NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_crmcloudsync_ltf_interest]([dv_batch_id] ASC);

