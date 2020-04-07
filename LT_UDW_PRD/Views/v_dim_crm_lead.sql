﻿CREATE VIEW [marketing].[v_dim_crm_lead]
AS select d_crmcloudsync_lead.dim_crm_lead_key dim_crm_lead_key,
       d_crmcloudsync_lead.lead_id lead_id,
       d_crmcloudsync_lead.address_1_address_type_code address_1_address_type_code,
       d_crmcloudsync_lead.address_1_address_type_code_name address_1_address_type_code_name,
       d_crmcloudsync_lead.address_1_city address_1_city,
       d_crmcloudsync_lead.address_1_composite address_1_composite,
       d_crmcloudsync_lead.address_1_country address_1_country,
       d_crmcloudsync_lead.address_1_latitude address_1_latitude,
       d_crmcloudsync_lead.address_1_line_1 address_1_line_1,
       d_crmcloudsync_lead.address_1_longitude address_1_longitude,
       d_crmcloudsync_lead.address_1_postal_code address_1_postal_code,
       d_crmcloudsync_lead.address_1_state_or_province address_1_state_or_province,
       d_crmcloudsync_lead.address_1_telephone_1 address_1_telephone_1,
       d_crmcloudsync_lead.address_1_telephone_2 address_1_telephone_2,
       d_crmcloudsync_lead.campaign_id_name campaign_id_name,
       d_crmcloudsync_lead.created_by_dim_crm_system_user_key created_by_dim_crm_system_user_key,
       d_crmcloudsync_lead.created_by_name created_by_name,
       d_crmcloudsync_lead.created_dim_date_key created_dim_date_key,
       d_crmcloudsync_lead.created_dim_time_key created_dim_time_key,
       d_crmcloudsync_lead.created_on created_on,
       d_crmcloudsync_lead.created_on_behalf_by_dim_crm_system_user_key created_on_behalf_by_dim_crm_system_user_key,
       d_crmcloudsync_lead.created_on_behalf_by_name created_on_behalf_by_name,
       d_crmcloudsync_lead.customer_id_name customer_id_name,
       d_crmcloudsync_lead.customer_id_type customer_id_type,
       d_crmcloudsync_lead.customer_id_yomi_name customer_id_yomi_name,
       d_crmcloudsync_lead.dim_club_key dim_club_key,
       d_crmcloudsync_lead.dim_crm_address_1_address_key dim_crm_address_1_address_key,
       d_crmcloudsync_lead.dim_crm_contact_key dim_crm_contact_key,
       d_crmcloudsync_lead.dim_crm_customer_key dim_crm_customer_key,
       d_crmcloudsync_lead.dim_crm_ltf_campaign_key dim_crm_ltf_campaign_key,
       d_crmcloudsync_lead.dim_crm_ltf_club_key dim_crm_ltf_club_key,
       d_crmcloudsync_lead.dim_crm_ltf_employer_key  dim_crm_ltf_employer_key ,
       d_crmcloudsync_lead.dim_crm_ltf_primary_lead_key dim_crm_ltf_primary_lead_key,
       d_crmcloudsync_lead.dim_crm_ltf_visitor_key dim_crm_ltf_visitor_key,
       d_crmcloudsync_lead.dim_crm_owner_key dim_crm_owner_key,
       d_crmcloudsync_lead.dim_crm_parent_account_key dim_crm_parent_account_key,
       d_crmcloudsync_lead.dim_crm_parent_contact_key dim_crm_parent_contact_key,
       d_crmcloudsync_lead.dim_mms_member_key dim_mms_member_key,
       d_crmcloudsync_lead.do_not_send_marketing_material_name do_not_send_marketing_material_name,
       d_crmcloudsync_lead.email_address_1 email_address_1,
       d_crmcloudsync_lead.email_address_2 email_address_2,
       d_crmcloudsync_lead.first_name first_name,
       d_crmcloudsync_lead.full_name full_name,
       d_crmcloudsync_lead.insert_user insert_user,
       d_crmcloudsync_lead.inserted_date_time inserted_date_time,
       d_crmcloudsync_lead.inserted_dim_date_key inserted_dim_date_key,
       d_crmcloudsync_lead.inserted_dim_time_key inserted_dim_time_key,
       d_crmcloudsync_lead.last_name last_name,
       d_crmcloudsync_lead.ltf_actual_appointment_scheduled ltf_actual_appointment_scheduled,
       d_crmcloudsync_lead.ltf_actual_appointment_scheduled_dim_date_key ltf_actual_appointment_scheduled_dim_date_key,
       d_crmcloudsync_lead.ltf_actual_appointment_scheduled_dim_time_key ltf_actual_appointment_scheduled_dim_time_key,
       d_crmcloudsync_lead.ltf_actual_first_response ltf_actual_first_response,
       d_crmcloudsync_lead.ltf_actual_first_response_dim_date_key ltf_actual_first_response_dim_date_key,
       d_crmcloudsync_lead.ltf_actual_first_response_dim_time_key ltf_actual_first_response_dim_time_key,
       d_crmcloudsync_lead.ltf_actual_initial_contact ltf_actual_initial_contact,
       d_crmcloudsync_lead.ltf_actual_initial_contact_dim_date_key ltf_actual_initial_contact_dim_date_key,
       d_crmcloudsync_lead.ltf_actual_initial_contact_dim_time_key ltf_actual_initial_contact_dim_time_key,
       d_crmcloudsync_lead.ltf_appointment_showed ltf_appointment_showed,
       d_crmcloudsync_lead.ltf_appointment_showed_flag ltf_appointment_showed_flag,
       d_crmcloudsync_lead.ltf_appointment_showed_name ltf_appointment_showed_name,
       d_crmcloudsync_lead.ltf_assigned_to_club_date ltf_assigned_to_club_date,
       d_crmcloudsync_lead.ltf_assigned_to_club_date_dim_date_key ltf_assigned_to_club_date_dim_date_key,
       d_crmcloudsync_lead.ltf_assigned_to_club_date_dim_time_key ltf_assigned_to_club_date_dim_time_key,
       d_crmcloudsync_lead.ltf_best_time_to_contact ltf_best_time_to_contact,
       d_crmcloudsync_lead.ltf_best_time_to_contact_name ltf_best_time_to_contact_name,
       d_crmcloudsync_lead.ltf_birth_date ltf_birth_date,
       d_crmcloudsync_lead.ltf_birth_dim_date_key ltf_birth_dim_date_key,
       d_crmcloudsync_lead.ltf_birth_dim_time_key ltf_birth_dim_time_key,
       d_crmcloudsync_lead.ltf_birth_year ltf_birth_year,
       d_crmcloudsync_lead.ltf_business_unit ltf_business_unit,
       d_crmcloudsync_lead.ltf_business_unit_name ltf_business_unit_name,
       d_crmcloudsync_lead.ltf_channel ltf_channel,
       d_crmcloudsync_lead.ltf_channel_name ltf_channel_name,
       d_crmcloudsync_lead.ltf_club_id_name ltf_club_id_name,
       d_crmcloudsync_lead.ltf_communication_consent ltf_communication_consent,
       d_crmcloudsync_lead.ltf_communication_consent_name ltf_communication_consent_name,
       d_crmcloudsync_lead.ltf_consent_date_time ltf_consent_date_time,
       d_crmcloudsync_lead.ltf_consent_dim_date_key ltf_consent_dim_date_key,
       d_crmcloudsync_lead.ltf_consent_dim_time_key ltf_consent_dim_time_key,
       d_crmcloudsync_lead.ltf_consent_ip_address ltf_consent_ip_address,
       d_crmcloudsync_lead.ltf_consent_text ltf_consent_text,
       d_crmcloudsync_lead.ltf_current_member ltf_current_member,
       d_crmcloudsync_lead.ltf_current_member_flag ltf_current_member_flag,
       d_crmcloudsync_lead.ltf_current_member_name ltf_current_member_name,
       d_crmcloudsync_lead.ltf_device ltf_device,
       d_crmcloudsync_lead.ltf_dnc_dne_update_triggered_by ltf_dnc_dne_update_triggered_by,
       d_crmcloudsync_lead.ltf_dnc_dne_update_triggered_by_name ltf_dnc_dne_update_triggered_by_name,
       d_crmcloudsync_lead.ltf_dnc_override ltf_dnc_override,
       d_crmcloudsync_lead.ltf_dnc_override_flag ltf_dnc_override_flag,
       d_crmcloudsync_lead.ltf_dnc_override_name ltf_dnc_override_name,
       d_crmcloudsync_lead.ltf_dnc_temporary_release_expiration ltf_dnc_temporary_release_expiration,
       d_crmcloudsync_lead.ltf_dnc_temporary_release_expiration_dim_date_key ltf_dnc_temporary_release_expiration_dim_date_key,
       d_crmcloudsync_lead.ltf_dnc_temporary_release_expiration_dim_time_key ltf_dnc_temporary_release_expiration_dim_time_key,
       d_crmcloudsync_lead.ltf_dnd_override_expiration ltf_dnd_override_expiration,
       d_crmcloudsync_lead.ltf_dnd_override_expiration_dim_date_key ltf_dnd_override_expiration_dim_date_key,
       d_crmcloudsync_lead.ltf_dnd_override_expiration_dim_time_key ltf_dnd_override_expiration_dim_time_key,
       d_crmcloudsync_lead.ltf_do_not_email_address_1 ltf_do_not_email_address_1,
       d_crmcloudsync_lead.ltf_do_not_email_address_1_flag ltf_do_not_email_address_1_flag,
       d_crmcloudsync_lead.ltf_do_not_email_address_1_name ltf_do_not_email_address_1_name,
       d_crmcloudsync_lead.ltf_do_not_email_address_2 ltf_do_not_email_address_2,
       d_crmcloudsync_lead.ltf_do_not_email_address_2_flag ltf_do_not_email_address_2_flag,
       d_crmcloudsync_lead.ltf_do_not_email_address_2_name ltf_do_not_email_address_2_name,
       d_crmcloudsync_lead.ltf_do_not_phone_mobile_phone ltf_do_not_phone_mobile_phone,
       d_crmcloudsync_lead.ltf_do_not_phone_mobile_phone_flag ltf_do_not_phone_mobile_phone_flag,
       d_crmcloudsync_lead.ltf_do_not_phone_mobile_phone_name ltf_do_not_phone_mobile_phone_name,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_1 ltf_do_not_phone_telephone_1,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_1_flag ltf_do_not_phone_telephone_1_flag,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_1_name ltf_do_not_phone_telephone_1_name,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_2 ltf_do_not_phone_telephone_2,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_2_flag ltf_do_not_phone_telephone_2_flag,
       d_crmcloudsync_lead.ltf_do_not_phone_telephone_2_name ltf_do_not_phone_telephone_2_name,
       d_crmcloudsync_lead.ltf_duplicate_lead_count ltf_duplicate_lead_count,
       d_crmcloudsync_lead.ltf_duplicate_override ltf_duplicate_override,
       d_crmcloudsync_lead.ltf_duplicate_override_flag ltf_duplicate_override_flag,
       d_crmcloudsync_lead.ltf_duplicate_override_name ltf_duplicate_override_name,
       d_crmcloudsync_lead.ltf_email_address_1_umsk ltf_email_address_1_umsk,
       d_crmcloudsync_lead.ltf_email_address_2_umsk ltf_email_address_2_umsk,
       d_crmcloudsync_lead.ltf_email_template ltf_email_template,
       d_crmcloudsync_lead.ltf_employee_number ltf_employee_number,
       d_crmcloudsync_lead.ltf_employer ltf_employer,
       d_crmcloudsync_lead.ltf_employer_id_name ltf_employer_id_name,
       d_crmcloudsync_lead.ltf_employer_id_yomi_name ltf_employer_id_yomi_name,
       d_crmcloudsync_lead.ltf_exact_target_email_sent ltf_exact_target_email_sent,
       d_crmcloudsync_lead.ltf_exact_target_email_sent_flag ltf_exact_target_email_sent_flag,
       d_crmcloudsync_lead.ltf_exact_target_email_sent_name ltf_exact_target_email_sent_name,
       d_crmcloudsync_lead.ltf_exclude_from_follow_up ltf_exclude_from_follow_up,
       d_crmcloudsync_lead.ltf_exclude_from_follow_up_flag ltf_exclude_from_follow_up_flag,
       d_crmcloudsync_lead.ltf_exclude_from_follow_up_name ltf_exclude_from_follow_up_name,
       d_crmcloudsync_lead.ltf_first_response_by ltf_first_response_by,
       d_crmcloudsync_lead.ltf_first_response_dim_date_key ltf_first_response_dim_date_key,
       d_crmcloudsync_lead.ltf_first_response_dim_time_key ltf_first_response_dim_time_key,
       d_crmcloudsync_lead.ltf_first_response_sent ltf_first_response_sent,
       d_crmcloudsync_lead.ltf_first_response_sent_name ltf_first_response_sent_name,
       d_crmcloudsync_lead.ltf_first_response_status ltf_first_response_status,
       d_crmcloudsync_lead.ltf_first_response_status_name ltf_first_response_status_name,
       d_crmcloudsync_lead.ltf_gcl_id ltf_gcl_id,
       d_crmcloudsync_lead.ltf_gender_code ltf_gender_code,
       d_crmcloudsync_lead.ltf_gender_code_name ltf_gender_code_name,
       d_crmcloudsync_lead.ltf_group ltf_group,
       d_crmcloudsync_lead.ltf_group_name ltf_group_name,
       d_crmcloudsync_lead.ltf_guest_to_lead_dim_crm_activity_key ltf_guest_to_lead_dim_crm_activity_key,
       d_crmcloudsync_lead.ltf_guest_to_lead_id_name ltf_guest_to_lead_id_name,
       d_crmcloudsync_lead.ltf_ims_join_link ltf_ims_join_link,
       d_crmcloudsync_lead.ltf_initial_contact_by ltf_initial_contact_by,
       d_crmcloudsync_lead.ltf_initial_contact_dim_date_key ltf_initial_contact_dim_date_key,
       d_crmcloudsync_lead.ltf_initial_contact_dim_time_key ltf_initial_contact_dim_time_key,
       d_crmcloudsync_lead.ltf_initial_contact_made ltf_initial_contact_made,
       d_crmcloudsync_lead.ltf_initial_contact_made_name ltf_initial_contact_made_name,
       d_crmcloudsync_lead.ltf_initial_contact_status ltf_initial_contact_status,
       d_crmcloudsync_lead.ltf_initial_contact_status_name ltf_initial_contact_status_name,
       d_crmcloudsync_lead.ltf_initial_email_subject ltf_initial_email_subject,
       d_crmcloudsync_lead.ltf_inquiry_type ltf_inquiry_type,
       d_crmcloudsync_lead.ltf_inserted_by_system ltf_inserted_by_system,
       d_crmcloudsync_lead.ltf_inserted_by_system_flag ltf_inserted_by_system_flag,
       d_crmcloudsync_lead.ltf_inserted_by_system_name ltf_inserted_by_system_name,
       d_crmcloudsync_lead.ltf_is_ims_join ltf_is_ims_join,
       d_crmcloudsync_lead.ltf_is_ims_join_flag ltf_is_ims_join_flag,
       d_crmcloudsync_lead.ltf_is_life_time_close_to ltf_is_life_time_close_to,
       d_crmcloudsync_lead.ltf_is_life_time_close_to_name ltf_is_life_time_close_to_name,
       d_crmcloudsync_lead.ltf_keywords ltf_keywords,
       d_crmcloudsync_lead.ltf_landing_page ltf_landing_page,
       d_crmcloudsync_lead.ltf_last_activity ltf_last_activity,
       d_crmcloudsync_lead.ltf_last_activity_lead ltf_last_activity_lead,
       d_crmcloudsync_lead.ltf_last_activity_lead_dim_date_key ltf_last_activity_lead_dim_date_key,
       d_crmcloudsync_lead.ltf_last_activity_lead_dim_time_key ltf_last_activity_lead_dim_time_key,
       d_crmcloudsync_lead.ltf_last_submission_date ltf_last_submission_date,
       d_crmcloudsync_lead.ltf_last_submission_dim_date_key ltf_last_submission_dim_date_key,
       d_crmcloudsync_lead.ltf_last_submission_dim_time_key ltf_last_submission_dim_time_key,
       d_crmcloudsync_lead.ltf_lead_initial_load ltf_lead_initial_load,
       d_crmcloudsync_lead.ltf_lead_initial_load_flag ltf_lead_initial_load_flag,
       d_crmcloudsync_lead.ltf_lead_initial_load_name ltf_lead_initial_load_name,
       d_crmcloudsync_lead.ltf_lead_source ltf_lead_source,
       d_crmcloudsync_lead.ltf_lead_source_name ltf_lead_source_name,
       d_crmcloudsync_lead.ltf_lead_type ltf_lead_type,
       d_crmcloudsync_lead.ltf_lead_type_name ltf_lead_type_name,
       d_crmcloudsync_lead.ltf_legacy ltf_legacy,
       d_crmcloudsync_lead.ltf_line_of_business ltf_line_of_business,
       d_crmcloudsync_lead.ltf_line_of_business_name ltf_line_of_business_name,
       d_crmcloudsync_lead.ltf_managed_until ltf_managed_until,
       d_crmcloudsync_lead.ltf_managed_until_dim_date_key ltf_managed_until_dim_date_key,
       d_crmcloudsync_lead.ltf_managed_until_dim_time_key ltf_managed_until_dim_time_key,
       d_crmcloudsync_lead.ltf_membership_info_requested ltf_membership_info_requested,
       d_crmcloudsync_lead.ltf_membership_level ltf_membership_level,
       d_crmcloudsync_lead.ltf_membership_level_name ltf_membership_level_name,
       d_crmcloudsync_lead.ltf_mobile_phone_umsk ltf_mobile_phone_umsk,
       d_crmcloudsync_lead.ltf_most_recent_casl ltf_most_recent_casl,
       d_crmcloudsync_lead.ltf_most_recent_casl_dim_date_key ltf_most_recent_casl_dim_date_key,
       d_crmcloudsync_lead.ltf_most_recent_casl_dim_time_key ltf_most_recent_casl_dim_time_key,
       d_crmcloudsync_lead.ltf_nugget ltf_nugget,
       d_crmcloudsync_lead.ltf_operating_system ltf_operating_system,
       d_crmcloudsync_lead.ltf_originating_chat ltf_originating_chat,
       d_crmcloudsync_lead.ltf_originating_chat_name ltf_originating_chat_name,
       d_crmcloudsync_lead.ltf_originating_guest_visit_dim_crm_ltf_guest_visit_key ltf_originating_guest_visit_dim_crm_ltf_guest_visit_key,
       d_crmcloudsync_lead.ltf_originating_guest_visit_name ltf_originating_guest_visit_name,
       d_crmcloudsync_lead.ltf_park ltf_park,
       d_crmcloudsync_lead.ltf_park_comments ltf_park_comments,
       d_crmcloudsync_lead.ltf_park_flag ltf_park_flag,
       d_crmcloudsync_lead.ltf_park_name ltf_park_name,
       d_crmcloudsync_lead.ltf_park_reason ltf_park_reason,
       d_crmcloudsync_lead.ltf_park_reason_name ltf_park_reason_name,
       d_crmcloudsync_lead.ltf_park_until ltf_park_until,
       d_crmcloudsync_lead.ltf_park_until_dim_date_key ltf_park_until_dim_date_key,
       d_crmcloudsync_lead.ltf_park_until_dim_time_key ltf_park_until_dim_time_key,
       d_crmcloudsync_lead.ltf_primary_goal ltf_primary_goal,
       d_crmcloudsync_lead.ltf_primary_lead_name ltf_primary_lead_name,
       d_crmcloudsync_lead.ltf_promocode ltf_promocode,
       d_crmcloudsync_lead.ltf_reactivation_reason ltf_reactivation_reason,
       d_crmcloudsync_lead.ltf_reactivation_reason_name ltf_reactivation_reason_name,
       d_crmcloudsync_lead.ltf_referring_contact_dim_crm_contact_key ltf_referring_contact_dim_crm_contact_key,
       d_crmcloudsync_lead.ltf_referring_contact_id_name ltf_referring_contact_id_name,
       d_crmcloudsync_lead.ltf_referring_domain ltf_referring_domain,
       d_crmcloudsync_lead.ltf_referring_member_dim_crm_member_key ltf_referring_member_dim_crm_member_key,
       d_crmcloudsync_lead.ltf_referring_page ltf_referring_page,
       d_crmcloudsync_lead.ltf_registration_code ltf_registration_code,
       d_crmcloudsync_lead.ltf_request_type ltf_request_type,
       d_crmcloudsync_lead.ltf_schedule_appt_by ltf_schedule_appt_by,
       d_crmcloudsync_lead.ltf_schedule_appt_dim_date_key ltf_schedule_appt_dim_date_key,
       d_crmcloudsync_lead.ltf_schedule_appt_dim_time_key ltf_schedule_appt_dim_time_key,
       d_crmcloudsync_lead.ltf_schedule_appt_sent ltf_schedule_appt_sent,
       d_crmcloudsync_lead.ltf_schedule_appt_sent_name ltf_schedule_appt_sent_name,
       d_crmcloudsync_lead.ltf_schedule_appt_status ltf_schedule_appt_status,
       d_crmcloudsync_lead.ltf_schedule_appt_status_name ltf_schedule_appt_status_name,
       d_crmcloudsync_lead.ltf_suffix ltf_suffix,
       d_crmcloudsync_lead.ltf_transferred_to_club_on ltf_transferred_to_club_on,
       d_crmcloudsync_lead.ltf_transferred_to_club_on_dim_date_key ltf_transferred_to_club_on_dim_date_key,
       d_crmcloudsync_lead.ltf_transferred_to_club_on_dim_time_key ltf_transferred_to_club_on_dim_time_key,
       d_crmcloudsync_lead.ltf_udw_id ltf_udw_id,
       d_crmcloudsync_lead.ltf_under_eighteen ltf_under_eighteen,
       d_crmcloudsync_lead.ltf_under_eighteen_flag ltf_under_eighteen_flag,
       d_crmcloudsync_lead.ltf_under_eighteen_name ltf_under_eighteen_name,
       d_crmcloudsync_lead.ltf_update_contact ltf_update_contact,
       d_crmcloudsync_lead.ltf_update_contact_flag ltf_update_contact_flag,
       d_crmcloudsync_lead.ltf_update_contact_name ltf_update_contact_name,
       d_crmcloudsync_lead.ltf_utm_audience ltf_utm_audience,
       d_crmcloudsync_lead.ltf_utm_campaign ltf_utm_campaign,
       d_crmcloudsync_lead.ltf_utm_content ltf_utm_content,
       d_crmcloudsync_lead.ltf_utm_image ltf_utm_image,
       d_crmcloudsync_lead.ltf_utm_medium ltf_utm_medium,
       d_crmcloudsync_lead.ltf_utm_source ltf_utm_source,
       d_crmcloudsync_lead.ltf_utm_term ltf_utm_term,
       d_crmcloudsync_lead.ltf_visit_count ltf_visit_count,
       d_crmcloudsync_lead.ltf_volatile_contact ltf_volatile_contact,
       d_crmcloudsync_lead.ltf_volatile_contact_flag ltf_volatile_contact_flag,
       d_crmcloudsync_lead.ltf_volatile_contact_name ltf_volatile_contact_name,
       d_crmcloudsync_lead.ltf_web_team_email ltf_web_team_email,
       d_crmcloudsync_lead.ltf_web_team_id ltf_web_team_id,
       d_crmcloudsync_lead.ltf_web_team_id_name ltf_web_team_id_name,
       d_crmcloudsync_lead.ltf_web_team_phone ltf_web_team_phone,
       d_crmcloudsync_lead.ltf_web_transfer_method ltf_web_transfer_method,
       d_crmcloudsync_lead.ltf_web_transfer_method_name ltf_web_transfer_method_name,
       d_crmcloudsync_lead.merged merged,
       d_crmcloudsync_lead.merged_flag merged_flag,
       d_crmcloudsync_lead.middle_name middle_name,
       d_crmcloudsync_lead.mobile_phone mobile_phone,
       d_crmcloudsync_lead.modified_by_dim_crm_system_user_key modified_by_dim_crm_system_user_key,
       d_crmcloudsync_lead.modified_dim_date_key modified_dim_date_key,
       d_crmcloudsync_lead.modified_dim_time_key modified_dim_time_key,
       d_crmcloudsync_lead.modified_on modified_on,
       d_crmcloudsync_lead.modified_on_behalf_by_dim_crm_system_user_key modified_on_behalf_by_dim_crm_system_user_key,
       d_crmcloudsync_lead.overridden_created_dim_date_key overridden_created_dim_date_key,
       d_crmcloudsync_lead.overridden_created_dim_time_key overridden_created_dim_time_key,
       d_crmcloudsync_lead.overridden_created_on overridden_created_on,
       d_crmcloudsync_lead.owner_id owner_id,
       d_crmcloudsync_lead.owner_id_name owner_id_name,
       d_crmcloudsync_lead.owner_id_type owner_id_type,
       d_crmcloudsync_lead.owning_business_unit owning_business_unit,
       d_crmcloudsync_lead.owning_team owning_team,
       d_crmcloudsync_lead.owning_user_dim_crm_system_user_key owning_user_dim_crm_system_user_key,
       d_crmcloudsync_lead.parent_account_id_name parent_account_id_name,
       d_crmcloudsync_lead.parent_contact_id parent_contact_id,
       d_crmcloudsync_lead.preferred_contact_method_code preferred_contact_method_code,
       d_crmcloudsync_lead.preferred_contact_method_code_name preferred_contact_method_code_name,
       d_crmcloudsync_lead.qualifying_opportunity_dim_crm_opportunity_key qualifying_opportunity_dim_crm_opportunity_key,
       d_crmcloudsync_lead.qualifying_opportunity_id_name qualifying_opportunity_id_name,
       d_crmcloudsync_lead.salutation salutation,
       d_crmcloudsync_lead.state_code state_code,
       d_crmcloudsync_lead.state_code_name state_code_name,
       d_crmcloudsync_lead.status_code status_code,
       d_crmcloudsync_lead.status_code_name status_code_name,
       d_crmcloudsync_lead.telephone_1 telephone_1,
       d_crmcloudsync_lead.telephone_2 telephone_2,
       d_crmcloudsync_lead.update_user update_user,
       d_crmcloudsync_lead.updated_date_time updated_date_time,
       d_crmcloudsync_lead.updated_dim_date_key updated_dim_date_key,
       d_crmcloudsync_lead.updated_dim_time_key updated_dim_time_key,
       d_crmcloudsync_lead.utc_conversion_time_zone_code utc_conversion_time_zone_code
  from dbo.d_crmcloudsync_lead;