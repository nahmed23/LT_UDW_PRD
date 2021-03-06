﻿CREATE PROC [sandbox].[proc_mart_d_mms_department] @min_batch_id [bigint],@max_batch_id [bigint] AS

BEGIN

SELECT PIT.[department_id]
     , SAT.[name]
     , SAT.[description]
     , SAT.[sort_order]
     , SAT.[inserted_date_time]
     , SAT.[updated_date_time]
     , PIT.[bk_hash]
     , PIT.[p_mms_department_id]
     , PIT.[dv_load_date_time]
     , PIT.[dv_batch_id]
     , SAT.[dv_hash]
  FROM [dbo].[p_mms_department] PIT
       INNER JOIN [dbo].[s_mms_department] SAT
         ON SAT.[bk_hash] = PIT.[bk_hash]
            AND SAT.[s_mms_department_id] = PIT.[s_mms_department_id]
       INNER JOIN
         ( SELECT PIT.[p_mms_department_id]
                , RowRank = RANK() OVER (PARTITION BY PIT.[bk_hash] ORDER BY PIT.[dv_load_end_date_time] DESC)
                , RowNumber = ROW_NUMBER() OVER (PARTITION BY PIT.[bk_hash] ORDER BY PIT.[dv_load_end_date_time] DESC)
             FROM [dbo].[p_mms_department] PIT
             WHERE ( PIT.[dv_batch_id] >= CASE WHEN @min_batch_id = -998 THEN -1 ELSE @min_batch_id END
                 AND PIT.[dv_batch_id] <= CASE WHEN @max_batch_id = -998 THEN 9223372036854775807 ELSE @max_batch_id END )
         ) PITU
         ON PITU.[p_mms_department_id] = PIT.[p_mms_department_id]
            AND PITU.RowRank = 1 AND PITU.RowNumber = 1
  WHERE NOT PIT.[department_id] Is Null
ORDER BY PIT.[dv_batch_id] ASC, PIT.[dv_load_date_time] ASC, ISNULL(SAT.[updated_date_time], SAT.[inserted_date_time]) ASC;

END
