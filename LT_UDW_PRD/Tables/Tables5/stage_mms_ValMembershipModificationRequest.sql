﻿CREATE TABLE [dbo].[stage_mms_ValMembershipModificationRequest] (
    [stage_mms_ValMembershipModificationRequest_id] BIGINT       NOT NULL,
    [ValMembershipModificationRequestID]            INT          NULL,
    [Description]                                   VARCHAR (50) NULL,
    [SortOrder]                                     INT          NULL,
    [InsertedDateTime]                              DATETIME     NULL,
    [UpdatedDateTime]                               DATETIME     NULL,
    [dv_batch_id]                                   BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

