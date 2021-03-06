﻿CREATE PROC [reporting].[proc_PromptCheckInGroup] AS
BEGIN 

SET XACT_ABORT ON
SET NOCOUNT ON

IF 1=0 BEGIN
   SET FMTONLY OFF
END

------ This SP returns 1) check_in_group_description and 2) ref_mms_val_check_in_group_id from v_dim_mms_membership_type.
------ Execution Sample:  Exec [reporting].[proc_PromptCheckInGroup]
 
SELECT distinct [ref_mms_val_check_in_group_id] ValCheckInGroupID
, [check_in_group_description] CheckInGroupDescription
FROM [marketing].[v_dim_mms_membership_type]
WHERE [ref_mms_val_check_in_group_id] IS NOT NULL

	   
END

