﻿CREATE VIEW [marketing].[v_fact_mms_package_session]
AS select fact_mms_package_session.body_age_assessment_count body_age_assessment_count,
       fact_mms_package_session.created_dim_date_key created_dim_date_key,
       fact_mms_package_session.created_dim_time_key created_dim_time_key,
       fact_mms_package_session.delivered_dim_club_key delivered_dim_club_key,
       fact_mms_package_session.delivered_dim_date_key delivered_dim_date_key,
       fact_mms_package_session.delivered_dim_employee_key delivered_dim_employee_key,
       fact_mms_package_session.delivered_dim_time_key delivered_dim_time_key,
       fact_mms_package_session.delivered_session_discount_value delivered_session_discount_value,
       fact_mms_package_session.delivered_session_lt_bucks_amount delivered_session_lt_bucks_amount,
       fact_mms_package_session.delivered_session_price delivered_session_price,
       fact_mms_package_session.dim_mms_member_key dim_mms_member_key,
       fact_mms_package_session.edw_inserted_dim_date_key edw_inserted_dim_date_key,
       fact_mms_package_session.fact_mms_package_dim_product_key fact_mms_package_dim_product_key,
       fact_mms_package_session.fact_mms_package_key fact_mms_package_key,
       fact_mms_package_session.fact_mms_package_session_key fact_mms_package_session_key,
       fact_mms_package_session.fact_mms_sales_transaction_key fact_mms_sales_transaction_key,
       fact_mms_package_session.mms_tran_id mms_tran_id,
       fact_mms_package_session.number_of_sessions_in_package number_of_sessions_in_package,
       fact_mms_package_session.original_currency_code original_currency_code,
       fact_mms_package_session.package_created_dim_date_key package_created_dim_date_key,
       fact_mms_package_session.package_created_dim_time_key package_created_dim_time_key,
       fact_mms_package_session.package_edited_flag package_edited_flag,
       fact_mms_package_session.package_entered_dim_club_key package_entered_dim_club_key,
       fact_mms_package_session.package_entered_dim_employee_key package_entered_dim_employee_key,
       fact_mms_package_session.package_id package_id,
       fact_mms_package_session.package_session_id package_session_id,
       fact_mms_package_session.package_status_dim_description_key package_status_dim_description_key,
       fact_mms_package_session.primary_sales_dim_employee_key primary_sales_dim_employee_key,
       fact_mms_package_session.reporting_dim_club_key reporting_dim_club_key,
       fact_mms_package_session.reporting_local_currency_dim_plan_exchange_rate_key reporting_local_currency_dim_plan_exchange_rate_key,
       fact_mms_package_session.reporting_local_currency_monthly_average_dim_exchange_rate_key reporting_local_currency_monthly_average_dim_exchange_rate_key,
       fact_mms_package_session.sales_channel_dim_description_key sales_channel_dim_description_key,
       fact_mms_package_session.secondary_sales_dim_employee_key secondary_sales_dim_employee_key,
       fact_mms_package_session.session_comment session_comment,
       fact_mms_package_session.session_complete_count session_complete_count,
       fact_mms_package_session.tran_item_id tran_item_id,
       fact_mms_package_session.usd_dim_plan_exchange_rate_key usd_dim_plan_exchange_rate_key,
       fact_mms_package_session.usd_monthly_average_dim_exchange_rate_key usd_monthly_average_dim_exchange_rate_key,
       fact_mms_package_session.voided_flag voided_flag
  from dbo.fact_mms_package_session;