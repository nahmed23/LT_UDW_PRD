﻿CREATE TABLE [dbo].[s_sfmc_content_details_log] (
    [s_sfmc_content_details_log_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                       CHAR (32)      NOT NULL,
    [section]                       VARCHAR (4000) NULL,
    [priority]                      VARCHAR (4000) NULL,
    [subject_line]                  VARCHAR (4000) NULL,
    [headline]                      VARCHAR (4000) NULL,
    [body]                          VARCHAR (4000) NULL,
    [image_url]                     VARCHAR (4000) NULL,
    [cta_text]                      VARCHAR (4000) NULL,
    [cta_url]                       VARCHAR (4000) NULL,
    [membership_type]               VARCHAR (4000) NULL,
    [interests]                     VARCHAR (4000) NULL,
    [lt_bucks]                      VARCHAR (4000) NULL,
    [wl_challenge]                  VARCHAR (4000) NULL,
    [kids_choice]                   VARCHAR (4000) NULL,
    [additional_logic]              VARCHAR (4000) NULL,
    [content_type]                  VARCHAR (4000) NULL,
    [et_inserted_date_time]         DATETIME       NULL,
    [content_guid]                  VARCHAR (4000) NULL,
    [event_date]                    DATETIME       NULL,
    [company_inside]                VARCHAR (4000) NULL,
    [subhead]                       VARCHAR (4000) NULL,
    [notification_type]             VARCHAR (4000) NULL,
    [channel]                       VARCHAR (4000) NULL,
    [gender]                        VARCHAR (4000) NULL,
    [created_by]                    VARCHAR (4000) NULL,
    [updated_by]                    VARCHAR (4000) NULL,
    [internal_notes]                VARCHAR (4000) NULL,
    [created_date_time]             DATETIME       NULL,
    [last_updated_date_time]        DATETIME       NULL,
    [publish_date_time]             DATETIME       NULL,
    [swipe_start_date]              DATETIME       NULL,
    [active_junior_flag]            VARCHAR (4000) NULL,
    [child_center_swiped_flag]      VARCHAR (4000) NULL,
    [message_active_flag]           VARCHAR (4000) NULL,
    [expiration_date_time]          DATETIME       NULL,
    [category]                      VARCHAR (4000) NULL,
    [dv_load_date_time]             DATETIME       NOT NULL,
    [dv_r_load_source_id]           BIGINT         NOT NULL,
    [dv_inserted_date_time]         DATETIME       NOT NULL,
    [dv_insert_user]                VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]          DATETIME       NULL,
    [dv_update_user]                VARCHAR (50)   NULL,
    [dv_hash]                       CHAR (32)      NOT NULL,
    [dv_deleted]                    BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                   BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
