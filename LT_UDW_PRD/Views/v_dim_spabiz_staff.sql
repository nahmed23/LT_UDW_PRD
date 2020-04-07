﻿CREATE VIEW [marketing].[v_dim_spabiz_staff] AS select d_spabiz_staff.dim_spabiz_staff_key dim_spabiz_staff_key,
       d_spabiz_staff.staff_id staff_id,
       d_spabiz_staff.store_number store_number,
       d_spabiz_staff.address_city address_city,
       d_spabiz_staff.address_line_1 address_line_1,
       d_spabiz_staff.address_line_2 address_line_2,
       d_spabiz_staff.adress_state adress_state,
       d_spabiz_staff.anniversary anniversary,
       d_spabiz_staff.appointment_cycle_count appointment_cycle_count,
       d_spabiz_staff.birthday birthday,
       d_spabiz_staff.book_name book_name,
       d_spabiz_staff.can_use_system_flag can_use_system_flag,
       d_spabiz_staff.clock_in_request_flag clock_in_request_flag,
       d_spabiz_staff.deleted_date_time deleted_date_time,
       d_spabiz_staff.deleted_flag deleted_flag,
       d_spabiz_staff.dim_spabiz_assistant_comission_key dim_spabiz_assistant_comission_key,
       d_spabiz_staff.dim_spabiz_category_key dim_spabiz_category_key,
       d_spabiz_staff.dim_spabiz_primary_store_key dim_spabiz_primary_store_key,
       d_spabiz_staff.dim_spabiz_store_key dim_spabiz_store_key,
       d_spabiz_staff.do_not_print_productivity_flag do_not_print_productivity_flag,
       d_spabiz_staff.edit_date_time edit_date_time,
       d_spabiz_staff.employee_end_date_time employee_end_date_time,
       d_spabiz_staff.employee_start_date_time employee_start_date_time,
       d_spabiz_staff.first_initial_last_name first_initial_last_name,
       d_spabiz_staff.first_last_name first_last_name,
       d_spabiz_staff.first_name first_name,
       d_spabiz_staff.gender_dim_description_key gender_dim_description_key,
       d_spabiz_staff.gender_id gender_id,
       d_spabiz_staff.home_phone_number home_phone_number,
       d_spabiz_staff.is_admin_flag is_admin_flag,
       d_spabiz_staff.last_name last_name,
       d_spabiz_staff.middle_initial middle_initial,
       d_spabiz_staff.mobile_phone_number mobile_phone_number,
       d_spabiz_staff.name name,
       d_spabiz_staff.neill_id neill_id,
       d_spabiz_staff.pager_number pager_number,
       d_spabiz_staff.pager_type pager_type,
       d_spabiz_staff.pop_up_information pop_up_information,
       d_spabiz_staff.postal_code postal_code,
       d_spabiz_staff.print_1_flag print_1_flag,
       d_spabiz_staff.print_2_flag print_2_flag,
       d_spabiz_staff.print_3_flag print_3_flag,
       d_spabiz_staff.print_4_flag print_4_flag,
       d_spabiz_staff.print_5_flag print_5_flag,
       d_spabiz_staff.print_6_flag print_6_flag,
       d_spabiz_staff.print_7_flag print_7_flag,
       d_spabiz_staff.print_traveler_flag print_traveler_flag,
       d_spabiz_staff.quick_id quick_id,
       d_spabiz_staff.resource_flag resource_flag,
       d_spabiz_staff.staff_flag staff_flag,
       d_spabiz_staff.start_appointment_cycle_date_time start_appointment_cycle_date_time,
       d_spabiz_staff.wage wage,
       d_spabiz_staff.wage_per_minute wage_per_minute,
       d_spabiz_staff.wage_type_dim_description_key wage_type_dim_description_key,
       d_spabiz_staff.wage_type_id wage_type_id,
       d_spabiz_staff.web_book_flag web_book_flag,
       d_spabiz_staff.work_phone_number work_phone_number
  from dbo.d_spabiz_staff;