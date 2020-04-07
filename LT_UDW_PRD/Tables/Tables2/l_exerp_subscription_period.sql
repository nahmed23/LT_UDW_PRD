﻿CREATE TABLE [dbo].[l_exerp_subscription_period] (
    [l_exerp_subscription_period_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                        CHAR (32)      NOT NULL,
    [subscription_period_id]         VARCHAR (4000) NULL,
    [subscription_id]                VARCHAR (4000) NULL,
    [sale_log_id]                    VARCHAR (4000) NULL,
    [center_id]                      INT            NULL,
    [dv_load_date_time]              DATETIME       NOT NULL,
    [dv_r_load_source_id]            BIGINT         NOT NULL,
    [dv_inserted_date_time]          DATETIME       NOT NULL,
    [dv_insert_user]                 VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]           DATETIME       NULL,
    [dv_update_user]                 VARCHAR (50)   NULL,
    [dv_hash]                        CHAR (32)      NOT NULL,
    [dv_deleted]                     BIT            DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                    BIGINT         NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[l_exerp_subscription_period]([dv_batch_id] ASC);

