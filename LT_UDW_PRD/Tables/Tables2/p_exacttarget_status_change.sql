﻿CREATE TABLE [dbo].[p_exacttarget_status_change] (
    [p_exacttarget_status_change_id]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                              CHAR (32)    NOT NULL,
    [stage_exacttarget_status_change_id]   BIGINT       NULL,
    [client_id]                            BIGINT       NULL,
    [subscriber_id]                        BIGINT       NULL,
    [s_exacttarget_status_change_id]       BIGINT       NULL,
    [dv_greatest_satellite_date_time]      DATETIME     NULL,
    [dv_next_greatest_satellite_date_time] DATETIME     NULL,
    [dv_load_date_time]                    DATETIME     NOT NULL,
    [dv_load_end_date_time]                DATETIME     NOT NULL,
    [dv_batch_id]                          BIGINT       NOT NULL,
    [dv_inserted_date_time]                DATETIME     NOT NULL,
    [dv_insert_user]                       VARCHAR (50) NOT NULL,
    [dv_updated_date_time]                 DATETIME     NULL,
    [dv_update_user]                       VARCHAR (50) NULL,
    [dv_first_in_key_series]               BIT          NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_p_exacttarget_status_change]
    ON [dbo].[p_exacttarget_status_change]([bk_hash] ASC, [p_exacttarget_status_change_id] ASC);

