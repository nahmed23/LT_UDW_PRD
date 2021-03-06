﻿CREATE TABLE [dbo].[stage_mms_MembershipRecurrentProduct] (
    [stage_mms_MembershipRecurrentProduct_id] BIGINT          NOT NULL,
    [MembershipRecurrentProductID]            INT             NULL,
    [MembershipID]                            INT             NULL,
    [ProductID]                               INT             NULL,
    [ActivationDate]                          DATETIME        NULL,
    [CancellationRequestDate]                 DATETIME        NULL,
    [TerminationDate]                         DATETIME        NULL,
    [ValRecurrentProductTerminationReasonID]  SMALLINT        NULL,
    [InsertedDateTime]                        DATETIME        NULL,
    [UpdatedDateTime]                         DATETIME        NULL,
    [ClubID]                                  INT             NULL,
    [Price]                                   DECIMAL (26, 6) NULL,
    [CreatedDateTime]                         DATETIME        NULL,
    [UTCCreatedDateTime]                      DATETIME        NULL,
    [CreatedDateTimeZone]                     VARCHAR (4)     NULL,
    [LastUpdatedEmployeeID]                   INT             NULL,
    [LastUpdatedDateTime]                     DATETIME        NULL,
    [UTCLastUpdatedDateTime]                  DATETIME        NULL,
    [LastUpdatedDateTimeZone]                 VARCHAR (4)     NULL,
    [ProductAssessedDateTime]                 DATETIME        NULL,
    [Comments]                                VARCHAR (255)   NULL,
    [NumberOfSessions]                        INT             NULL,
    [PricePerSession]                         NUMERIC (7, 2)  NULL,
    [CommissionEmployeeID]                    INT             NULL,
    [MemberID]                                INT             NULL,
    [ValRecurrentProductSourceID]             TINYINT         NULL,
    [ValAssessmentDayID]                      SMALLINT        NULL,
    [ProductHoldBeginDate]                    DATETIME        NULL,
    [ProductHoldEndDate]                      DATETIME        NULL,
    [SoldNotServicedFlag]                     BIT             NULL,
    [RetailPrice]                             DECIMAL (26, 6) NULL,
    [RetailPricePerSession]                   DECIMAL (26, 6) NULL,
    [PromotionCode]                           VARCHAR (50)    NULL,
    [PricingDiscountID]                       INT             NULL,
    [ValDiscountReasonID]                     SMALLINT        NULL,
    [DisplayOnlyFlag]                         BIT             NULL,
    [dv_batch_id]                             BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

