﻿CREATE PROC [dbo].[proc_fact_exerp_payroll] @dv_batch_id [bigint] AS

BEGIN
SET XACT_ABORT ON
SET NOCOUNT ON

if object_id('tempdb..#pay_dim_date') is not null drop table #pay_dim_date
create table dbo.#pay_dim_date with(distribution=round_robin, location=user_db) as 
select d1.dim_date_key,
       max(ps.dim_date_key) pay_week_first_day_dim_date_key,
       min(pe.dim_date_key) pay_week_last_day_dim_date_keyx
  from marketing.v_dim_date d1 --"UDW day"
  join marketing.v_dim_date ps --week start
    on ps.dim_date_key <= d1.dim_date_key 
   and ps.day_number_in_week = 1 
   and d1.bi_weekly_pay_period_code = ps.bi_weekly_pay_period_code --optimization join clause
  join marketing.v_dim_date pe --week end
    on pe.dim_date_key >= d1.dim_date_key 
   and pe.day_number_in_week = 7 
   and d1.bi_weekly_pay_period_code = pe.bi_weekly_pay_period_code --optimization join clause
group by d1.dim_date_key

if object_id('tempdb..#booking') is not null drop table #booking
create table #booking with (distribution = hash(dim_exerp_booking_key)) as
select dim_exerp_booking.dim_exerp_booking_key,
       dim_exerp_booking.start_dim_date_key delivered_dim_date_key,
       dim_exerp_booking.start_dim_time_key delivered_dim_time_key,
       dim_exerp_booking.dim_club_key delivered_dim_club_key, 
       cast(dim_date.full_date_numeric_description +' '+ dim_time.display_12_hour_time as datetime) delivered_date_time,
       #pay_dim_date.pay_week_first_day_dim_date_key pay_period_first_day_dim_date_key
  from marketing.v_dim_exerp_booking dim_exerp_booking
  join marketing.v_dim_exerp_activity dim_exerp_activity
    on dim_exerp_booking.dim_exerp_activity_key = dim_exerp_activity.dim_exerp_activity_key
  join marketing.v_dim_date dim_date 
    on dim_exerp_booking.start_dim_date_key = dim_date.dim_date_key
   and dim_date.dim_date_key not in ('-998','-997','-999')
   --and dim_date.calendar_date < convert(datetime, convert(Varchar,getdate(),110),110)
  join #pay_dim_date
    on dim_date.dim_date_key = #pay_dim_date.dim_date_key
  join marketing.v_dim_time dim_time 
    on dim_exerp_booking.start_dim_time_key = dim_time.dim_time_key
   and dim_time.dim_time_key not in ('-998','-997','-999')
 where dim_exerp_activity.activity_group_name in ('Small Group Training','Pilates Class','Virtual Training')

if object_id('tempdb..#booking_participation') is not null drop table #booking_participation
create table #booking_participation with (distribution = hash(dim_exerp_booking_key)) as
select fact_exerp_participation.dim_exerp_subscription_key,
       fact_exerp_participation.dim_mms_member_key,
       fact_exerp_participation.dim_exerp_booking_key,
       booking.delivered_dim_club_key,       
       booking.delivered_dim_date_key,
       booking.delivered_dim_time_key,
       booking.pay_period_first_day_dim_date_key,
       case when refunded_period.subscription_period_state = 'cancelled' then refunded_period.price_per_booking
	        else dim_exerp_subscription_period.price_per_booking
	    end price_per_booking,
       case when refunded_period.subscription_period_state = 'cancelled' then refunded_period.price_per_booking_less_lt_bucks
	        else dim_exerp_subscription_period.price_per_booking_less_lt_bucks
	    end price_per_booking_less_lt_bucks,
       case when refunded_period.subscription_period_state = 'cancelled' then refunded_period.dim_exerp_subscription_period_key
	        else dim_exerp_subscription_period.dim_exerp_subscription_period_key
	    end dim_exerp_subscription_period_key,
       case when refunded_period.subscription_period_state = 'cancelled' then refunded_period.dim_exerp_product_key
	        else dim_exerp_subscription_period.dim_exerp_product_key
	    end dim_exerp_product_key,
       dim_exerp_staff_usage.dim_employee_key,
       booking.delivered_date_time,
       fact_exerp_participation.fact_exerp_participation_key,
       fact_exerp_participation.participation_id,
       '7'+fact_exerp_participation.fact_exerp_participation_key payroll_unique_key
  from #booking booking
  join marketing.v_fact_exerp_participation fact_exerp_participation
    on fact_exerp_participation.dim_exerp_booking_key = booking.dim_exerp_booking_key
  join marketing.v_dim_exerp_subscription dim_exerp_subscription
    on fact_exerp_participation.dim_exerp_subscription_key = dim_exerp_subscription.dim_exerp_subscription_key
  join marketing.v_dim_exerp_subscription_period dim_exerp_subscription_period
    on fact_exerp_participation.dim_exerp_subscription_key = dim_exerp_subscription_period.dim_exerp_subscription_key
   and booking.delivered_dim_date_key >= dim_exerp_subscription_period.from_dim_date_key
   and booking.delivered_dim_date_key <= dim_exerp_subscription_period.to_dim_date_key
  left join marketing.v_dim_exerp_subscription_period refunded_period
    on fact_exerp_participation.dim_exerp_subscription_key = refunded_period.dim_exerp_subscription_key --same subscription
   and refunded_period.dim_exerp_subscription_period_key <> dim_exerp_subscription_period.dim_exerp_subscription_period_key --different period
   and refunded_period.from_dim_date_key = dim_exerp_subscription_period.from_dim_date_key
  join marketing.v_dim_exerp_staff_usage dim_exerp_staff_usage
    on fact_exerp_participation.dim_exerp_booking_key = dim_exerp_staff_usage.dim_exerp_booking_key 
   and dim_exerp_staff_usage.staff_usage_state = 'ACTIVE'
 where (booking.delivered_dim_date_key < dim_exerp_subscription.stop_cancel_dim_date_key
       or dim_exerp_subscription.stop_cancel_dim_date_key = '-998')
   and (refunded_period.subscription_period_state = 'cancelled'
        or refunded_period.dim_exerp_subscription_period_key is null) 
   and (fact_exerp_participation.participation_state <> 'cancelled'
        or isnull(fact_exerp_participation.cancel_reason,'') = 'NO_SHOW')

if object_id('tempdb..#booking_payroll') is not null drop table #booking_payroll
create table #booking_payroll with (distribution = hash(dim_exerp_booking_key)) as
select #booking_participation.*, 
       dim_mms_product_history.dim_mms_product_key,
       dim_mms_product_history.payroll_description,
       dim_mms_product_history.payroll_standard_group_description payroll_group_description,
       dim_mms_product_history.payroll_region_type,
       dim_mms_product_history.payroll_standard_service_amount_flag payroll_service_amount_flag,
       dim_mms_product_history.payroll_standard_service_quantity_flag payroll_service_quantity_flag,
       dim_mms_product_history.product_id
  from #booking_participation
  join marketing.v_dim_exerp_product dim_exerp_product
    on #booking_participation.dim_exerp_product_key = dim_exerp_product.dim_exerp_product_key
  join marketing.v_dim_mms_product_history dim_mms_product_history
    ON dim_exerp_product.dim_mms_product_key = dim_mms_product_history.dim_mms_product_key
   and dim_mms_product_history.effective_date_time <= #booking_participation.delivered_date_time
   and dim_mms_product_history.expiration_date_time > #booking_participation.delivered_date_time

truncate table fact_exerp_payroll

declare @insert_dt datetime = getdate()
declare @insert_user varchar(50) = suser_sname()

insert into fact_exerp_payroll (
    club_id,
    delivered_dim_date_key,
    delivered_dim_time_key,
    dim_club_key,
    dim_employee_key,
    dim_exerp_booking_key,
    dim_exerp_product_key,
    dim_exerp_subscription_key,
    dim_exerp_subscription_period_key,
    dim_mms_member_key,
    dim_mms_product_key,
    employee_id,
    fact_exerp_participation_key,
    member_id,
    pay_period_first_day_dim_date_key,
    payroll_description,
    payroll_group_description,
    payroll_region_type,
    payroll_service_amount_flag,
    payroll_service_quantity_flag,
    price_per_booking,
    price_per_booking_less_lt_bucks,
    product_id,
    payroll_unique_key,
    participation_id,
    dv_load_date_time,
    dv_load_end_date_time,
    dv_batch_id,
    dv_inserted_date_time,
    dv_insert_user
)
select dim_club.club_id,
       #booking_payroll.delivered_dim_date_key,
       #booking_payroll.delivered_dim_time_key,
       #booking_payroll.delivered_dim_club_key,
       #booking_payroll.dim_employee_key,
       #booking_payroll.dim_exerp_booking_key,
       #booking_payroll.dim_exerp_product_key,
       #booking_payroll.dim_exerp_subscription_key,
       #booking_payroll.dim_exerp_subscription_period_key,
       #booking_payroll.dim_mms_member_key,
       #booking_payroll.dim_mms_product_key,
       dim_employee.employee_id,
       #booking_payroll.fact_exerp_participation_key,
       dim_mms_member.member_id,
       #booking_payroll.pay_period_first_day_dim_date_key,
       #booking_payroll.payroll_description,
       #booking_payroll.payroll_group_description,
       #booking_payroll.payroll_region_type,
       #booking_payroll.payroll_service_amount_flag,
       #booking_payroll.payroll_service_quantity_flag,
       #booking_payroll.price_per_booking,
       #booking_payroll.price_per_booking_less_lt_bucks,
       #booking_payroll.product_id,
       #booking_payroll.payroll_unique_key,
       #booking_payroll.participation_id,
       'jan 1, 1763' dv_load_date_time,
       'Dec 31, 9999' dv_load_end_date_time,
       @dv_batch_id dv_batch_id,
       @insert_dt dv_inserted_date_time,
       @insert_user dv_insert_user
from #booking_payroll
join marketing.v_dim_club dim_club on #booking_payroll.delivered_dim_club_key = dim_club.dim_club_key 
join marketing.v_dim_mms_member dim_mms_member on #booking_payroll.dim_mms_member_key = dim_mms_member.dim_mms_member_key
join marketing.v_dim_employee dim_employee on #booking_payroll.dim_employee_key = dim_employee.dim_employee_key

drop table #booking
drop table #booking_participation
drop table #booking_payroll

END
