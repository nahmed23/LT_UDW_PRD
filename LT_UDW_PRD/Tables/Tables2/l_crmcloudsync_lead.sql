﻿CREATE TABLE [dbo].[l_crmcloudsync_lead] (
    [l_crmcloudsync_lead_id]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                     CHAR (32)      NOT NULL,
    [account_id]                  VARCHAR (36)   NULL,
    [address1_address_id]         VARCHAR (36)   NULL,
    [address2_address_id]         VARCHAR (36)   NULL,
    [campaign_id]                 VARCHAR (36)   NULL,
    [contact_id]                  VARCHAR (36)   NULL,
    [created_by]                  VARCHAR (36)   NULL,
    [created_on_behalf_by]        VARCHAR (36)   NULL,
    [customer_id]                 VARCHAR (36)   NULL,
    [entity_image_id]             VARCHAR (36)   NULL,
    [lead_id]                     VARCHAR (36)   NULL,
    [ltf_business_unit]           VARCHAR (36)   NULL,
    [ltf_club_id]                 VARCHAR (36)   NULL,
    [ltf_employer_id]             VARCHAR (36)   NULL,
    [ltf_guest_to_lead_id]        VARCHAR (36)   NULL,
    [ltf_measurable_goal_id]      VARCHAR (36)   NULL,
    [ltf_mms_club_id]             INT            NULL,
    [ltf_primary_objective_id]    VARCHAR (36)   NULL,
    [ltf_referring_contact_id]    VARCHAR (36)   NULL,
    [ltf_referring_member_id]     NVARCHAR (10)  NULL,
    [ltf_specific_goal_id]        VARCHAR (36)   NULL,
    [ltf_task_id]                 VARCHAR (36)   NULL,
    [ltf_udw_id]                  BIGINT         NULL,
    [ltf_web_team_id]             VARCHAR (36)   NULL,
    [master_id]                   VARCHAR (36)   NULL,
    [modified_by]                 VARCHAR (36)   NULL,
    [modified_on_behalf_by]       VARCHAR (36)   NULL,
    [originating_case_id]         VARCHAR (36)   NULL,
    [owner_id]                    VARCHAR (36)   NULL,
    [owning_business_unit]        VARCHAR (36)   NULL,
    [owning_team]                 VARCHAR (36)   NULL,
    [owning_user]                 VARCHAR (36)   NULL,
    [parent_account_id]           VARCHAR (36)   NULL,
    [parent_contact_id]           VARCHAR (36)   NULL,
    [process_id]                  VARCHAR (36)   NULL,
    [qualifying_opportunity_id]   VARCHAR (36)   NULL,
    [related_object_id]           VARCHAR (36)   NULL,
    [stage_id]                    VARCHAR (36)   NULL,
    [transaction_currency_id]     VARCHAR (36)   NULL,
    [ltf_member_id]               NVARCHAR (100) NULL,
    [ltf_primary_lead]            VARCHAR (36)   NULL,
    [ltf_visitor_id]              NVARCHAR (40)  NULL,
    [ltf_originating_guest_visit] VARCHAR (36)   NULL,
    [ltf_originating_chat]        VARCHAR (36)   NULL,
    [ltf_referring_corp_acct]     VARCHAR (36)   NULL,
    [dv_load_date_time]           DATETIME       NOT NULL,
    [dv_r_load_source_id]         BIGINT         NOT NULL,
    [dv_inserted_date_time]       DATETIME       NOT NULL,
    [dv_insert_user]              VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]        DATETIME       NULL,
    [dv_update_user]              VARCHAR (50)   NULL,
    [dv_hash]                     CHAR (32)      NOT NULL,
    [dv_deleted]                  BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                 BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

