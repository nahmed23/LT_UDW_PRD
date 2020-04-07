﻿CREATE VIEW [marketing].[v_fact_spabiz_ticket_tax] AS select d_spabiz_ticket_tax.fact_spabiz_ticket_tax_key fact_spabiz_ticket_tax_key,
       d_spabiz_ticket_tax.ticket_tax_id ticket_tax_id,
       d_spabiz_ticket_tax.store_number store_number,
       d_spabiz_ticket_tax.amount amount,
       d_spabiz_ticket_tax.created_date_time created_date_time,
       d_spabiz_ticket_tax.dim_spabiz_shift_key dim_spabiz_shift_key,
       d_spabiz_ticket_tax.dim_spabiz_store_key dim_spabiz_store_key,
       d_spabiz_ticket_tax.dim_spabiz_tax_rate_key dim_spabiz_tax_rate_key,
       d_spabiz_ticket_tax.edit_date_time edit_date_time,
       d_spabiz_ticket_tax.fact_spabiz_ticket_key fact_spabiz_ticket_key,
       d_spabiz_ticket_tax.status_dim_description_key status_dim_description_key,
       d_spabiz_ticket_tax.status_id status_id
  from dbo.d_spabiz_ticket_tax;