﻿CREATE VIEW [marketing].[v_dim_cafe_product_history]
AS select isnull(d_udwcloudsync_product_master_history.effective_date_time,'jan 1, 2000') effective_date_time,
       isnull(d_udwcloudsync_product_master_history.expiration_date_time,'Dec 31, 9999') expiration_date_time,
       d_udwcloudsync_product_master_history.allocation_rule allocation_rule,
       d_udwcloudsync_product_master_history.connectivity_lead_generator_flag connectivity_lead_generator_flag,
       d_udwcloudsync_product_master_history.connectivity_primary_lead_generator_flag connectivity_primary_lead_generator_flag,
       d_udwcloudsync_product_master_history.corporate_transfer_flag corporate_transfer_flag,
       d_udwcloudsync_product_master_history.corporate_transfer_multiplier corporate_transfer_multiplier,
       d_udwcloudsync_product_master_history.departmental_dssr_flag departmental_dssr_flag,
       dim_cafe_product.dim_cafe_product_key dim_cafe_product_key,
       isnull(d_udwcloudsync_product_master_history.dim_reporting_hierarchy_key,dim_cafe_product.default_dim_reporting_hierarchy_key) dim_reporting_hierarchy_key,
       dim_cafe_product.kronos_labor_category kronos_labor_category,
       dim_cafe_product.menu_item_active_flag menu_item_active_flag,
       dim_cafe_product.menu_item_id menu_item_id,
       dim_cafe_product.menu_item_name menu_item_name,
       d_udwcloudsync_product_master_history.mtd_average_delivered_session_price_flag mtd_average_delivered_session_price_flag,
       d_udwcloudsync_product_master_history.mtd_average_sale_price_flag mtd_average_sale_price_flag,
       d_udwcloudsync_product_master_history.new_business_old_business_flag new_business_old_business_flag,
       d_udwcloudsync_product_master_history.payroll_description payroll_description,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_group_description payroll_lt_bucks_group_description,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_group_sort_order payroll_lt_bucks_group_sort_order,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_product_group_flag payroll_lt_bucks_product_group_flag,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_sales_amount_flag payroll_lt_bucks_sales_amount_flag,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_service_amount_flag payroll_lt_bucks_service_amount_flag,
       d_udwcloudsync_product_master_history.payroll_lt_bucks_service_quantity_flag payroll_lt_bucks_service_quantity_flag,
       d_udwcloudsync_product_master_history.payroll_region_type payroll_region_type,
       d_udwcloudsync_product_master_history.payroll_standard_group_description payroll_standard_group_description,
       d_udwcloudsync_product_master_history.payroll_standard_group_sort_order payroll_standard_group_sort_order,
       d_udwcloudsync_product_master_history.payroll_standard_product_group_flag payroll_standard_product_group_flag,
       d_udwcloudsync_product_master_history.payroll_standard_sales_amount_flag payroll_standard_sales_amount_flag,
       d_udwcloudsync_product_master_history.payroll_standard_service_amount_flag payroll_standard_service_amount_flag,
       d_udwcloudsync_product_master_history.payroll_standard_service_quantity_flag payroll_standard_service_quantity_flag,
       d_udwcloudsync_product_master_history.payroll_track_sales_flag payroll_track_sales_flag,
       d_udwcloudsync_product_master_history.payroll_track_service_flag payroll_track_service_flag,
       dim_cafe_product.product_class_id product_class_id,
       dim_cafe_product.product_class_name product_class_name,
       isnull(d_udwcloudsync_product_master_history.reporting_department,'LifeCafe') reporting_department,
       isnull(d_udwcloudsync_product_master_history.reporting_division,'LifeCafe') reporting_division,
       isnull(d_udwcloudsync_product_master_history.reporting_product_group,'') reporting_product_group,
       d_udwcloudsync_product_master_history.reporting_product_group_gl_account reporting_product_group_gl_account,
       d_udwcloudsync_product_master_history.reporting_product_group_sort_order reporting_product_group_sort_order,
       d_udwcloudsync_product_master_history.reporting_region_type reporting_region_type,
       isnull(d_udwcloudsync_product_master_history.reporting_sub_division,'LifeCafe') reporting_sub_division,
       d_udwcloudsync_product_master_history.sales_category_description sales_category_description,
       dim_cafe_product.sku_number sku_number
from dim_cafe_product  left join d_udwcloudsync_product_master_history  on dim_cafe_product.dim_cafe_product_key = d_udwcloudsync_product_master_history.dim_cafe_product_key and d_udwcloudsync_product_master_history.source_system = 'cafe';