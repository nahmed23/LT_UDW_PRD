﻿CREATE TABLE [dbo].[l_commprefs_communication_type_channels] (
    [l_commprefs_communication_type_channels_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                    CHAR (32)      NOT NULL,
    [communication_type_channels_id]             INT            NULL,
    [channel_key]                                NVARCHAR (128) NULL,
    [communication_type_id]                      INT            NULL,
    [dv_load_date_time]                          DATETIME       NOT NULL,
    [dv_r_load_source_id]                        BIGINT         NOT NULL,
    [dv_inserted_date_time]                      DATETIME       NOT NULL,
    [dv_insert_user]                             VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]                       DATETIME       NULL,
    [dv_update_user]                             VARCHAR (50)   NULL,
    [dv_hash]                                    CHAR (32)      NOT NULL,
    [dv_batch_id]                                BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_l_commprefs_communication_type_channels]
    ON [dbo].[l_commprefs_communication_type_channels]([bk_hash] ASC, [l_commprefs_communication_type_channels_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[l_commprefs_communication_type_channels]([dv_batch_id] ASC);

