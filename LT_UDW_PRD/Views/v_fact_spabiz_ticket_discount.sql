﻿CREATE VIEW [marketing].[v_fact_spabiz_ticket_discount] AS select d_spabiz_ticket_discount.fact_spabiz_ticket_discount_key fact_spabiz_ticket_discount_key,
       d_spabiz_ticket_discount.ticket_discount_id ticket_discount_id,
       d_spabiz_ticket_discount.store_number store_number,
       d_spabiz_ticket_discount.amount amount,
       d_spabiz_ticket_discount.created_date_time created_date_time,
       d_spabiz_ticket_discount.dim_spabiz_customer_key dim_spabiz_customer_key,
       d_spabiz_ticket_discount.dim_spabiz_discount_key dim_spabiz_discount_key,
       d_spabiz_ticket_discount.dim_spabiz_product_key dim_spabiz_product_key,
       d_spabiz_ticket_discount.dim_spabiz_shift_key dim_spabiz_shift_key,
       d_spabiz_ticket_discount.dim_spabiz_store_key dim_spabiz_store_key,
       d_spabiz_ticket_discount.discount_processed_flag discount_processed_flag,
       d_spabiz_ticket_discount.edit_date_time edit_date_time,
       d_spabiz_ticket_discount.fact_spabiz_ticket_key fact_spabiz_ticket_key,
       d_spabiz_ticket_discount.ticket_discount_percent ticket_discount_percent
  from dbo.d_spabiz_ticket_discount;