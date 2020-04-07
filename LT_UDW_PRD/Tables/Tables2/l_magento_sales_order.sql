﻿CREATE TABLE [dbo].[l_magento_sales_order] (
    [l_magento_sales_order_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                  CHAR (32)    NOT NULL,
    [entity_id]                INT          NULL,
    [store_id]                 INT          NULL,
    [customer_id]              INT          NULL,
    [billing_address_id]       INT          NULL,
    [customer_group_id]        INT          NULL,
    [quote_address_id]         INT          NULL,
    [quote_id]                 INT          NULL,
    [shipping_address_id]      INT          NULL,
    [increment_id]             VARCHAR (32) NULL,
    [ext_customer_id]          VARCHAR (32) NULL,
    [ext_order_id]             VARCHAR (32) NULL,
    [original_increment_id]    VARCHAR (32) NULL,
    [relation_child_id]        VARCHAR (32) NULL,
    [relation_child_real_id]   VARCHAR (32) NULL,
    [relation_parent_id]       VARCHAR (32) NULL,
    [relation_parent_real_id]  VARCHAR (32) NULL,
    [gift_message_id]          INT          NULL,
    [gw_id]                    INT          NULL,
    [m1_order_id]              INT          NULL,
    [customer_mms_id]          INT          NULL,
    [dv_load_date_time]        DATETIME     NOT NULL,
    [dv_r_load_source_id]      BIGINT       NOT NULL,
    [dv_inserted_date_time]    DATETIME     NOT NULL,
    [dv_insert_user]           VARCHAR (50) NOT NULL,
    [dv_updated_date_time]     DATETIME     NULL,
    [dv_update_user]           VARCHAR (50) NULL,
    [dv_hash]                  CHAR (32)    NOT NULL,
    [dv_deleted]               BIT          DEFAULT ((0)) NOT NULL,
    [dv_batch_id]              BIGINT       NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));
