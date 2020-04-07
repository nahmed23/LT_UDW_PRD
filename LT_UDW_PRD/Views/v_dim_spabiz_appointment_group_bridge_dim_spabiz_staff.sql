﻿CREATE VIEW [marketing].[v_dim_spabiz_appointment_group_bridge_dim_spabiz_staff] AS select d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.fact_spabiz_ap_group_data_key AS fact_spabiz_ap_group_data_key,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.ap_group_data_id ap_group_data_id,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.store_number store_number,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff_id d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff_id,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.dim_spabiz_appointment_group_key dim_spabiz_appointment_group_key,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.dim_spabiz_staff_key dim_spabiz_staff_key,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.dim_spabiz_store_key dim_spabiz_store_key,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.edit_date_time edit_date_time,
       d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff.l_spabiz_ap_group_data_ap_group_id l_spabiz_ap_group_data_ap_group_id
  from dbo.d_dim_spabiz_appointment_group_bridge_dim_spabiz_staff;