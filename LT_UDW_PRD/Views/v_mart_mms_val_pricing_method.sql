﻿CREATE VIEW [sandbox].[v_mart_mms_val_pricing_method]
AS SELECT [val_pricing_method_id]
     , [description]
     , [sort_order]
     , [inserted_date_time]
     , [updated_date_time]
     , [bk_hash]
     , [r_mms_val_pricing_method_id]
     , [dv_load_date_time]
     , [dv_batch_id]
     , [dv_hash]
  FROM [dbo].[r_mms_val_pricing_method]
  WHERE [dv_load_end_date_time] = '9999-12-31 00:00:00.000'
    AND NOT [val_pricing_method_id] Is Null;