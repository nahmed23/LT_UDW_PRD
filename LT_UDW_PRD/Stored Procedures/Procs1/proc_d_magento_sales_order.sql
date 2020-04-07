﻿CREATE PROC [dbo].[proc_d_magento_sales_order] @current_dv_batch_id [bigint] AS
begin

set nocount on
set xact_abort on

--Start!
-- Get the @max_dv_batch_id from dimension/fact.  Use -2 if there aren't any records.
declare @max_dv_batch_id bigint = (select isnull(max(dv_batch_id),-2) from d_magento_sales_order)

-- Find the PIT records with dv_batch_id > @max_dv_batch_id
-- and find the PIT records with dv_batch_id = @current_dv_batch_id since those need to be deleted in case of a retry
if object_id('tempdb..#p_magento_sales_order_insert') is not null drop table #p_magento_sales_order_insert
create table dbo.#p_magento_sales_order_insert with(distribution=hash(bk_hash), location=user_db) as
select p_magento_sales_order.p_magento_sales_order_id,
       p_magento_sales_order.bk_hash
  from dbo.p_magento_sales_order
 where p_magento_sales_order.dv_load_end_date_time = convert(datetime,'9999.12.31',102)
   and (p_magento_sales_order.dv_batch_id > @max_dv_batch_id
        or p_magento_sales_order.dv_batch_id = @current_dv_batch_id)

-- calculate all values of the records to be inserted to make the actual update go as fast as possible
if object_id('tempdb..#insert') is not null drop table #insert
create table dbo.#insert with(distribution=hash(bk_hash), location=user_db) as
select p_magento_sales_order.bk_hash,
       p_magento_sales_order.entity_id order_id,
       s_magento_sales_order.base_rwrd_crrncy_amount_invoiced base_rwrd_crrncy_amount_invoiced,
       s_magento_sales_order.base_rwrd_crrncy_amount_refnded base_rwrd_crrncy_amount_refnded,
       l_magento_sales_order.billing_address_id billing_address_id,
       s_magento_sales_order.coupon_code coupon_code,
       s_magento_sales_order.created_at created_at,
       case when p_magento_sales_order.bk_hash in('-997', '-998', '-999') then p_magento_sales_order.bk_hash
           when s_magento_sales_order.created_at is null then '-998'
        else convert(varchar, s_magento_sales_order.created_at, 112)    end created_dim_date_key,
       case when p_magento_sales_order.bk_hash in ('-997','-998','-999') then p_magento_sales_order.bk_hash
       when s_magento_sales_order.created_at is null then '-998'
       else '1' + replace(substring(convert(varchar,s_magento_sales_order.created_at,114), 1, 5),':','') end created_dim_time_key,
       s_magento_sales_order.customer_dob customer_dob,
       case when p_magento_sales_order.bk_hash in('-997', '-998', '-999') then p_magento_sales_order.bk_hash
           when s_magento_sales_order.customer_dob is null then '-998'
        else convert(varchar, s_magento_sales_order.customer_dob, 112)    end customer_dob_dim_date_key,
       case when p_magento_sales_order.bk_hash in ('-997','-998','-999') then p_magento_sales_order.bk_hash
       when s_magento_sales_order.customer_dob is null then '-998'
       else '1' + replace(substring(convert(varchar,s_magento_sales_order.customer_dob,114), 1, 5),':','') end customer_dob_dim_time_key,
       s_magento_sales_order.customer_gender customer_gender,
       l_magento_sales_order.customer_group_id customer_group_id,
       case when s_magento_sales_order.customer_is_guest= 1 then 'Y' else 'N' end customer_is_guest_flag,
       s_magento_sales_order.customer_taxvat customer_taxvat,
       case when p_magento_sales_order.bk_hash in ('-997', '-998', '-999') then p_magento_sales_order.bk_hash
            when l_magento_sales_order.shipping_address_id is null then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(cast(l_magento_sales_order.shipping_address_id as int) as varchar(500)),'z#@$k%&P'))),2) 
        end d_magento_sales_order_address_bk_hash,
       case when p_magento_sales_order.bk_hash in('-997', '-998', '-999') then p_magento_sales_order.bk_hash
           when s_magento_sales_order.trainer_id is null then '-998'
        else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(cast(s_magento_sales_order.trainer_id as int) as varchar(500)),'z#@$k%&P'))),2) end d_workday_employee_trainer_bk_hash,
       case when p_magento_sales_order.bk_hash in('-997', '-998', '-999') then p_magento_sales_order.bk_hash
           when l_magento_sales_order.customer_id is null then '-998'
        else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(cast(l_magento_sales_order.customer_id as int) as varchar(500)),'z#@$k%&P'))),2) end dim_magento_customer_key,
       case when p_magento_sales_order.bk_hash in ('-997', '-998', '-999') then p_magento_sales_order.bk_hash
            when l_magento_sales_order.customer_mms_id is null then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(cast(l_magento_sales_order.customer_mms_id as int) as varchar(500)),'z#@$k%&P'))),2) 
        end dim_mms_member_key,
       s_magento_sales_order.email_sent email_sent,
       l_magento_sales_order.gw_id gw_id,
       l_magento_sales_order.increment_id increment_id,
       case when s_magento_sales_order.is_virtual= 1 then 'Y' else 'N' end is_virtual_flag,
       l_magento_sales_order.m1_order_id m1_order_id,
       l_magento_sales_order.customer_mms_id member_id,
       l_magento_sales_order.increment_id order_number,
       s_magento_sales_order.paypal_ipn_customer_notified paypal_ipn_customer_notified,
       s_magento_sales_order.protect_code protect_code,
       l_magento_sales_order.quote_address_id quote_address_id,
       l_magento_sales_order.quote_id quote_id,
       s_magento_sales_order.reward_points_balance_refund reward_points_balance_refund,
       s_magento_sales_order.rwrd_crrncy_amount_refunded rwrd_crrncy_amount_refunded,
       s_magento_sales_order.rwrd_currency_amount_invoiced rwrd_currency_amount_invoiced,
       s_magento_sales_order.adjustment_negative sales_order_adjustment_negative,
       s_magento_sales_order.adjustment_positive sales_order_adjustment_positive,
       s_magento_sales_order.applied_rule_ids sales_order_applied_rule_ids,
       s_magento_sales_order.base_adjustment_negative sales_order_base_adjustment_negative,
       s_magento_sales_order.base_adjustment_positive sales_order_base_adjustment_positive,
       s_magento_sales_order.base_currency_code sales_order_base_currency_code,
       s_magento_sales_order.base_customer_balance_amount sales_order_base_customer_balance_amount,
       s_magento_sales_order.base_customer_balance_invoiced sales_order_base_customer_balance_invoiced,
       s_magento_sales_order.base_customer_balance_refunded sales_order_base_customer_balance_refunded,
       s_magento_sales_order.base_discount_amount sales_order_base_discount_amount,
       s_magento_sales_order.base_discount_canceled sales_order_base_discount_canceled,
       s_magento_sales_order.base_discount_invoiced sales_order_base_discount_invoiced,
       s_magento_sales_order.base_discount_refunded sales_order_base_discount_refunded,
       s_magento_sales_order.base_discount_tax_compensation_amount sales_order_base_discount_tax_compensation_amount,
       s_magento_sales_order.base_discount_tax_compensation_invoiced sales_order_base_discount_tax_compensation_invoiced,
       s_magento_sales_order.base_discount_tax_compensation_refunded sales_order_base_discount_tax_compensation_refunded,
       s_magento_sales_order.base_gift_cards_amount sales_order_base_gift_cards_amount,
       s_magento_sales_order.base_gift_cards_invoiced sales_order_base_gift_cards_invoiced,
       s_magento_sales_order.base_gift_cards_refunded sales_order_base_gift_cards_refunded,
       s_magento_sales_order.base_grand_total sales_order_base_grand_total,
       s_magento_sales_order.base_reward_currency_amount sales_order_base_reward_currency_amount,
       s_magento_sales_order.base_shipping_amount sales_order_base_shipping_amount,
       s_magento_sales_order.base_shipping_canceled sales_order_base_shipping_canceled,
       s_magento_sales_order.base_shipping_discount_amount sales_order_base_shipping_discount_amount,
       s_magento_sales_order.base_shipping_discount_tax_compensation_amount sales_order_base_shipping_discount_tax_compensation_amount,
       s_magento_sales_order.base_shipping_incl_tax sales_order_base_shipping_incl_tax,
       s_magento_sales_order.base_shipping_invoiced sales_order_base_shipping_invoiced,
       s_magento_sales_order.base_shipping_refunded sales_order_base_shipping_refunded,
       s_magento_sales_order.base_shipping_tax_amount sales_order_base_shipping_tax_amount,
       s_magento_sales_order.base_shipping_tax_refunded sales_order_base_shipping_tax_refunded,
       s_magento_sales_order.base_subtotal sales_order_base_subtotal,
       s_magento_sales_order.base_subtotal_canceled sales_order_base_subtotal_canceled,
       s_magento_sales_order.base_subtotal_incl_tax sales_order_base_subtotal_incl_tax,
       s_magento_sales_order.base_subtotal_invoiced sales_order_base_subtotal_invoiced,
       s_magento_sales_order.base_subtotal_refunded sales_order_base_subtotal_refunded,
       s_magento_sales_order.base_tax_amount sales_order_base_tax_amount,
       s_magento_sales_order.base_tax_canceled sales_order_base_tax_canceled,
       s_magento_sales_order.base_tax_invoiced sales_order_base_tax_invoiced,
       s_magento_sales_order.base_tax_refunded sales_order_base_tax_refunded,
       s_magento_sales_order.base_to_global_rate sales_order_base_to_global_rate,
       s_magento_sales_order.base_to_order_rate sales_order_base_to_order_rate,
       s_magento_sales_order.base_total_canceled sales_order_base_total_canceled,
       s_magento_sales_order.base_total_due sales_order_base_total_due,
       s_magento_sales_order.base_total_invoiced sales_order_base_total_invoiced,
       s_magento_sales_order.base_total_invoiced_cost sales_order_base_total_invoiced_cost,
       s_magento_sales_order.base_total_offline_refunded sales_order_base_total_offline_refunded,
       s_magento_sales_order.base_total_online_refunded sales_order_base_total_online_refunded,
       s_magento_sales_order.base_total_paid sales_order_base_total_paid,
       s_magento_sales_order.base_total_qty_ordered sales_order_base_total_qty_ordered,
       s_magento_sales_order.base_total_refunded sales_order_base_total_refunded,
       s_magento_sales_order.bs_customer_bal_total_refunded sales_order_bs_customer_bal_total_refunded,
       s_magento_sales_order.can_ship_partially sales_order_can_ship_partially,
       s_magento_sales_order.can_ship_partially_item sales_order_can_ship_partially_item,
       s_magento_sales_order.coupon_rule_name sales_order_coupon_rule_name,
       s_magento_sales_order.customer_bal_total_refunded sales_order_customer_bal_total_refunded,
       s_magento_sales_order.customer_balance_amount sales_order_customer_balance_amount,
       s_magento_sales_order.customer_balance_invoiced sales_order_customer_balance_invoiced,
       s_magento_sales_order.customer_balance_refunded sales_order_customer_balance_refunded,
       s_magento_sales_order.customer_note_notify sales_order_customer_note_notify,
       s_magento_sales_order.discount_amount sales_order_discount_amount,
       s_magento_sales_order.discount_canceled sales_order_discount_canceled,
       s_magento_sales_order.discount_description sales_order_discount_description,
       s_magento_sales_order.discount_invoiced sales_order_discount_invoiced,
       s_magento_sales_order.discount_refunded sales_order_discount_refunded,
       s_magento_sales_order.discount_tax_compensation_amount sales_order_discount_tax_compensation_amount,
       s_magento_sales_order.discount_tax_compensation_invoiced sales_order_discount_tax_compensation_invoiced,
       s_magento_sales_order.discount_tax_compensation_refunded sales_order_discount_tax_compensation_refunded,
       s_magento_sales_order.edit_increment sales_order_edit_increment,
       l_magento_sales_order.ext_customer_id sales_order_ext_customer_id,
       l_magento_sales_order.ext_order_id sales_order_ext_order_id,
       s_magento_sales_order.forced_shipment_with_invoice sales_order_forced_shipment_with_invoice,
       s_magento_sales_order.gift_cards_amount sales_order_gift_cards_amount,
       s_magento_sales_order.gift_cards_invoiced sales_order_gift_cards_invoiced,
       s_magento_sales_order.gift_cards_refunded sales_order_gift_cards_refunded,
       l_magento_sales_order.gift_message_id sales_order_gift_message_id,
       s_magento_sales_order.global_currency_code sales_order_global_currency_code,
       s_magento_sales_order.grand_total sales_order_grand_total,
       s_magento_sales_order.gw_add_card sales_order_gw_add_card,
       s_magento_sales_order.gw_allow_gift_receipt sales_order_gw_allow_gift_receipt,
       s_magento_sales_order.gw_card_base_price_incl_tax sales_order_gw_card_base_price_incl_tax,
       s_magento_sales_order.gw_card_base_price_invoiced sales_order_gw_card_base_price_invoiced,
       s_magento_sales_order.gw_card_base_price_refunded sales_order_gw_card_base_price_refunded,
       s_magento_sales_order.gw_card_base_tax_amount sales_order_gw_card_base_tax_amount,
       s_magento_sales_order.gw_card_base_tax_invoiced sales_order_gw_card_base_tax_invoiced,
       s_magento_sales_order.gw_card_base_tax_refunded sales_order_gw_card_base_tax_refunded,
       s_magento_sales_order.gw_card_price_incl_tax sales_order_gw_card_price_incl_tax,
       s_magento_sales_order.gw_card_price_invoiced sales_order_gw_card_price_invoiced,
       s_magento_sales_order.gw_card_price_refunded sales_order_gw_card_price_refunded,
       s_magento_sales_order.gw_card_tax_amount sales_order_gw_card_tax_amount,
       s_magento_sales_order.gw_card_tax_invoiced sales_order_gw_card_tax_invoiced,
       s_magento_sales_order.gw_card_tax_refunded sales_order_gw_card_tax_refunded,
       s_magento_sales_order.hold_before_state sales_order_hold_before_state,
       s_magento_sales_order.hold_before_status sales_order_hold_before_status,
       s_magento_sales_order.lt_bucks_redeemed sales_order_lt_bucks_redeemed,
       s_magento_sales_order.lt_bucks_refunded sales_order_lt_bucks_refunded,
       s_magento_sales_order.mms_party_id sales_order_mms_party_id,
       s_magento_sales_order.order_currency_code sales_order_order_currency_code,
       l_magento_sales_order.original_increment_id sales_order_original_increment_id,
       s_magento_sales_order.payment_auth_expiration sales_order_payment_auth_expiration,
       s_magento_sales_order.payment_authorization_amount sales_order_payment_authorization_amount,
       l_magento_sales_order.relation_child_id sales_order_relation_child_id,
       l_magento_sales_order.relation_child_real_id sales_order_relation_child_real_id,
       l_magento_sales_order.relation_parent_id sales_order_relation_parent_id,
       l_magento_sales_order.relation_parent_real_id sales_order_relation_parent_real_id,
       s_magento_sales_order.remote_ip sales_order_remote_ip,
       s_magento_sales_order.reward_currency_amount sales_order_reward_currency_amount,
       s_magento_sales_order.reward_points_balance sales_order_reward_points_balance,
       s_magento_sales_order.shipping_discount_amount sales_order_shipping_discount_amount,
       s_magento_sales_order.shipping_discount_tax_compensation_amount sales_order_shipping_discount_tax_compensation_amount,
       s_magento_sales_order.shipping_incl_tax sales_order_shipping_incl_tax,
       s_magento_sales_order.store_to_base_rate sales_order_store_to_base_rate,
       s_magento_sales_order.store_to_order_rate sales_order_store_to_order_rate,
       s_magento_sales_order.subtotal_canceled sales_order_subtotal_canceled,
       s_magento_sales_order.subtotal_invoiced sales_order_subtotal_invoiced,
       s_magento_sales_order.subtotal_refunded sales_order_subtotal_refunded,
       s_magento_sales_order.tax_amount sales_order_tax_amount,
       s_magento_sales_order.tax_canceled sales_order_tax_canceled,
       s_magento_sales_order.tax_invoiced sales_order_tax_invoiced,
       s_magento_sales_order.tax_refunded sales_order_tax_refunded,
       s_magento_sales_order.total_canceled sales_order_total_canceled,
       s_magento_sales_order.total_invoiced sales_order_total_invoiced,
       s_magento_sales_order.total_item_count sales_order_total_item_count,
       s_magento_sales_order.total_offline_refunded sales_order_total_offline_refunded,
       s_magento_sales_order.total_online_refunded sales_order_total_online_refunded,
       s_magento_sales_order.x_forwarded_for sales_order_x_forwarded_for,
       s_magento_sales_order.send_email send_email,
       l_magento_sales_order.shipping_address_id shipping_address_id,
       s_magento_sales_order.shipping_amount shipping_amount,
       s_magento_sales_order.shipping_canceled shipping_canceled,
       s_magento_sales_order.shipping_invoiced shipping_invoiced,
       s_magento_sales_order.shipping_method shipping_method,
       s_magento_sales_order.shipping_refunded shipping_refunded,
       s_magento_sales_order.shipping_tax_amount shipping_tax_amount,
       s_magento_sales_order.shipping_tax_refunded shipping_tax_refunded,
       s_magento_sales_order.state state,
       s_magento_sales_order.status status,
       s_magento_sales_order.store_currency_code store_currency_code,
       l_magento_sales_order.store_id store_id,
       s_magento_sales_order.store_name store_name,
       s_magento_sales_order.subtotal subtotal,
       s_magento_sales_order.subtotal_incl_tax subtotal_incl_tax,
       s_magento_sales_order.total_due total_due,
       s_magento_sales_order.total_paid total_paid,
       s_magento_sales_order.total_qty_ordered total_qty_ordered,
       s_magento_sales_order.total_refunded total_refunded,
       s_magento_sales_order.trainer_name trainer_name,
       s_magento_sales_order.updated_at updated_at,
       case when p_magento_sales_order.bk_hash in('-997', '-998', '-999') then p_magento_sales_order.bk_hash
           when s_magento_sales_order.updated_at is null then '-998'
        else convert(varchar, s_magento_sales_order.updated_at, 112)    end updated_dim_date_key,
       case when p_magento_sales_order.bk_hash in ('-997','-998','-999') then p_magento_sales_order.bk_hash
       when s_magento_sales_order.updated_at is null then '-998'
       else '1' + replace(substring(convert(varchar,s_magento_sales_order.updated_at,114), 1, 5),':','') end updated_dim_time_key,
       s_magento_sales_order.weight weight,
       isnull(h_magento_sales_order.dv_deleted,0) dv_deleted,
       p_magento_sales_order.p_magento_sales_order_id,
       p_magento_sales_order.dv_batch_id,
       p_magento_sales_order.dv_load_date_time,
       p_magento_sales_order.dv_load_end_date_time
  from dbo.h_magento_sales_order
  join dbo.p_magento_sales_order
    on h_magento_sales_order.bk_hash = p_magento_sales_order.bk_hash
  join #p_magento_sales_order_insert
    on p_magento_sales_order.bk_hash = #p_magento_sales_order_insert.bk_hash
   and p_magento_sales_order.p_magento_sales_order_id = #p_magento_sales_order_insert.p_magento_sales_order_id
  join dbo.l_magento_sales_order
    on p_magento_sales_order.bk_hash = l_magento_sales_order.bk_hash
   and p_magento_sales_order.l_magento_sales_order_id = l_magento_sales_order.l_magento_sales_order_id
  join dbo.s_magento_sales_order
    on p_magento_sales_order.bk_hash = s_magento_sales_order.bk_hash
   and p_magento_sales_order.s_magento_sales_order_id = s_magento_sales_order.s_magento_sales_order_id

-- do as a single transaction
--   delete records from the dimensional table where the business_key is in #p_*_insert temp table
--   insert records from all of the joins to the pit table and to #p_*_insert temp table
begin tran
  delete dbo.d_magento_sales_order
   where d_magento_sales_order.bk_hash in (select bk_hash from #p_magento_sales_order_insert)

  insert dbo.d_magento_sales_order(
             bk_hash,
             order_id,
             base_rwrd_crrncy_amount_invoiced,
             base_rwrd_crrncy_amount_refnded,
             billing_address_id,
             coupon_code,
             created_at,
             created_dim_date_key,
             created_dim_time_key,
             customer_dob,
             customer_dob_dim_date_key,
             customer_dob_dim_time_key,
             customer_gender,
             customer_group_id,
             customer_is_guest_flag,
             customer_taxvat,
             d_magento_sales_order_address_bk_hash,
             d_workday_employee_trainer_bk_hash,
             dim_magento_customer_key,
             dim_mms_member_key,
             email_sent,
             gw_id,
             increment_id,
             is_virtual_flag,
             m1_order_id,
             member_id,
             order_number,
             paypal_ipn_customer_notified,
             protect_code,
             quote_address_id,
             quote_id,
             reward_points_balance_refund,
             rwrd_crrncy_amount_refunded,
             rwrd_currency_amount_invoiced,
             sales_order_adjustment_negative,
             sales_order_adjustment_positive,
             sales_order_applied_rule_ids,
             sales_order_base_adjustment_negative,
             sales_order_base_adjustment_positive,
             sales_order_base_currency_code,
             sales_order_base_customer_balance_amount,
             sales_order_base_customer_balance_invoiced,
             sales_order_base_customer_balance_refunded,
             sales_order_base_discount_amount,
             sales_order_base_discount_canceled,
             sales_order_base_discount_invoiced,
             sales_order_base_discount_refunded,
             sales_order_base_discount_tax_compensation_amount,
             sales_order_base_discount_tax_compensation_invoiced,
             sales_order_base_discount_tax_compensation_refunded,
             sales_order_base_gift_cards_amount,
             sales_order_base_gift_cards_invoiced,
             sales_order_base_gift_cards_refunded,
             sales_order_base_grand_total,
             sales_order_base_reward_currency_amount,
             sales_order_base_shipping_amount,
             sales_order_base_shipping_canceled,
             sales_order_base_shipping_discount_amount,
             sales_order_base_shipping_discount_tax_compensation_amount,
             sales_order_base_shipping_incl_tax,
             sales_order_base_shipping_invoiced,
             sales_order_base_shipping_refunded,
             sales_order_base_shipping_tax_amount,
             sales_order_base_shipping_tax_refunded,
             sales_order_base_subtotal,
             sales_order_base_subtotal_canceled,
             sales_order_base_subtotal_incl_tax,
             sales_order_base_subtotal_invoiced,
             sales_order_base_subtotal_refunded,
             sales_order_base_tax_amount,
             sales_order_base_tax_canceled,
             sales_order_base_tax_invoiced,
             sales_order_base_tax_refunded,
             sales_order_base_to_global_rate,
             sales_order_base_to_order_rate,
             sales_order_base_total_canceled,
             sales_order_base_total_due,
             sales_order_base_total_invoiced,
             sales_order_base_total_invoiced_cost,
             sales_order_base_total_offline_refunded,
             sales_order_base_total_online_refunded,
             sales_order_base_total_paid,
             sales_order_base_total_qty_ordered,
             sales_order_base_total_refunded,
             sales_order_bs_customer_bal_total_refunded,
             sales_order_can_ship_partially,
             sales_order_can_ship_partially_item,
             sales_order_coupon_rule_name,
             sales_order_customer_bal_total_refunded,
             sales_order_customer_balance_amount,
             sales_order_customer_balance_invoiced,
             sales_order_customer_balance_refunded,
             sales_order_customer_note_notify,
             sales_order_discount_amount,
             sales_order_discount_canceled,
             sales_order_discount_description,
             sales_order_discount_invoiced,
             sales_order_discount_refunded,
             sales_order_discount_tax_compensation_amount,
             sales_order_discount_tax_compensation_invoiced,
             sales_order_discount_tax_compensation_refunded,
             sales_order_edit_increment,
             sales_order_ext_customer_id,
             sales_order_ext_order_id,
             sales_order_forced_shipment_with_invoice,
             sales_order_gift_cards_amount,
             sales_order_gift_cards_invoiced,
             sales_order_gift_cards_refunded,
             sales_order_gift_message_id,
             sales_order_global_currency_code,
             sales_order_grand_total,
             sales_order_gw_add_card,
             sales_order_gw_allow_gift_receipt,
             sales_order_gw_card_base_price_incl_tax,
             sales_order_gw_card_base_price_invoiced,
             sales_order_gw_card_base_price_refunded,
             sales_order_gw_card_base_tax_amount,
             sales_order_gw_card_base_tax_invoiced,
             sales_order_gw_card_base_tax_refunded,
             sales_order_gw_card_price_incl_tax,
             sales_order_gw_card_price_invoiced,
             sales_order_gw_card_price_refunded,
             sales_order_gw_card_tax_amount,
             sales_order_gw_card_tax_invoiced,
             sales_order_gw_card_tax_refunded,
             sales_order_hold_before_state,
             sales_order_hold_before_status,
             sales_order_lt_bucks_redeemed,
             sales_order_lt_bucks_refunded,
             sales_order_mms_party_id,
             sales_order_order_currency_code,
             sales_order_original_increment_id,
             sales_order_payment_auth_expiration,
             sales_order_payment_authorization_amount,
             sales_order_relation_child_id,
             sales_order_relation_child_real_id,
             sales_order_relation_parent_id,
             sales_order_relation_parent_real_id,
             sales_order_remote_ip,
             sales_order_reward_currency_amount,
             sales_order_reward_points_balance,
             sales_order_shipping_discount_amount,
             sales_order_shipping_discount_tax_compensation_amount,
             sales_order_shipping_incl_tax,
             sales_order_store_to_base_rate,
             sales_order_store_to_order_rate,
             sales_order_subtotal_canceled,
             sales_order_subtotal_invoiced,
             sales_order_subtotal_refunded,
             sales_order_tax_amount,
             sales_order_tax_canceled,
             sales_order_tax_invoiced,
             sales_order_tax_refunded,
             sales_order_total_canceled,
             sales_order_total_invoiced,
             sales_order_total_item_count,
             sales_order_total_offline_refunded,
             sales_order_total_online_refunded,
             sales_order_x_forwarded_for,
             send_email,
             shipping_address_id,
             shipping_amount,
             shipping_canceled,
             shipping_invoiced,
             shipping_method,
             shipping_refunded,
             shipping_tax_amount,
             shipping_tax_refunded,
             state,
             status,
             store_currency_code,
             store_id,
             store_name,
             subtotal,
             subtotal_incl_tax,
             total_due,
             total_paid,
             total_qty_ordered,
             total_refunded,
             trainer_name,
             updated_at,
             updated_dim_date_key,
             updated_dim_time_key,
             weight,
             deleted_flag,
             p_magento_sales_order_id,
             dv_load_date_time,
             dv_load_end_date_time,
             dv_batch_id,
             dv_inserted_date_time,
             dv_insert_user)
  select bk_hash,
         order_id,
         base_rwrd_crrncy_amount_invoiced,
         base_rwrd_crrncy_amount_refnded,
         billing_address_id,
         coupon_code,
         created_at,
         created_dim_date_key,
         created_dim_time_key,
         customer_dob,
         customer_dob_dim_date_key,
         customer_dob_dim_time_key,
         customer_gender,
         customer_group_id,
         customer_is_guest_flag,
         customer_taxvat,
         d_magento_sales_order_address_bk_hash,
         d_workday_employee_trainer_bk_hash,
         dim_magento_customer_key,
         dim_mms_member_key,
         email_sent,
         gw_id,
         increment_id,
         is_virtual_flag,
         m1_order_id,
         member_id,
         order_number,
         paypal_ipn_customer_notified,
         protect_code,
         quote_address_id,
         quote_id,
         reward_points_balance_refund,
         rwrd_crrncy_amount_refunded,
         rwrd_currency_amount_invoiced,
         sales_order_adjustment_negative,
         sales_order_adjustment_positive,
         sales_order_applied_rule_ids,
         sales_order_base_adjustment_negative,
         sales_order_base_adjustment_positive,
         sales_order_base_currency_code,
         sales_order_base_customer_balance_amount,
         sales_order_base_customer_balance_invoiced,
         sales_order_base_customer_balance_refunded,
         sales_order_base_discount_amount,
         sales_order_base_discount_canceled,
         sales_order_base_discount_invoiced,
         sales_order_base_discount_refunded,
         sales_order_base_discount_tax_compensation_amount,
         sales_order_base_discount_tax_compensation_invoiced,
         sales_order_base_discount_tax_compensation_refunded,
         sales_order_base_gift_cards_amount,
         sales_order_base_gift_cards_invoiced,
         sales_order_base_gift_cards_refunded,
         sales_order_base_grand_total,
         sales_order_base_reward_currency_amount,
         sales_order_base_shipping_amount,
         sales_order_base_shipping_canceled,
         sales_order_base_shipping_discount_amount,
         sales_order_base_shipping_discount_tax_compensation_amount,
         sales_order_base_shipping_incl_tax,
         sales_order_base_shipping_invoiced,
         sales_order_base_shipping_refunded,
         sales_order_base_shipping_tax_amount,
         sales_order_base_shipping_tax_refunded,
         sales_order_base_subtotal,
         sales_order_base_subtotal_canceled,
         sales_order_base_subtotal_incl_tax,
         sales_order_base_subtotal_invoiced,
         sales_order_base_subtotal_refunded,
         sales_order_base_tax_amount,
         sales_order_base_tax_canceled,
         sales_order_base_tax_invoiced,
         sales_order_base_tax_refunded,
         sales_order_base_to_global_rate,
         sales_order_base_to_order_rate,
         sales_order_base_total_canceled,
         sales_order_base_total_due,
         sales_order_base_total_invoiced,
         sales_order_base_total_invoiced_cost,
         sales_order_base_total_offline_refunded,
         sales_order_base_total_online_refunded,
         sales_order_base_total_paid,
         sales_order_base_total_qty_ordered,
         sales_order_base_total_refunded,
         sales_order_bs_customer_bal_total_refunded,
         sales_order_can_ship_partially,
         sales_order_can_ship_partially_item,
         sales_order_coupon_rule_name,
         sales_order_customer_bal_total_refunded,
         sales_order_customer_balance_amount,
         sales_order_customer_balance_invoiced,
         sales_order_customer_balance_refunded,
         sales_order_customer_note_notify,
         sales_order_discount_amount,
         sales_order_discount_canceled,
         sales_order_discount_description,
         sales_order_discount_invoiced,
         sales_order_discount_refunded,
         sales_order_discount_tax_compensation_amount,
         sales_order_discount_tax_compensation_invoiced,
         sales_order_discount_tax_compensation_refunded,
         sales_order_edit_increment,
         sales_order_ext_customer_id,
         sales_order_ext_order_id,
         sales_order_forced_shipment_with_invoice,
         sales_order_gift_cards_amount,
         sales_order_gift_cards_invoiced,
         sales_order_gift_cards_refunded,
         sales_order_gift_message_id,
         sales_order_global_currency_code,
         sales_order_grand_total,
         sales_order_gw_add_card,
         sales_order_gw_allow_gift_receipt,
         sales_order_gw_card_base_price_incl_tax,
         sales_order_gw_card_base_price_invoiced,
         sales_order_gw_card_base_price_refunded,
         sales_order_gw_card_base_tax_amount,
         sales_order_gw_card_base_tax_invoiced,
         sales_order_gw_card_base_tax_refunded,
         sales_order_gw_card_price_incl_tax,
         sales_order_gw_card_price_invoiced,
         sales_order_gw_card_price_refunded,
         sales_order_gw_card_tax_amount,
         sales_order_gw_card_tax_invoiced,
         sales_order_gw_card_tax_refunded,
         sales_order_hold_before_state,
         sales_order_hold_before_status,
         sales_order_lt_bucks_redeemed,
         sales_order_lt_bucks_refunded,
         sales_order_mms_party_id,
         sales_order_order_currency_code,
         sales_order_original_increment_id,
         sales_order_payment_auth_expiration,
         sales_order_payment_authorization_amount,
         sales_order_relation_child_id,
         sales_order_relation_child_real_id,
         sales_order_relation_parent_id,
         sales_order_relation_parent_real_id,
         sales_order_remote_ip,
         sales_order_reward_currency_amount,
         sales_order_reward_points_balance,
         sales_order_shipping_discount_amount,
         sales_order_shipping_discount_tax_compensation_amount,
         sales_order_shipping_incl_tax,
         sales_order_store_to_base_rate,
         sales_order_store_to_order_rate,
         sales_order_subtotal_canceled,
         sales_order_subtotal_invoiced,
         sales_order_subtotal_refunded,
         sales_order_tax_amount,
         sales_order_tax_canceled,
         sales_order_tax_invoiced,
         sales_order_tax_refunded,
         sales_order_total_canceled,
         sales_order_total_invoiced,
         sales_order_total_item_count,
         sales_order_total_offline_refunded,
         sales_order_total_online_refunded,
         sales_order_x_forwarded_for,
         send_email,
         shipping_address_id,
         shipping_amount,
         shipping_canceled,
         shipping_invoiced,
         shipping_method,
         shipping_refunded,
         shipping_tax_amount,
         shipping_tax_refunded,
         state,
         status,
         store_currency_code,
         store_id,
         store_name,
         subtotal,
         subtotal_incl_tax,
         total_due,
         total_paid,
         total_qty_ordered,
         total_refunded,
         trainer_name,
         updated_at,
         updated_dim_date_key,
         updated_dim_time_key,
         weight,
         dv_deleted,
         p_magento_sales_order_id,
         dv_load_date_time,
         dv_load_end_date_time,
         dv_batch_id,
         getdate(),
         suser_sname()
    from #insert
commit tran

--force replication
set @max_dv_batch_id = (select isnull(max(dv_batch_id),-2) from d_magento_sales_order)
--Done!
end