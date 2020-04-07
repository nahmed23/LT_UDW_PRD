﻿CREATE PROC [dbo].[proc_etl_magento_catalog_product_entity_datetime] @current_dv_batch_id [bigint],@job_start_date_time_varchar [varchar](19) AS
begin

set nocount on
set xact_abort on

--Start!
declare @job_start_date_time datetime
set @job_start_date_time = convert(datetime,@job_start_date_time_varchar,120)

declare @user varchar(50) = suser_sname()
declare @insert_date_time datetime

truncate table stage_hash_magento_catalog_product_entity_datetime

set @insert_date_time = getdate()
insert into dbo.stage_hash_magento_catalog_product_entity_datetime (
       bk_hash,
       value_id,
       attribute_id,
       store_id,
       row_id,
       value,
       dummy_modified_date_time,
       dv_load_date_time,
       dv_batch_id)
select convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(value_id as varchar(500)),'z#@$k%&P'))),2) bk_hash,
       value_id,
       attribute_id,
       store_id,
       row_id,
       value,
       dummy_modified_date_time,
       isnull(cast(stage_magento_catalog_product_entity_datetime.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       dv_batch_id
  from stage_magento_catalog_product_entity_datetime
 where dv_batch_id = @current_dv_batch_id

--Run PIT proc for retry logic
exec dbo.proc_p_magento_catalog_product_entity_datetime @current_dv_batch_id

--Insert/update new hub business keys
set @insert_date_time = getdate()
insert into h_magento_catalog_product_entity_datetime (
       bk_hash,
       value_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_inserted_date_time,
       dv_insert_user)
select stage_hash_magento_catalog_product_entity_datetime.bk_hash,
       stage_hash_magento_catalog_product_entity_datetime.value_id value_id,
       isnull(cast(stage_hash_magento_catalog_product_entity_datetime.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       @current_dv_batch_id,
       39,
       @insert_date_time,
       @user
  from stage_hash_magento_catalog_product_entity_datetime
  left join h_magento_catalog_product_entity_datetime
    on stage_hash_magento_catalog_product_entity_datetime.bk_hash = h_magento_catalog_product_entity_datetime.bk_hash
 where h_magento_catalog_product_entity_datetime_id is null
   and stage_hash_magento_catalog_product_entity_datetime.dv_batch_id = @current_dv_batch_id

--calculate hash and lookup to current l_magento_catalog_product_entity_datetime
if object_id('tempdb..#l_magento_catalog_product_entity_datetime_inserts') is not null drop table #l_magento_catalog_product_entity_datetime_inserts
create table #l_magento_catalog_product_entity_datetime_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_magento_catalog_product_entity_datetime.bk_hash,
       stage_hash_magento_catalog_product_entity_datetime.value_id value_id,
       stage_hash_magento_catalog_product_entity_datetime.attribute_id attribute_id,
       stage_hash_magento_catalog_product_entity_datetime.store_id store_id,
       stage_hash_magento_catalog_product_entity_datetime.row_id row_id,
       isnull(cast(stage_hash_magento_catalog_product_entity_datetime.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_magento_catalog_product_entity_datetime.value_id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_magento_catalog_product_entity_datetime.attribute_id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_magento_catalog_product_entity_datetime.store_id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_magento_catalog_product_entity_datetime.row_id as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_magento_catalog_product_entity_datetime
 where stage_hash_magento_catalog_product_entity_datetime.dv_batch_id = @current_dv_batch_id

--Insert all updated and new l_magento_catalog_product_entity_datetime records
set @insert_date_time = getdate()
insert into l_magento_catalog_product_entity_datetime (
       bk_hash,
       value_id,
       attribute_id,
       store_id,
       row_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #l_magento_catalog_product_entity_datetime_inserts.bk_hash,
       #l_magento_catalog_product_entity_datetime_inserts.value_id,
       #l_magento_catalog_product_entity_datetime_inserts.attribute_id,
       #l_magento_catalog_product_entity_datetime_inserts.store_id,
       #l_magento_catalog_product_entity_datetime_inserts.row_id,
       case when l_magento_catalog_product_entity_datetime.l_magento_catalog_product_entity_datetime_id is null then isnull(#l_magento_catalog_product_entity_datetime_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       39,
       #l_magento_catalog_product_entity_datetime_inserts.source_hash,
       @insert_date_time,
       @user
  from #l_magento_catalog_product_entity_datetime_inserts
  left join p_magento_catalog_product_entity_datetime
    on #l_magento_catalog_product_entity_datetime_inserts.bk_hash = p_magento_catalog_product_entity_datetime.bk_hash
   and p_magento_catalog_product_entity_datetime.dv_load_end_date_time = 'Dec 31, 9999'
  left join l_magento_catalog_product_entity_datetime
    on p_magento_catalog_product_entity_datetime.bk_hash = l_magento_catalog_product_entity_datetime.bk_hash
   and p_magento_catalog_product_entity_datetime.l_magento_catalog_product_entity_datetime_id = l_magento_catalog_product_entity_datetime.l_magento_catalog_product_entity_datetime_id
 where l_magento_catalog_product_entity_datetime.l_magento_catalog_product_entity_datetime_id is null
    or (l_magento_catalog_product_entity_datetime.l_magento_catalog_product_entity_datetime_id is not null
        and l_magento_catalog_product_entity_datetime.dv_hash <> #l_magento_catalog_product_entity_datetime_inserts.source_hash)

--calculate hash and lookup to current s_magento_catalog_product_entity_datetime
if object_id('tempdb..#s_magento_catalog_product_entity_datetime_inserts') is not null drop table #s_magento_catalog_product_entity_datetime_inserts
create table #s_magento_catalog_product_entity_datetime_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_magento_catalog_product_entity_datetime.bk_hash,
       stage_hash_magento_catalog_product_entity_datetime.value_id value_id,
       stage_hash_magento_catalog_product_entity_datetime.value value,
       stage_hash_magento_catalog_product_entity_datetime.dummy_modified_date_time dummy_modified_date_time,
       isnull(cast(stage_hash_magento_catalog_product_entity_datetime.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_magento_catalog_product_entity_datetime.value_id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(convert(varchar,stage_hash_magento_catalog_product_entity_datetime.value,120),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(convert(varchar,stage_hash_magento_catalog_product_entity_datetime.dummy_modified_date_time,120),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_magento_catalog_product_entity_datetime
 where stage_hash_magento_catalog_product_entity_datetime.dv_batch_id = @current_dv_batch_id

--Insert all updated and new s_magento_catalog_product_entity_datetime records
set @insert_date_time = getdate()
insert into s_magento_catalog_product_entity_datetime (
       bk_hash,
       value_id,
       value,
       dummy_modified_date_time,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #s_magento_catalog_product_entity_datetime_inserts.bk_hash,
       #s_magento_catalog_product_entity_datetime_inserts.value_id,
       #s_magento_catalog_product_entity_datetime_inserts.value,
       #s_magento_catalog_product_entity_datetime_inserts.dummy_modified_date_time,
       case when s_magento_catalog_product_entity_datetime.s_magento_catalog_product_entity_datetime_id is null then isnull(#s_magento_catalog_product_entity_datetime_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       39,
       #s_magento_catalog_product_entity_datetime_inserts.source_hash,
       @insert_date_time,
       @user
  from #s_magento_catalog_product_entity_datetime_inserts
  left join p_magento_catalog_product_entity_datetime
    on #s_magento_catalog_product_entity_datetime_inserts.bk_hash = p_magento_catalog_product_entity_datetime.bk_hash
   and p_magento_catalog_product_entity_datetime.dv_load_end_date_time = 'Dec 31, 9999'
  left join s_magento_catalog_product_entity_datetime
    on p_magento_catalog_product_entity_datetime.bk_hash = s_magento_catalog_product_entity_datetime.bk_hash
   and p_magento_catalog_product_entity_datetime.s_magento_catalog_product_entity_datetime_id = s_magento_catalog_product_entity_datetime.s_magento_catalog_product_entity_datetime_id
 where s_magento_catalog_product_entity_datetime.s_magento_catalog_product_entity_datetime_id is null
    or (s_magento_catalog_product_entity_datetime.s_magento_catalog_product_entity_datetime_id is not null
        and s_magento_catalog_product_entity_datetime.dv_hash <> #s_magento_catalog_product_entity_datetime_inserts.source_hash)

--Run the PIT proc
exec dbo.proc_p_magento_catalog_product_entity_datetime @current_dv_batch_id

--run dimensional procs
exec dbo.proc_d_magento_catalog_product_entity_datetime @current_dv_batch_id

end
