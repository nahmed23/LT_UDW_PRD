﻿CREATE TABLE [dbo].[dim_location] (
    [dim_location_id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [business_key]                     VARCHAR (32)   NULL,
    [business_source_name]             VARCHAR (100)  NULL,
    [created_by]                       VARCHAR (100)  NULL,
    [created_dim_date_key]             CHAR (8)       NULL,
    [deleted_by]                       VARCHAR (100)  NULL,
    [deleted_dim_date_key]             CHAR (8)       NULL,
    [description]                      VARCHAR (4000) NULL,
    [dim_location_key]                 VARCHAR (32)   NULL,
    [display_name]                     VARCHAR (100)  NULL,
    [hierarchy_level]                  INT            NULL,
    [location_type_display_name]       VARCHAR (4000) NULL,
    [location_type_group_display_name] VARCHAR (4000) NULL,
    [location_type_group_name]         VARCHAR (100)  NULL,
    [location_type_name]               VARCHAR (100)  NULL,
    [managed_by_udw_flag]              VARCHAR (1)    NULL,
    [parent_dim_location_key]          VARCHAR (32)   NULL,
    [top_level_dim_location_key]       VARCHAR (32)   NULL,
    [updated_by]                       VARCHAR (100)  NULL,
    [updated_dim_date_key]             CHAR (8)       NULL,
    [dv_load_date_time]                DATETIME       NULL,
    [dv_load_end_date_time]            DATETIME       NULL,
    [dv_batch_id]                      BIGINT         NOT NULL,
    [dv_inserted_date_time]            DATETIME       NOT NULL,
    [dv_insert_user]                   VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]             DATETIME       NULL,
    [dv_update_user]                   VARCHAR (50)   NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([dim_location_key]));

