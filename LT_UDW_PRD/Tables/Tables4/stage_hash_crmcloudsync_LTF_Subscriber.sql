﻿CREATE TABLE [dbo].[stage_hash_crmcloudsync_LTF_Subscriber] (
    [stage_hash_crmcloudsync_LTF_Subscriber_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                   CHAR (32)      NOT NULL,
    [createdby]                                 VARCHAR (36)   NULL,
    [createdbyname]                             NVARCHAR (200) NULL,
    [createdbyyominame]                         NVARCHAR (200) NULL,
    [createdon]                                 DATETIME       NULL,
    [createdonbehalfby]                         VARCHAR (36)   NULL,
    [createdonbehalfbyname]                     NVARCHAR (200) NULL,
    [createdonbehalfbyyominame]                 NVARCHAR (200) NULL,
    [importsequencenumber]                      INT            NULL,
    [ltf_contactid]                             VARCHAR (36)   NULL,
    [ltf_contactidname]                         NVARCHAR (160) NULL,
    [ltf_contactidyominame]                     NVARCHAR (160) NULL,
    [ltf_joindate]                              DATETIME       NULL,
    [ltf_name]                                  NVARCHAR (100) NULL,
    [ltf_role]                                  INT            NULL,
    [ltf_rolename]                              NVARCHAR (255) NULL,
    [ltf_subscriberid]                          VARCHAR (36)   NULL,
    [ltf_subscriptionid]                        VARCHAR (36)   NULL,
    [ltf_subscriptionidname]                    NVARCHAR (100) NULL,
    [ltf_udwid]                                 NVARCHAR (255) NULL,
    [modifiedby]                                VARCHAR (36)   NULL,
    [modifiedbyname]                            NVARCHAR (200) NULL,
    [modifiedbyyominame]                        NVARCHAR (200) NULL,
    [modifiedon]                                DATETIME       NULL,
    [modifiedonbehalfby]                        VARCHAR (36)   NULL,
    [modifiedonbehalfbyname]                    NVARCHAR (200) NULL,
    [modifiedonbehalfbyyominame]                NVARCHAR (200) NULL,
    [overriddencreatedon]                       DATETIME       NULL,
    [ownerid]                                   VARCHAR (36)   NULL,
    [owneridname]                               NVARCHAR (200) NULL,
    [owneridtype]                               NVARCHAR (64)  NULL,
    [owneridyominame]                           NVARCHAR (200) NULL,
    [owningbusinessunit]                        VARCHAR (36)   NULL,
    [owningteam]                                VARCHAR (36)   NULL,
    [owninguser]                                VARCHAR (36)   NULL,
    [statecode]                                 INT            NULL,
    [statecodename]                             NVARCHAR (255) NULL,
    [statuscode]                                INT            NULL,
    [statuscodename]                            NVARCHAR (255) NULL,
    [timezoneruleversionnumber]                 INT            NULL,
    [utcconversiontimezonecode]                 INT            NULL,
    [versionnumber]                             BIGINT         NULL,
    [InsertedDateTime]                          DATETIME       NULL,
    [InsertUser]                                VARCHAR (100)  NULL,
    [UpdatedDateTime]                           DATETIME       NULL,
    [UpdateUser]                                VARCHAR (50)   NULL,
    [ltf_originatingopportunityid]              VARCHAR (36)   NULL,
    [ltf_originatingopportunityidname]          NVARCHAR (300) NULL,
    [ltf_connectionpreference]                  INT            NULL,
    [ltf_connectionprefsource]                  INT            NULL,
    [dv_load_date_time]                         DATETIME       NOT NULL,
    [dv_updated_date_time]                      DATETIME       NULL,
    [dv_update_user]                            VARCHAR (50)   NULL,
    [dv_batch_id]                               BIGINT         NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));

