﻿CREATE TABLE [dbo].[s_lt_bucks_shopping_cart] (
    [s_lt_bucks_shopping_cart_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                     CHAR (32)       NOT NULL,
    [cart_id]                     INT             NULL,
    [cart_qty]                    INT             NULL,
    [cart_status]                 INT             NULL,
    [cart_color]                  INT             NULL,
    [cart_size]                   INT             NULL,
    [cart_ext_data1]              DECIMAL (26, 6) NULL,
    [cart_amount]                 DECIMAL (26, 6) NULL,
    [cart_point_amount]           DECIMAL (26, 6) NULL,
    [cart_sku]                    NVARCHAR (15)   NULL,
    [cart_sku2]                   NVARCHAR (10)   NULL,
    [cart_name]                   NVARCHAR (150)  NULL,
    [cart_locked]                 BIT             NULL,
    [cart_timestamp]              DATETIME2 (7)   NULL,
    [cart_coupon_amount]          DECIMAL (26, 6) NULL,
    [last_modified_timestamp]     DATETIME        NULL,
    [dv_load_date_time]           DATETIME        NOT NULL,
    [dv_r_load_source_id]         BIGINT          NOT NULL,
    [dv_inserted_date_time]       DATETIME        NOT NULL,
    [dv_insert_user]              VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]        DATETIME        NULL,
    [dv_update_user]              VARCHAR (50)    NULL,
    [dv_hash]                     CHAR (32)       NOT NULL,
    [dv_batch_id]                 BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_s_lt_bucks_shopping_cart]
    ON [dbo].[s_lt_bucks_shopping_cart]([bk_hash] ASC, [s_lt_bucks_shopping_cart_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_lt_bucks_shopping_cart]([dv_batch_id] ASC);

