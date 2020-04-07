﻿CREATE TABLE [dbo].[d_magento_sales_order] (
    [d_magento_sales_order_id]                                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                                    CHAR (32)       NOT NULL,
    [order_id]                                                   INT             NULL,
    [base_rwrd_crrncy_amount_invoiced]                           DECIMAL (12, 4) NULL,
    [base_rwrd_crrncy_amount_refnded]                            DECIMAL (12, 4) NULL,
    [billing_address_id]                                         INT             NULL,
    [coupon_code]                                                VARCHAR (255)   NULL,
    [created_at]                                                 DATETIME        NULL,
    [created_dim_date_key]                                       CHAR (8)        NULL,
    [created_dim_time_key]                                       CHAR (8)        NULL,
    [customer_dob]                                               DATETIME        NULL,
    [customer_dob_dim_date_key]                                  CHAR (8)        NULL,
    [customer_dob_dim_time_key]                                  CHAR (8)        NULL,
    [customer_gender]                                            INT             NULL,
    [customer_group_id]                                          INT             NULL,
    [customer_is_guest_flag]                                     CHAR (1)        NULL,
    [customer_taxvat]                                            VARCHAR (32)    NULL,
    [d_magento_sales_order_address_bk_hash]                      VARCHAR (32)    NULL,
    [d_workday_employee_trainer_bk_hash]                         CHAR (32)       NULL,
    [dim_magento_customer_key]                                   CHAR (32)       NULL,
    [dim_mms_member_key]                                         VARCHAR (32)    NULL,
    [email_sent]                                                 INT             NULL,
    [gw_id]                                                      INT             NULL,
    [increment_id]                                               VARCHAR (32)    NULL,
    [is_virtual_flag]                                            CHAR (1)        NULL,
    [m1_order_id]                                                INT             NULL,
    [member_id]                                                  INT             NULL,
    [order_number]                                               VARCHAR (32)    NULL,
    [paypal_ipn_customer_notified]                               INT             NULL,
    [protect_code]                                               VARCHAR (255)   NULL,
    [quote_address_id]                                           INT             NULL,
    [quote_id]                                                   INT             NULL,
    [reward_points_balance_refund]                               INT             NULL,
    [rwrd_crrncy_amount_refunded]                                DECIMAL (12, 4) NULL,
    [rwrd_currency_amount_invoiced]                              DECIMAL (12, 4) NULL,
    [sales_order_adjustment_negative]                            DECIMAL (12, 4) NULL,
    [sales_order_adjustment_positive]                            DECIMAL (12, 4) NULL,
    [sales_order_applied_rule_ids]                               VARCHAR (128)   NULL,
    [sales_order_base_adjustment_negative]                       DECIMAL (12, 4) NULL,
    [sales_order_base_adjustment_positive]                       DECIMAL (12, 4) NULL,
    [sales_order_base_currency_code]                             VARCHAR (3)     NULL,
    [sales_order_base_customer_balance_amount]                   DECIMAL (12, 4) NULL,
    [sales_order_base_customer_balance_invoiced]                 DECIMAL (12, 4) NULL,
    [sales_order_base_customer_balance_refunded]                 DECIMAL (12, 4) NULL,
    [sales_order_base_discount_amount]                           DECIMAL (12, 4) NULL,
    [sales_order_base_discount_canceled]                         DECIMAL (12, 4) NULL,
    [sales_order_base_discount_invoiced]                         DECIMAL (12, 4) NULL,
    [sales_order_base_discount_refunded]                         DECIMAL (12, 4) NULL,
    [sales_order_base_discount_tax_compensation_amount]          DECIMAL (12, 4) NULL,
    [sales_order_base_discount_tax_compensation_invoiced]        DECIMAL (12, 4) NULL,
    [sales_order_base_discount_tax_compensation_refunded]        DECIMAL (12, 4) NULL,
    [sales_order_base_gift_cards_amount]                         DECIMAL (12, 4) NULL,
    [sales_order_base_gift_cards_invoiced]                       DECIMAL (12, 4) NULL,
    [sales_order_base_gift_cards_refunded]                       DECIMAL (12, 4) NULL,
    [sales_order_base_grand_total]                               DECIMAL (12, 4) NULL,
    [sales_order_base_reward_currency_amount]                    DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_amount]                           DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_canceled]                         DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_discount_amount]                  DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_discount_tax_compensation_amount] DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_incl_tax]                         DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_invoiced]                         DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_refunded]                         DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_tax_amount]                       DECIMAL (12, 4) NULL,
    [sales_order_base_shipping_tax_refunded]                     DECIMAL (12, 4) NULL,
    [sales_order_base_subtotal]                                  DECIMAL (12, 4) NULL,
    [sales_order_base_subtotal_canceled]                         DECIMAL (12, 4) NULL,
    [sales_order_base_subtotal_incl_tax]                         DECIMAL (12, 4) NULL,
    [sales_order_base_subtotal_invoiced]                         DECIMAL (12, 4) NULL,
    [sales_order_base_subtotal_refunded]                         DECIMAL (12, 4) NULL,
    [sales_order_base_tax_amount]                                DECIMAL (12, 4) NULL,
    [sales_order_base_tax_canceled]                              DECIMAL (12, 4) NULL,
    [sales_order_base_tax_invoiced]                              DECIMAL (12, 4) NULL,
    [sales_order_base_tax_refunded]                              DECIMAL (12, 4) NULL,
    [sales_order_base_to_global_rate]                            DECIMAL (12, 4) NULL,
    [sales_order_base_to_order_rate]                             DECIMAL (12, 4) NULL,
    [sales_order_base_total_canceled]                            DECIMAL (12, 4) NULL,
    [sales_order_base_total_due]                                 DECIMAL (12, 4) NULL,
    [sales_order_base_total_invoiced]                            DECIMAL (12, 4) NULL,
    [sales_order_base_total_invoiced_cost]                       DECIMAL (12, 4) NULL,
    [sales_order_base_total_offline_refunded]                    DECIMAL (12, 4) NULL,
    [sales_order_base_total_online_refunded]                     DECIMAL (12, 4) NULL,
    [sales_order_base_total_paid]                                DECIMAL (12, 4) NULL,
    [sales_order_base_total_qty_ordered]                         DECIMAL (12, 4) NULL,
    [sales_order_base_total_refunded]                            DECIMAL (12, 4) NULL,
    [sales_order_bs_customer_bal_total_refunded]                 DECIMAL (12, 4) NULL,
    [sales_order_can_ship_partially]                             INT             NULL,
    [sales_order_can_ship_partially_item]                        INT             NULL,
    [sales_order_coupon_rule_name]                               VARCHAR (255)   NULL,
    [sales_order_customer_bal_total_refunded]                    DECIMAL (12, 4) NULL,
    [sales_order_customer_balance_amount]                        DECIMAL (12, 4) NULL,
    [sales_order_customer_balance_invoiced]                      DECIMAL (12, 4) NULL,
    [sales_order_customer_balance_refunded]                      DECIMAL (12, 4) NULL,
    [sales_order_customer_note_notify]                           INT             NULL,
    [sales_order_discount_amount]                                DECIMAL (12, 4) NULL,
    [sales_order_discount_canceled]                              DECIMAL (12, 4) NULL,
    [sales_order_discount_description]                           VARCHAR (255)   NULL,
    [sales_order_discount_invoiced]                              DECIMAL (12, 4) NULL,
    [sales_order_discount_refunded]                              DECIMAL (12, 4) NULL,
    [sales_order_discount_tax_compensation_amount]               DECIMAL (12, 4) NULL,
    [sales_order_discount_tax_compensation_invoiced]             DECIMAL (12, 4) NULL,
    [sales_order_discount_tax_compensation_refunded]             DECIMAL (12, 4) NULL,
    [sales_order_edit_increment]                                 INT             NULL,
    [sales_order_ext_customer_id]                                VARCHAR (32)    NULL,
    [sales_order_ext_order_id]                                   VARCHAR (32)    NULL,
    [sales_order_forced_shipment_with_invoice]                   INT             NULL,
    [sales_order_gift_cards_amount]                              DECIMAL (12, 4) NULL,
    [sales_order_gift_cards_invoiced]                            DECIMAL (12, 4) NULL,
    [sales_order_gift_cards_refunded]                            DECIMAL (12, 4) NULL,
    [sales_order_gift_message_id]                                INT             NULL,
    [sales_order_global_currency_code]                           VARCHAR (3)     NULL,
    [sales_order_grand_total]                                    DECIMAL (12, 4) NULL,
    [sales_order_gw_add_card]                                    INT             NULL,
    [sales_order_gw_allow_gift_receipt]                          INT             NULL,
    [sales_order_gw_card_base_price_incl_tax]                    DECIMAL (12, 4) NULL,
    [sales_order_gw_card_base_price_invoiced]                    DECIMAL (12, 4) NULL,
    [sales_order_gw_card_base_price_refunded]                    DECIMAL (12, 4) NULL,
    [sales_order_gw_card_base_tax_amount]                        DECIMAL (12, 4) NULL,
    [sales_order_gw_card_base_tax_invoiced]                      DECIMAL (12, 4) NULL,
    [sales_order_gw_card_base_tax_refunded]                      DECIMAL (12, 4) NULL,
    [sales_order_gw_card_price_incl_tax]                         DECIMAL (12, 4) NULL,
    [sales_order_gw_card_price_invoiced]                         DECIMAL (12, 4) NULL,
    [sales_order_gw_card_price_refunded]                         DECIMAL (12, 4) NULL,
    [sales_order_gw_card_tax_amount]                             DECIMAL (12, 4) NULL,
    [sales_order_gw_card_tax_invoiced]                           DECIMAL (12, 4) NULL,
    [sales_order_gw_card_tax_refunded]                           DECIMAL (12, 4) NULL,
    [sales_order_hold_before_state]                              VARCHAR (32)    NULL,
    [sales_order_hold_before_status]                             VARCHAR (32)    NULL,
    [sales_order_lt_bucks_redeemed]                              INT             NULL,
    [sales_order_lt_bucks_refunded]                              INT             NULL,
    [sales_order_mms_party_id]                                   VARCHAR (8000)  NULL,
    [sales_order_order_currency_code]                            VARCHAR (3)     NULL,
    [sales_order_original_increment_id]                          VARCHAR (32)    NULL,
    [sales_order_payment_auth_expiration]                        INT             NULL,
    [sales_order_payment_authorization_amount]                   DECIMAL (12, 4) NULL,
    [sales_order_relation_child_id]                              VARCHAR (32)    NULL,
    [sales_order_relation_child_real_id]                         VARCHAR (32)    NULL,
    [sales_order_relation_parent_id]                             VARCHAR (32)    NULL,
    [sales_order_relation_parent_real_id]                        VARCHAR (32)    NULL,
    [sales_order_remote_ip]                                      VARCHAR (45)    NULL,
    [sales_order_reward_currency_amount]                         DECIMAL (12, 4) NULL,
    [sales_order_reward_points_balance]                          INT             NULL,
    [sales_order_shipping_discount_amount]                       DECIMAL (12, 4) NULL,
    [sales_order_shipping_discount_tax_compensation_amount]      DECIMAL (12, 4) NULL,
    [sales_order_shipping_incl_tax]                              DECIMAL (12, 4) NULL,
    [sales_order_store_to_base_rate]                             DECIMAL (12, 4) NULL,
    [sales_order_store_to_order_rate]                            DECIMAL (12, 4) NULL,
    [sales_order_subtotal_canceled]                              DECIMAL (12, 4) NULL,
    [sales_order_subtotal_invoiced]                              DECIMAL (12, 4) NULL,
    [sales_order_subtotal_refunded]                              DECIMAL (12, 4) NULL,
    [sales_order_tax_amount]                                     DECIMAL (12, 4) NULL,
    [sales_order_tax_canceled]                                   DECIMAL (12, 4) NULL,
    [sales_order_tax_invoiced]                                   DECIMAL (12, 4) NULL,
    [sales_order_tax_refunded]                                   DECIMAL (12, 4) NULL,
    [sales_order_total_canceled]                                 DECIMAL (12, 4) NULL,
    [sales_order_total_invoiced]                                 DECIMAL (12, 4) NULL,
    [sales_order_total_item_count]                               INT             NULL,
    [sales_order_total_offline_refunded]                         DECIMAL (12, 4) NULL,
    [sales_order_total_online_refunded]                          DECIMAL (12, 4) NULL,
    [sales_order_x_forwarded_for]                                VARCHAR (32)    NULL,
    [send_email]                                                 INT             NULL,
    [shipping_address_id]                                        INT             NULL,
    [shipping_amount]                                            DECIMAL (12, 4) NULL,
    [shipping_canceled]                                          DECIMAL (12, 4) NULL,
    [shipping_invoiced]                                          DECIMAL (12, 4) NULL,
    [shipping_method]                                            VARCHAR (120)   NULL,
    [shipping_refunded]                                          DECIMAL (12, 4) NULL,
    [shipping_tax_amount]                                        DECIMAL (12, 4) NULL,
    [shipping_tax_refunded]                                      DECIMAL (12, 4) NULL,
    [state]                                                      VARCHAR (32)    NULL,
    [status]                                                     VARCHAR (32)    NULL,
    [store_currency_code]                                        VARCHAR (3)     NULL,
    [store_id]                                                   INT             NULL,
    [store_name]                                                 VARCHAR (32)    NULL,
    [subtotal]                                                   DECIMAL (12, 4) NULL,
    [subtotal_incl_tax]                                          DECIMAL (12, 4) NULL,
    [total_due]                                                  DECIMAL (12, 4) NULL,
    [total_paid]                                                 DECIMAL (12, 4) NULL,
    [total_qty_ordered]                                          DECIMAL (12, 4) NULL,
    [total_refunded]                                             DECIMAL (12, 4) NULL,
    [trainer_name]                                               VARCHAR (8000)  NULL,
    [updated_at]                                                 DATETIME        NULL,
    [updated_dim_date_key]                                       CHAR (8)        NULL,
    [updated_dim_time_key]                                       CHAR (8)        NULL,
    [weight]                                                     DECIMAL (12, 4) NULL,
    [p_magento_sales_order_id]                                   BIGINT          NOT NULL,
    [deleted_flag]                                               INT             NULL,
    [dv_load_date_time]                                          DATETIME        NULL,
    [dv_load_end_date_time]                                      DATETIME        NULL,
    [dv_batch_id]                                                BIGINT          NOT NULL,
    [dv_inserted_date_time]                                      DATETIME        NOT NULL,
    [dv_insert_user]                                             VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                       DATETIME        NULL,
    [dv_update_user]                                             VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

