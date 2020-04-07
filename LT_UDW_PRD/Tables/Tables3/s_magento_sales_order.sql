﻿CREATE TABLE [dbo].[s_magento_sales_order] (
    [s_magento_sales_order_id]                       BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                        CHAR (32)       NOT NULL,
    [entity_id]                                      INT             NULL,
    [state]                                          VARCHAR (32)    NULL,
    [status]                                         VARCHAR (32)    NULL,
    [coupon_code]                                    VARCHAR (255)   NULL,
    [protect_code]                                   VARCHAR (255)   NULL,
    [shipping_description]                           VARCHAR (255)   NULL,
    [is_virtual]                                     INT             NULL,
    [base_discount_amount]                           DECIMAL (12, 4) NULL,
    [base_discount_canceled]                         DECIMAL (12, 4) NULL,
    [base_discount_invoiced]                         DECIMAL (12, 4) NULL,
    [base_discount_refunded]                         DECIMAL (12, 4) NULL,
    [base_grand_total]                               DECIMAL (12, 4) NULL,
    [base_shipping_amount]                           DECIMAL (12, 4) NULL,
    [base_shipping_canceled]                         DECIMAL (12, 4) NULL,
    [base_shipping_invoiced]                         DECIMAL (12, 4) NULL,
    [base_shipping_refunded]                         DECIMAL (12, 4) NULL,
    [base_shipping_tax_amount]                       DECIMAL (12, 4) NULL,
    [base_shipping_tax_refunded]                     DECIMAL (12, 4) NULL,
    [base_subtotal]                                  DECIMAL (12, 4) NULL,
    [base_subtotal_canceled]                         DECIMAL (12, 4) NULL,
    [base_subtotal_invoiced]                         DECIMAL (12, 4) NULL,
    [base_subtotal_refunded]                         DECIMAL (12, 4) NULL,
    [base_tax_amount]                                DECIMAL (12, 4) NULL,
    [base_tax_canceled]                              DECIMAL (12, 4) NULL,
    [base_tax_invoiced]                              DECIMAL (12, 4) NULL,
    [base_tax_refunded]                              DECIMAL (12, 4) NULL,
    [base_to_global_rate]                            DECIMAL (12, 4) NULL,
    [base_to_order_rate]                             DECIMAL (12, 4) NULL,
    [base_total_canceled]                            DECIMAL (12, 4) NULL,
    [base_total_invoiced]                            DECIMAL (12, 4) NULL,
    [base_total_invoiced_cost]                       DECIMAL (12, 4) NULL,
    [base_total_offline_refunded]                    DECIMAL (12, 4) NULL,
    [base_total_online_refunded]                     DECIMAL (12, 4) NULL,
    [base_total_paid]                                DECIMAL (12, 4) NULL,
    [base_total_qty_ordered]                         DECIMAL (12, 4) NULL,
    [base_total_refunded]                            DECIMAL (12, 4) NULL,
    [discount_amount]                                DECIMAL (12, 4) NULL,
    [discount_canceled]                              DECIMAL (12, 4) NULL,
    [discount_invoiced]                              DECIMAL (12, 4) NULL,
    [discount_refunded]                              DECIMAL (12, 4) NULL,
    [grand_total]                                    DECIMAL (12, 4) NULL,
    [shipping_amount]                                DECIMAL (12, 4) NULL,
    [shipping_canceled]                              DECIMAL (12, 4) NULL,
    [shipping_invoiced]                              DECIMAL (12, 4) NULL,
    [shipping_refunded]                              DECIMAL (12, 4) NULL,
    [shipping_tax_amount]                            DECIMAL (12, 4) NULL,
    [shipping_tax_refunded]                          DECIMAL (12, 4) NULL,
    [store_to_base_rate]                             DECIMAL (12, 4) NULL,
    [store_to_order_rate]                            DECIMAL (12, 4) NULL,
    [subtotal]                                       DECIMAL (12, 4) NULL,
    [subtotal_canceled]                              DECIMAL (12, 4) NULL,
    [subtotal_invoiced]                              DECIMAL (12, 4) NULL,
    [subtotal_refunded]                              DECIMAL (12, 4) NULL,
    [tax_amount]                                     DECIMAL (12, 4) NULL,
    [tax_canceled]                                   DECIMAL (12, 4) NULL,
    [tax_invoiced]                                   DECIMAL (12, 4) NULL,
    [tax_refunded]                                   DECIMAL (12, 4) NULL,
    [total_canceled]                                 DECIMAL (12, 4) NULL,
    [total_invoiced]                                 DECIMAL (12, 4) NULL,
    [total_offline_refunded]                         DECIMAL (12, 4) NULL,
    [total_online_refunded]                          DECIMAL (12, 4) NULL,
    [total_paid]                                     DECIMAL (12, 4) NULL,
    [total_qty_ordered]                              DECIMAL (12, 4) NULL,
    [total_refunded]                                 DECIMAL (12, 4) NULL,
    [can_ship_partially]                             INT             NULL,
    [can_ship_partially_item]                        INT             NULL,
    [customer_is_guest]                              INT             NULL,
    [customer_note_notify]                           INT             NULL,
    [edit_increment]                                 INT             NULL,
    [email_sent]                                     INT             NULL,
    [send_email]                                     INT             NULL,
    [forced_shipment_with_invoice]                   INT             NULL,
    [payment_auth_expiration]                        INT             NULL,
    [adjustment_negative]                            DECIMAL (12, 4) NULL,
    [adjustment_positive]                            DECIMAL (12, 4) NULL,
    [base_adjustment_negative]                       DECIMAL (12, 4) NULL,
    [base_adjustment_positive]                       DECIMAL (12, 4) NULL,
    [base_shipping_discount_amount]                  DECIMAL (12, 4) NULL,
    [base_subtotal_incl_tax]                         DECIMAL (12, 4) NULL,
    [base_total_due]                                 DECIMAL (12, 4) NULL,
    [payment_authorization_amount]                   DECIMAL (12, 4) NULL,
    [shipping_discount_amount]                       DECIMAL (12, 4) NULL,
    [subtotal_incl_tax]                              DECIMAL (12, 4) NULL,
    [total_due]                                      DECIMAL (12, 4) NULL,
    [weight]                                         DECIMAL (12, 4) NULL,
    [customer_dob]                                   DATETIME        NULL,
    [applied_rule_ids]                               VARCHAR (128)   NULL,
    [base_currency_code]                             VARCHAR (3)     NULL,
    [customer_email]                                 VARCHAR (128)   NULL,
    [customer_first_name]                            VARCHAR (128)   NULL,
    [customer_last_name]                             VARCHAR (128)   NULL,
    [customer_middle_name]                           VARCHAR (128)   NULL,
    [customer_prefix]                                VARCHAR (32)    NULL,
    [customer_suffix]                                VARCHAR (32)    NULL,
    [customer_taxvat]                                VARCHAR (32)    NULL,
    [discount_description]                           VARCHAR (255)   NULL,
    [global_currency_code]                           VARCHAR (3)     NULL,
    [hold_before_state]                              VARCHAR (32)    NULL,
    [hold_before_status]                             VARCHAR (32)    NULL,
    [order_currency_code]                            VARCHAR (3)     NULL,
    [remote_ip]                                      VARCHAR (45)    NULL,
    [shipping_method]                                VARCHAR (120)   NULL,
    [store_currency_code]                            VARCHAR (3)     NULL,
    [store_name]                                     VARCHAR (32)    NULL,
    [x_forwarded_for]                                VARCHAR (32)    NULL,
    [customer_note]                                  VARCHAR (8000)  NULL,
    [created_at]                                     DATETIME        NULL,
    [updated_at]                                     DATETIME        NULL,
    [total_item_count]                               INT             NULL,
    [customer_gender]                                INT             NULL,
    [discount_tax_compensation_amount]               DECIMAL (12, 4) NULL,
    [base_discount_tax_compensation_amount]          DECIMAL (12, 4) NULL,
    [shipping_discount_tax_compensation_amount]      DECIMAL (12, 4) NULL,
    [base_shipping_discount_tax_compensation_amount] DECIMAL (12, 4) NULL,
    [discount_tax_compensation_invoiced]             DECIMAL (12, 4) NULL,
    [base_discount_tax_compensation_invoiced]        DECIMAL (12, 4) NULL,
    [discount_tax_compensation_refunded]             DECIMAL (12, 4) NULL,
    [base_discount_tax_compensation_refunded]        DECIMAL (12, 4) NULL,
    [shipping_incl_tax]                              DECIMAL (12, 4) NULL,
    [base_shipping_incl_tax]                         DECIMAL (12, 4) NULL,
    [coupon_rule_name]                               VARCHAR (255)   NULL,
    [paypal_ipn_customer_notified]                   INT             NULL,
    [base_customer_balance_amount]                   DECIMAL (12, 4) NULL,
    [customer_balance_amount]                        DECIMAL (12, 4) NULL,
    [base_customer_balance_invoiced]                 DECIMAL (12, 4) NULL,
    [customer_balance_invoiced]                      DECIMAL (12, 4) NULL,
    [base_customer_balance_refunded]                 DECIMAL (12, 4) NULL,
    [customer_balance_refunded]                      DECIMAL (12, 4) NULL,
    [bs_customer_bal_total_refunded]                 DECIMAL (12, 4) NULL,
    [customer_bal_total_refunded]                    DECIMAL (12, 4) NULL,
    [gift_cards]                                     VARCHAR (8000)  NULL,
    [base_gift_cards_amount]                         DECIMAL (12, 4) NULL,
    [gift_cards_amount]                              DECIMAL (12, 4) NULL,
    [base_gift_cards_invoiced]                       DECIMAL (12, 4) NULL,
    [gift_cards_invoiced]                            DECIMAL (12, 4) NULL,
    [base_gift_cards_refunded]                       DECIMAL (12, 4) NULL,
    [gift_cards_refunded]                            DECIMAL (12, 4) NULL,
    [gw_allow_gift_receipt]                          INT             NULL,
    [gw_add_card]                                    INT             NULL,
    [gw_base_price]                                  DECIMAL (12, 4) NULL,
    [gw_price]                                       DECIMAL (12, 4) NULL,
    [gw_items_base_price]                            DECIMAL (12, 4) NULL,
    [gw_items_price]                                 DECIMAL (12, 4) NULL,
    [gw_card_base_price]                             DECIMAL (12, 4) NULL,
    [gw_card_price]                                  DECIMAL (12, 4) NULL,
    [gw_base_tax_amount]                             DECIMAL (12, 4) NULL,
    [gw_tax_amount]                                  DECIMAL (12, 4) NULL,
    [gw_items_base_tax_amount]                       DECIMAL (12, 4) NULL,
    [gw_items_tax_amount]                            DECIMAL (12, 4) NULL,
    [gw_card_base_tax_amount]                        DECIMAL (12, 4) NULL,
    [gw_card_tax_amount]                             DECIMAL (12, 4) NULL,
    [gw_base_price_incl_tax]                         DECIMAL (12, 4) NULL,
    [gw_price_incl_tax]                              DECIMAL (12, 4) NULL,
    [gw_items_base_price_incl_tax]                   DECIMAL (12, 4) NULL,
    [gw_items_price_incl_tax]                        DECIMAL (12, 4) NULL,
    [gw_card_base_price_incl_tax]                    DECIMAL (12, 4) NULL,
    [gw_card_price_incl_tax]                         DECIMAL (12, 4) NULL,
    [gw_base_price_invoiced]                         DECIMAL (12, 4) NULL,
    [gw_price_invoiced]                              DECIMAL (12, 4) NULL,
    [gw_items_base_price_invoiced]                   DECIMAL (12, 4) NULL,
    [gw_items_price_invoiced]                        DECIMAL (12, 4) NULL,
    [gw_card_base_price_invoiced]                    DECIMAL (12, 4) NULL,
    [gw_card_price_invoiced]                         DECIMAL (12, 4) NULL,
    [gw_base_tax_amount_invoiced]                    DECIMAL (12, 4) NULL,
    [gw_tax_amount_invoiced]                         DECIMAL (12, 4) NULL,
    [gw_items_base_tax_invoiced]                     DECIMAL (12, 4) NULL,
    [gw_items_tax_invoiced]                          DECIMAL (12, 4) NULL,
    [gw_card_base_tax_invoiced]                      DECIMAL (12, 4) NULL,
    [gw_card_tax_invoiced]                           DECIMAL (12, 4) NULL,
    [gw_base_price_refunded]                         DECIMAL (12, 4) NULL,
    [gw_price_refunded]                              DECIMAL (12, 4) NULL,
    [gw_items_base_price_refunded]                   DECIMAL (12, 4) NULL,
    [gw_items_price_refunded]                        DECIMAL (12, 4) NULL,
    [gw_card_base_price_refunded]                    DECIMAL (12, 4) NULL,
    [gw_card_price_refunded]                         DECIMAL (12, 4) NULL,
    [gw_base_tax_amount_refunded]                    DECIMAL (12, 4) NULL,
    [gw_tax_amount_refunded]                         DECIMAL (12, 4) NULL,
    [gw_items_base_tax_refunded]                     DECIMAL (12, 4) NULL,
    [gw_items_tax_refunded]                          DECIMAL (12, 4) NULL,
    [gw_card_base_tax_refunded]                      DECIMAL (12, 4) NULL,
    [gw_card_tax_refunded]                           DECIMAL (12, 4) NULL,
    [reward_points_balance]                          INT             NULL,
    [base_reward_currency_amount]                    DECIMAL (12, 4) NULL,
    [reward_currency_amount]                         DECIMAL (12, 4) NULL,
    [base_rwrd_crrncy_amount_invoiced]               DECIMAL (12, 4) NULL,
    [rwrd_currency_amount_invoiced]                  DECIMAL (12, 4) NULL,
    [base_rwrd_crrncy_amount_refnded]                DECIMAL (12, 4) NULL,
    [rwrd_crrncy_amount_refunded]                    DECIMAL (12, 4) NULL,
    [reward_points_balance_refund]                   INT             NULL,
    [trainer_id]                                     VARCHAR (8000)  NULL,
    [trainer_name]                                   VARCHAR (8000)  NULL,
    [mms_party_id]                                   VARCHAR (8000)  NULL,
    [lt_bucks_redeemed]                              INT             NULL,
    [lt_bucks_refunded]                              INT             NULL,
    [dv_load_date_time]                              DATETIME        NOT NULL,
    [dv_r_load_source_id]                            BIGINT          NOT NULL,
    [dv_inserted_date_time]                          DATETIME        NOT NULL,
    [dv_insert_user]                                 VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                           DATETIME        NULL,
    [dv_update_user]                                 VARCHAR (50)    NULL,
    [dv_hash]                                        CHAR (32)       NOT NULL,
    [dv_deleted]                                     BIT             DEFAULT ((0)) NOT NULL,
    [dv_batch_id]                                    BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));

