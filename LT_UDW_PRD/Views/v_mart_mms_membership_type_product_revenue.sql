﻿CREATE VIEW [sandbox].[v_mart_mms_membership_type_product_revenue]
AS SELECT [membership_type_id]           = d_mms_membership_type.[membership_type_id]
       , [product_id]                   = d_mms_membership_type.[product_id]
       , [membership_type_display_name] = d_mms_membership_type.[display_name]
    FROM [dbo].[d_mms_membership_type] d_mms_membership_type
    WHERE NOT d_mms_membership_type.[membership_type_id] IN (1298,6141)
      AND EXISTS
        ( SELECT d_mms_membership_type_attribute.*
            FROM [dbo].[d_mms_membership_type_attribute] d_mms_membership_type_attribute
                 INNER JOIN [dbo].[r_mms_val_membership_type_attribute] r_mms_val_membership_type_attribute
                   ON r_mms_val_membership_type_attribute.[val_membership_type_attribute_id] = d_mms_membership_type_attribute.[val_membership_type_attribute_id]
            WHERE d_mms_membership_type_attribute.[membership_type_id] = d_mms_membership_type.[membership_type_id]
              AND r_mms_val_membership_type_attribute.[val_membership_type_attribute_id] IN (53,54,55,56,60,61) );