﻿CREATE PROC [dbo].[proc_etl_mms_drawer] @current_dv_batch_id [bigint],@job_start_date_time_varchar [varchar](19) AS
begin

set nocount on
set xact_abort on

--Start!
declare @job_start_date_time datetime
set @job_start_date_time = convert(datetime,@job_start_date_time_varchar,120)

declare @user varchar(50) = suser_sname()
declare @insert_date_time datetime

truncate table stage_hash_mms_Drawer

set @insert_date_time = getdate()
insert into dbo.stage_hash_mms_Drawer (
       bk_hash,
       DrawerID,
       ClubID,
       LockedFlag,
       Description,
       InsertedDateTime,
       UpdatedDateTime,
       StartingCashAmount,
       dv_load_date_time,
       dv_inserted_date_time,
       dv_insert_user,
       dv_batch_id)
select convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(DrawerID as varchar(500)),'z#@$k%&P'))),2) bk_hash,
       DrawerID,
       ClubID,
       LockedFlag,
       Description,
       InsertedDateTime,
       UpdatedDateTime,
       StartingCashAmount,
       isnull(cast(stage_mms_Drawer.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       @insert_date_time,
       @user,
       dv_batch_id
  from stage_mms_Drawer
 where dv_batch_id = @current_dv_batch_id

--Run PIT proc for retry logic
exec dbo.proc_p_mms_drawer @current_dv_batch_id

--Insert/update new hub business keys
set @insert_date_time = getdate()
insert into h_mms_drawer (
       bk_hash,
       drawer_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_inserted_date_time,
       dv_insert_user)
select stage_hash_mms_Drawer.bk_hash,
       stage_hash_mms_Drawer.DrawerID drawer_id,
       isnull(cast(stage_hash_mms_Drawer.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       @current_dv_batch_id,
       2,
       @insert_date_time,
       @user
  from stage_hash_mms_Drawer
  left join h_mms_drawer
    on stage_hash_mms_Drawer.bk_hash = h_mms_drawer.bk_hash
 where h_mms_drawer_id is null
   and stage_hash_mms_Drawer.dv_batch_id = @current_dv_batch_id

--calculate hash and lookup to current l_mms_drawer
if object_id('tempdb..#l_mms_drawer_inserts') is not null drop table #l_mms_drawer_inserts
create table #l_mms_drawer_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_mms_Drawer.bk_hash,
       stage_hash_mms_Drawer.DrawerID drawer_id,
       stage_hash_mms_Drawer.ClubID club_id,
       isnull(cast(stage_hash_mms_Drawer.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_mms_Drawer.DrawerID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_Drawer.ClubID as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_mms_Drawer
 where stage_hash_mms_Drawer.dv_batch_id = @current_dv_batch_id

--Insert all updated and new l_mms_drawer records
set @insert_date_time = getdate()
insert into l_mms_drawer (
       bk_hash,
       drawer_id,
       club_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #l_mms_drawer_inserts.bk_hash,
       #l_mms_drawer_inserts.drawer_id,
       #l_mms_drawer_inserts.club_id,
       case when l_mms_drawer.l_mms_drawer_id is null then isnull(#l_mms_drawer_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       2,
       #l_mms_drawer_inserts.source_hash,
       @insert_date_time,
       @user
  from #l_mms_drawer_inserts
  left join p_mms_drawer
    on #l_mms_drawer_inserts.bk_hash = p_mms_drawer.bk_hash
   and p_mms_drawer.dv_load_end_date_time = 'Dec 31, 9999'
  left join l_mms_drawer
    on p_mms_drawer.bk_hash = l_mms_drawer.bk_hash
   and p_mms_drawer.l_mms_drawer_id = l_mms_drawer.l_mms_drawer_id
 where l_mms_drawer.l_mms_drawer_id is null
    or (l_mms_drawer.l_mms_drawer_id is not null
        and l_mms_drawer.dv_hash <> #l_mms_drawer_inserts.source_hash)

--calculate hash and lookup to current s_mms_drawer
if object_id('tempdb..#s_mms_drawer_inserts') is not null drop table #s_mms_drawer_inserts
create table #s_mms_drawer_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_mms_Drawer.bk_hash,
       stage_hash_mms_Drawer.DrawerID drawer_id,
       stage_hash_mms_Drawer.LockedFlag locked_flag,
       stage_hash_mms_Drawer.Description description,
       stage_hash_mms_Drawer.InsertedDateTime inserted_date_time,
       stage_hash_mms_Drawer.UpdatedDateTime updated_date_time,
       stage_hash_mms_Drawer.StartingCashAmount starting_cash_amount,
       isnull(cast(stage_hash_mms_Drawer.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_mms_Drawer.DrawerID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_Drawer.LockedFlag as varchar(42)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_Drawer.Description,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_Drawer.InsertedDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_Drawer.UpdatedDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_Drawer.StartingCashAmount as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_mms_Drawer
 where stage_hash_mms_Drawer.dv_batch_id = @current_dv_batch_id

--Insert all updated and new s_mms_drawer records
set @insert_date_time = getdate()
insert into s_mms_drawer (
       bk_hash,
       drawer_id,
       locked_flag,
       description,
       inserted_date_time,
       updated_date_time,
       starting_cash_amount,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #s_mms_drawer_inserts.bk_hash,
       #s_mms_drawer_inserts.drawer_id,
       #s_mms_drawer_inserts.locked_flag,
       #s_mms_drawer_inserts.description,
       #s_mms_drawer_inserts.inserted_date_time,
       #s_mms_drawer_inserts.updated_date_time,
       #s_mms_drawer_inserts.starting_cash_amount,
       case when s_mms_drawer.s_mms_drawer_id is null then isnull(#s_mms_drawer_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       2,
       #s_mms_drawer_inserts.source_hash,
       @insert_date_time,
       @user
  from #s_mms_drawer_inserts
  left join p_mms_drawer
    on #s_mms_drawer_inserts.bk_hash = p_mms_drawer.bk_hash
   and p_mms_drawer.dv_load_end_date_time = 'Dec 31, 9999'
  left join s_mms_drawer
    on p_mms_drawer.bk_hash = s_mms_drawer.bk_hash
   and p_mms_drawer.s_mms_drawer_id = s_mms_drawer.s_mms_drawer_id
 where s_mms_drawer.s_mms_drawer_id is null
    or (s_mms_drawer.s_mms_drawer_id is not null
        and s_mms_drawer.dv_hash <> #s_mms_drawer_inserts.source_hash)

--Run the PIT proc
exec dbo.proc_p_mms_drawer @current_dv_batch_id

--run dimensional procs
exec dbo.proc_d_mms_drawer @current_dv_batch_id

end
