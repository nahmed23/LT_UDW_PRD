﻿CREATE TABLE [dbo].[stage_magento_customer_entity] (
    [stage_magento_customer_entity_id] BIGINT        NOT NULL,
    [entity_id]                        INT           NULL,
    [website_id]                       INT           NULL,
    [email]                            VARCHAR (255) NULL,
    [group_id]                         INT           NULL,
    [increment_id]                     VARCHAR (50)  NULL,
    [store_id]                         INT           NULL,
    [created_at]                       DATETIME      NULL,
    [updated_at]                       DATETIME      NULL,
    [is_active]                        INT           NULL,
    [disable_auto_group_change]        INT           NULL,
    [created_in]                       VARCHAR (255) NULL,
    [prefix]                           VARCHAR (40)  NULL,
    [firstname]                        VARCHAR (255) NULL,
    [middlename]                       VARCHAR (255) NULL,
    [lastname]                         VARCHAR (255) NULL,
    [suffix]                           VARCHAR (40)  NULL,
    [dob]                              DATE          NULL,
    [password_hash]                    VARCHAR (128) NULL,
    [rp_token]                         VARCHAR (128) NULL,
    [rp_token_created_at]              DATETIME      NULL,
    [default_billing]                  INT           NULL,
    [default_shipping]                 INT           NULL,
    [taxvat]                           VARCHAR (50)  NULL,
    [confirmation]                     VARCHAR (64)  NULL,
    [gender]                           INT           NULL,
    [failures_num]                     INT           NULL,
    [first_failure]                    DATETIME      NULL,
    [lock_expires]                     DATETIME      NULL,
    [m1_customer_id]                   INT           NULL,
    [dv_batch_id]                      BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);
