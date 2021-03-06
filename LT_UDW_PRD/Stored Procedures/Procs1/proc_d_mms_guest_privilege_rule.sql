﻿CREATE PROC [dbo].[proc_d_mms_guest_privilege_rule] @current_dv_batch_id [bigint] AS
begin

set nocount on
set xact_abort on

--Start!
-- Get the @max_dv_batch_id from dimension/fact.  Use -2 if there aren't any records.
declare @max_dv_batch_id bigint = (select isnull(max(dv_batch_id),-2) from d_mms_guest_privilege_rule)

-- Find the PIT records with dv_batch_id > @max_dv_batch_id
-- and find the PIT records with dv_batch_id = @current_dv_batch_id since those need to be deleted in case of a retry
if object_id('tempdb..#p_mms_guest_privilege_rule_insert') is not null drop table #p_mms_guest_privilege_rule_insert
create table dbo.#p_mms_guest_privilege_rule_insert with(distribution=hash(bk_hash), location=user_db) as
select p_mms_guest_privilege_rule.p_mms_guest_privilege_rule_id,
       p_mms_guest_privilege_rule.bk_hash
  from dbo.p_mms_guest_privilege_rule
 where p_mms_guest_privilege_rule.dv_load_end_date_time = convert(datetime,'9999.12.31',102)
   and (p_mms_guest_privilege_rule.dv_batch_id > @max_dv_batch_id
        or p_mms_guest_privilege_rule.dv_batch_id = @current_dv_batch_id)

-- calculate all values of the records to be inserted to make the actual update go as fast as possible
if object_id('tempdb..#insert') is not null drop table #insert
create table dbo.#insert with(distribution=hash(bk_hash), location=user_db) as
select p_mms_guest_privilege_rule.bk_hash,
       p_mms_guest_privilege_rule.bk_hash dim_mms_membership_guest_privilege_rule_key,
       p_mms_guest_privilege_rule.guest_privilege_rule_id guest_privilege_rule_id,
       case when p_mms_guest_privilege_rule.bk_hash in ('-997','-998','-999') then p_mms_guest_privilege_rule.bk_hash     
         when l_mms_guest_privilege_rule_1.val_card_level_id is null then '-998'   
         else 'r_mms_val_card_level_'+convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(cast(l_mms_guest_privilege_rule_1.val_card_level_id as int) as varchar(500)),'z#@$k%&P'))),2)   end card_level_dim_description_key,
       case when p_mms_guest_privilege_rule.bk_hash in ('-997', '-998', '-999') then p_mms_guest_privilege_rule.bk_hash
            when s_mms_guest_privilege_rule.membership_start_date is null then '19920101'
            else convert(varchar, s_mms_guest_privilege_rule.membership_start_date, 112)
        end earliest_membership_created_dim_date_key,
       s_mms_guest_privilege_rule.high_club_access_level high_membership_type_check_in_group_level,
       case when p_mms_guest_privilege_rule.bk_hash in ('-997', '-998', '-999') then p_mms_guest_privilege_rule.bk_hash
            when s_mms_guest_privilege_rule.membership_end_date is null then '20790506'
            else convert(varchar, s_mms_guest_privilege_rule.membership_end_date, 112)
        end latest_membership_created_dim_date_key,
       s_mms_guest_privilege_rule.low_club_access_level low_membership_type_check_in_group_level,
       s_mms_guest_privilege_rule.number_of_guests max_number_of_guests,
       case when p_mms_guest_privilege_rule.bk_hash in ('-997','-998','-999') then 'N'
            when l_mms_guest_privilege_rule.val_period_type_id = 1 then 'Y'
            else 'N'
        end month_flag,
       l_mms_guest_privilege_rule_1.val_card_level_id val_card_level_id,
       case when p_mms_guest_privilege_rule.bk_hash in ('-997','-998','-999') then 'N'
            when l_mms_guest_privilege_rule.val_period_type_id = 2 then 'Y'
            else 'N'
        end year_flag,
       isnull(h_mms_guest_privilege_rule.dv_deleted,0) dv_deleted,
       p_mms_guest_privilege_rule.p_mms_guest_privilege_rule_id,
       p_mms_guest_privilege_rule.dv_batch_id,
       p_mms_guest_privilege_rule.dv_load_date_time,
       p_mms_guest_privilege_rule.dv_load_end_date_time
  from dbo.h_mms_guest_privilege_rule
  join dbo.p_mms_guest_privilege_rule
    on h_mms_guest_privilege_rule.bk_hash = p_mms_guest_privilege_rule.bk_hash
  join #p_mms_guest_privilege_rule_insert
    on p_mms_guest_privilege_rule.bk_hash = #p_mms_guest_privilege_rule_insert.bk_hash
   and p_mms_guest_privilege_rule.p_mms_guest_privilege_rule_id = #p_mms_guest_privilege_rule_insert.p_mms_guest_privilege_rule_id
  join dbo.l_mms_guest_privilege_rule
    on p_mms_guest_privilege_rule.bk_hash = l_mms_guest_privilege_rule.bk_hash
   and p_mms_guest_privilege_rule.l_mms_guest_privilege_rule_id = l_mms_guest_privilege_rule.l_mms_guest_privilege_rule_id
  join dbo.l_mms_guest_privilege_rule_1
    on p_mms_guest_privilege_rule.bk_hash = l_mms_guest_privilege_rule_1.bk_hash
   and p_mms_guest_privilege_rule.l_mms_guest_privilege_rule_1_id = l_mms_guest_privilege_rule_1.l_mms_guest_privilege_rule_1_id
  join dbo.s_mms_guest_privilege_rule
    on p_mms_guest_privilege_rule.bk_hash = s_mms_guest_privilege_rule.bk_hash
   and p_mms_guest_privilege_rule.s_mms_guest_privilege_rule_id = s_mms_guest_privilege_rule.s_mms_guest_privilege_rule_id

-- do as a single transaction
--   delete records from the dimensional table where the business_key is in #p_*_insert temp table
--   insert records from all of the joins to the pit table and to #p_*_insert temp table
begin tran
  delete dbo.d_mms_guest_privilege_rule
   where d_mms_guest_privilege_rule.bk_hash in (select bk_hash from #p_mms_guest_privilege_rule_insert)

  insert dbo.d_mms_guest_privilege_rule(
             bk_hash,
             dim_mms_membership_guest_privilege_rule_key,
             guest_privilege_rule_id,
             card_level_dim_description_key,
             earliest_membership_created_dim_date_key,
             high_membership_type_check_in_group_level,
             latest_membership_created_dim_date_key,
             low_membership_type_check_in_group_level,
             max_number_of_guests,
             month_flag,
             val_card_level_id,
             year_flag,
             deleted_flag,
             p_mms_guest_privilege_rule_id,
             dv_load_date_time,
             dv_load_end_date_time,
             dv_batch_id,
             dv_inserted_date_time,
             dv_insert_user)
  select bk_hash,
         dim_mms_membership_guest_privilege_rule_key,
         guest_privilege_rule_id,
         card_level_dim_description_key,
         earliest_membership_created_dim_date_key,
         high_membership_type_check_in_group_level,
         latest_membership_created_dim_date_key,
         low_membership_type_check_in_group_level,
         max_number_of_guests,
         month_flag,
         val_card_level_id,
         year_flag,
         dv_deleted,
         p_mms_guest_privilege_rule_id,
         dv_load_date_time,
         dv_load_end_date_time,
         dv_batch_id,
         getdate(),
         suser_sname()
    from #insert
commit tran

--force replication
set @max_dv_batch_id = (select isnull(max(dv_batch_id),-2) from d_mms_guest_privilege_rule)
--Done!
end
