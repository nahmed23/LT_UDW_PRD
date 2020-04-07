CREATE VIEW [sandbox].[v_mart_mms_val_termination_reason]
AS SELECT [val_termination_reason_id]
     , [description]
     , [sort_order]
     , [inserted_date_time]
     , [updated_date_time]
     , [display_ui_flag]
     , [StageSrc.additional_reason_display_ui_flag] = 0
     , [bk_hash]
     , [r_mms_val_termination_reason_id]
     , [dv_load_date_time]
     , [dv_batch_id]
     , [dv_hash]
  FROM [dbo].[r_mms_val_termination_reason]
  WHERE [dv_load_end_date_time] = '9999-12-31 00:00:00.000'
    AND NOT [val_termination_reason_id] Is Null;