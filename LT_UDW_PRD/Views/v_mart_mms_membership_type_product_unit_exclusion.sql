﻿CREATE VIEW [sandbox].[v_mart_mms_membership_type_product_unit_exclusion]
AS SELECT [membership_type_id]           = d_mms_membership_type.[membership_type_id]
       , [product_id]                   = d_mms_membership_type.[product_id]
       , [membership_type_display_name] = d_mms_membership_type.[display_name]
    FROM [dbo].[d_mms_membership_type] d_mms_membership_type
    WHERE ( d_mms_membership_type.[membership_type_id] IN (4480,4680,9729,1298,6141,134)  --Mbr Adv Partner, Single Corporate Flex, Life Time Weight Loss Single, Gold Single_Rochester College, Gold Single_Rochester College Club Only, House Account
         OR EXISTS
            ( SELECT d_mms_membership_type_attribute.*
                FROM [dbo].[d_mms_membership_type_attribute] d_mms_membership_type_attribute
                     INNER JOIN [dbo].[r_mms_val_membership_type_attribute] r_mms_val_membership_type_attribute
                       ON r_mms_val_membership_type_attribute.[val_membership_type_attribute_id] = d_mms_membership_type_attribute.[val_membership_type_attribute_id]
                WHERE d_mms_membership_type_attribute.[membership_type_id] = d_mms_membership_type.[membership_type_id]
                  AND r_mms_val_membership_type_attribute.[val_membership_type_attribute_id] IN (1,4,10,12,16,23,24,29,51,57,58,59,33) ) );