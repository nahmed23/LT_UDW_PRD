﻿CREATE TABLE [dbo].[s_exerp_product] (
    [s_exerp_product_id]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                  CHAR (32)       NOT NULL,
    [product_id]               VARCHAR (4000)  NULL,
    [name]                     VARCHAR (4000)  NULL,
    [type]                     VARCHAR (4000)  NULL,
    [sales_price]              DECIMAL (26, 6) NULL,
    [minimum_price]            DECIMAL (26, 6) NULL,
    [cost_price]               DECIMAL (26, 6) NULL,
    [blocked]                  VARCHAR (10)    NULL,
    [sales_commission]         INT             NULL,
    [sales_units]              INT             NULL,
    [period_commission]        INT             NULL,
    [included_member_count]    INT             NULL,
    [ets]                      BIGINT          NULL,
    [flat_rate_commission]     DECIMAL (26, 6) NULL,
    [dummy_modified_date_time] DATETIME        NULL,
    [dv_load_date_time]        DATETIME        NOT NULL,
    [dv_r_load_source_id]      BIGINT          NOT NULL,
    [dv_inserted_date_time]    DATETIME        NOT NULL,
    [dv_insert_user]           VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]     DATETIME        NULL,
    [dv_update_user]           VARCHAR (50)    NULL,
    [dv_hash]                  CHAR (32)       NOT NULL,
    [dv_deleted]               BIT             DEFAULT ((0)) NOT NULL,
    [dv_batch_id]              BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_exerp_product]([dv_batch_id] ASC);

