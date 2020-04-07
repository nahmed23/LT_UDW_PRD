﻿CREATE PROC [dbo].[proc_etl_exerp_visit_log] @current_dv_batch_id [bigint],@job_start_date_time_varchar [varchar](19) AS
begin

set nocount on
set xact_abort on

--Start!
declare @job_start_date_time datetime
set @job_start_date_time = convert(datetime,@job_start_date_time_varchar,120)

declare @user varchar(50) = suser_sname()
declare @insert_date_time datetime

truncate table stage_hash_exerp_visit_log

set @insert_date_time = getdate()
insert into dbo.stage_hash_exerp_visit_log (
       bk_hash,
       id,
       center_id,
       person_id,
       home_center_id,
       check_in_datetime,
       check_out_datetime,
       result,
       card_checked_in,
       ets,
       dummy_modified_date_time,
       dv_load_date_time,
       dv_batch_id)
select convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(id as varchar(500)),'z#@$k%&P'))),2) bk_hash,
       id,
       center_id,
       person_id,
       home_center_id,
       check_in_datetime,
       check_out_datetime,
       result,
       card_checked_in,
       ets,
       dummy_modified_date_time,
       isnull(cast(stage_exerp_visit_log.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       dv_batch_id
  from stage_exerp_visit_log
 where dv_batch_id = @current_dv_batch_id

--Run PIT proc for retry logic
exec dbo.proc_p_exerp_visit_log @current_dv_batch_id

--Insert/update new hub business keys
set @insert_date_time = getdate()
insert into h_exerp_visit_log (
       bk_hash,
       visit_log_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_inserted_date_time,
       dv_insert_user)
select stage_hash_exerp_visit_log.bk_hash,
       stage_hash_exerp_visit_log.id visit_log_id,
       isnull(cast(stage_hash_exerp_visit_log.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       @current_dv_batch_id,
       33,
       @insert_date_time,
       @user
  from stage_hash_exerp_visit_log
  left join h_exerp_visit_log
    on stage_hash_exerp_visit_log.bk_hash = h_exerp_visit_log.bk_hash
 where h_exerp_visit_log_id is null
   and stage_hash_exerp_visit_log.dv_batch_id = @current_dv_batch_id

--calculate hash and lookup to current l_exerp_visit_log
if object_id('tempdb..#l_exerp_visit_log_inserts') is not null drop table #l_exerp_visit_log_inserts
create table #l_exerp_visit_log_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_exerp_visit_log.bk_hash,
       stage_hash_exerp_visit_log.id visit_log_id,
       stage_hash_exerp_visit_log.center_id center_id,
       stage_hash_exerp_visit_log.person_id person_id,
       stage_hash_exerp_visit_log.home_center_id home_center_id,
       isnull(cast(stage_hash_exerp_visit_log.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.center_id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(stage_hash_exerp_visit_log.person_id,'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.home_center_id as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_exerp_visit_log
 where stage_hash_exerp_visit_log.dv_batch_id = @current_dv_batch_id

--Insert all updated and new l_exerp_visit_log records
set @insert_date_time = getdate()
insert into l_exerp_visit_log (
       bk_hash,
       visit_log_id,
       center_id,
       person_id,
       home_center_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #l_exerp_visit_log_inserts.bk_hash,
       #l_exerp_visit_log_inserts.visit_log_id,
       #l_exerp_visit_log_inserts.center_id,
       #l_exerp_visit_log_inserts.person_id,
       #l_exerp_visit_log_inserts.home_center_id,
       case when l_exerp_visit_log.l_exerp_visit_log_id is null then isnull(#l_exerp_visit_log_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       33,
       #l_exerp_visit_log_inserts.source_hash,
       @insert_date_time,
       @user
  from #l_exerp_visit_log_inserts
  left join p_exerp_visit_log
    on #l_exerp_visit_log_inserts.bk_hash = p_exerp_visit_log.bk_hash
   and p_exerp_visit_log.dv_load_end_date_time = 'Dec 31, 9999'
  left join l_exerp_visit_log
    on p_exerp_visit_log.bk_hash = l_exerp_visit_log.bk_hash
   and p_exerp_visit_log.l_exerp_visit_log_id = l_exerp_visit_log.l_exerp_visit_log_id
 where l_exerp_visit_log.l_exerp_visit_log_id is null
    or (l_exerp_visit_log.l_exerp_visit_log_id is not null
        and l_exerp_visit_log.dv_hash <> #l_exerp_visit_log_inserts.source_hash)

--calculate hash and lookup to current s_exerp_visit_log
if object_id('tempdb..#s_exerp_visit_log_inserts') is not null drop table #s_exerp_visit_log_inserts
create table #s_exerp_visit_log_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_exerp_visit_log.bk_hash,
       stage_hash_exerp_visit_log.id visit_log_id,
       stage_hash_exerp_visit_log.check_in_datetime check_in_datetime,
       stage_hash_exerp_visit_log.check_out_datetime check_out_datetime,
       stage_hash_exerp_visit_log.result result,
       stage_hash_exerp_visit_log.card_checked_in card_checked_in,
       stage_hash_exerp_visit_log.ets ets,
       stage_hash_exerp_visit_log.dummy_modified_date_time dummy_modified_date_time,
       isnull(cast(stage_hash_exerp_visit_log.dummy_modified_date_time as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.id as varchar(500)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(convert(varchar,stage_hash_exerp_visit_log.check_in_datetime,120),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(convert(varchar,stage_hash_exerp_visit_log.check_out_datetime,120),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(stage_hash_exerp_visit_log.result,'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.card_checked_in as varchar(42)),'z#@$k%&P')
                                        +'P%#&z$@k'+isnull(cast(stage_hash_exerp_visit_log.ets as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_exerp_visit_log
 where stage_hash_exerp_visit_log.dv_batch_id = @current_dv_batch_id

--Insert all updated and new s_exerp_visit_log records
set @insert_date_time = getdate()
insert into s_exerp_visit_log (
       bk_hash,
       visit_log_id,
       check_in_datetime,
       check_out_datetime,
       result,
       card_checked_in,
       ets,
       dummy_modified_date_time,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #s_exerp_visit_log_inserts.bk_hash,
       #s_exerp_visit_log_inserts.visit_log_id,
       #s_exerp_visit_log_inserts.check_in_datetime,
       #s_exerp_visit_log_inserts.check_out_datetime,
       #s_exerp_visit_log_inserts.result,
       #s_exerp_visit_log_inserts.card_checked_in,
       #s_exerp_visit_log_inserts.ets,
       #s_exerp_visit_log_inserts.dummy_modified_date_time,
       case when s_exerp_visit_log.s_exerp_visit_log_id is null then isnull(#s_exerp_visit_log_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       33,
       #s_exerp_visit_log_inserts.source_hash,
       @insert_date_time,
       @user
  from #s_exerp_visit_log_inserts
  left join p_exerp_visit_log
    on #s_exerp_visit_log_inserts.bk_hash = p_exerp_visit_log.bk_hash
   and p_exerp_visit_log.dv_load_end_date_time = 'Dec 31, 9999'
  left join s_exerp_visit_log
    on p_exerp_visit_log.bk_hash = s_exerp_visit_log.bk_hash
   and p_exerp_visit_log.s_exerp_visit_log_id = s_exerp_visit_log.s_exerp_visit_log_id
 where s_exerp_visit_log.s_exerp_visit_log_id is null
    or (s_exerp_visit_log.s_exerp_visit_log_id is not null
        and s_exerp_visit_log.dv_hash <> #s_exerp_visit_log_inserts.source_hash)

--Run the PIT proc
exec dbo.proc_p_exerp_visit_log @current_dv_batch_id

end
