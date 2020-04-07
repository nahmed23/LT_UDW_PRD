﻿CREATE PROC [dbo].[proc_d_spabiz_service_charge] @current_dv_batch_id [bigint] AS
begin

set nocount on
set xact_abort on

--Start!
-- Get the @max_dv_batch_id from dimension/fact.  Use -2 if there aren't any records.
declare @max_dv_batch_id bigint = (select isnull(max(dv_batch_id),-2) from d_spabiz_service_charge)

-- Find the PIT records with dv_batch_id > @max_dv_batch_id
-- and find the PIT records with dv_batch_id = @current_dv_batch_id since those need to be deleted in case of a retry
if object_id('tempdb..#p_spabiz_service_charge_insert') is not null drop table #p_spabiz_service_charge_insert
create table dbo.#p_spabiz_service_charge_insert with(distribution=hash(bk_hash), location=user_db) as
select p_spabiz_service_charge.p_spabiz_service_charge_id,
       p_spabiz_service_charge.bk_hash
  from dbo.p_spabiz_service_charge
 where p_spabiz_service_charge.dv_load_end_date_time = convert(datetime,'9999.12.31',102)
   and (p_spabiz_service_charge.dv_batch_id > @max_dv_batch_id
        or p_spabiz_service_charge.dv_batch_id = @current_dv_batch_id)

-- calculate all values of the records to be inserted to make the actual update go as fast as possible
if object_id('tempdb..#insert') is not null drop table #insert
create table dbo.#insert with(distribution=hash(bk_hash), location=user_db) as
select p_spabiz_service_charge.bk_hash,
       p_spabiz_service_charge.bk_hash dim_spabiz_service_charge_type_key,
       p_spabiz_service_charge.service_charge_id service_charge_id,
       p_spabiz_service_charge.store_number store_number,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then null
             else delete_date
        end deleted_date_time,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 'N'
            when s_spabiz_service_charge.service_charge_delete = -1 then 'Y'
            else 'N'
        end deleted_flag,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then p_spabiz_service_charge.bk_hash
            when l_spabiz_service_charge.staff_id is null then '-998'
            when l_spabiz_service_charge.staff_id = 0 then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(l_spabiz_service_charge.staff_id as varchar(500)),'z#@$k%&P')+'P%#&z$@k'+isnull(cast(l_spabiz_service_charge.store_number as varchar(500)),'z#@$k%&P'))),2)
        end dim_spabiz_staff_key,
       s_spabiz_service_charge.edit_time edit_date_time,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 'N'
            when s_spabiz_service_charge.enabled = 1 then 'Y'
            else 'N'
        end enabled_flag,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 'N'
            when s_spabiz_service_charge.pay_commission = 1 then 'Y'
            else 'N'
        end pay_commission_flag,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then ''
             else l_spabiz_service_charge.quick_id
        end quick_id,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 0
            else s_spabiz_service_charge.amount
        end service_charge_amount,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 'N'
             when s_spabiz_service_charge.computed_on = 1 then 'Y'
             else 'N'
        end service_charge_computed_by_percent_flag,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then ''
            when s_spabiz_service_charge.display_name is null then ''
            else s_spabiz_service_charge.display_name
        end service_charge_display_name,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then ''
            when s_spabiz_service_charge.name is null then ''
            else s_spabiz_service_charge.name
        end service_charge_name,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 0
            else s_spabiz_service_charge.dollar_percent
        end service_charge_percent,
       case when p_spabiz_service_charge.bk_hash in ('-997','-998','-999') then 'N'
             when s_spabiz_service_charge.taxable = 1 then 'Y'
             else 'N'
        end taxable_flag,
       p_spabiz_service_charge.p_spabiz_service_charge_id,
       p_spabiz_service_charge.dv_batch_id,
       p_spabiz_service_charge.dv_load_date_time,
       p_spabiz_service_charge.dv_load_end_date_time
  from dbo.p_spabiz_service_charge
  join #p_spabiz_service_charge_insert
    on p_spabiz_service_charge.bk_hash = #p_spabiz_service_charge_insert.bk_hash
   and p_spabiz_service_charge.p_spabiz_service_charge_id = #p_spabiz_service_charge_insert.p_spabiz_service_charge_id
  join dbo.l_spabiz_service_charge
    on p_spabiz_service_charge.bk_hash = l_spabiz_service_charge.bk_hash
   and p_spabiz_service_charge.l_spabiz_service_charge_id = l_spabiz_service_charge.l_spabiz_service_charge_id
  join dbo.s_spabiz_service_charge
    on p_spabiz_service_charge.bk_hash = s_spabiz_service_charge.bk_hash
   and p_spabiz_service_charge.s_spabiz_service_charge_id = s_spabiz_service_charge.s_spabiz_service_charge_id
 where l_spabiz_service_charge.store_number not in (1,100,999) OR p_spabiz_service_charge.bk_hash in ('-999','-998','-997')

-- do as a single transaction
--   delete records from the dimensional table where the business_key is in #p_*_insert temp table
--   insert records from all of the joins to the pit table and to #p_*_insert temp table
begin tran
  delete dbo.d_spabiz_service_charge
   where d_spabiz_service_charge.bk_hash in (select bk_hash from #p_spabiz_service_charge_insert)

  insert dbo.d_spabiz_service_charge(
             bk_hash,
             dim_spabiz_service_charge_type_key,
             service_charge_id,
             store_number,
             deleted_date_time,
             deleted_flag,
             dim_spabiz_staff_key,
             edit_date_time,
             enabled_flag,
             pay_commission_flag,
             quick_id,
             service_charge_amount,
             service_charge_computed_by_percent_flag,
             service_charge_display_name,
             service_charge_name,
             service_charge_percent,
             taxable_flag,
             p_spabiz_service_charge_id,
             dv_load_date_time,
             dv_load_end_date_time,
             dv_batch_id,
             dv_inserted_date_time,
             dv_insert_user)
  select bk_hash,
         dim_spabiz_service_charge_type_key,
         service_charge_id,
         store_number,
         deleted_date_time,
         deleted_flag,
         dim_spabiz_staff_key,
         edit_date_time,
         enabled_flag,
         pay_commission_flag,
         quick_id,
         service_charge_amount,
         service_charge_computed_by_percent_flag,
         service_charge_display_name,
         service_charge_name,
         service_charge_percent,
         taxable_flag,
         p_spabiz_service_charge_id,
         dv_load_date_time,
         dv_load_end_date_time,
         dv_batch_id,
         getdate(),
         suser_sname()
    from #insert
commit tran

--force replication
set @max_dv_batch_id = (select isnull(max(dv_batch_id),-2) from d_spabiz_service_charge)
--Done!
end
