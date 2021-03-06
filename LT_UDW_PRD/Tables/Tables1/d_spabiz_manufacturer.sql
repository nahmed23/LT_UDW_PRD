﻿CREATE TABLE [dbo].[d_spabiz_manufacturer] (
    [d_spabiz_manufacturer_id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                   CHAR (32)     NOT NULL,
    [dim_spabiz_manufacturer_key]               CHAR (32)     NULL,
    [manufacturer_id]                           BIGINT        NULL,
    [store_number]                              BIGINT        NULL,
    [deleted_date_time]                         DATETIME      NULL,
    [deleted_flag]                              CHAR (1)      NULL,
    [dim_spabiz_commission_product_mapping_key] CHAR (32)     NULL,
    [dim_spabiz_store_key]                      CHAR (32)     NULL,
    [edit_date_time]                            DATETIME      NULL,
    [name]                                      VARCHAR (150) NULL,
    [quick_id]                                  VARCHAR (150) NULL,
    [p_spabiz_manufacturer_id]                  BIGINT        NOT NULL,
    [dv_load_date_time]                         DATETIME      NULL,
    [dv_load_end_date_time]                     DATETIME      NULL,
    [dv_batch_id]                               BIGINT        NOT NULL,
    [dv_inserted_date_time]                     DATETIME      NOT NULL,
    [dv_insert_user]                            VARCHAR (50)  NOT NULL,
    [dv_updated_date_time]                      DATETIME      NULL,
    [dv_update_user]                            VARCHAR (50)  NULL
)
WITH (HEAP, DISTRIBUTION = REPLICATE);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[d_spabiz_manufacturer]([dv_batch_id] ASC);


GO
CREATE STATISTICS [stat_dv_batch_id]
    ON [dbo].[d_spabiz_manufacturer]([dv_batch_id]);

