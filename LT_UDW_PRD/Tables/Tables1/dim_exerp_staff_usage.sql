﻿CREATE TABLE [dbo].[dim_exerp_staff_usage] (
    [dim_exerp_staff_usage_id]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [booking_id]                     VARCHAR (4000)  NULL,
    [dim_club_key]                   CHAR (32)       NULL,
    [dim_employee_key]               CHAR (32)       NULL,
    [dim_exerp_booking_key]          CHAR (32)       NULL,
    [dim_exerp_staff_usage_key]      CHAR (32)       NULL,
    [staff_usage_salary]             DECIMAL (26, 6) NULL,
    [staff_usage_state]              VARCHAR (4000)  NULL,
    [start_dim_date_key]             CHAR (8)        NULL,
    [start_dim_time_key]             CHAR (8)        NULL,
    [stop_dim_date_key]              CHAR (8)        NULL,
    [stop_dim_time_key]              CHAR (8)        NULL,
    [sub_for_dim_employee_key]       CHAR (32)       NULL,
    [substitute_of_dim_employee_key] VARCHAR (32)    NULL,
    [dv_load_date_time]              DATETIME        NULL,
    [dv_load_end_date_time]          DATETIME        NULL,
    [dv_batch_id]                    BIGINT          NOT NULL,
    [dv_inserted_date_time]          DATETIME        NOT NULL,
    [dv_insert_user]                 VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]           DATETIME        NULL,
    [dv_update_user]                 VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([dim_exerp_staff_usage_key]));

