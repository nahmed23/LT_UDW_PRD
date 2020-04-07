﻿CREATE TABLE [dbo].[stage_hash_nmo_hubtask] (
    [stage_hash_nmo_hubtask_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                   CHAR (32)       NOT NULL,
    [id]                        INT             NULL,
    [title]                     NVARCHAR (255)  NULL,
    [description]               NVARCHAR (4000) NULL,
    [hubtaskdepartmentid]       INT             NULL,
    [hubtaskstatusid]           INT             NULL,
    [hubtasktypeid]             INT             NULL,
    [clubid]                    INT             NULL,
    [partyid]                   INT             NULL,
    [priority]                  INT             NULL,
    [creatorpartyid]            INT             NULL,
    [creatorname]               NVARCHAR (60)   NULL,
    [assigneepartyid]           INT             NULL,
    [assigneename]              NVARCHAR (60)   NULL,
    [duedate]                   DATETIME        NULL,
    [resolutiondate]            DATETIME        NULL,
    [createddate]               DATETIME        NULL,
    [updateddate]               DATETIME        NULL,
    [dv_load_date_time]         DATETIME        NOT NULL,
    [dv_batch_id]               BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

