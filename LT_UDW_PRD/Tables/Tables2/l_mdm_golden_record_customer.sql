﻿CREATE TABLE [dbo].[l_mdm_golden_record_customer] (
    [l_mdm_golden_record_customer_id] BIGINT        IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)     NOT NULL,
    [load_date_time]                  DATETIME      NULL,
    [row_number]                      INT           NULL,
    [entity_id]                       VARCHAR (128) NULL,
    [source_id]                       VARCHAR (128) NULL,
    [source_code]                     VARCHAR (128) NULL,
    [contact_id]                      VARCHAR (128) NULL,
    [lead_id]                         VARCHAR (128) NULL,
    [member_id]                       VARCHAR (128) NULL,
    [party_id]                        VARCHAR (128) NULL,
    [membership_id]                   VARCHAR (128) NULL,
    [spa_customer_id]                 VARCHAR (128) NULL,
    [dv_load_date_time]               DATETIME      NOT NULL,
    [dv_batch_id]                     BIGINT        NOT NULL,
    [dv_r_load_source_id]             BIGINT        NOT NULL,
    [dv_inserted_date_time]           DATETIME      NOT NULL,
    [dv_insert_user]                  VARCHAR (50)  NOT NULL,
    [dv_updated_date_time]            DATETIME      NULL,
    [dv_update_user]                  VARCHAR (50)  NULL,
    [dv_hash]                         CHAR (32)     NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_l_mdm_golden_record_customer]
    ON [dbo].[l_mdm_golden_record_customer]([bk_hash] ASC, [l_mdm_golden_record_customer_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[l_mdm_golden_record_customer]([dv_batch_id] ASC);

