﻿CREATE TABLE [dbo].[stage_hash_hybris_pointofservice] (
    [stage_hash_hybris_pointofservice_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                             CHAR (32)       NOT NULL,
    [hjmpTS]                              BIGINT          NULL,
    [createdTS]                           DATETIME        NULL,
    [modifiedTS]                          DATETIME        NULL,
    [TypePkString]                        BIGINT          NULL,
    [OwnerPkString]                       BIGINT          NULL,
    [PK]                                  BIGINT          NULL,
    [p_name]                              NVARCHAR (255)  NULL,
    [p_address]                           BIGINT          NULL,
    [p_description]                       NVARCHAR (255)  NULL,
    [p_type]                              BIGINT          NULL,
    [p_mapicon]                           BIGINT          NULL,
    [p_latitude]                          DECIMAL (26, 6) NULL,
    [p_longitude]                         DECIMAL (26, 6) NULL,
    [p_geocodetimestamp]                  DATETIME        NULL,
    [p_openingschedule]                   BIGINT          NULL,
    [p_storeimage]                        BIGINT          NULL,
    [p_basestore]                         BIGINT          NULL,
    [p_displayname]                       NVARCHAR (255)  NULL,
    [p_nearbystoreradius]                 DECIMAL (26, 6) NULL,
    [p_ltfclubid]                         INT             NULL,
    [p_nextmonthduesflag]                 TINYINT         NULL,
    [p_nextmonthduesdayofmonth]           INT             NULL,
    [p_catalog]                           BIGINT          NULL,
    [p_activeflag]                        TINYINT         NULL,
    [aCLTS]                               BIGINT          NULL,
    [propTS]                              BIGINT          NULL,
    [dv_load_date_time]                   DATETIME        NOT NULL,
    [dv_inserted_date_time]               DATETIME        NOT NULL,
    [dv_insert_user]                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                DATETIME        NULL,
    [dv_update_user]                      VARCHAR (50)    NULL,
    [dv_batch_id]                         BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));
