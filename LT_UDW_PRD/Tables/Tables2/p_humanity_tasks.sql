﻿CREATE TABLE [dbo].[p_humanity_tasks] (
    [p_humanity_tasks_id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [bk_hash]                              CHAR (32)     NOT NULL,
    [task_id]                              BIGINT        NULL,
    [shift_id]                             BIGINT        NULL,
    [company_id]                           VARCHAR (255) NULL,
    [task_name]                            VARCHAR (255) NULL,
    [created_at]                           VARCHAR (255) NULL,
    [created_by]                           VARCHAR (255) NULL,
    [deleted]                              VARCHAR (255) NULL,
    [load_dttm]                            VARCHAR (255) NULL,
    [ltf_file_name]                        VARCHAR (255) NULL,
    [l_humanity_tasks_id]                  BIGINT        NULL,
    [s_humanity_tasks_id]                  BIGINT        NULL,
    [dv_load_date_time]                    DATETIME      NOT NULL,
    [dv_load_end_date_time]                DATETIME      NOT NULL,
    [dv_greatest_satellite_date_time]      DATETIME      NULL,
    [dv_next_greatest_satellite_date_time] DATETIME      NULL,
    [dv_first_in_key_series]               INT           NULL,
    [dv_inserted_date_time]                DATETIME      NOT NULL,
    [dv_insert_user]                       VARCHAR (50)  NOT NULL,
    [dv_updated_date_time]                 DATETIME      NULL,
    [dv_update_user]                       VARCHAR (50)  NULL,
    [dv_batch_id]                          BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

