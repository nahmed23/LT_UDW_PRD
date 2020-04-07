﻿CREATE VIEW [marketing].[v_fact_cafe_terminal_shift_cash]
AS select d_ig_it_trn_terminal_shift_cash_BD.fact_cafe_terminal_shift_cash_key fact_cafe_terminal_shift_cash_key,
       d_ig_it_trn_terminal_shift_cash_BD.bus_day_id bus_day_id,
       d_ig_it_trn_terminal_shift_cash_BD.cash_shift_id cash_shift_id,
       d_ig_it_trn_terminal_shift_cash_BD.tender_id tender_id,
       d_ig_it_trn_terminal_shift_cash_BD.term_id term_id,
       d_ig_it_trn_terminal_shift_cash_BD.breakage_amount breakage_amount,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_end_date_time business_day_end_date_time,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_end_dim_date_key business_day_end_dim_date_key,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_end_dim_time_key business_day_end_dim_time_key,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_start_date_time business_day_start_date_time,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_start_dim_date_key business_day_start_dim_date_key,
       d_ig_it_trn_terminal_shift_cash_BD.business_day_start_dim_time_key business_day_start_dim_time_key,
       d_ig_it_trn_terminal_shift_cash_BD.cash_drop_amount cash_drop_amount,
       d_ig_it_trn_terminal_shift_cash_BD.change_amount change_amount,
       d_ig_it_trn_terminal_shift_cash_BD.dim_cafe_business_day_dates_key dim_cafe_business_day_dates_key,
       d_ig_it_trn_terminal_shift_cash_BD.dim_cafe_payment_type_key dim_cafe_payment_type_key,
       d_ig_it_trn_terminal_shift_cash_BD.dim_cafe_terminal_key dim_cafe_terminal_key,
       d_ig_it_trn_terminal_shift_cash_BD.loan_amount loan_amount,
       d_ig_it_trn_terminal_shift_cash_BD.number_tendered_checks number_tendered_checks,
       d_ig_it_trn_terminal_shift_cash_BD.paid_out_amount paid_out_amount,
       d_ig_it_trn_terminal_shift_cash_BD.received_current_amount received_current_amount,
       d_ig_it_trn_terminal_shift_cash_BD.tender_amount tender_amount,
       d_ig_it_trn_terminal_shift_cash_BD.tender_quantity tender_quantity,
       d_ig_it_trn_terminal_shift_cash_BD.withdrawal_amount withdrawal_amount
  from dbo.d_ig_it_trn_terminal_shift_cash_BD;