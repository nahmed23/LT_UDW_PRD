﻿CREATE TABLE [dbo].[dim_mms_reimbursement_program] (
    [dim_mms_reimbursement_program_id]                                BIGINT         IDENTITY (1, 1) NOT NULL,
    [dim_mms_reimbursement_program_key]                               CHAR (32)      NULL,
    [reimbursement_program_id]                                        INT            NULL,
    [dim_mms_company_key]                                             CHAR (32)      NULL,
    [program_active_flag]                                             CHAR (1)       NULL,
    [program_name]                                                    VARCHAR (100)  NULL,
    [program_processing_type_dim_description_key]                     VARCHAR (2000) NULL,
    [program_type_dim_description_key]                                VARCHAR (2000) NULL,
    [subsidy_program_description]                                     VARCHAR (255)  NULL,
    [subsidy_program_flag]                                            CHAR (1)       NULL,
    [subsidy_reimbursement_couple_membership_dues_amount]             DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_couple_membership_dues_flag]               CHAR (1)       NULL,
    [subsidy_reimbursement_couple_membership_dues_include_tax_flag]   CHAR (1)       NULL,
    [subsidy_reimbursement_couple_membership_dues_percentage]         DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_experience_life_magazine_amount]           DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_experience_life_magazine_flag]             CHAR (1)       NULL,
    [subsidy_reimbursement_experience_life_magazine_include_tax_flag] CHAR (1)       NULL,
    [subsidy_reimbursement_experience_life_magazine_percentage]       DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_family_membership_dues_amount]             DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_family_membership_dues_flag]               CHAR (1)       NULL,
    [subsidy_reimbursement_family_membership_dues_include_tax_flag]   CHAR (1)       NULL,
    [subsidy_reimbursement_family_membership_dues_percentage]         DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_junior_member_dues_amount]                 DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_junior_member_dues_flag]                   CHAR (1)       NULL,
    [subsidy_reimbursement_junior_member_dues_include_tax_flag]       CHAR (1)       NULL,
    [subsidy_reimbursement_junior_member_dues_percentage]             DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_single_membership_dues_amount]             DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_single_membership_dues_flag]               CHAR (1)       NULL,
    [subsidy_reimbursement_single_membership_dues_include_tax_flag]   CHAR (1)       NULL,
    [subsidy_reimbursement_single_membership_dues_percentage]         DECIMAL (6, 2) NULL,
    [subsidy_reimbursement_usage_type_dim_description_key]            VARCHAR (2000) NULL,
    [dv_load_date_time]                                               DATETIME       NULL,
    [dv_load_end_date_time]                                           DATETIME       NULL,
    [dv_batch_id]                                                     BIGINT         NOT NULL,
    [dv_inserted_date_time]                                           DATETIME       NOT NULL,
    [dv_insert_user]                                                  VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]                                            DATETIME       NULL,
    [dv_update_user]                                                  VARCHAR (50)   NULL
)
WITH (HEAP, DISTRIBUTION = HASH([dim_mms_reimbursement_program_key]));

