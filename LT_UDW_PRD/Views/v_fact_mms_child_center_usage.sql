﻿CREATE VIEW [marketing].[v_fact_mms_child_center_usage] AS select fact_mms_child_center_usage.fact_mms_child_center_usage_key fact_mms_child_center_usage_key,
       fact_mms_child_center_usage.child_center_usage_id child_center_usage_id,
       fact_mms_child_center_usage.check_in_dim_date_key check_in_dim_date_key,
       fact_mms_child_center_usage.check_in_dim_mms_member_key check_in_dim_mms_member_key,
       fact_mms_child_center_usage.check_in_dim_time_key check_in_dim_time_key,
       fact_mms_child_center_usage.check_out_dim_date_key check_out_dim_date_key,
       fact_mms_child_center_usage.check_out_dim_mms_member_key check_out_dim_mms_member_key,
       fact_mms_child_center_usage.check_out_dim_time_key check_out_dim_time_key,
       fact_mms_child_center_usage.child_age_months child_age_months,
       fact_mms_child_center_usage.child_age_years child_age_years,
       fact_mms_child_center_usage.child_dim_mms_member_key child_dim_mms_member_key,
       fact_mms_child_center_usage.child_gender_abbreviation child_gender_abbreviation,
       fact_mms_child_center_usage.dim_club_key dim_club_key,
       fact_mms_child_center_usage.dim_mms_membership_key dim_mms_membership_key,
       fact_mms_child_center_usage.exception_flag exception_flag,
       fact_mms_child_center_usage.kids_play_check_in_count kids_play_check_in_count,
       fact_mms_child_center_usage.length_of_stay_display length_of_stay_display,
       fact_mms_child_center_usage.length_of_stay_minutes length_of_stay_minutes,
       fact_mms_child_center_usage.primary_dim_mms_member_key primary_dim_mms_member_key
  from dbo.fact_mms_child_center_usage;