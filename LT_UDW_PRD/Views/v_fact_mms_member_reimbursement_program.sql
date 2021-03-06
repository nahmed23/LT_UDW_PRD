﻿CREATE VIEW [marketing].[v_fact_mms_member_reimbursement_program] AS select fact_mms_member_reimbursement_program.fact_mms_member_reimbursement_program_key fact_mms_member_reimbursement_program_key,
       fact_mms_member_reimbursement_program.dim_mms_company_key dim_mms_company_key,
       fact_mms_member_reimbursement_program.dim_mms_member_key dim_mms_member_key,
       fact_mms_member_reimbursement_program.dim_mms_membership_key dim_mms_membership_key,
       fact_mms_member_reimbursement_program.dim_mms_reimbursement_program_key dim_mms_reimbursement_program_key,
       fact_mms_member_reimbursement_program.enrollment_date enrollment_date,
       fact_mms_member_reimbursement_program.enrollment_dim_date_key enrollment_dim_date_key,
       fact_mms_member_reimbursement_program.identifier_field1_name_dim_description_key identifier_field1_name_dim_description_key,
       fact_mms_member_reimbursement_program.identifier_field1_value identifier_field1_value,
       fact_mms_member_reimbursement_program.identifier_field2_name_dim_description_key identifier_field2_name_dim_description_key,
       fact_mms_member_reimbursement_program.identifier_field2_value identifier_field2_value,
       fact_mms_member_reimbursement_program.identifier_field3_name_dim_description_key identifier_field3_name_dim_description_key,
       fact_mms_member_reimbursement_program.identifier_field3_value identifier_field3_value,
       fact_mms_member_reimbursement_program.member_reimbursement_id member_reimbursement_id,
       fact_mms_member_reimbursement_program.p_mms_member_reimbursement_id p_mms_member_reimbursement_id,
       fact_mms_member_reimbursement_program.termination_date termination_date,
       fact_mms_member_reimbursement_program.termination_dim_date_key termination_dim_date_key
  from dbo.fact_mms_member_reimbursement_program;