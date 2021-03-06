﻿CREATE TABLE [dbo].[MMSMembership] (
    [MMSMembershipKey]                    INT           NOT NULL,
    [MembershipID]                        INT           NOT NULL,
    [ClubID]                              INT           NULL,
    [PurchaserID]                         INT           NULL,
    [LegacyCode]                          VARCHAR (12)  NULL,
    [AdvisorEmployeeID]                   INT           NULL,
    [ActivationDate]                      DATETIME      NULL,
    [ExpirationDate]                      DATETIME      NULL,
    [TotalContractAmount]                 MONEY         NULL,
    [CompanyID]                           INT           NULL,
    [Comments]                            VARCHAR (255) NULL,
    [MandatoryCommentFlag]                BIT           NULL,
    [ValEFTOptionID]                      TINYINT       NULL,
    [ValEnrollmentTypeID]                 TINYINT       NULL,
    [ValTerminationReasonID]              TINYINT       NULL,
    [MembershipTypeID]                    INT           NULL,
    [ValMembershipStatusID]               TINYINT       NULL,
    [CancellationRequestDate]             DATETIME      NULL,
    [CreatedDateTime]                     DATETIME      NULL,
    [UTCCreatedDateTime]                  DATETIME      NULL,
    [CreatedDateTimeZone]                 VARCHAR (4)   NULL,
    [MMSInsertedDateTime]                 DATETIME      NULL,
    [ValMembershipSourceID]               TINYINT       NULL,
    [AssessJrMemberDuesFlag]              BIT           NULL,
    [MMSUpdatedDateTime]                  DATETIME      NULL,
    [InsertedDateTime]                    DATETIME      NULL,
    [InsertUser]                          VARCHAR (50)  NULL,
    [BatchID]                             INT           NOT NULL,
    [ETLSourceSystemKey]                  INT           NOT NULL,
    [PromotionID]                         INT           NULL,
    [JrMemberDuesProductID]               INT           NULL,
    [SalesforceProspectID]                VARCHAR (18)  NULL,
    [MoneyBackCancelPolicyDays]           INT           NULL,
    [LastUpdatedEmployeeID]               INT           NULL,
    [QualifiedSalesPromotionID]           INT           NULL,
    [JoinFeePaid]                         MONEY         NULL,
    [SalesforceAccountID]                 VARCHAR (18)  NULL,
    [SalesforceOpportunityID]             VARCHAR (18)  NULL,
    [ChildCenterUnrestrictedCheckoutFlag] BIT           NULL,
    [UpdatedDateTime]                     DATETIME      NULL,
    [UpdateUser]                          VARCHAR (50)  NULL,
    [OriginalClubID]                      INT           NULL,
    [CRMOpportunityID]                    VARCHAR (36)  NULL,
    [ValTerminationReasonClubTypeID]      INT           NULL,
    [CurrentPrice]                        MONEY         NULL,
    [PreviousPrice]                       MONEY         NULL,
    [PreviousMembershipTypeID]            INT           NULL,
    [PriorPlusPrice]                      MONEY         NULL,
    [PriorPlusMembershipTypeID]           INT           NULL
)
WITH (HEAP, DISTRIBUTION = HASH([MembershipID]));

