CREATE PROC [dbo].[proc_fact_commprefs_user_preferences] @dv_batch_id [varchar](500) AS
begin

set xact_abort on
set nocount on

declare @max_dv_batch_id bigint = (select max(isnull(dv_batch_id,-1)) from fact_commprefs_user_preferences)
declare @current_dv_batch_id bigint = @dv_batch_id
declare @load_dv_batch_id bigint = case when @max_dv_batch_id < @current_dv_batch_id then @max_dv_batch_id else @current_dv_batch_id end

 /* Get the mms_email_address_status data in the currentBatch*/
if object_id('tempdb..#mms_email_address_status_current_batch') is not null drop table #mms_email_address_status_current_batch
create table dbo.#mms_email_address_status_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       status_from_date,
	   status_thru_date,
	   email_address as 'subscriber_key',
	   case when [description]='Subscribed' then 'Active'
            when [description]='Unsubscribed' then 'Unsubscribed'
	   else  ''  end as "status",
	   d_mms_email_address_status.dv_load_date_time,
	   d_mms_email_address_status.dv_batch_id
into #mms_email_address_status_current_batch
from d_mms_email_address_status
left join dim_description on val_communication_preference_status_key=dim_description_key
where /*description in ('Subscribed','Unsubscribed')and*/
d_mms_email_address_status.bk_hash NOT IN ('-997','-998','-999') and
d_mms_email_address_status.dv_batch_id >= @load_dv_batch_id

 /* Get the exacttarget_subscribers data in the currentBatch*/
if object_id('tempdb..#dim_exacttarget_subscribers_current_batch') is not null drop table #dim_exacttarget_subscribers_current_batch
create table dbo.#dim_exacttarget_subscribers_current_batch with(distribution=hash(email_address), location=user_db) as
select distinct lower(email_address) as email_address,
       1 as invalid_bounce
into #dim_exacttarget_subscribers_current_batch
from marketing.v_dim_exacttarget_subscribers
where email_address is not null
and client_id = 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and status = 'undeliverable'
and dv_batch_id >= @load_dv_batch_id


 /* Get email_all_subscriber data in the currentBatch from above two temp tables*/

 if object_id('tempdb..#etl_step_1') is not null drop table #etl_step_1
create table dbo.#etl_step_1 with(distribution=hash(email_address), location=user_db) as
select coalesce(#mms_email_address_status_current_batch.email_address,#dim_exacttarget_subscribers_current_batch.email_address) as email_address,
       #mms_email_address_status_current_batch.status_from_date as global_opt_status_from_date,
       case when #mms_email_address_status_current_batch.status='Active' or status is null then 1
	     else 0 end as global_opt_in,
       case when #mms_email_address_status_current_batch.status='Active' or status is null then 1
	     else 0 end as lt_insider_opt_in,
	   case when #mms_email_address_status_current_batch.status='Active' or status is null then 1
	     else 0 end as promotional_opt_in,
	   invalid_bounce,
	   #mms_email_address_status_current_batch.dv_load_date_time,
	   #mms_email_address_status_current_batch.dv_batch_id
from #mms_email_address_status_current_batch
full join #dim_exacttarget_subscribers_current_batch
on #mms_email_address_status_current_batch.email_address = #dim_exacttarget_subscribers_current_batch.email_address


 /* Get the exacttarget_open data. We can't consider this for the current batch as we have to get the max of event date*/
if object_id('tempdb..#fact_exacttarget_open_current_batch') is not null drop table #fact_exacttarget_open_current_batch
create table dbo.#fact_exacttarget_open_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       max(event_date) as 'last_open_date'
into #fact_exacttarget_open_current_batch
from marketing.v_fact_exacttarget_open
where email_address is not null
and client_id = 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and exists (select 1 from marketing.v_fact_exacttarget_open t1
            where t1.email_address=v_fact_exacttarget_open.email_address and client_id = 6194782 and email_address is not null
            and dv_batch_id >= @load_dv_batch_id )
group by email_address


 /* Get the exacttarget_sent data in the currentBatch*/
if object_id('tempdb..#fact_exacttarget_sent_current_batch') is not null drop table #fact_exacttarget_sent_current_batch
create table dbo.#fact_exacttarget_sent_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       min(event_date) as 'first_sent_date',
       max(event_date) as 'last_sent_date',
	   count(*) as 'total_sent'
into #fact_exacttarget_sent_current_batch
from marketing.v_fact_exacttarget_sent
where email_address is not null
and client_id = 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and exists (select 1 from marketing.v_fact_exacttarget_sent t1
            where t1.email_address=v_fact_exacttarget_sent.email_address and client_id = 6194782 and email_address is not null
            and dv_batch_id >= '-1' )
group by email_address



 /* Get the exacttarget_bounces data in the currentBatch*/
if object_id('tempdb..#fact_exacttarget_bounces_current_batch') is not null drop table #fact_exacttarget_bounces_current_batch
create table dbo.#fact_exacttarget_bounces_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       max(event_date) as 'last_bounce_date',
	   sum(case when bounce_category like '%hard%' then 1 else 0 end) as 'total_hard_bounces'
into #fact_exacttarget_bounces_current_batch
from marketing.v_fact_exacttarget_bounces t2
where client_id = 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and exists (select 1 from marketing.v_fact_exacttarget_bounces t1
            where t1.email_address=t2.email_address and client_id = 6194782
            and dv_batch_id >= @load_dv_batch_id )
group by email_address

 /* Get the exacttarget_clicks data in the currentBatch*/
if object_id('tempdb..#fact_exacttarget_clicks_current_batch') is not null drop table #fact_exacttarget_clicks_current_batch
create table dbo.#fact_exacttarget_clicks_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       max(event_date) as 'last_click_date'
into #fact_exacttarget_clicks_current_batch
from marketing.v_fact_exacttarget_clicks
where email_address is not null
and client_id = 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and exists (select 1 from marketing.v_fact_exacttarget_clicks t1
            where t1.email_address=v_fact_exacttarget_clicks.email_address and client_id = 6194782
            and dv_batch_id >= @load_dv_batch_id )
group by email_address

 /* Get the exacttarget_sent_ae_el data in the currentBatch*/
if object_id('tempdb..#fact_exacttarget_sent_ae_el_current_batch') is not null drop table #fact_exacttarget_sent_ae_el_current_batch
create table dbo.#fact_exacttarget_sent_ae_el_current_batch with(distribution=hash(email_address), location=user_db) as
select lower(email_address) as email_address,
       sum(case when client_id=6198976 then 1 else 0 end) as el_total_sent,
       max(case when client_id=6198976 then event_date else NULL end) as 'el_last_sent_date',
       sum(case when client_id in (6198979,6410090) then 1 else 0 end) as ae_total_sent,
       max(case when client_id in (6198979,6410090) then event_date else NULL end) as 'ae_last_sent_date'
into #fact_exacttarget_sent_ae_el_current_batch
from marketing.v_fact_exacttarget_sent
where email_address is not null
and client_id != 6194782 /*this is the main sending BU in SFMC, does not include AE or EL*/
and exists (select 1 from marketing.v_fact_exacttarget_sent t1
            where t1.email_address=v_fact_exacttarget_sent.email_address and client_id = 6194782 and email_address is not null
            and dv_batch_id >= @load_dv_batch_id )
group by email_address


 /* Get the CommPrefs UserPreference data in the currentBatch for all the batchid*/
if object_id('tempdb..#commprefs_user_preferences') is not null drop table #commprefs_user_preferences
create table dbo.#commprefs_user_preferences with(distribution=hash(email_address), location=user_db) as
select distinct d_commprefs_communication_types.name,
     case when d_commprefs_communication_types.slug='life_time_insider' then 1 else 0 end as lt_insider_opt_in,
	 case when d_commprefs_communication_types.slug='alerts_and_account_notifications' then 1 else 0 end as notifications_opt_in,
	 case when d_commprefs_communication_types.slug='flourish' then 1 else 0 end as flourish_opt_in,
	 case when d_commprefs_communication_types.slug='promotional' then 1 else 0 end as promotional_opt_in,
     d_commprefs_communication_values.channel_key,
	 lower(d_commprefs_communication_values.value) as email_address,
     case when isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_party_communication_values.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_membership_segment_parties.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
     else isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753') end dv_load_date_time,
		 case when isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_party_communication_values.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_values.dv_batch_id,-1)
		 when isnull(d_commprefs_party_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1)
                and isnull(d_commprefs_party_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
                and isnull(d_commprefs_party_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_party_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_party_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_party_communication_values.dv_batch_id,-1)
		 when isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
                and isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_membership_segment_parties.dv_batch_id,-1)
		 when isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
		 when isnull(d_commprefs_communication_types.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_types.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_types.dv_batch_id,-1)
		 when isnull(d_commprefs_communication_types.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_types.dv_batch_id,-1)
     else isnull(d_commprefs_communication_type_channels.dv_batch_id,-1) end dv_batch_id
from d_commprefs_communication_values
left join d_commprefs_party_communication_values
on d_commprefs_communication_values.bk_hash = d_commprefs_party_communication_values.d_commprefs_communication_values_bk_hash
left join d_commprefs_membership_segment_parties
on d_commprefs_party_communication_values.d_commprefs_parties_bk_hash=d_commprefs_membership_segment_parties.d_commprefs_parties_bk_hash
left join d_commprefs_communication_type_channel_membership_segments
on d_commprefs_communication_type_channel_membership_segments.d_commprefs_membership_segments_bk_hash=d_commprefs_membership_segment_parties.d_commprefs_membership_segments_bk_hash
left join d_commprefs_communication_type_channels
on d_commprefs_communication_type_channel_membership_segments.d_commprefs_communication_type_channels_bk_hash=d_commprefs_communication_type_channels.d_commprefs_communication_type_channels_key
left join d_commprefs_communication_types
on d_commprefs_communication_type_channels.d_commprefs_communication_types_bk_hash = d_commprefs_communication_types.bk_hash
left join d_commprefs_communication_preferences
on d_commprefs_communication_preferences.d_commprefs_communication_values_bk_hash=d_commprefs_communication_values.d_commprefs_communication_values_key
and d_commprefs_communication_type_channels.d_commprefs_communication_type_channels_key=d_commprefs_communication_preferences.d_commprefs_communication_type_channels_bk_hash
where d_commprefs_communication_types.active_on_dim_date_key <= convert(varchar(10), getdate(), 112)
and (d_commprefs_communication_types.active_until_dim_date_key ='-998'
     or d_commprefs_communication_types.active_until_dim_date_key >= convert(varchar(10), getdate(), 112)
     )
and d_commprefs_communication_type_channels.deleted_date_key='-998'
and d_commprefs_communication_values.channel_key='email'
and d_commprefs_communication_types.name='Alerts & Account Notifications'
and (d_commprefs_communication_values.dv_batch_id >= @load_dv_batch_id
or d_commprefs_party_communication_values.dv_batch_id >= @load_dv_batch_id
or d_commprefs_membership_segment_parties.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_type_channel_membership_segments.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_types.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_preferences.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_type_channels.dv_batch_id >= @load_dv_batch_id
)
union
select d_commprefs_communication_types.name,
     case when d_commprefs_communication_types.slug='life_time_insider' then 1 else 0 end as lt_insider_opt_in,
	 case when d_commprefs_communication_types.slug='alerts_and_account_notifications' then 1 else 0 end as notifications_opt_in,
	 case when d_commprefs_communication_types.slug='flourish' then 1 else 0 end as flourish_opt_in,
	 case when d_commprefs_communication_types.slug='promotional' then 1 else 0 end as promotional_opt_in,
     d_commprefs_communication_values.channel_key,
	 lower(d_commprefs_communication_values.value) as email_address,
     case when isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_values.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
                and isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_type_channel_membership_segments.dv_load_date_time,'Jan 1, 1753')
         when isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
				and isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_types.dv_load_date_time,'Jan 1, 1753')
		 when isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753') >= isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753')
         then isnull(d_commprefs_communication_preferences.dv_load_date_time,'Jan 1, 1753')
	else isnull(d_commprefs_communication_type_channels.dv_load_date_time,'Jan 1, 1753') end dv_load_date_time,
     case when isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_values.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_values.dv_batch_id,-1)
		 when isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_types.dv_batch_id,-1)
                and isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_type_channel_membership_segments.dv_batch_id,-1)
         when isnull(d_commprefs_communication_types.dv_batch_id,-1) >= isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
				and isnull(d_commprefs_communication_types.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_types.dv_batch_id,-1)
		 when isnull(d_commprefs_communication_preferences.dv_batch_id,-1) >= isnull(d_commprefs_communication_type_channels.dv_batch_id,-1)
         then isnull(d_commprefs_communication_preferences.dv_batch_id,-1)
	else isnull(d_commprefs_communication_type_channels.dv_batch_id,-1) end dv_batch_id
from d_commprefs_communication_values
left join d_commprefs_communication_type_channel_membership_segments
on d_commprefs_communication_type_channel_membership_segments.d_commprefs_membership_segments_bk_hash=
(select dim_commprefs_membership_segments_key from d_commprefs_membership_segments where membership_segments_key_value='non_member')
left join d_commprefs_communication_type_channels
on d_commprefs_communication_type_channel_membership_segments.d_commprefs_communication_type_channels_bk_hash=d_commprefs_communication_type_channels.d_commprefs_communication_type_channels_key
left join d_commprefs_communication_types
on d_commprefs_communication_type_channels.d_commprefs_communication_types_bk_hash = d_commprefs_communication_types.bk_hash
left join d_commprefs_communication_preferences
on d_commprefs_communication_preferences.d_commprefs_communication_values_bk_hash=d_commprefs_communication_values.d_commprefs_communication_values_key
and d_commprefs_communication_type_channels.d_commprefs_communication_type_channels_key=d_commprefs_communication_preferences.d_commprefs_communication_type_channels_bk_hash
where d_commprefs_communication_types.active_on_dim_date_key <= convert(varchar(10), getdate(), 112)
and (d_commprefs_communication_types.active_until_dim_date_key ='-998'
     or d_commprefs_communication_types.active_until_dim_date_key >= convert(varchar(10), getdate(), 112)
     )
and d_commprefs_communication_type_channels.deleted_date_key='-998'
and d_commprefs_communication_values.channel_key='email'
and d_commprefs_communication_types.name='Alerts & Account Notifications'
and d_commprefs_communication_values.d_commprefs_communication_values_key not in (
		SELECT d_commprefs_communication_values_bk_hash FROM dbo.d_commprefs_party_communication_values
		)
and (d_commprefs_communication_values.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_type_channel_membership_segments.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_types.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_preferences.dv_batch_id >= @load_dv_batch_id
or d_commprefs_communication_type_channels.dv_batch_id >= @load_dv_batch_id
)


 /* Get the CommPrefs UserPreference data in the currentBatch*/
if object_id('tempdb..#commprefs_user_preferences_current_batch') is not null drop table #commprefs_user_preferences_current_batch
create table dbo.#commprefs_user_preferences_current_batch with(distribution=hash(email_address), location=user_db) as
select name,
       lt_insider_opt_in,
       notifications_opt_in,
       flourish_opt_in,
       promotional_opt_in,
       channel_key,
       email_address,
       max(dv_load_date_time) dv_load_date_time,
       max(dv_batch_id) dv_batch_id
from dbo.#commprefs_user_preferences
group by name,
       lt_insider_opt_in,
       notifications_opt_in,
       flourish_opt_in,
       promotional_opt_in,
       channel_key,
       email_address

 /* all email address*/
if object_id('tempdb..#all_email_id') is not null drop table #all_email_id
create table dbo.#all_email_id with(distribution=hash(email_address), location=user_db) as
select email_address from #etl_step_1
union
select email_address from #commprefs_user_preferences_current_batch
union
select email_address from #fact_exacttarget_sent_current_batch
union
select email_address from #fact_exacttarget_open_current_batch
union
select email_address from #fact_exacttarget_clicks_current_batch
union
select email_address from #fact_exacttarget_bounces_current_batch
union
select email_address from #fact_exacttarget_sent_ae_el_current_batch



/*--etl_step_2*/
if object_id('tempdb..#etl_step_2') is not null drop table #etl_step_2
create table dbo.#etl_step_2 with(distribution=hash(email_address), location=user_db) as
select #all_email_id.email_address,
       coalesce(#etl_step_1.global_opt_in,1)global_opt_in,
	   coalesce(#etl_step_1.invalid_bounce,0) invalid_bounce,
	   coalesce(#commprefs_user_preferences_current_batch.promotional_opt_in,
	            case when #etl_step_1.global_opt_in is null or #etl_step_1.global_opt_in =1 then 1 else 0 end) promotional_opt_in,
	   coalesce(#commprefs_user_preferences_current_batch.lt_insider_opt_in,
	            case when #etl_step_1.global_opt_in is null or #etl_step_1.global_opt_in =1 then 1 else 0 end) lt_insider_opt_in,
       coalesce(#commprefs_user_preferences_current_batch.flourish_opt_in,0)flourish_opt_in,
	   #commprefs_user_preferences_current_batch.notifications_opt_in,
	   #etl_step_1.global_opt_status_from_date,
	   NULL as invalid_bounce_date,
	   #fact_exacttarget_sent_current_batch.first_sent_date,
	   #fact_exacttarget_sent_current_batch.last_sent_date,
	   #fact_exacttarget_open_current_batch.last_open_date,
	   #fact_exacttarget_clicks_current_batch.last_click_date,
       case when isnull(#fact_exacttarget_open_current_batch.last_open_date,'Jan 1, 1753') >= isnull(#fact_exacttarget_clicks_current_batch.last_click_date,'Jan 1, 1753')
	      then #fact_exacttarget_open_current_batch.last_open_date
	   else #fact_exacttarget_clicks_current_batch.last_click_date  end as last_engagement_date,
	   #fact_exacttarget_sent_current_batch.total_sent,
	   #fact_exacttarget_bounces_current_batch.total_hard_bounces,
	   #fact_exacttarget_bounces_current_batch.last_bounce_date,
	   #fact_exacttarget_sent_ae_el_current_batch.ae_last_sent_date,
	   #fact_exacttarget_sent_ae_el_current_batch.ae_total_sent,
	   #fact_exacttarget_sent_ae_el_current_batch.el_last_sent_date,
	   #fact_exacttarget_sent_ae_el_current_batch.el_total_sent,
	   case when isnull(#etl_step_1.dv_load_date_time,'Jan 1, 1753') >= isnull(#commprefs_user_preferences_current_batch.dv_load_date_time,'Jan 1, 1753')
          then isnull(#etl_step_1.dv_load_date_time,'Jan 1, 1753')
       else isnull(#commprefs_user_preferences_current_batch.dv_load_date_time,'Jan 1, 1753') end as dv_load_date_time,
       case when isnull(#etl_step_1.dv_batch_id,'-1') >= isnull(#commprefs_user_preferences_current_batch.dv_batch_id,'-1')
          then isnull(#etl_step_1.dv_batch_id,'-1')
       else isnull(#commprefs_user_preferences_current_batch.dv_batch_id,'-1') end as dv_batch_id
from #all_email_id
left join #etl_step_1
on #all_email_id.email_address=#etl_step_1.email_address
left join #commprefs_user_preferences_current_batch
on #all_email_id.email_address=#commprefs_user_preferences_current_batch.email_address
left join #fact_exacttarget_sent_current_batch
on #all_email_id.email_address = #fact_exacttarget_sent_current_batch.email_address
left join #fact_exacttarget_open_current_batch
on #all_email_id.email_address = #fact_exacttarget_open_current_batch.email_address
left join #fact_exacttarget_clicks_current_batch
on #all_email_id.email_address = #fact_exacttarget_clicks_current_batch.email_address
left join #fact_exacttarget_bounces_current_batch
on #all_email_id.email_address = #fact_exacttarget_bounces_current_batch.email_address
left join #fact_exacttarget_sent_ae_el_current_batch
on #all_email_id.email_address = #fact_exacttarget_sent_ae_el_current_batch.email_address


 /* Get the exacttarget_sent data till last_engagement_date*/
if object_id('tempdb..#fact_exacttarget_sent_till_last_engagement_date') is not null drop table #fact_exacttarget_sent_till_last_engagement_date
create table dbo.#fact_exacttarget_sent_till_last_engagement_date with(distribution=hash(email_address), location=user_db) as
select lower(#etl_step_2.email_address) as email_address,
	   count(*) as 'total_sent_till_last_engagement_date'
into #fact_exacttarget_sent_till_last_engagement_date
from marketing.v_fact_exacttarget_sent
left join #etl_step_2
on #etl_step_2.email_address = v_fact_exacttarget_sent.email_address
where #etl_step_2.email_address is not null and  client_id = 6194782
and exists (select 1 from marketing.v_fact_exacttarget_sent t1
            where v_fact_exacttarget_sent.email_address=#etl_step_2.email_address
			and client_id = 6194782
			and v_fact_exacttarget_sent.event_date>last_engagement_date
            and dv_batch_id >= @load_dv_batch_id )
group by #etl_step_2.email_address,last_engagement_date

if object_id('tempdb..#etl_step_3') is not null drop table #etl_step_3
create table dbo.#etl_step_3 with(distribution=hash(email_address), location=user_db) as
select
       #etl_step_2.email_address,
       global_opt_in,
	   invalid_bounce,
	   promotional_opt_in,
	   lt_insider_opt_in,
       flourish_opt_in,
	   notifications_opt_in,
       global_opt_status_from_date,
	   invalid_bounce_date,
	   #etl_step_2.first_sent_date,
	   #etl_step_2.last_sent_date,
	   last_open_date,
	   last_click_date,
	   last_engagement_date,
	   total_sent,
	   total_hard_bounces,
	   last_bounce_date,
	   ae_last_sent_date,
	   ae_total_sent,
	   el_last_sent_date,
	   el_total_sent,
	   total_sent_till_last_engagement_date,
       (total_sent - #fact_exacttarget_sent_till_last_engagement_date.total_sent_till_last_engagement_date) total_sent_after_last_engage,
	   dv_load_date_time,
	   dv_batch_id
from #etl_step_2
left join #fact_exacttarget_sent_till_last_engagement_date
on #etl_step_2.email_address = #fact_exacttarget_sent_till_last_engagement_date.email_address



if object_id('tempdb..#etl_step_4') is not null drop table #etl_step_4
create table dbo.#etl_step_4 with(distribution=hash(email_address), location=user_db) as
select email_address,
       global_opt_in,
	   invalid_bounce,
	   promotional_opt_in,
	   lt_insider_opt_in,
       flourish_opt_in,
	   notifications_opt_in,
	   global_opt_status_from_date,
	   invalid_bounce_date,
	   first_sent_date,
	   last_sent_date,
	   last_open_date,
	   last_click_date,
	   last_engagement_date,
	   total_sent,
	   total_hard_bounces,
	   last_bounce_date,
	   ae_last_sent_date,
	   ae_total_sent,
	   el_last_sent_date,
	   el_total_sent,
       total_sent_after_last_engage,
	   case when datediff(day, first_sent_date,last_sent_date) > 3*30
                and last_engagement_date is not null and total_sent_after_last_engage > 10
                and datediff(day,last_engagement_date,last_sent_date) > 3*30
            then 1
            when datediff(day, first_sent_date,last_sent_date) > 3*30
                and last_engagement_date is null and total_sent > 10
            then 1
       else 0 end as no_engagement_3_months,
	   case when datediff(day, first_sent_date,last_sent_date) > 6*30
                and last_engagement_date is not null and total_sent_after_last_engage > 10
                and datediff(day, last_engagement_date,last_sent_date) > 6*30
            then 1
            when datediff(day, first_sent_date,last_sent_date) > 6*30
                and last_engagement_date is null and total_sent > 10
            then 1
       else 0 end as no_engagement_6_months,
	   case when datediff(day, first_sent_date,last_sent_date) > 12*30
                and last_engagement_date is not null and total_sent_after_last_engage > 10
                and datediff(day, last_engagement_date,last_sent_date) > 12*30
            then 1
            when datediff(day, first_sent_date,last_sent_date) > 12*30
                and last_engagement_date is null and total_sent > 10
            then 1
       else 0 end as no_engagement_12_months,
	   case when datediff(day, first_sent_date,last_sent_date) > 13*30
                and last_engagement_date is not null and total_sent_after_last_engage > 10
                and datediff(day, last_engagement_date,last_sent_date) > 13*30
            then 1
            when datediff(day, first_sent_date,last_sent_date) > 13*30
                and last_engagement_date is null and total_sent > 10
            then 1
       else 0 end as no_engagement_13_months,
	   dv_load_date_time,
	   coalesce(dv_batch_id,-1) dv_batch_id
from #etl_step_3

/* Delete and re-insert as a single transaction*/
/*   Delete records from the table that exist*/
/*   Insert records from records from current and missing batches*/

begin tran

  delete dbo.fact_commprefs_user_preferences
   where email_address in (select email_address from dbo.#etl_step_4)

    insert into fact_commprefs_user_preferences
	(
	  ae_last_sent_date,
      ae_total_sent,
      el_last_sent_date,
      el_total_sent,
      email_address,
      first_sent_date,
      flourish_opt_in,
      global_opt_in,
      global_opt_status_from_date,
      invalid_bounce,
      invalid_bounce_date,
      last_bounce_date,
      last_click_date,
      last_engagement_date,
      last_open_date,
      last_sent_date,
      lt_insider_opt_in,
	  no_engagement_13_months,
      no_engagement_12_months,
      no_engagement_3_months,
      no_engagement_6_months,
      notifications_opt_in,
      promotional_opt_in,
      total_hard_bounces,
      total_sent,
      total_sent_after_last_engage,
      dv_load_date_time,
      dv_load_end_date_time,
      dv_batch_id,
      dv_inserted_date_time,
      dv_insert_user

	)

   select
      ae_last_sent_date,
      ae_total_sent,
      el_last_sent_date,
      el_total_sent,
      email_address,
      first_sent_date,
      flourish_opt_in,
      global_opt_in,
      global_opt_status_from_date,
      invalid_bounce,
      invalid_bounce_date,
      last_bounce_date,
      last_click_date,
      last_engagement_date,
      last_open_date,
      last_sent_date,
      lt_insider_opt_in,
	  no_engagement_13_months,
      no_engagement_12_months,
      no_engagement_3_months,
      no_engagement_6_months,
      notifications_opt_in,
      promotional_opt_in,
      total_hard_bounces,
      total_sent,
      total_sent_after_last_engage,
	  dv_load_date_time,
      'dec 31, 9999',
      dv_batch_id,
      getdate(),
      suser_sname()
 from #etl_step_4

 commit tran

end

