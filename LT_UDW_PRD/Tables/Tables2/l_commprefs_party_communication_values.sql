﻿CREATE TABLE [dbo].[l_commprefs_party_communication_values] (
    [l_commprefs_party_communication_values_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                   CHAR (32)    NOT NULL,
    [party_communication_values_id]             INT          NULL,
    [communication_value_id]                    INT          NULL,
    [party_id]                                  INT          NULL,
    [dv_load_date_time]                         DATETIME     NOT NULL,
    [dv_r_load_source_id]                       BIGINT       NOT NULL,
    [dv_inserted_date_time]                     DATETIME     NOT NULL,
    [dv_insert_user]                            VARCHAR (50) NOT NULL,
    [dv_updated_date_time]                      DATETIME     NULL,
    [dv_update_user]                            VARCHAR (50) NULL,
    [dv_hash]                                   CHAR (32)    NOT NULL,
    [dv_batch_id]                               BIGINT       NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[l_commprefs_party_communication_values]([dv_batch_id] ASC);

