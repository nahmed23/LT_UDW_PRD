﻿CREATE VIEW [marketing].[v_dim_crm_related_interest]
AS select d_crmcloudsync_ltf_related_interest.dim_crm_related_interest_key dim_crm_related_interest_key,
       d_crmcloudsync_ltf_related_interest.ltf_related_interest_id ltf_related_interest_id,
       d_crmcloudsync_ltf_related_interest.created_by_dim_crm_system_user_key created_by_dim_crm_system_user_key,
       d_crmcloudsync_ltf_related_interest.created_by_name created_by_name,
       d_crmcloudsync_ltf_related_interest.created_dim_date_key created_dim_date_key,
       d_crmcloudsync_ltf_related_interest.created_dim_time_key created_dim_time_key,
       d_crmcloudsync_ltf_related_interest.created_on created_on,
       d_crmcloudsync_ltf_related_interest.dim_crm_contact_key dim_crm_contact_key,
       d_crmcloudsync_ltf_related_interest.dim_crm_interest_key dim_crm_interest_key,
       d_crmcloudsync_ltf_related_interest.dim_crm_lead_key dim_crm_lead_key,
       d_crmcloudsync_ltf_related_interest.dim_crm_opportunity_key dim_crm_opportunity_key,
       d_crmcloudsync_ltf_related_interest.dim_crm_owner_key dim_crm_owner_key,
       d_crmcloudsync_ltf_related_interest.insert_user insert_user,
       d_crmcloudsync_ltf_related_interest.inserted_date_time inserted_date_time,
       d_crmcloudsync_ltf_related_interest.inserted_dim_date_key inserted_dim_date_key,
       d_crmcloudsync_ltf_related_interest.inserted_dim_time_key inserted_dim_time_key,
       d_crmcloudsync_ltf_related_interest.ltf_add_by ltf_add_by,
       d_crmcloudsync_ltf_related_interest.ltf_add_date ltf_add_date,
       d_crmcloudsync_ltf_related_interest.ltf_add_dim_date_key ltf_add_dim_date_key,
       d_crmcloudsync_ltf_related_interest.ltf_add_dim_time_key ltf_add_dim_time_key,
       d_crmcloudsync_ltf_related_interest.ltf_add_source ltf_add_source,
       d_crmcloudsync_ltf_related_interest.ltf_contact_id_name ltf_contact_id_name,
       d_crmcloudsync_ltf_related_interest.ltf_interest_id ltf_interest_id,
       d_crmcloudsync_ltf_related_interest.ltf_interest_id_name ltf_interest_id_name,
       d_crmcloudsync_ltf_related_interest.ltf_lead_id_name ltf_lead_id_name,
       d_crmcloudsync_ltf_related_interest.ltf_name ltf_name,
       d_crmcloudsync_ltf_related_interest.ltf_opportunity_id_name ltf_opportunity_id_name,
       d_crmcloudsync_ltf_related_interest.ltf_remove_by ltf_remove_by,
       d_crmcloudsync_ltf_related_interest.ltf_remove_date ltf_remove_date,
       d_crmcloudsync_ltf_related_interest.ltf_remove_dim_date_key ltf_remove_dim_date_key,
       d_crmcloudsync_ltf_related_interest.ltf_remove_dim_time_key ltf_remove_dim_time_key,
       d_crmcloudsync_ltf_related_interest.ltf_remove_source ltf_remove_source,
       d_crmcloudsync_ltf_related_interest.modified_by_dim_crm_system_user_key modified_by_dim_crm_system_user_key,
       d_crmcloudsync_ltf_related_interest.modified_by_name modified_by_name,
       d_crmcloudsync_ltf_related_interest.modified_dim_date_key modified_dim_date_key,
       d_crmcloudsync_ltf_related_interest.modified_dim_time_key modified_dim_time_key,
       d_crmcloudsync_ltf_related_interest.modified_on modified_on,
       d_crmcloudsync_ltf_related_interest.modified_on_behalf_by_dim_crm_system_user_key modified_on_behalf_by_dim_crm_system_user_key,
       d_crmcloudsync_ltf_related_interest.modified_on_behalf_by_name modified_on_behalf_by_name,
       d_crmcloudsync_ltf_related_interest.owner_id_name owner_id_name,
       d_crmcloudsync_ltf_related_interest.owner_id_type owner_id_type,
       d_crmcloudsync_ltf_related_interest.owning_business_unit owning_business_unit,
       d_crmcloudsync_ltf_related_interest.owning_team owning_team,
       d_crmcloudsync_ltf_related_interest.owning_user_dim_crm_system_user_key owning_user_dim_crm_system_user_key,
       d_crmcloudsync_ltf_related_interest.primary_interest_flag primary_interest_flag,
       d_crmcloudsync_ltf_related_interest.state_code state_code,
       d_crmcloudsync_ltf_related_interest.state_code_name state_code_name,
       d_crmcloudsync_ltf_related_interest.status_code status_code,
       d_crmcloudsync_ltf_related_interest.status_code_name status_code_name,
       d_crmcloudsync_ltf_related_interest.update_user update_user,
       d_crmcloudsync_ltf_related_interest.updated_date_time updated_date_time,
       d_crmcloudsync_ltf_related_interest.updated_dim_date_key updated_dim_date_key,
       d_crmcloudsync_ltf_related_interest.updated_dim_time_key updated_dim_time_key
  from dbo.d_crmcloudsync_ltf_related_interest;