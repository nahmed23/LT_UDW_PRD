﻿CREATE TABLE [dbo].[l_affinitech_camera_count] (
    [l_affinitech_camera_count_id] BIGINT       IDENTITY (1, 1) NOT NULL,
    [bk_hash]                      CHAR (32)    NOT NULL,
    [Door_Description]             VARCHAR (50) NULL,
    [Start_Range]                  DATETIME     NULL,
    [Source_IP]                    VARCHAR (50) NULL,
    [Division_ID]                  VARCHAR (50) NULL,
    [Site_ID]                      VARCHAR (50) NULL,
    [Door_ID]                      VARCHAR (50) NULL,
    [dv_load_date_time]            DATETIME     NOT NULL,
    [dv_r_load_source_id]          BIGINT       NOT NULL,
    [dv_inserted_date_time]        DATETIME     NOT NULL,
    [dv_insert_user]               VARCHAR (50) NOT NULL,
    [dv_updated_date_time]         DATETIME     NULL,
    [dv_update_user]               VARCHAR (50) NULL,
    [dv_hash]                      CHAR (32)    NOT NULL,
    [dv_deleted]                   BIT          DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                  BIGINT       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

