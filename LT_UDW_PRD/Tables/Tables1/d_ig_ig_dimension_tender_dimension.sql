﻿CREATE TABLE [dbo].[d_ig_ig_dimension_tender_dimension] (
    [d_ig_ig_dimension_tender_dimension_id] BIGINT        IDENTITY (1, 1) NOT NULL,
    [bk_hash]                               CHAR (32)     NOT NULL,
    [tender_dim_id]                         INT           NULL,
    [additional_check_id_code_id]           TINYINT       NULL,
    [cash_tender_flag]                      CHAR (1)      NULL,
    [comp_tender_flag]                      CHAR (1)      NULL,
    [corp_id]                               INT           NULL,
    [customer_id]                           INT           NULL,
    [dim_cafe_payment_type_key]             CHAR (32)     NULL,
    [eff_date_from]                         DATETIME      NULL,
    [eff_date_to]                           DATETIME      NULL,
    [effective_dim_date_key]                CHAR (8)      NULL,
    [ent_id]                                INT           NULL,
    [expiration_dim_date_key]               CHAR (8)      NULL,
    [payment_class]                         NVARCHAR (50) NULL,
    [payment_id]                            INT           NULL,
    [payment_type]                          NVARCHAR (50) NULL,
    [profit_center_dim_level_2_id]          INT           NULL,
    [tender_id]                             INT           NULL,
    [p_ig_ig_dimension_tender_dimension_id] BIGINT        NOT NULL,
    [deleted_flag]                          INT           NULL,
    [dv_load_date_time]                     DATETIME      NULL,
    [dv_load_end_date_time]                 DATETIME      NULL,
    [dv_batch_id]                           BIGINT        NOT NULL,
    [dv_inserted_date_time]                 DATETIME      NOT NULL,
    [dv_insert_user]                        VARCHAR (50)  NOT NULL,
    [dv_updated_date_time]                  DATETIME      NULL,
    [dv_update_user]                        VARCHAR (50)  NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

