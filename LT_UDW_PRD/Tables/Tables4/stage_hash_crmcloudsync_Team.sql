﻿CREATE TABLE [dbo].[stage_hash_crmcloudsync_Team] (
    [stage_hash_crmcloudsync_Team_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)       NOT NULL,
    [administratorid]                 VARCHAR (38)    NULL,
    [administratoridname]             NVARCHAR (200)  NULL,
    [administratoridyominame]         NVARCHAR (200)  NULL,
    [businessunitid]                  VARCHAR (38)    NULL,
    [businessunitidname]              NVARCHAR (160)  NULL,
    [createdby]                       VARCHAR (38)    NULL,
    [createdbyname]                   NVARCHAR (200)  NULL,
    [createdbyyominame]               NVARCHAR (200)  NULL,
    [createdon]                       DATETIME        NULL,
    [createdonbehalfby]               VARCHAR (38)    NULL,
    [createdonbehalfbyname]           NVARCHAR (200)  NULL,
    [createdonbehalfbyyominame]       NVARCHAR (200)  NULL,
    [description]                     NVARCHAR (4000) NULL,
    [emailaddress]                    NVARCHAR (100)  NULL,
    [exchangerate]                    DECIMAL (28)    NULL,
    [importsequencenumber]            INT             NULL,
    [isdefault]                       BIT             NULL,
    [isdefaultname]                   NVARCHAR (255)  NULL,
    [ltf_telephone1]                  NVARCHAR (15)   NULL,
    [modifiedby]                      VARCHAR (38)    NULL,
    [modifiedbyname]                  NVARCHAR (200)  NULL,
    [modifiedbyyominame]              NVARCHAR (200)  NULL,
    [modifiedon]                      DATETIME        NULL,
    [modifiedonbehalfby]              VARCHAR (38)    NULL,
    [modifiedonbehalfbyname]          NVARCHAR (200)  NULL,
    [modifiedonbehalfbyyominame]      NVARCHAR (200)  NULL,
    [name]                            NVARCHAR (160)  NULL,
    [organizationid]                  VARCHAR (38)    NULL,
    [organizationidname]              NVARCHAR (100)  NULL,
    [overriddencreatedon]             DATETIME        NULL,
    [processid]                       VARCHAR (38)    NULL,
    [queueid]                         VARCHAR (38)    NULL,
    [queueidname]                     NVARCHAR (400)  NULL,
    [regardingobjectid]               VARCHAR (38)    NULL,
    [regardingobjecttypecode]         NVARCHAR (64)   NULL,
    [stageid]                         VARCHAR (38)    NULL,
    [systemmanaged]                   BIT             NULL,
    [systemmanagedname]               NVARCHAR (255)  NULL,
    [teamid]                          VARCHAR (38)    NULL,
    [teamtemplateid]                  VARCHAR (38)    NULL,
    [teamtype]                        INT             NULL,
    [teamtypename]                    NVARCHAR (255)  NULL,
    [transactioncurrencyid]           VARCHAR (38)    NULL,
    [transactioncurrencyidname]       NVARCHAR (100)  NULL,
    [versionnumber]                   BIGINT          NULL,
    [yominame]                        NVARCHAR (160)  NULL,
    [InsertedDateTime]                DATETIME        NULL,
    [InsertUser]                      VARCHAR (100)   NULL,
    [UpdatedDateTime]                 DATETIME        NULL,
    [UpdateUser]                      VARCHAR (50)    NULL,
    [ltf_teamtype]                    INT             NULL,
    [ltf_teamtypename]                NVARCHAR (255)  NULL,
    [traversedpath]                   NVARCHAR (1250) NULL,
    [dv_load_date_time]               DATETIME        NOT NULL,
    [dv_updated_date_time]            DATETIME        NULL,
    [dv_update_user]                  VARCHAR (50)    NULL,
    [dv_batch_id]                     BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
