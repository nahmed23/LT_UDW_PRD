﻿CREATE VIEW [marketing].[v_dim_crm_connect_member]
AS select d_crmcloudsync_ltf_connect_member.dim_crm_ltf_connect_member_key dim_crm_ltf_connect_member_key,
       d_crmcloudsync_ltf_connect_member.ltf_connect_member_id ltf_connect_member_id,
       d_crmcloudsync_ltf_connect_member.created_by_dim_crm_system_user_key created_by_dim_crm_system_user_key,
       d_crmcloudsync_ltf_connect_member.created_by_name created_by_name,
       d_crmcloudsync_ltf_connect_member.created_dim_date_key created_dim_date_key,
       d_crmcloudsync_ltf_connect_member.created_dim_time_key created_dim_time_key,
       d_crmcloudsync_ltf_connect_member.created_on created_on,
       d_crmcloudsync_ltf_connect_member.dim_crm_ltf_subscriber_key dim_crm_ltf_subscriber_key,
       d_crmcloudsync_ltf_connect_member.dim_crm_opportunity_key dim_crm_opportunity_key,
       d_crmcloudsync_ltf_connect_member.inserted_date_time inserted_date_time,
       d_crmcloudsync_ltf_connect_member.inserted_dim_date_key inserted_dim_date_key,
       d_crmcloudsync_ltf_connect_member.inserted_dim_time_key inserted_dim_time_key,
       d_crmcloudsync_ltf_connect_member.ltf_move_it_scheduled_date ltf_move_it_scheduled_date,
       d_crmcloudsync_ltf_connect_member.ltf_move_it_scheduled_dim_date_key ltf_move_it_scheduled_dim_date_key,
       d_crmcloudsync_ltf_connect_member.ltf_move_it_scheduled_dim_time_key ltf_move_it_scheduled_dim_time_key,
       d_crmcloudsync_ltf_connect_member.ltf_move_it_scheduled_with ltf_move_it_scheduled_with,
       d_crmcloudsync_ltf_connect_member.ltf_profile_notes ltf_profile_notes,
       d_crmcloudsync_ltf_connect_member.ltf_programs_of_interest ltf_programs_of_interest,
       d_crmcloudsync_ltf_connect_member.ltf_programs_of_interest_name ltf_programs_of_interest_name,
       d_crmcloudsync_ltf_connect_member.ltf_subscriber_id_name ltf_subscriber_id_name,
       d_crmcloudsync_ltf_connect_member.ltf_want_to_do ltf_want_to_do,
       d_crmcloudsync_ltf_connect_member.ltf_want_to_do_name ltf_want_to_do_name,
       d_crmcloudsync_ltf_connect_member.ltf_who_met_with ltf_who_met_with,
       d_crmcloudsync_ltf_connect_member.ltf_why_want_to_do ltf_why_want_to_do,
       d_crmcloudsync_ltf_connect_member.ltf_why_want_to_do_name ltf_why_want_to_do_name,
       d_crmcloudsync_ltf_connect_member.modified_dim_date_key modified_dim_date_key,
       d_crmcloudsync_ltf_connect_member.modified_dim_time_key modified_dim_time_key,
       d_crmcloudsync_ltf_connect_member.modified_on modified_on,
       d_crmcloudsync_ltf_connect_member.state_code state_code,
       d_crmcloudsync_ltf_connect_member.status_code status_code,
       d_crmcloudsync_ltf_connect_member.updated_date_time updated_date_time,
       d_crmcloudsync_ltf_connect_member.updated_dim_date_key updated_dim_date_key,
       d_crmcloudsync_ltf_connect_member.updated_dim_time_key updated_dim_time_key
  from dbo.d_crmcloudsync_ltf_connect_member;