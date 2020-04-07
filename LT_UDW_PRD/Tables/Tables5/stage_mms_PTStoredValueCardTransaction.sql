﻿CREATE TABLE [dbo].[stage_mms_PTStoredValueCardTransaction] (
    [stage_mms_PTStoredValueCardTransaction_id] BIGINT          NOT NULL,
    [PTStoredValueCardTransactionID]            INT             NULL,
    [PaymentID]                                 INT             NULL,
    [TranSequenceNumber]                        INT             NULL,
    [TransactionCode]                           INT             NULL,
    [EntryDataSource]                           INT             NULL,
    [PINCapabilityCode]                         INT             NULL,
    [MaskedAccountNumber]                       VARCHAR (19)    NULL,
    [ExpirationDate]                            DATETIME        NULL,
    [TranAmount]                                DECIMAL (26, 6) NULL,
    [CounterTipAmount]                          DECIMAL (26, 6) NULL,
    [PriorApprovedAuthCode]                     CHAR (6)        NULL,
    [CashOutYN]                                 CHAR (1)        NULL,
    [PartialRedemptionYN]                       CHAR (1)        NULL,
    [IssuanceCardSequenceNumber]                INT             NULL,
    [IssuanceNCards]                            INT             NULL,
    [EmployeeID]                                INT             NULL,
    [TipLineParentSVCardTransactionID]          INT             NULL,
    [ResponseActionCode]                        CHAR (1)        NULL,
    [ResponseAuthorizationCode]                 CHAR (6)        NULL,
    [ResponseRetrievalReferenceNumber]          INT             NULL,
    [ResponseMessage]                           CHAR (32)       NULL,
    [ResponseTraceNumber]                       CHAR (8)        NULL,
    [ResponseAuthorizingNetworkID]              INT             NULL,
    [ResponseAuthorizationSource]               CHAR (1)        NULL,
    [ResponseSVBalanceAmount]                   DECIMAL (26, 6) NULL,
    [ResponseSVPreviousBalanceAmount]           DECIMAL (26, 6) NULL,
    [ResponseApprovedAmount]                    DECIMAL (26, 6) NULL,
    [ResponseCashOutAmount]                     DECIMAL (26, 6) NULL,
    [SVBatchNumber]                             INT             NULL,
    [TransactionDateTime]                       DATETIME        NULL,
    [UTCTransactionDateTime]                    DATETIME        NULL,
    [TransactionDateTimezone]                   VARCHAR (4)     NULL,
    [InsertedDateTime]                          DATETIME        NULL,
    [PTCreditCardBatchID]                       INT             NULL,
    [RetrievalReferenceNumber]                  INT             NULL,
    [VoidedFlag]                                BIT             NULL,
    [UpdatedDateTime]                           DATETIME        NULL,
    [dv_batch_id]                               BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

