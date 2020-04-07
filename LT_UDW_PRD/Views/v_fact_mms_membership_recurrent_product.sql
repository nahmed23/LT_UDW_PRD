﻿CREATE VIEW [marketing].[v_fact_mms_membership_recurrent_product]
AS select fact_mms_membership_recurrent_product.fact_mms_membership_recurrent_product_key fact_mms_membership_recurrent_product_key,
       fact_mms_membership_recurrent_product.membership_recurrent_product_id membership_recurrent_product_id,
       fact_mms_membership_recurrent_product.activation_dim_date_key activation_dim_date_key,
       fact_mms_membership_recurrent_product.assessment_day_of_month assessment_day_of_month,
       fact_mms_membership_recurrent_product.cancellation_request_dim_date_key cancellation_request_dim_date_key,
       fact_mms_membership_recurrent_product.comments comments,
       fact_mms_membership_recurrent_product.commission_dim_mms_employee_key commission_dim_mms_employee_key,
       fact_mms_membership_recurrent_product.commission_employee_id commission_employee_id,
       fact_mms_membership_recurrent_product.created_date_time_zone created_date_time_zone,
       fact_mms_membership_recurrent_product.created_dim_date_key created_dim_date_key,
       fact_mms_membership_recurrent_product.created_dim_time_key created_dim_time_key,
       fact_mms_membership_recurrent_product.dim_club_key dim_club_key,
       fact_mms_membership_recurrent_product.dim_mms_member_key dim_mms_member_key,
       fact_mms_membership_recurrent_product.dim_mms_pricing_discount_key dim_mms_pricing_discount_key,
       fact_mms_membership_recurrent_product.dim_mms_product_key dim_mms_product_key,
       fact_mms_membership_recurrent_product.display_only_flag display_only_flag,
       fact_mms_membership_recurrent_product.hold_end_dim_date_key hold_end_dim_date_key,
       fact_mms_membership_recurrent_product.hold_start_dim_date_key hold_start_dim_date_key,
       fact_mms_membership_recurrent_product.inserted_dim_date_key inserted_dim_date_key,
       fact_mms_membership_recurrent_product.inserted_dim_time_key inserted_dim_time_key,
       fact_mms_membership_recurrent_product.last_assessment_dim_date_key last_assessment_dim_date_key,
       fact_mms_membership_recurrent_product.last_updated_date_time_zone last_updated_date_time_zone,
       fact_mms_membership_recurrent_product.last_updated_dim_date_key last_updated_dim_date_key,
       fact_mms_membership_recurrent_product.last_updated_dim_employee_key last_updated_dim_employee_key,
       fact_mms_membership_recurrent_product.last_updated_dim_time_key last_updated_dim_time_key,
       fact_mms_membership_recurrent_product.last_updated_employee_id last_updated_employee_id,
       fact_mms_membership_recurrent_product.membership_id membership_id,
       fact_mms_membership_recurrent_product.number_of_sessions number_of_sessions,
       fact_mms_membership_recurrent_product.original_currency_code original_currency_code,
       fact_mms_membership_recurrent_product.price price,
       fact_mms_membership_recurrent_product.price_per_session price_per_session,
       fact_mms_membership_recurrent_product.pricing_discount_id pricing_discount_id,
       fact_mms_membership_recurrent_product.promotion_code promotion_code,
       fact_mms_membership_recurrent_product.recurrent_product_source_dim_description_key recurrent_product_source_dim_description_key,
       fact_mms_membership_recurrent_product.retail_price retail_price,
       fact_mms_membership_recurrent_product.retail_price_per_session retail_price_per_session,
       fact_mms_membership_recurrent_product.sold_not_serviced_flag sold_not_serviced_flag,
       fact_mms_membership_recurrent_product.termination_dim_date_key termination_dim_date_key,
       fact_mms_membership_recurrent_product.termination_reason_dim_description_key termination_reason_dim_description_key,
       fact_mms_membership_recurrent_product.updated_dim_date_key updated_dim_date_key,
       fact_mms_membership_recurrent_product.updated_dim_time_key updated_dim_time_key,
       fact_mms_membership_recurrent_product.utc_created_dim_date_key utc_created_dim_date_key,
       fact_mms_membership_recurrent_product.utc_created_dim_time_key utc_created_dim_time_key,
       fact_mms_membership_recurrent_product.utc_last_updated_dim_date_key utc_last_updated_dim_date_key,
       fact_mms_membership_recurrent_product.utc_last_updated_dim_time_key utc_last_updated_dim_time_key,
       fact_mms_membership_recurrent_product.val_discount_reason_id val_discount_reason_id,
       fact_mms_membership_recurrent_product.val_recurrent_product_source_id val_recurrent_product_source_id,
       fact_mms_membership_recurrent_product.val_recurrent_product_termination_reason_id val_recurrent_product_termination_reason_id
  from dbo.fact_mms_membership_recurrent_product;