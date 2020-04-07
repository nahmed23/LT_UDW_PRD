﻿CREATE PROC [dbo].[proc_d_dim_spabiz_block_time_reason] @current_dv_batch_id [bigint] AS
begin

set nocount on
set xact_abort on

--Start!
exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason','proc_d_dim_spabiz_block_time_reason start',@current_dv_batch_id

-- Get the @max_dv_batch_id from dimension/fact.  Use -2 if there aren't any records.
exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason','max dv_batch_id',@current_dv_batch_id
if object_id('tempdb..#batch_id') is not null drop table #batch_id
create table dbo.#batch_id with(distribution=round_robin, location=user_db, heap) as
select isnull(max(dv_batch_id),-2) max_dv_batch_id,
       @current_dv_batch_id as current_dv_batch_id
  from dbo.d_dim_spabiz_block_time_reason

-- Find the PIT records with dv_batch_id > @max_dv_batch_id
-- and find the PIT records with dv_batch_id = @current_dv_batch_id since those need to be deleted in case of a retry
exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason','#p_spabiz_block_time_insert',@current_dv_batch_id
if object_id('tempdb..#p_spabiz_block_time_insert') is not null drop table #p_spabiz_block_time_insert
create table dbo.#p_spabiz_block_time_insert with(distribution=round_robin, location=user_db, heap) as
select p_spabiz_block_time.p_spabiz_block_time_id,
       p_spabiz_block_time.bk_hash,
       row_number() over (order by p_spabiz_block_time_id) row_num
  from dbo.p_spabiz_block_time
  join #batch_id
    on p_spabiz_block_time.dv_batch_id > #batch_id.max_dv_batch_id
    or p_spabiz_block_time.dv_batch_id = #batch_id.current_dv_batch_id
 where p_spabiz_block_time.dv_load_end_date_time = convert(datetime,'9999.12.31',102)

-- calculate all values of the records to be inserted to make the actual update go as fast as possible
exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason','#insert',@current_dv_batch_id
if object_id('tempdb..#insert') is not null drop table #insert
create table dbo.#insert with(distribution=round_robin, location=user_db, heap) as
select #p_spabiz_block_time_insert.row_num,
       p_spabiz_block_time.bk_hash d_dim_spabiz_block_time_reason_key,
       p_spabiz_block_time.block_time_id block_time_reason_id,
       p_spabiz_block_time.store_number store_number,
       case when p_spabiz_block_time.bk_hash in ('-997','-998','-999') then null
            when s_spabiz_block_time.delete_date = convert(date, '18991230', 112) then null
            else s_spabiz_block_time.delete_date
        end deleted_date_time,
       case when p_spabiz_block_time.bk_hash in ('-997','-998','-999') then 'N'
            when s_spabiz_block_time.block_time_delete = -1 then 'Y'
            else 'N'
        end deleted_flag,
       case when p_spabiz_block_time.bk_hash in ('-997','-998','-999') then p_spabiz_block_time.bk_hash
            when l_spabiz_block_time.store_number is null then '-998'
            when l_spabiz_block_time.store_number = 0 then '-998'
            else convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(l_spabiz_block_time.store_number as varchar(500)),'z#@$k%&P'))),2)
        end dim_spabiz_store_key,
       case when p_spabiz_block_time.bk_hash in ('-997','-998','-999') then null
            when s_spabiz_block_time.edit_time = convert(date, '18991230', 112) then null
            else s_spabiz_block_time.edit_time
        end edit_date_time,
       case when s_spabiz_block_time.name is null then ''
            else s_spabiz_block_time.name
        end name,
       case when p_spabiz_block_time.bk_hash in ('-997','-998','-999') then 'N'
            when s_spabiz_block_time.reduces_productivity = 1 then 'Y'
            else 'N'
        end reduces_productivity_flag,
       p_spabiz_block_time.p_spabiz_block_time_id,
       p_spabiz_block_time.dv_batch_id,
       p_spabiz_block_time.dv_load_date_time,
       p_spabiz_block_time.dv_load_end_date_time
  from dbo.p_spabiz_block_time
  join #p_spabiz_block_time_insert
    on p_spabiz_block_time.p_spabiz_block_time_id = #p_spabiz_block_time_insert.p_spabiz_block_time_id
  join dbo.l_spabiz_block_time
    on p_spabiz_block_time.l_spabiz_block_time_id = l_spabiz_block_time.l_spabiz_block_time_id
  join dbo.s_spabiz_block_time
    on p_spabiz_block_time.s_spabiz_block_time_id = s_spabiz_block_time.s_spabiz_block_time_id
 where l_spabiz_block_time.store_number not in (1,100,999) OR p_spabiz_block_time.bk_hash in ('-999','-998','-997')

declare @start int, @end int, @task_description varchar(50)
declare @start_p_id bigint
declare @insert_count bigint
set @start = 1
set @end = (select max(row_num) from #insert)

while @start <= @end
begin

    set @insert_count = isnull((select count(*) from #insert where row_num >= @start and row_num < @start+1000000),0)
    exec dbo.proc_util_sequence_number_get_next @table_name = 'd_dim_spabiz_block_time_reason', @id_count = @insert_count, @start_id = @start_p_id out

-- do as a single transaction
--   delete records from the dimensional table where the business_key is in #p_*_insert temp table
--   insert records from all of the joins to the pit table and to #p_*_insert temp table
    set @task_description = 'final insert/update '+cast(@start as varchar)+' of '+cast(@end as varchar)
    exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason',@task_description,@current_dv_batch_id
    begin tran
      delete dbo.d_dim_spabiz_block_time_reason
       where d_dim_spabiz_block_time_reason.d_dim_spabiz_block_time_reason_key in (select bk_hash from #p_spabiz_block_time_insert where row_num >= @start and row_num < @start+1000000)

      insert dbo.d_dim_spabiz_block_time_reason(
                 d_dim_spabiz_block_time_reason_id,
                 d_dim_spabiz_block_time_reason_key,
                 block_time_reason_id,
                 store_number,
                 deleted_date_time,
                 deleted_flag,
                 dim_spabiz_store_key,
                 edit_date_time,
                 name,
                 reduces_productivity_flag,
                 p_spabiz_block_time_id,
                 dv_load_date_time,
                 dv_load_end_date_time,
                 dv_batch_id,
                 dv_inserted_date_time,
                 dv_insert_user)
      select @start_p_id + row_num,
             d_dim_spabiz_block_time_reason_key,
             block_time_reason_id,
             store_number,
             deleted_date_time,
             deleted_flag,
             dim_spabiz_store_key,
             edit_date_time,
             name,
             reduces_productivity_flag,
             p_spabiz_block_time_id,
             dv_load_date_time,
             dv_load_end_date_time,
             dv_batch_id,
             getdate(),
             suser_sname()
        from #insert
       where row_num >= @start
         and row_num < @start+1000000
    commit tran

    set @start = @start+1000000
end

--Done!
exec dbo.proc_util_task_status_insert 'proc_d_dim_spabiz_block_time_reason','proc_d_dim_spabiz_block_time_reason end',@current_dv_batch_id
end
