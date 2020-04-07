﻿CREATE PROC [dbo].[proc_d_spabiz_service] @current_dv_batch_id [bigint] AS
begin

set nocount on
set xact_abort on

--Start!
-- Get the @max_dv_batch_id from dimension/fact.  Use -2 if there aren't any records.
declare @max_dv_batch_id bigint = (select isnull(max(dv_batch_id),-2) from d_spabiz_service)

-- Find the PIT records with dv_batch_id > @max_dv_batch_id
-- and find the PIT records with dv_batch_id = @current_dv_batch_id since those need to be deleted in case of a retry
if object_id('tempdb..#p_spabiz_service_insert') is not null drop table #p_spabiz_service_insert
create table dbo.#p_spabiz_service_insert with(distribution=hash(bk_hash), location=user_db) as
select p_spabiz_service.p_spabiz_service_id,
       p_spabiz_service.bk_hash
  from dbo.p_spabiz_service
 where p_spabiz_service.dv_load_end_date_time = convert(datetime,'9999.12.31',102)
   and (p_spabiz_service.dv_batch_id > @max_dv_batch_id
        or p_spabiz_service.dv_batch_id = @current_dv_batch_id)

-- calculate all values of the records to be inserted to make the actual update go as fast as possible
if object_id('tempdb..#insert') is not null drop table #insert
create table dbo.#insert with(distribution=hash(bk_hash), location=user_db) as
select p_spabiz_service.bk_hash,
       p_spabiz_service.bk_hash dim_spabiz_service_key,
       p_spabiz_service.service_id service_id,
       p_spabiz_service.store_number store_number,
       case when s_spabiz_service.book_name is null then ''
            else s_spabiz_service.book_name
        end book_name,
       s_spabiz_service.call_after_x_days call_after_x_days,
       case when s_spabiz_service.is_color_balance = 1 then 'Y'
            else 'N'
        end color_balance_flag,
       case when s_spabiz_service.cost is null then 0
            else s_spabiz_service.cost
        end cost,
       s_spabiz_service.cost_type cost_type,
       s_spabiz_service.date_created created_date_time,
       case when p_spabiz_service.bk_hash in ('-997','-998','-999') then null
            when s_spabiz_service.delete_date = convert(date, '18991230', 112) then null
            else s_spabiz_service.delete_date
        end deleted_date_time,
       case when s_spabiz_service.service_delete = -1 then 'Y'
            else 'N'
        end deleted_flag,
       case when p_spabiz_service.bk_hash in ('-997','-998','-999') then p_spabiz_service.bk_hash
            when l_spabiz_service.dept_cat is null then '-998'
            when l_spabiz_service.dept_cat = 0 then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(l_spabiz_service.dept_cat as varchar(500)),'z#@$k%&P')+'P%#&z$@k'+isnull(cast(l_spabiz_service.store_number as varchar(500)),'z#@$k%&P'))),2)
        end dim_spabiz_category_key,
       case when p_spabiz_service.bk_hash in ('-997','-998','-999') then p_spabiz_service.bk_hash
            when l_spabiz_service.store_number is null then '-998'
            when l_spabiz_service.store_number = 0 then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(l_spabiz_service.store_number as varchar(500)),'z#@$k%&P'))),2)
        end dim_spabiz_store_key,
       s_spabiz_service.edit_time edit_date_time,
       s_spabiz_service.finish finish,
       case when s_spabiz_service.cost_type = 0 then 'Y'
            else 'N'
        end fixed_currency_amount_flag,
       isnull(l_spabiz_service.gl_account,'0') gl_account,
       case when s_spabiz_service.is_hilite_procedure = 1 then 'Y'
            else 'N'
        end highlight_procedure_flag,
       s_spabiz_service.new_extra_time new_customer_extra_time,
       case when s_spabiz_service.pay_comish = 1 then 'Y'
            else 'N'
        end pay_commission_flag,
       case when s_spabiz_service.cost_type = 1 then 'Y'
            else 'N'
        end percent_of_total_price_flag,
       case when s_spabiz_service.quick_id is null then ''
            else s_spabiz_service.quick_id
        end quick_id,
       case when s_spabiz_service.require_staff = 1 then 'Y'
            else 'N'
        end require_staff_flag,
       s_spabiz_service.resource_count resource_count,
       s_spabiz_service.retail_price retail_price,
       isnull(s_spabiz_service.description,'') service_description,
       s_spabiz_service.service_level service_level,
       case when s_spabiz_service.name is null then ''
            else s_spabiz_service.name
        end service_name,
       s_spabiz_service.process service_process,
       s_spabiz_service.time service_time,
       case when s_spabiz_service.taxable = 1 then 'Y'
            else 'N'
        end taxable_flag,
       case when s_spabiz_service.web_book = 1 then 'Y'
            else 'N'
        end web_book_flag,
       case when s_spabiz_service.web_view = 1 then 'Y'
            else 'N'
        end web_view_flag,
       p_spabiz_service.p_spabiz_service_id,
       p_spabiz_service.dv_batch_id,
       p_spabiz_service.dv_load_date_time,
       p_spabiz_service.dv_load_end_date_time
  from dbo.h_spabiz_service
  join dbo.p_spabiz_service
    on h_spabiz_service.bk_hash = p_spabiz_service.bk_hash  join #p_spabiz_service_insert
    on p_spabiz_service.bk_hash = #p_spabiz_service_insert.bk_hash
   and p_spabiz_service.p_spabiz_service_id = #p_spabiz_service_insert.p_spabiz_service_id
  join dbo.l_spabiz_service
    on p_spabiz_service.bk_hash = l_spabiz_service.bk_hash
   and p_spabiz_service.l_spabiz_service_id = l_spabiz_service.l_spabiz_service_id
  join dbo.s_spabiz_service
    on p_spabiz_service.bk_hash = s_spabiz_service.bk_hash
   and p_spabiz_service.s_spabiz_service_id = s_spabiz_service.s_spabiz_service_id
 where l_spabiz_service.store_number not in (1,100,999) OR p_spabiz_service.bk_hash in ('-999','-998','-997')

-- do as a single transaction
--   delete records from the dimensional table where the business_key is in #p_*_insert temp table
--   insert records from all of the joins to the pit table and to #p_*_insert temp table
begin tran
  delete dbo.d_spabiz_service
   where d_spabiz_service.bk_hash in (select bk_hash from #p_spabiz_service_insert)

  insert dbo.d_spabiz_service(
             bk_hash,
             dim_spabiz_service_key,
             service_id,
             store_number,
             book_name,
             call_after_x_days,
             color_balance_flag,
             cost,
             cost_type,
             created_date_time,
             deleted_date_time,
             deleted_flag,
             dim_spabiz_category_key,
             dim_spabiz_store_key,
             edit_date_time,
             finish,
             fixed_currency_amount_flag,
             gl_account,
             highlight_procedure_flag,
             new_customer_extra_time,
             pay_commission_flag,
             percent_of_total_price_flag,
             quick_id,
             require_staff_flag,
             resource_count,
             retail_price,
             service_description,
             service_level,
             service_name,
             service_process,
             service_time,
             taxable_flag,
             web_book_flag,
             web_view_flag,
             p_spabiz_service_id,
             dv_load_date_time,
             dv_load_end_date_time,
             dv_batch_id,
             dv_inserted_date_time,
             dv_insert_user)
  select bk_hash,
         dim_spabiz_service_key,
         service_id,
         store_number,
         book_name,
         call_after_x_days,
         color_balance_flag,
         cost,
         cost_type,
         created_date_time,
         deleted_date_time,
         deleted_flag,
         dim_spabiz_category_key,
         dim_spabiz_store_key,
         edit_date_time,
         finish,
         fixed_currency_amount_flag,
         gl_account,
         highlight_procedure_flag,
         new_customer_extra_time,
         pay_commission_flag,
         percent_of_total_price_flag,
         quick_id,
         require_staff_flag,
         resource_count,
         retail_price,
         service_description,
         service_level,
         service_name,
         service_process,
         service_time,
         taxable_flag,
         web_book_flag,
         web_view_flag,
         p_spabiz_service_id,
         dv_load_date_time,
         dv_load_end_date_time,
         dv_batch_id,
         getdate(),
         suser_sname()
    from #insert
commit tran

--force replication
set @max_dv_batch_id = (select isnull(max(dv_batch_id),-2) from d_spabiz_service)
--Done!
end
