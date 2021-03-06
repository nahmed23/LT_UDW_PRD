﻿CREATE TABLE [dbo].[d_spabiz_cust_card] (
    [d_spabiz_cust_card_id]                        BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                      CHAR (32)       NOT NULL,
    [cust_card_id]                                 DECIMAL (26, 6) NULL,
    [store_number]                                 DECIMAL (26, 6) NULL,
    [buy_cust_id]                                  BIGINT          NULL,
    [cancel_id]                                    DECIMAL (26, 6) NULL,
    [cancelled]                                    DECIMAL (26, 6) NULL,
    [counter_id]                                   DECIMAL (26, 6) NULL,
    [current_installment]                          DECIMAL (26, 6) NULL,
    [customer_id]                                  DECIMAL (26, 6) NULL,
    [d_spabiz_buy_cust_card_key]                   CHAR (32)       NULL,
    [d_spabiz_cust_card_cust_card_type_key]        CHAR (32)       NULL,
    [d_spabiz_cust_card_customer_key]              CHAR (32)       NULL,
    [d_spabiz_cust_card_dim_date_key]              CHAR (8)        NULL,
    [d_spabiz_cust_card_edit_dim_date_key]         CHAR (8)        NULL,
    [d_spabiz_cust_card_exp_dim_date_key]          CHAR (8)        NULL,
    [d_spabiz_cust_card_last_used_key]             CHAR (8)        NULL,
    [d_spabiz_cust_card_next_billing_dim_date_key] CHAR (8)        NULL,
    [d_spabiz_cust_card_staff_create_key]          CHAR (32)       NULL,
    [d_spabiz_cust_card_staff_id_key_1]            CHAR (32)       NULL,
    [d_spabiz_cust_card_staff_id_key_2]            CHAR (32)       NULL,
    [d_spabiz_cust_card_store_key]                 CHAR (32)       NULL,
    [d_spabiz_cust_card_ticket_key]                CHAR (32)       NULL,
    [d_spabiz_cust_card_type_key]                  CHAR (32)       NULL,
    [days_good]                                    DECIMAL (26, 6) NULL,
    [deleted_flag]                                 CHAR (1)        NULL,
    [initial_amount]                               DECIMAL (26, 6) NULL,
    [mem_type]                                     DECIMAL (26, 6) NULL,
    [price]                                        DECIMAL (26, 6) NULL,
    [product_sales]                                DECIMAL (26, 6) NULL,
    [prorated_amount]                              DECIMAL (26, 6) NULL,
    [recurring]                                    DECIMAL (26, 6) NULL,
    [recurring_after_expire]                       DECIMAL (26, 6) NULL,
    [recurring_declined]                           DECIMAL (26, 6) NULL,
    [recurring_declined_reason]                    VARCHAR (765)   NULL,
    [serial_num]                                   VARCHAR (150)   NULL,
    [service_sales]                                DECIMAL (26, 6) NULL,
    [status]                                       DECIMAL (26, 6) NULL,
    [total_sales]                                  DECIMAL (26, 6) NULL,
    [ytd_sales]                                    DECIMAL (26, 6) NULL,
    [p_spabiz_cust_card_id]                        BIGINT          NOT NULL,
    [dv_load_date_time]                            DATETIME        NULL,
    [dv_load_end_date_time]                        DATETIME        NULL,
    [dv_batch_id]                                  BIGINT          NOT NULL,
    [dv_inserted_date_time]                        DATETIME        NOT NULL,
    [dv_insert_user]                               VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                         DATETIME        NULL,
    [dv_update_user]                               VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

