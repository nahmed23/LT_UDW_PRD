﻿CREATE TABLE [dbo].[l_athlinks_api_vw_race_entry] (
    [l_athlinks_api_vw_race_entry_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)    NOT NULL,
    [class_id]                        INT          NULL,
    [entry_state_prov_id]             NVARCHAR (8) NULL,
    [entry_id]                        INT          NULL,
    [event_course_id]                 INT          NULL,
    [racer_id]                        INT          NULL,
    [race_id]                         INT          NULL,
    [course_id]                       INT          NULL,
    [master_id]                       INT          NULL,
    [dv_load_date_time]               DATETIME     NOT NULL,
    [dv_r_load_source_id]             BIGINT       NOT NULL,
    [dv_inserted_date_time]           DATETIME     NOT NULL,
    [dv_insert_user]                  VARCHAR (50) NOT NULL,
    [dv_updated_date_time]            DATETIME     NULL,
    [dv_update_user]                  VARCHAR (50) NULL,
    [dv_hash]                         CHAR (32)    NOT NULL,
    [dv_deleted]                      BIT          DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                     BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

