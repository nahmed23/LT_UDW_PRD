﻿CREATE TABLE [dbo].[l_crmcloudsync_ltf_guest_visit] (
    [l_crmcloudsync_ltf_guest_visit_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                           CHAR (32)      NOT NULL,
    [activity_id]                       VARCHAR (36)   NULL,
    [created_by]                        VARCHAR (36)   NULL,
    [created_on_behalf_by]              VARCHAR (36)   NULL,
    [ltf_business_unit_guest_visit_id]  VARCHAR (36)   NULL,
    [ltf_club_id]                       VARCHAR (36)   NULL,
    [ltf_referred_by]                   VARCHAR (36)   NULL,
    [modified_by]                       VARCHAR (36)   NULL,
    [modified_on_behalf_by]             VARCHAR (36)   NULL,
    [new_club_name]                     VARCHAR (36)   NULL,
    [owner_id]                          VARCHAR (36)   NULL,
    [owning_business_unit]              VARCHAR (36)   NULL,
    [owning_team]                       VARCHAR (36)   NULL,
    [owning_user]                       VARCHAR (36)   NULL,
    [process_id]                        VARCHAR (36)   NULL,
    [regarding_object_id]               VARCHAR (36)   NULL,
    [sender_mail_box_id]                VARCHAR (36)   NULL,
    [series_id]                         VARCHAR (36)   NULL,
    [service_id]                        VARCHAR (36)   NULL,
    [stage_id]                          VARCHAR (36)   NULL,
    [transaction_currency_id]           VARCHAR (36)   NULL,
    [ltf_assigned_mea]                  VARCHAR (36)   NULL,
    [ltf_appointment_id]                VARCHAR (36)   NULL,
    [ltf_lead_id]                       VARCHAR (36)   NULL,
    [ltf_party_id]                      NVARCHAR (100) NULL,
    [ltf_referring_member_id]           NVARCHAR (100) NULL,
    [ltf_request_id]                    NVARCHAR (100) NULL,
    [ltf_campaign_instance]             VARCHAR (36)   NULL,
    [ltf_prospect_id]                   NVARCHAR (100) NULL,
    [ltf_send_id]                       NVARCHAR (100) NULL,
    [ltf_referring_corpacct_id]         NVARCHAR (100) NULL,
    [dv_load_date_time]                 DATETIME       NOT NULL,
    [dv_r_load_source_id]               BIGINT         NOT NULL,
    [dv_inserted_date_time]             DATETIME       NOT NULL,
    [dv_insert_user]                    VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]              DATETIME       NULL,
    [dv_update_user]                    VARCHAR (50)   NULL,
    [dv_hash]                           CHAR (32)      NOT NULL,
    [dv_deleted]                        BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                       BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

