﻿CREATE TABLE [dbo].[stage_athlinks_api_vw_RaceEntry] (
    [stage_athlinks_api_vw_RaceEntry_id] BIGINT         NOT NULL,
    [DisplayName]                        NVARCHAR (50)  NULL,
    [IsMember]                           BIT            NULL,
    [PhotoPath]                          VARCHAR (1)    NULL,
    [Age]                                INT            NULL,
    [BibNum]                             NVARCHAR (24)  NULL,
    [ClassID]                            INT            NULL,
    [ClassName]                          NVARCHAR (255) NULL,
    [EntryStateProvID]                   NVARCHAR (8)   NULL,
    [EntryID]                            INT            NULL,
    [EventCourseID]                      INT            NULL,
    [Gender]                             CHAR (1)       NULL,
    [RacerID]                            INT            NULL,
    [RankO]                              INT            NULL,
    [RankG]                              INT            NULL,
    [RankA]                              INT            NULL,
    [Ticks]                              BIGINT         NULL,
    [TicksString]                        VARCHAR (16)   NULL,
    [RaceID]                             INT            NULL,
    [CourseID]                           INT            NULL,
    [ResultCount]                        INT            NULL,
    [RaceDate]                           DATETIME       NULL,
    [MasterID]                           INT            NULL,
    [MasterName]                         NVARCHAR (128) NULL,
    [ResultsDate]                        DATETIME       NULL,
    [TotalA]                             INT            NULL,
    [TotalG]                             INT            NULL,
    [TotalO]                             INT            NULL,
    [City]                               NVARCHAR (128) NULL,
    [CreateDate]                         DATETIME       NULL,
    [dv_batch_id]                        BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

