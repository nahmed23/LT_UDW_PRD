﻿CREATE TABLE [dbo].[s_spabiz_customer] (
    [s_spabiz_customer_id]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]               CHAR (32)       NOT NULL,
    [customer_id]           DECIMAL (26, 6) NULL,
    [counter_id]            DECIMAL (26, 6) NULL,
    [edit_time]             DATETIME        NULL,
    [customer_delete]       DECIMAL (26, 6) NULL,
    [delete_date]           DATETIME        NULL,
    [first_name]            VARCHAR (150)   NULL,
    [last_name]             VARCHAR (150)   NULL,
    [f_l_name]              VARCHAR (150)   NULL,
    [f_name]                VARCHAR (150)   NULL,
    [l_name]                VARCHAR (150)   NULL,
    [quick_id]              VARCHAR (150)   NULL,
    [address_1]             VARCHAR (765)   NULL,
    [address_2]             VARCHAR (360)   NULL,
    [city]                  VARCHAR (150)   NULL,
    [state]                 VARCHAR (30)    NULL,
    [zip]                   VARCHAR (30)    NULL,
    [country]               VARCHAR (150)   NULL,
    [tel_home]              VARCHAR (42)    NULL,
    [tel_work]              VARCHAR (42)    NULL,
    [tel_work_ext]          VARCHAR (12)    NULL,
    [tel_work_fax]          VARCHAR (42)    NULL,
    [tel_mobil]             VARCHAR (42)    NULL,
    [tel_pager]             VARCHAR (42)    NULL,
    [tel_which]             DECIMAL (26, 6) NULL,
    [email]                 VARCHAR (150)   NULL,
    [b_day]                 VARCHAR (30)    NULL,
    [sex]                   DECIMAL (26, 6) NULL,
    [active_status]         DECIMAL (26, 6) NULL,
    [created_date]          DATETIME        NULL,
    [first_visit]           DATETIME        NULL,
    [last_ap_date]          DATETIME        NULL,
    [last_date]             DATETIME        NULL,
    [total_visits]          DECIMAL (26, 6) NULL,
    [service_visits]        DECIMAL (26, 6) NULL,
    [retained]              DECIMAL (26, 6) NULL,
    [drivers_license]       VARCHAR (150)   NULL,
    [referral_id]           DECIMAL (26, 6) NULL,
    [app_confirm]           DECIMAL (26, 6) NULL,
    [app_confirm_on_day]    DECIMAL (26, 6) NULL,
    [total_late]            DECIMAL (26, 6) NULL,
    [total_no_show]         DECIMAL (26, 6) NULL,
    [balance]               DECIMAL (26, 6) NULL,
    [credit_limit]          DECIMAL (26, 6) NULL,
    [allergies]             VARCHAR (300)   NULL,
    [medication]            VARCHAR (300)   NULL,
    [occupation]            VARCHAR (150)   NULL,
    [employer]              VARCHAR (150)   NULL,
    [call_days]             DECIMAL (26, 6) NULL,
    [note]                  VARCHAR (4000)  NULL,
    [show_note]             DECIMAL (26, 6) NULL,
    [do_not_charge_tax]     DECIMAL (26, 6) NULL,
    [charge_cost]           DECIMAL (26, 6) NULL,
    [tax_num]               VARCHAR (150)   NULL,
    [mail_ok]               DECIMAL (26, 6) NULL,
    [total_service]         DECIMAL (26, 6) NULL,
    [total_product]         DECIMAL (26, 6) NULL,
    [ytd_service]           DECIMAL (26, 6) NULL,
    [ytd_product]           DECIMAL (26, 6) NULL,
    [last_called]           DATETIME        NULL,
    [marital]               VARCHAR (150)   NULL,
    [alt_id]                VARCHAR (75)    NULL,
    [r_id]                  VARCHAR (18)    NULL,
    [user_name]             VARCHAR (150)   NULL,
    [store_number]          DECIMAL (26, 6) NULL,
    [customer_customer_id]  DECIMAL (26, 6) NULL,
    [fn]                    VARCHAR (150)   NULL,
    [ln]                    VARCHAR (150)   NULL,
    [is_urgent]             DECIMAL (26, 6) NULL,
    [do_not_print_note]     DECIMAL (26, 6) NULL,
    [urgent]                DECIMAL (26, 6) NULL,
    [foreign_id]            VARCHAR (300)   NULL,
    [note_1]                VARCHAR (1500)  NULL,
    [customer_v_id]         VARCHAR (150)   NULL,
    [member_v_id]           VARCHAR (150)   NULL,
    [member_status]         VARCHAR (36)    NULL,
    [member_category]       VARCHAR (3)     NULL,
    [status]                VARCHAR (6)     NULL,
    [apt_hold_info]         VARCHAR (1500)  NULL,
    [ud_field_1]            VARCHAR (150)   NULL,
    [ud_field_2]            VARCHAR (150)   NULL,
    [ud_field_3]            VARCHAR (150)   NULL,
    [ud_field_4]            VARCHAR (150)   NULL,
    [account_number]        VARCHAR (300)   NULL,
    [email_ok]              DECIMAL (26, 6) NULL,
    [middle_name]           VARCHAR (150)   NULL,
    [member_active]         DECIMAL (26, 6) NULL,
    [text_msg_ok]           DECIMAL (26, 6) NULL,
    [email_recurring]       DECIMAL (26, 6) NULL,
    [mercury_1]             VARCHAR (600)   NULL,
    [mercury_2]             VARCHAR (600)   NULL,
    [mercury_3]             VARCHAR (600)   NULL,
    [mercury_4]             VARCHAR (600)   NULL,
    [title]                 VARCHAR (150)   NULL,
    [gender_pref]           DECIMAL (26, 6) NULL,
    [dv_load_date_time]     DATETIME        NOT NULL,
    [dv_r_load_source_id]   BIGINT          NOT NULL,
    [dv_inserted_date_time] DATETIME        NOT NULL,
    [dv_insert_user]        VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]  DATETIME        NULL,
    [dv_update_user]        VARCHAR (50)    NULL,
    [dv_hash]               CHAR (32)       NOT NULL,
    [dv_batch_id]           BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));


GO
CREATE CLUSTERED INDEX [ci_s_spabiz_customer]
    ON [dbo].[s_spabiz_customer]([bk_hash] ASC, [s_spabiz_customer_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_dv_batch_id]
    ON [dbo].[s_spabiz_customer]([dv_batch_id] ASC);
