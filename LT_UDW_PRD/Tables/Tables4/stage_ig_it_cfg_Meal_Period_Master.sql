﻿CREATE TABLE [dbo].[stage_ig_it_cfg_Meal_Period_Master] (
    [stage_ig_it_cfg_Meal_Period_Master_id] BIGINT        NOT NULL,
    [ent_id]                                INT           NULL,
    [meal_period_id]                        INT           NULL,
    [meal_period_name]                      NVARCHAR (16) NULL,
    [meal_period_abbr1]                     NVARCHAR (7)  NULL,
    [meal_period_abbr2]                     NVARCHAR (7)  NULL,
    [meal_period_sec_id]                    INT           NULL,
    [default_price_level_id]                INT           NULL,
    [default_check_type_id]                 INT           NULL,
    [store_id]                              INT           NULL,
    [entertainment_flag]                    BIT           NULL,
    [receipt_code]                          NVARCHAR (3)  NULL,
    [row_version]                           BINARY (8)    NULL,
    [enterprise_created_id]                 INT           NULL,
    [dummy_modified_date_time]              DATETIME      NULL,
    [dv_batch_id]                           BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

