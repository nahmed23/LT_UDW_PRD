﻿CREATE TABLE [dbo].[stage_mms_Club_history] (
    [MMSClubKey]                      INT           NOT NULL,
    [ClubID]                          INT           NOT NULL,
    [ValRegionID]                     TINYINT       NULL,
    [StatementMessageID]              INT           NULL,
    [ValClubTypeID]                   TINYINT       NULL,
    [DomainNamePrefix]                VARCHAR (10)  NULL,
    [ClubName]                        VARCHAR (50)  NULL,
    [ReceiptFooter]                   VARCHAR (100) NULL,
    [DisplayUIFlag]                   BIT           NULL,
    [CheckInGroupLevel]               INT           NULL,
    [ValStatementTypeID]              TINYINT       NULL,
    [ChargeToAccountFlag]             BIT           NULL,
    [ValPreSaleID]                    TINYINT       NULL,
    [ClubActivationDate]              DATETIME      NULL,
    [ValTimeZoneID]                   TINYINT       NULL,
    [MMSInsertedDateTime]             DATETIME      NULL,
    [ValCWRegionID]                   TINYINT       NULL,
    [EFTGroupID]                      TINYINT       NULL,
    [GLTaxID]                         SMALLINT      NULL,
    [GLClubID]                        INT           NULL,
    [CRMDivisionCode]                 VARCHAR (15)  NULL,
    [AssessJrMemberDuesFlag]          BIT           NULL,
    [SellJrMemberDuesFlag]            BIT           NULL,
    [MMSUpdatedDateTime]              DATETIME      NULL,
    [ClubCode]                        VARCHAR (3)   NULL,
    [SiteID]                          INT           NULL,
    [NewMemberCardFlag]               BIT           NULL,
    [InsertedDateTime]                DATETIME      NOT NULL,
    [InsertUser]                      VARCHAR (50)  NOT NULL,
    [BatchID]                         INT           NOT NULL,
    [ETLSourceSystemKey]              INT           NOT NULL,
    [ValMemberActivityRegionID]       TINYINT       NULL,
    [IGStoreID]                       INT           NULL,
    [ChildCenterWeeklyLimit]          TINYINT       NULL,
    [ValSalesAreaID]                  TINYINT       NULL,
    [ValPTRCLAreaID]                  TINYINT       NULL,
    [KronosForecastMapPath]           VARCHAR (15)  NULL,
    [GLCashEntryCompanyName]          VARCHAR (15)  NULL,
    [GLCashEntryAccount]              VARCHAR (4)   NULL,
    [GLReceivablesEntryAccount]       VARCHAR (4)   NULL,
    [GLCashEntryCashSubAccount]       VARCHAR (11)  NULL,
    [GLCashEntryCreditCardSubAccount] VARCHAR (11)  NULL,
    [GLReceivablesEntrySubAccount]    VARCHAR (11)  NULL,
    [GLReceivablesEntryCompanyName]   VARCHAR (15)  NULL,
    [FormalClubName]                  VARCHAR (50)  NULL,
    [ClubDeactivationDate]            DATETIME      NULL,
    [ValCurrencyCodeID]               TINYINT       NULL,
    [AllowMultipleCurrencyFlag]       BIT           NULL,
    [WorkdayRegion]                   VARCHAR (4)   NULL,
    [UpdatedDateTime]                 DATETIME      NULL,
    [UpdateUser]                      VARCHAR (50)  NULL,
    [AllowJuniorCheckInFlag]          BIT           NULL,
    [MarketingMapRegion]              VARCHAR (50)  NULL,
    [MarketingMapXmlStateName]        VARCHAR (50)  NULL,
    [MarketingClubLevel]              VARCHAR (50)  NULL,
    [LTFResourceID]                   INT           NULL,
    [HealthClubIdentifier]            VARCHAR (50)  NULL,
    [ChargeNextMonthDate]             INT           NULL,
    [MaxJuniorAge]                    INT           NULL,
    [MaxSecondaryAge]                 INT           NULL,
    [MinFrontDeskCheckinAge]          INT           NULL,
    [MaxChildCenterCheckinAge]        INT           NULL,
    [StateCancellationDays]           INT           NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN);

