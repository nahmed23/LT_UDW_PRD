﻿CREATE VIEW [sandbox].[v_mart_mms_val_employee_role]
AS SELECT [val_employee_role_id]
     , [ltu_position_id]
     , [description]
     , [sort_order]
     , [department_id]
     , [commissionable_flag]
     , [inserted_date_time]
     , [updated_date_time]
     , [hr_job_code]
     , [company_insider_type]
     , [bk_hash]
     , [r_mms_val_employee_role_id]
     , [dv_load_date_time]
     , [dv_batch_id]
     , [dv_hash]
  FROM [dbo].[r_mms_val_employee_role]
  WHERE [dv_load_date_time] = '9999-12-31 00:00:00.000'
    AND NOT [val_employee_role_id] Is Null;