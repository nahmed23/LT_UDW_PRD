﻿CREATE TABLE [dbo].[stage_ciscoautoattendant_IPCCContactCallDetail] (
    [stage_ciscoautoattendant_IPCCContactCallDetail_id] BIGINT        NOT NULL,
    [SessionID]                                         DECIMAL (18)  NULL,
    [SessionSeqNum]                                     SMALLINT      NULL,
    [NodeID]                                            SMALLINT      NULL,
    [ProfileID]                                         INT           NULL,
    [ContactType]                                       SMALLINT      NULL,
    [ContactDisposition]                                SMALLINT      NULL,
    [DispositionReason]                                 VARCHAR (100) NULL,
    [OriginatorType]                                    SMALLINT      NULL,
    [OriginatorID]                                      INT           NULL,
    [OriginatorDN]                                      NVARCHAR (30) NULL,
    [DestinationType]                                   SMALLINT      NULL,
    [DestinationID]                                     INT           NULL,
    [DestinationDN]                                     NVARCHAR (30) NULL,
    [StartDateTime]                                     DATETIME      NULL,
    [EndDateTime]                                       DATETIME      NULL,
    [GmtOffset]                                         SMALLINT      NULL,
    [CalledNumber]                                      NVARCHAR (30) NULL,
    [OrigCalledNumber]                                  NVARCHAR (30) NULL,
    [ApplicationTaskID]                                 DECIMAL (18)  NULL,
    [ApplicationID]                                     INT           NULL,
    [ApplicationName]                                   NVARCHAR (30) NULL,
    [ConnectTime]                                       SMALLINT      NULL,
    [CustomVariable1]                                   VARCHAR (40)  NULL,
    [CustomVariable2]                                   VARCHAR (40)  NULL,
    [CustomVariable3]                                   VARCHAR (40)  NULL,
    [CustomVariable4]                                   VARCHAR (40)  NULL,
    [CustomVariable5]                                   VARCHAR (40)  NULL,
    [CustomVariable6]                                   VARCHAR (40)  NULL,
    [CustomVariable7]                                   VARCHAR (40)  NULL,
    [CustomVariable8]                                   VARCHAR (40)  NULL,
    [CustomVariable9]                                   VARCHAR (40)  NULL,
    [CustomVariable10]                                  VARCHAR (40)  NULL,
    [AccountNumber]                                     VARCHAR (40)  NULL,
    [CallerEnteredDigits]                               VARCHAR (40)  NULL,
    [BadCallTag]                                        CHAR (1)      NULL,
    [Transfer]                                          BIT           NULL,
    [Redirect]                                          BIT           NULL,
    [Conference]                                        BIT           NULL,
    [Flowout]                                           BIT           NULL,
    [MetServiceLevel]                                   SMALLINT      NULL,
    [CampaignID]                                        INT           NULL,
    [OrigProtocolCallRef]                               VARCHAR (32)  NULL,
    [DestProtocolCallRef]                               VARCHAR (32)  NULL,
    [CallResult]                                        SMALLINT      NULL,
    [DialingListID]                                     INT           NULL,
    [dv_batch_id]                                       BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

