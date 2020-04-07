﻿CREATE TABLE [dbo].[fact_mms_child_center_usage] (
    [fact_mms_child_center_usage_id]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [fact_mms_child_center_usage_key] CHAR (32)      NULL,
    [child_center_usage_id]           INT            NULL,
    [check_in_dim_date_key]           CHAR (32)      NULL,
    [check_in_dim_mms_member_key]     CHAR (32)      NULL,
    [check_in_dim_time_key]           CHAR (32)      NULL,
    [check_out_dim_date_key]          CHAR (32)      NULL,
    [check_out_dim_mms_member_key]    CHAR (32)      NULL,
    [check_out_dim_time_key]          CHAR (32)      NULL,
    [child_age_months]                INT            NULL,
    [child_age_years]                 INT            NULL,
    [child_dim_mms_member_key]        CHAR (32)      NULL,
    [child_gender_abbreviation]       CHAR (1)       NULL,
    [dim_club_key]                    CHAR (32)      NULL,
    [dim_mms_membership_key]          CHAR (32)      NULL,
    [exception_flag]                  CHAR (1)       NULL,
    [kids_play_check_in_count]        INT            NULL,
    [length_of_stay_display]          VARCHAR (1000) NULL,
    [length_of_stay_minutes]          INT            NULL,
    [primary_dim_mms_member_key]      CHAR (32)      NULL,
    [dv_load_date_time]               DATETIME       NULL,
    [dv_load_end_date_time]           DATETIME       NULL,
    [dv_batch_id]                     BIGINT         NOT NULL,
    [dv_inserted_date_time]           DATETIME       NOT NULL,
    [dv_insert_user]                  VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]            DATETIME       NULL,
    [dv_update_user]                  VARCHAR (50)   NULL
)
WITH (HEAP, DISTRIBUTION = HASH([fact_mms_child_center_usage_key]));
