﻿CREATE TABLE [dbo].[s_chronotrack_entry] (
    [s_chronotrack_entry_id]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                  CHAR (32)      NOT NULL,
    [entry_id]                 BIGINT         NULL,
    [apply_wave_rule]          TINYINT        NULL,
    [auto_bracket_policy]      NCHAR (4)      NULL,
    [remove_bracket]           NCHAR (48)     NULL,
    [override_bracket_rule]    SMALLINT       NULL,
    [reg_sms]                  INT            NULL,
    [reg_soc_msg]              TINYINT        NULL,
    [allow_tracking]           TINYINT        NULL,
    [race_age]                 INT            NULL,
    [bib]                      NVARCHAR (15)  NULL,
    [name]                     NVARCHAR (255) NULL,
    [type]                     NCHAR (6)      NULL,
    [status]                   NCHAR (12)     NULL,
    [location_string]          NVARCHAR (255) NULL,
    [notes]                    VARCHAR (4000) NULL,
    [search_result]            NVARCHAR (255) NULL,
    [ctime]                    INT            NULL,
    [mtime]                    INT            NULL,
    [check_in]                 TINYINT        NULL,
    [source_type]              NCHAR (15)     NULL,
    [platform_source]          NVARCHAR (16)  NULL,
    [dummy_modified_date_time] DATETIME       NULL,
    [dv_load_date_time]        DATETIME       NOT NULL,
    [dv_r_load_source_id]      BIGINT         NOT NULL,
    [dv_inserted_date_time]    DATETIME       NOT NULL,
    [dv_insert_user]           VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]     DATETIME       NULL,
    [dv_update_user]           VARCHAR (50)   NULL,
    [dv_hash]                  CHAR (32)      NOT NULL,
    [dv_deleted]               BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]              BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

