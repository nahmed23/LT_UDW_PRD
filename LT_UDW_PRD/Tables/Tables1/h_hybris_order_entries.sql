﻿CREATE TABLE [dbo].[h_hybris_order_entries] (
    [h_hybris_order_entries_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                   CHAR (32)    NOT NULL,
    [order_entries_pk]          BIGINT       NULL,
    [dv_load_date_time]         DATETIME     NOT NULL,
    [dv_r_load_source_id]       BIGINT       NOT NULL,
    [dv_inserted_date_time]     DATETIME     NOT NULL,
    [dv_insert_user]            VARCHAR (50) NOT NULL,
    [dv_updated_date_time]      DATETIME     NULL,
    [dv_update_user]            VARCHAR (50) NULL,
    [dv_deleted]                BIT          DEFAULT ((0)) NOT NULL,
    [dv_batch_id]               BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_h_hybris_order_entries]
    ON [dbo].[h_hybris_order_entries]([bk_hash] ASC, [h_hybris_order_entries_id] ASC);

