CREATE VIEW [sandbox].[v_mart_mms_membership_type_product_tmvip]
AS SELECT [membership_type_id]
       , [product_id]
       , [membership_type_display_name]
       , [product_description]
       , [family_status_display_name]
       , [family_status_description]
       , [card_level_description]
       , [membership_type_group_description]
       , [access_by_price_paid_flag]
       , [assess_jr_member_dues_flag]
       , [revenue_category]
       , [gl_account_number]
       , [gl_department_code]
       , [gl_product_code]
       , [department_id]
       , [val_membership_type_family_status_id]
       , [val_pricing_method_id]
       , [val_pricing_rule_id]
       , [val_product_status_id]
       , [val_card_level_id]
       , [val_check_in_group_id]
       , [val_membership_type_group_id]
       , [min_unit_type]
       , [max_unit_type]
    FROM [sandbox].[v_mart_mms_membership_type_product] vMTP
    WHERE EXISTS
        ( SELECT d_mms_membership_type_attribute.*
            FROM [dbo].[d_mms_membership_type_attribute] d_mms_membership_type_attribute
            WHERE d_mms_membership_type_attribute.[membership_type_id] = vMTP.[membership_type_id]
              AND d_mms_membership_type_attribute.[val_membership_type_attribute_id] = 9 )
      AND vMTP.[product_description] LIKE '%TMVIP%';