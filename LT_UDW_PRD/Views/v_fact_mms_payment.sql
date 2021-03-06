﻿CREATE VIEW [marketing].[v_fact_mms_payment]
AS select fact_mms_payment.approval_code approval_code,
       fact_mms_payment.automated_refund_flag automated_refund_flag,
       fact_mms_payment.dim_club_key dim_club_key,
       fact_mms_payment.dim_mms_drawer_activity_key dim_mms_drawer_activity_key,
       fact_mms_payment.dim_mms_member_key dim_mms_member_key,
       fact_mms_payment.dim_mms_membership_key dim_mms_membership_key,
       fact_mms_payment.dim_mms_transaction_reason_key dim_mms_transaction_reason_key,
       fact_mms_payment.fact_mms_payment_key fact_mms_payment_key,
       fact_mms_payment.mms_tran_id mms_tran_id,
       fact_mms_payment.payment_amount payment_amount,
       fact_mms_payment.payment_dim_date_key payment_dim_date_key,
       fact_mms_payment.payment_dim_time_key payment_dim_time_key,
       fact_mms_payment.payment_flag payment_flag,
       fact_mms_payment.payment_id payment_id,
       fact_mms_payment.payment_status_dim_description_key payment_status_dim_description_key,
       fact_mms_payment.payment_type_dim_description_key payment_type_dim_description_key,
       fact_mms_payment.pos_flag pos_flag,
       fact_mms_payment.refund_flag refund_flag,
       fact_mms_payment.refunded_flag refunded_flag,
       fact_mms_payment.sales_entered_dim_employee_key sales_entered_dim_employee_key,
       fact_mms_payment.tip_amount tip_amount,
       fact_mms_payment.transaction_reporting_dim_club_key transaction_reporting_dim_club_key,
       fact_mms_payment.voided_flag voided_flag
  from dbo.fact_mms_payment;