﻿CREATE TABLE [dbo].[s_ig_it_cfg_tender_master] (
    [s_ig_it_cfg_tender_master_id]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                           CHAR (32)       NOT NULL,
    [ent_id]                            INT             NULL,
    [tender_id]                         INT             NULL,
    [tender_name]                       NVARCHAR (16)   NULL,
    [tender_abbr1]                      NVARCHAR (7)    NULL,
    [tender_abbr2]                      NVARCHAR (7)    NULL,
    [sales_tippable_flag]               BIT             NULL,
    [tender_limit]                      DECIMAL (26, 6) NULL,
    [require_amt_flag]                  BIT             NULL,
    [restricted_flag]                   BIT             NULL,
    [first_tender_flag]                 BIT             NULL,
    [last_tender_flag]                  BIT             NULL,
    [num_receipts_print]                SMALLINT        NULL,
    [auto_remove_tax_flag]              BIT             NULL,
    [enter_tip_prompt]                  BIT             NULL,
    [post_acct_no]                      NVARCHAR (30)   NULL,
    [post_system1_flag]                 BIT             NULL,
    [post_system2_flag]                 BIT             NULL,
    [post_system3_flag]                 BIT             NULL,
    [post_system4_flag]                 BIT             NULL,
    [post_system5_flag]                 BIT             NULL,
    [post_system6_flag]                 BIT             NULL,
    [post_system7_flag]                 BIT             NULL,
    [post_system8_flag]                 BIT             NULL,
    [prompt_extra_data_flag]            BIT             NULL,
    [icc_rate]                          DECIMAL (26, 6) NULL,
    [icc_decimal_places]                SMALLINT        NULL,
    [prompt_extra_alpha_flag]           BIT             NULL,
    [comp_tender_flag]                  BIT             NULL,
    [prompt_cvv_flag]                   BIT             NULL,
    [prompt_zipcode_flag]               BIT             NULL,
    [use_sigcap_flag]                   BIT             NULL,
    [use_archive_flag]                  BIT             NULL,
    [verification_manual_entry_code_id] SMALLINT        NULL,
    [destination_property_code]         NVARCHAR (6)    NULL,
    [emv_card_type_code]                NVARCHAR (20)   NULL,
    [row_version]                       BINARY (8)      NULL,
    [loyalty_earn_eligible_flag]        BIT             NULL,
    [tax_comp_code]                     TINYINT         NULL,
    [bypass_pds_flag]                   BIT             NULL,
    [jan_one]                           DATETIME        NULL,
    [dv_load_date_time]                 DATETIME        NOT NULL,
    [dv_r_load_source_id]               BIGINT          NOT NULL,
    [dv_inserted_date_time]             DATETIME        NOT NULL,
    [dv_insert_user]                    VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]              DATETIME        NULL,
    [dv_update_user]                    VARCHAR (50)    NULL,
    [dv_hash]                           CHAR (32)       NOT NULL,
    [dv_batch_id]                       BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_ig_it_cfg_tender_master]([dv_batch_id] ASC);

