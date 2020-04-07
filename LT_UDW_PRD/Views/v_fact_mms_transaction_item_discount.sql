﻿CREATE VIEW [marketing].[v_fact_mms_transaction_item_discount] AS select fact_mms_sales_transaction_item_discount.dim_mms_pricing_discount_key dim_mms_pricing_discount_key,
       fact_mms_sales_transaction_item_discount.discount_amount discount_amount,
       fact_mms_sales_transaction_item_discount.fact_mms_sales_transaction_edw_inserted_dim_date_key fact_mms_sales_transaction_edw_inserted_dim_date_key,
       fact_mms_sales_transaction_item_discount.fact_mms_sales_transaction_item_discount_key fact_mms_sales_transaction_item_discount_key,
       fact_mms_sales_transaction_item_discount.original_currency_code original_currency_code,
       fact_mms_sales_transaction_item_discount.tran_item_discount_id tran_item_discount_id,
       fact_mms_sales_transaction_item_discount.tran_item_id tran_item_id,
       fact_mms_sales_transaction_item_discount.usd_dim_plan_exchange_rate_key usd_dim_plan_exchange_rate_key,
       fact_mms_sales_transaction_item_discount.usd_monthly_average_dim_exchange_rate_key usd_monthly_average_dim_exchange_rate_key
  from dbo.fact_mms_sales_transaction_item_discount;