﻿CREATE TABLE [dbo].[d_loc_location] (
    [d_loc_location_id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                      CHAR (32)      NOT NULL,
    [location_id]                  BIGINT         NULL,
    [created_by]                   VARCHAR (100)  NULL,
    [created_date_key]             CHAR (8)       NULL,
    [created_date_time]            DATETIME       NULL,
    [deleted_by]                   VARCHAR (100)  NULL,
    [deleted_date_key]             CHAR (8)       NULL,
    [deleted_date_time]            DATETIME       NULL,
    [description]                  VARCHAR (4000) NULL,
    [display_name]                 VARCHAR (4000) NULL,
    [external_id]                  INT            NULL,
    [hierarchy_level]              BIGINT         NULL,
    [last_updated_by]              VARCHAR (100)  NULL,
    [last_updated_date_key]        CHAR (8)       NULL,
    [last_updated_date_time]       DATETIME       NULL,
    [parent_location_id]           BIGINT         NULL,
    [slug]                         VARCHAR (100)  NULL,
    [top_level_location_id]        BIGINT         NULL,
    [val_location_type_id_bk_hash] VARCHAR (32)   NULL,
    [p_loc_location_id]            BIGINT         NOT NULL,
    [deleted_flag]                 INT            NULL,
    [dv_load_date_time]            DATETIME       NULL,
    [dv_load_end_date_time]        DATETIME       NULL,
    [dv_batch_id]                  BIGINT         NOT NULL,
    [dv_inserted_date_time]        DATETIME       NOT NULL,
    [dv_insert_user]               VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]         DATETIME       NULL,
    [dv_update_user]               VARCHAR (50)   NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

