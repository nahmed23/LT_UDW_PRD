﻿CREATE TABLE [dbo].[s_spabiz_staff] (
    [s_spabiz_staff_id]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]               CHAR (32)       NOT NULL,
    [staff_id]              DECIMAL (26, 6) NULL,
    [counter_id]            DECIMAL (26, 6) NULL,
    [edit_time]             DATETIME        NULL,
    [staff_delete]          DECIMAL (26, 6) NULL,
    [delete_date]           DATETIME        NULL,
    [first_name]            VARCHAR (150)   NULL,
    [mi]                    VARCHAR (3)     NULL,
    [last_name]             VARCHAR (150)   NULL,
    [f_l_name]              VARCHAR (150)   NULL,
    [f_name]                VARCHAR (150)   NULL,
    [quick_id]              VARCHAR (60)    NULL,
    [book_name]             VARCHAR (150)   NULL,
    [address_1]             VARCHAR (765)   NULL,
    [address_2]             VARCHAR (90)    NULL,
    [city]                  VARCHAR (60)    NULL,
    [state]                 VARCHAR (6)     NULL,
    [zip]                   VARCHAR (30)    NULL,
    [tel_home]              VARCHAR (60)    NULL,
    [tel_work]              VARCHAR (60)    NULL,
    [tel_mobil]             VARCHAR (60)    NULL,
    [tel_pager]             VARCHAR (60)    NULL,
    [birthday]              DATETIME        NULL,
    [sex]                   VARCHAR (150)   NULL,
    [employer]              VARCHAR (150)   NULL,
    [emp_start_date]        DATETIME        NULL,
    [emp_end_date]          DATETIME        NULL,
    [can_use_system]        DECIMAL (26, 6) NULL,
    [balance]               DECIMAL (26, 6) NULL,
    [print_traveler]        DECIMAL (26, 6) NULL,
    [pop_up_info]           VARCHAR (3000)  NULL,
    [note]                  VARCHAR (765)   NULL,
    [print_1]               DECIMAL (26, 6) NULL,
    [print_2]               DECIMAL (26, 6) NULL,
    [print_3]               DECIMAL (26, 6) NULL,
    [print_4]               DECIMAL (26, 6) NULL,
    [print_5]               DECIMAL (26, 6) NULL,
    [print_6]               DECIMAL (26, 6) NULL,
    [print_7]               DECIMAL (26, 6) NULL,
    [start_ap_cycle]        DATETIME        NULL,
    [ap_cycle_count]        DECIMAL (26, 6) NULL,
    [status]                DECIMAL (26, 6) NULL,
    [b_day]                 VARCHAR (30)    NULL,
    [anniversary]           VARCHAR (30)    NULL,
    [clock_in_req]          DECIMAL (26, 6) NULL,
    [wage_type]             DECIMAL (26, 6) NULL,
    [wage]                  DECIMAL (26, 6) NULL,
    [wage_per_min]          DECIMAL (26, 6) NULL,
    [tg_level]              DECIMAL (26, 6) NULL,
    [print_pop_up]          DECIMAL (26, 6) NULL,
    [bio]                   VARCHAR (765)   NULL,
    [type_of]               DECIMAL (26, 6) NULL,
    [name]                  VARCHAR (150)   NULL,
    [pager_num]             DECIMAL (26, 6) NULL,
    [pager_type]            DECIMAL (26, 6) NULL,
    [sales_total]           DECIMAL (26, 6) NULL,
    [store_number]          DECIMAL (26, 6) NULL,
    [service_template_id]   DECIMAL (26, 6) NULL,
    [staff_template_id]     DECIMAL (26, 6) NULL,
    [web_book]              DECIMAL (26, 6) NULL,
    [neill_id]              VARCHAR (75)    NULL,
    [louis]                 DECIMAL (26, 6) NULL,
    [do_not_print_prod]     DECIMAL (26, 6) NULL,
    [print_travler]         DECIMAL (26, 6) NULL,
    [foreign_id]            VARCHAR (300)   NULL,
    [new_id]                DECIMAL (26, 6) NULL,
    [staff_backup_id]       DECIMAL (26, 6) NULL,
    [user_name]             VARCHAR (60)    NULL,
    [is_admin]              DECIMAL (26, 6) NULL,
    [head_map_staff]        DECIMAL (26, 6) NULL,
    [allow_power_booking]   DECIMAL (26, 6) NULL,
    [email]                 VARCHAR (750)   NULL,
    [dv_load_date_time]     DATETIME        NOT NULL,
    [dv_batch_id]           BIGINT          NOT NULL,
    [dv_r_load_source_id]   BIGINT          NOT NULL,
    [dv_inserted_date_time] DATETIME        NOT NULL,
    [dv_insert_user]        VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]  DATETIME        NULL,
    [dv_update_user]        VARCHAR (50)    NULL,
    [dv_hash]               CHAR (32)       NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_s_spabiz_staff]
    ON [dbo].[s_spabiz_staff]([bk_hash] ASC, [s_spabiz_staff_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_spabiz_staff]([dv_batch_id] ASC);

