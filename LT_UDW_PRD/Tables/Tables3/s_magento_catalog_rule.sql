﻿CREATE TABLE [dbo].[s_magento_catalog_rule] (
    [s_magento_catalog_rule_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                   CHAR (32)       NOT NULL,
    [row_id]                    INT             NULL,
    [created_in]                BIGINT          NULL,
    [updated_in]                BIGINT          NULL,
    [name]                      VARCHAR (255)   NULL,
    [description]               VARCHAR (8000)  NULL,
    [from_date]                 DATE            NULL,
    [to_date]                   DATE            NULL,
    [is_active]                 INT             NULL,
    [conditions_serialized]     VARCHAR (8000)  NULL,
    [actions_serialized]        VARCHAR (8000)  NULL,
    [stop_rules_processing]     INT             NULL,
    [sort_order]                INT             NULL,
    [simple_action]             VARCHAR (32)    NULL,
    [discount_amount]           DECIMAL (12, 4) NULL,
    [dummy_modified_date_time]  DATETIME        NULL,
    [dv_load_date_time]         DATETIME        NOT NULL,
    [dv_r_load_source_id]       BIGINT          NOT NULL,
    [dv_inserted_date_time]     DATETIME        NOT NULL,
    [dv_insert_user]            VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]      DATETIME        NULL,
    [dv_update_user]            VARCHAR (50)    NULL,
    [dv_hash]                   CHAR (32)       NOT NULL,
    [dv_deleted]                BIT             DEFAULT ((0)) NOT NULL,
    [dv_batch_id]               BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));

