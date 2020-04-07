﻿CREATE TABLE [dbo].[s_athlinks_api_vw_race_entry] (
    [s_athlinks_api_vw_race_entry_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)      NOT NULL,
    [display_name]                    NVARCHAR (50)  NULL,
    [is_member]                       BIT            NULL,
    [photo_path]                      VARCHAR (1)    NULL,
    [age]                             INT            NULL,
    [bib_num]                         NVARCHAR (24)  NULL,
    [class_name]                      NVARCHAR (255) NULL,
    [entry_id]                        INT            NULL,
    [gender]                          CHAR (1)       NULL,
    [rank_o]                          INT            NULL,
    [rank_g]                          INT            NULL,
    [rank_a]                          INT            NULL,
    [ticks]                           BIGINT         NULL,
    [ticks_string]                    VARCHAR (16)   NULL,
    [result_count]                    INT            NULL,
    [race_date]                       DATETIME       NULL,
    [master_name]                     NVARCHAR (128) NULL,
    [results_date]                    DATETIME       NULL,
    [total_a]                         INT            NULL,
    [total_g]                         INT            NULL,
    [total_o]                         INT            NULL,
    [city]                            NVARCHAR (128) NULL,
    [create_date]                     DATETIME       NULL,
    [dv_load_date_time]               DATETIME       NOT NULL,
    [dv_r_load_source_id]             BIGINT         NOT NULL,
    [dv_inserted_date_time]           DATETIME       NOT NULL,
    [dv_insert_user]                  VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]            DATETIME       NULL,
    [dv_update_user]                  VARCHAR (50)   NULL,
    [dv_hash]                         CHAR (32)      NOT NULL,
    [dv_deleted]                      BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                     BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
