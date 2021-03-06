﻿CREATE TABLE [dbo].[stage_crmcloudsync_Invoice] (
    [stage_crmcloudsync_Invoice_id]    BIGINT          NOT NULL,
    [accountid]                        VARCHAR (36)    NULL,
    [accountidname]                    NVARCHAR (160)  NULL,
    [accountidyominame]                NVARCHAR (160)  NULL,
    [billto_city]                      NVARCHAR (80)   NULL,
    [billto_composite]                 VARCHAR (8000)  NULL,
    [billto_country]                   NVARCHAR (80)   NULL,
    [billto_fax]                       NVARCHAR (50)   NULL,
    [billto_line1]                     NVARCHAR (250)  NULL,
    [billto_line2]                     NVARCHAR (250)  NULL,
    [billto_line3]                     NVARCHAR (250)  NULL,
    [billto_name]                      NVARCHAR (200)  NULL,
    [billto_postalcode]                NVARCHAR (20)   NULL,
    [billto_stateorprovince]           NVARCHAR (50)   NULL,
    [billto_telephone]                 NVARCHAR (50)   NULL,
    [contactid]                        VARCHAR (36)    NULL,
    [contactidname]                    NVARCHAR (160)  NULL,
    [contactidyominame]                NVARCHAR (160)  NULL,
    [createdby]                        VARCHAR (36)    NULL,
    [createdbyname]                    NVARCHAR (200)  NULL,
    [createdbyyominame]                NVARCHAR (200)  NULL,
    [createdon]                        DATETIME        NULL,
    [createdonbehalfby]                VARCHAR (36)    NULL,
    [createdonbehalfbyname]            NVARCHAR (200)  NULL,
    [createdonbehalfbyyominame]        NVARCHAR (200)  NULL,
    [customerid]                       VARCHAR (36)    NULL,
    [customeridname]                   NVARCHAR (160)  NULL,
    [customeridtype]                   NVARCHAR (64)   NULL,
    [customeridyominame]               NVARCHAR (450)  NULL,
    [datedelivered]                    DATETIME        NULL,
    [description]                      VARCHAR (8000)  NULL,
    [discountamount]                   DECIMAL (26, 3) NULL,
    [discountamount_base]              DECIMAL (26, 3) NULL,
    [discountpercentage]               DECIMAL (28)    NULL,
    [duedate]                          DATETIME        NULL,
    [entityimage_timestamp]            BIGINT          NULL,
    [entityimage_url]                  NVARCHAR (200)  NULL,
    [entityimageid]                    VARCHAR (36)    NULL,
    [exchangerate]                     DECIMAL (28)    NULL,
    [freightamount]                    DECIMAL (26, 3) NULL,
    [freightamount_base]               DECIMAL (26, 3) NULL,
    [importsequencenumber]             INT             NULL,
    [invoiceid]                        VARCHAR (36)    NULL,
    [invoicenumber]                    NVARCHAR (100)  NULL,
    [ispricelocked]                    BIT             NULL,
    [ispricelockedname]                NVARCHAR (255)  NULL,
    [lastbackofficesubmit]             DATETIME        NULL,
    [ltf_clubid]                       VARCHAR (36)    NULL,
    [ltf_clubidname]                   NVARCHAR (100)  NULL,
    [ltf_membershipid]                 NVARCHAR (25)   NULL,
    [ltf_membershipsource]             INT             NULL,
    [ltf_membershipsourcename]         NVARCHAR (255)  NULL,
    [ltf_udwid]                        NVARCHAR (255)  NULL,
    [modifiedby]                       VARCHAR (36)    NULL,
    [modifiedbyname]                   NVARCHAR (200)  NULL,
    [modifiedbyyominame]               NVARCHAR (200)  NULL,
    [modifiedon]                       DATETIME        NULL,
    [modifiedonbehalfby]               VARCHAR (36)    NULL,
    [modifiedonbehalfbyname]           NVARCHAR (200)  NULL,
    [modifiedonbehalfbyyominame]       NVARCHAR (200)  NULL,
    [name]                             NVARCHAR (300)  NULL,
    [opportunityid]                    VARCHAR (36)    NULL,
    [opportunityidname]                NVARCHAR (300)  NULL,
    [overriddencreatedon]              DATETIME        NULL,
    [ownerid]                          VARCHAR (36)    NULL,
    [owneridname]                      NVARCHAR (200)  NULL,
    [owneridtype]                      NVARCHAR (64)   NULL,
    [owneridyominame]                  NVARCHAR (200)  NULL,
    [owningbusinessunit]               VARCHAR (36)    NULL,
    [owningteam]                       VARCHAR (36)    NULL,
    [owninguser]                       VARCHAR (36)    NULL,
    [paymenttermscode]                 INT             NULL,
    [paymenttermscodename]             NVARCHAR (255)  NULL,
    [pricelevelid]                     VARCHAR (36)    NULL,
    [pricelevelidname]                 NVARCHAR (100)  NULL,
    [pricingerrorcode]                 INT             NULL,
    [pricingerrorcodename]             NVARCHAR (255)  NULL,
    [prioritycode]                     INT             NULL,
    [prioritycodename]                 NVARCHAR (255)  NULL,
    [processid]                        VARCHAR (36)    NULL,
    [salesorderid]                     VARCHAR (36)    NULL,
    [salesorderidname]                 NVARCHAR (300)  NULL,
    [shippingmethodcode]               INT             NULL,
    [shippingmethodcodename]           NVARCHAR (255)  NULL,
    [shipto_city]                      NVARCHAR (80)   NULL,
    [shipto_composite]                 VARCHAR (8000)  NULL,
    [shipto_country]                   NVARCHAR (80)   NULL,
    [shipto_fax]                       NVARCHAR (50)   NULL,
    [shipto_freighttermscode]          INT             NULL,
    [shipto_freighttermscodename]      NVARCHAR (255)  NULL,
    [shipto_line1]                     NVARCHAR (250)  NULL,
    [shipto_line2]                     NVARCHAR (250)  NULL,
    [shipto_line3]                     NVARCHAR (250)  NULL,
    [shipto_name]                      NVARCHAR (200)  NULL,
    [shipto_postalcode]                NVARCHAR (20)   NULL,
    [shipto_stateorprovince]           NVARCHAR (50)   NULL,
    [shipto_telephone]                 NVARCHAR (50)   NULL,
    [stageid]                          VARCHAR (36)    NULL,
    [statecode]                        INT             NULL,
    [statecodename]                    NVARCHAR (255)  NULL,
    [statuscode]                       INT             NULL,
    [statuscodename]                   NVARCHAR (255)  NULL,
    [timezoneruleversionnumber]        INT             NULL,
    [totalamount]                      DECIMAL (26, 3) NULL,
    [totalamount_base]                 DECIMAL (26, 3) NULL,
    [totalamountlessfreight]           DECIMAL (26, 3) NULL,
    [totalamountlessfreight_base]      DECIMAL (26, 3) NULL,
    [totaldiscountamount]              DECIMAL (26, 3) NULL,
    [totaldiscountamount_base]         DECIMAL (26, 3) NULL,
    [totallineitemamount]              DECIMAL (26, 3) NULL,
    [totallineitemamount_base]         DECIMAL (26, 3) NULL,
    [totallineitemdiscountamount]      DECIMAL (26, 3) NULL,
    [totallineitemdiscountamount_base] DECIMAL (26, 3) NULL,
    [totaltax]                         DECIMAL (26, 3) NULL,
    [totaltax_base]                    DECIMAL (26, 3) NULL,
    [transactioncurrencyid]            VARCHAR (36)    NULL,
    [transactioncurrencyidname]        NVARCHAR (100)  NULL,
    [utcconversiontimezonecode]        INT             NULL,
    [versionnumber]                    BIGINT          NULL,
    [willcall]                         BIT             NULL,
    [willcallname]                     NVARCHAR (255)  NULL,
    [InsertedDateTime]                 DATETIME        NULL,
    [InsertUser]                       VARCHAR (100)   NULL,
    [UpdatedDateTime]                  DATETIME        NULL,
    [UpdateUser]                       VARCHAR (50)    NULL,
    [dv_batch_id]                      BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

