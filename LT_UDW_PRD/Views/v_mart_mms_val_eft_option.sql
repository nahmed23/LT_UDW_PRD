﻿CREATE VIEW [sandbox].[v_mart_mms_val_eft_option]
AS SELECT [val_eft_option_id]
     , [description]
     , [sort_order]
     , [inserted_date_time]
     , [updated_date_time]
     , [bk_hash]
     , [r_mms_val_eft_option_id]
     , [dv_load_date_time]
     , [dv_batch_id]
     , [dv_hash]
  FROM [dbo].[r_mms_val_eft_option]
  WHERE [dv_load_date_time] = '9999-12-31 00:00:00.000'
    AND NOT [val_eft_option_id] Is Null;