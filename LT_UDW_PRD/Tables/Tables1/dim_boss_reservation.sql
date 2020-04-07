﻿CREATE TABLE [dbo].[dim_boss_reservation] (
    [dim_boss_reservation_id]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [age_high]                         INT             NULL,
    [age_low]                          INT             NULL,
    [allow_wait_list]                  CHAR (1)        NULL,
    [billing_count]                    INT             NULL,
    [capacity]                         INT             NULL,
    [comment]                          VARCHAR (40)    NULL,
    [continuous]                       CHAR (1)        NULL,
    [created_dim_date_key]             CHAR (8)        NULL,
    [day_of_week_friday_flag]          CHAR (1)        NULL,
    [day_of_week_monday_flag]          CHAR (1)        NULL,
    [day_of_week_saturday_flag]        CHAR (1)        NULL,
    [day_of_week_sunday_flag]          CHAR (1)        NULL,
    [day_of_week_thursday_flag]        CHAR (1)        NULL,
    [day_of_week_tuesday_flag]         CHAR (1)        NULL,
    [day_of_week_wednesday_flag]       CHAR (1)        NULL,
    [dim_boss_product_key]             CHAR (32)       NULL,
    [dim_boss_reservation_key]         CHAR (32)       NULL,
    [dim_club_key]                     CHAR (32)       NULL,
    [dim_employee_key]                 CHAR (32)       NULL,
    [dim_mms_product_key]              CHAR (32)       NULL,
    [dv_deleted_flag]                  INT             NULL,
    [end_dim_date_key]                 CHAR (8)        NULL,
    [end_dim_time_key]                 CHAR (8)        NULL,
    [format_id]                        INT             NULL,
    [free_dim_date_key]                CHAR (8)        NULL,
    [grace_days]                       INT             NULL,
    [inactive_end_dim_date_key]        CHAR (8)        NULL,
    [inactive_start_dim_date_key]      CHAR (8)        NULL,
    [instructor_expense]               DECIMAL (26, 6) NULL,
    [length_in_minutes]                INT             NULL,
    [limit]                            INT             NULL,
    [limit_minimum]                    INT             NULL,
    [link_to_dim_boss_reservation_key] CHAR (32)       NULL,
    [modified_dim_date_key]            CHAR (8)        NULL,
    [non_member_price]                 DECIMAL (26, 6) NULL,
    [print_description]                VARCHAR (40)    NULL,
    [product_format_long_desc]         CHAR (50)       NULL,
    [product_format_short_desc]        CHAR (15)       NULL,
    [program_id]                       VARCHAR (25)    NULL,
    [publish_flag]                     CHAR (1)        NULL,
    [reservation_id]                   INT             NULL,
    [reservation_status]               CHAR (1)        NULL,
    [reservation_type]                 CHAR (1)        NULL,
    [resource]                         CHAR (25)       NULL,
    [resource_type]                    CHAR (25)       NULL,
    [start_dim_date_key]               CHAR (8)        NULL,
    [start_dim_time_key]               CHAR (8)        NULL,
    [use_for_lt_bucks_flag]            CHAR (1)        NULL,
    [waiver_required_flag]             CHAR (1)        NULL,
    [web_active]                       CHAR (1)        NULL,
    [web_enable]                       CHAR (1)        NULL,
    [web_register_flag]                CHAR (1)        NULL,
    [web_start_dim_date_key]           CHAR (8)        NULL,
    [dv_load_date_time]                DATETIME        NULL,
    [dv_load_end_date_time]            DATETIME        NULL,
    [dv_batch_id]                      BIGINT          NOT NULL,
    [dv_inserted_date_time]            DATETIME        NOT NULL,
    [dv_insert_user]                   VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]             DATETIME        NULL,
    [dv_update_user]                   VARCHAR (50)    NULL
)
WITH (HEAP, DISTRIBUTION = HASH([dim_boss_reservation_key]));

