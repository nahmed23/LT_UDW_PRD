﻿CREATE TABLE [dbo].[stage_exacttarget_ListMembership] (
    [stage_exacttarget_ListMembership_id] BIGINT         NOT NULL,
    [ClientID]                            BIGINT         NULL,
    [SubscriberKey]                       VARCHAR (4000) NULL,
    [EmailAddress]                        VARCHAR (4000) NULL,
    [SubscriberID]                        BIGINT         NULL,
    [ListID]                              BIGINT         NULL,
    [ListName]                            VARCHAR (4000) NULL,
    [DateJoined]                          DATETIME       NULL,
    [JoinType]                            VARCHAR (4000) NULL,
    [DateUnsubscribed]                    DATETIME       NULL,
    [UnsubscribeReason]                   VARCHAR (4000) NULL,
    [jan_one]                             DATETIME       NULL,
    [dv_inserted_date_time]               DATETIME       NOT NULL,
    [dv_insert_user]                      VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]                DATETIME       NULL,
    [dv_update_user]                      VARCHAR (50)   NULL,
    [dv_batch_id]                         BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

