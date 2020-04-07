﻿CREATE VIEW [sandbox].[v_mart_mms_val_sales_reporting_category]
AS SELECT [val_sales_reporting_category_id]
     , [description]
     , [sort_order]
     , [inserted_date_time]
     , [updated_date_time]
     , [bk_hash]
     , [r_mms_val_sales_reporting_category_id]
     , [dv_load_date_time]
     , [dv_batch_id]
     , [dv_hash]
  FROM [dbo].[r_mms_val_sales_reporting_category]
  WHERE [dv_load_end_date_time] = '9999-12-31 00:00:00.000'
    AND NOT [val_sales_reporting_category_id] Is Null;