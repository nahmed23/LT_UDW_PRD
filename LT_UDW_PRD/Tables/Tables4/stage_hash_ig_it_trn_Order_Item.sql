﻿CREATE TABLE [dbo].[stage_hash_ig_it_trn_Order_Item] (
    [stage_hash_ig_it_trn_Order_Item_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                            CHAR (32)    NOT NULL,
    [check_seq]                          SMALLINT     NULL,
    [check_type_id]                      INT          NULL,
    [check_void_reason_id]               INT          NULL,
    [discount_amt]                       MONEY        NULL,
    [discoup_id]                         INT          NULL,
    [item_qty]                           INT          NULL,
    [meal_period_id]                     INT          NULL,
    [menu_item_id]                       INT          NULL,
    [order_hdr_id]                       INT          NULL,
    [price_level_id]                     INT          NULL,
    [profit_center_id]                   INT          NULL,
    [sales_amt_gross]                    MONEY        NULL,
    [server_emp_id]                      INT          NULL,
    [split_item_flag]                    CHAR (1)     NULL,
    [tax_amt_incl_disc]                  MONEY        NULL,
    [tax_amt_incl_sales]                 MONEY        NULL,
    [tax_incl_flag]                      CHAR (1)     NULL,
    [void_reason_id]                     INT          NULL,
    [void_type_id]                       INT          NULL,
    [package_id]                         INT          NULL,
    [jan_one]                            DATETIME     NULL,
    [dv_load_date_time]                  DATETIME     NOT NULL,
    [dv_updated_date_time]               DATETIME     NULL,
    [dv_update_user]                     VARCHAR (50) NULL,
    [dv_batch_id]                        BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

