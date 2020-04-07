CREATE PROC [reporting].[proc_ExerpDeferred_Revenue_NonSession] @StartDate [DATETIME],@EndDate [DATETIME],@RegionList [VARCHAR](4000),@DimLocationKeyList [VARCHAR](4000),@WorkDayOffering [VARCHAR](4000),@WorkDayCostCenter [VARCHAR](4000) AS

BEGIN 
SET XACT_ABORT ON
SET NOCOUNT ON

IF 1=0 BEGIN
   SET FMTONLY OFF
END

----- Sample Execution
 ---   Exec [reporting].[proc_ExerpDeferred_Revenue_NonSession] '7/18/2019','8/24/2019','All Regions','178','OF10122|OF10056','51015'
 --    Exec [reporting].[proc_ExerpDeferred_Revenue_NonSession] '10/1/2019','10/3/2019','Hall-MN-West','-1','All Offerings','All Cost Centers'

--DECLARE @StartDate [DATETIME]
--DECLARE @EndDate [DATETIME]

SET @StartDate = CASE WHEN @StartDate = 'Jan 1, 1900' 
                      THEN DATEADD(MONTH,DATEDIFF(MONTH,0,GETDATE()-1),0)    ----- returns 1st of yesterday's month
					  WHEN @StartDate = 'Dec 30, 1899'
					  THEN DATEADD(YEAR,DATEDIFF(YEAR,0,GETDATE()-1),0)      ----- returns 1st of yesterday's year
					  ELSE @StartDate END
SET @EndDate = CASE WHEN @EndDate = 'Jan 1, 1900' 
                    THEN CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE()-1,101),101) 
					ELSE @EndDate END


DECLARE @StartDimDateKey INT,
        @EndtDimDateKey INT


SET @StartDimDateKey = (SELECT dim_date_key FROM [marketing].[v_dim_date] WHERE calendar_date = @StartDate)
SET @EndtDimDateKey = (SELECT dim_date_key FROM [marketing].[v_dim_date] WHERE calendar_date = @EndDate)


--DECLARE @StartDimDateKey VARCHAR(22) = '20191001'
--DECLARE @EndtDimDateKey VARCHAR(22) = '20191021'
--DECLARE @RegionList [VARCHAR](4000) = 'All Regions'
--DECLARE @DimLocationKeyList VARCHAR(4000) = '238'
--DECLARE @WorkDayOffering VARCHAR(4000) = 'All Offerings'
--DECLARE @WorkDayCostCenter VARCHAR(4000) = 'All Cost Centers'


/* Parse the Passed Parameters */

 ----- Club Prompt ------  
IF OBJECT_ID('tempdb.dbo.#Clubs', 'U') IS NOT NULL  
  DROP TABLE #Clubs;

DECLARE @list_table VARCHAR(8000)
SET @list_table = 'club_list'

  EXEC marketing.proc_parse_pipe_list @DimLocationKeyList,@list_table


	
SELECT DimClub.dim_club_key AS DimClubKey, 
       DimClub.club_id, 
	   DimClub.club_name AS ClubName,
       DimClub.club_code,
	   DimClub.gl_club_id,
	   DimClub.local_currency_code AS LocalCurrencyCode,
	   MMSRegion.description AS MMSRegion,
	   PTRCLRegion.description AS PTRCLRegion,
	   MemberActivitiesRegion.description AS MemberActivitiesRegion
  INTO #Clubs   
  FROM [marketing].[v_dim_club] DimClub
  JOIN #club_list ClubKeyList
    ON ClubKeyList.Item = DimClub.club_id
	  OR ClubKeyList.Item = -1
  JOIN [marketing].[v_dim_description]  MMSRegion
   ON MMSRegion.dim_description_key = DimClub.region_dim_description_key 
  JOIN [marketing].[v_dim_description]  PTRCLRegion
   ON PTRCLRegion.dim_description_key = DimClub.pt_rcl_area_dim_description_key
  JOIN [marketing].[v_dim_description]  MemberActivitiesRegion
   ON MemberActivitiesRegion.dim_description_key = DimClub.member_activities_region_dim_description_key
WHERE DimClub.club_id Not In (-1,99,100)
  AND DimClub.club_id < 900
  AND DimClub.club_type = 'Club'
  AND (DimClub.club_close_dim_date_key in('-997','-998','-999')  OR DimClub.club_close_dim_date_key > @StartDimDateKey)  
GROUP BY DimClub.dim_club_key, 
       DimClub.club_id, 
	   DimClub.club_name,
       DimClub.club_code,
	   DimClub.gl_club_id,
	   DimClub.local_currency_code,
	   MMSRegion.description,
	   PTRCLRegion.description,
	   MemberActivitiesRegion.description

----- Region Prompt ---------------------------------------

IF OBJECT_ID('tempdb.dbo.#DimLocationInfo', 'U') IS NOT NULL
  DROP TABLE #DimLocationInfo;

SET @list_table = 'region_list'


  EXEC marketing.proc_parse_pipe_list @RegionList,@list_table


	
SELECT DimClub.DimClubKey,      ------ name change
      DimClub.MMSRegion as Region,
       DimClub.ClubName AS MMSClubName,
	   DimClub.club_id AS MMSClubID,
	   DimClub.gl_club_id AS GLClubID,
	   DimClub.LocalCurrencyCode
  INTO #DimLocationInfo    
  FROM #Clubs DimClub     
  JOIN #region_list RegionList 
   ON RegionList.Item = DimClub.MMSRegion
     OR RegionList.Item = 'All Regions'
 GROUP BY DimClub.DimClubKey, 
      DimClub.MMSRegion,
       DimClub.ClubName,
	   DimClub.club_id,
	   DimClub.gl_club_id,
	   DimClub.LocalCurrencyCode


   --- Workday Offering Prompt ------  
IF OBJECT_ID('tempdb.dbo.#WDOfferingPromptList', 'U') IS NOT NULL
  DROP TABLE #WDOfferingPromptList;   

DECLARE @list_offering_table VARCHAR(100)
SET @list_offering_table = 'wd_offering_list'

EXEC marketing.proc_parse_pipe_list @WorkDayOffering,@list_offering_table



SELECT DISTINCT wd_offering_list.Item
  INTO #WDOfferingPromptList
  FROM #wd_offering_list  wd_offering_list


 --- Workday Cost Center Prompt ------  
IF OBJECT_ID('tempdb.dbo.#WDCostCenterPromptList', 'U') IS NOT NULL
  DROP TABLE #WDCostCenterPromptList;   

DECLARE @list_costcenter_table VARCHAR(100)
SET @list_costcenter_table = 'wd_costcenter_list'

EXEC marketing.proc_parse_pipe_list @WorkDayCostCenter,@list_costcenter_table

SELECT DISTINCT wd_costcenter_list.Item
  INTO #WDCostCenterPromptList
  FROM #wd_costcenter_list  wd_costcenter_list



/* Find all Participation records related to Pilates/SGT , where booking date is after the Start Date of the Reporting Range till the date the subscription is Paid*/
IF OBJECT_ID('tempdb.dbo.#participation_temp', 'U') IS NOT NULL
drop table #participation_temp;

/* Number of Participations */
SELECT
--distinct
c.club_code,
c.club_name,
c.workday_region,
mmsregion.description mmsRegion,
mmsp.workday_cost_center,
mmsp.workday_offering,
bo.start_dim_date_key,
par.dim_exerp_subscription_key,
--par.participation_id,
p.product_name exerp_product_name,
mmsp.product_description mms_product_description,
case when (bo.start_dim_date_key between @StartDimDateKey and @EndtDimDateKey) then 1 else 0 end booking_serviced_this_period,
case when bo.start_dim_date_key > @EndtDimDateKey then 1 else 0 end booking_outstanding
INTO #participation_temp
from marketing.v_fact_exerp_participation par
inner join marketing.v_dim_exerp_booking bo on bo.dim_exerp_booking_key = par.dim_exerp_booking_key
inner join [marketing].[v_dim_exerp_activity] a on bo.dim_exerp_activity_key = a.dim_exerp_activity_key
inner join marketing.v_dim_exerp_subscription s on par.dim_exerp_subscription_key = s.dim_exerp_subscription_key
inner join marketing.v_dim_exerp_product p on s.dim_exerp_product_key = p.dim_exerp_product_key
left join marketing.v_dim_mms_Product mmsp on p.dim_mms_product_key = mmsp.dim_mms_product_key
inner join marketing.v_dim_club c on bo.dim_club_key = c.dim_club_key
inner join marketing.v_dim_description mmsregion on c.region_dim_description_key = mmsregion.dim_description_key
inner join #DimLocationInfo  clist on c.dim_club_key = clist.DimClubKey
 where 1=1
 and a.activity_group_name in ('Small Group Training','Pilates Class','Virtual Training')
and bo.start_dim_date_key >= @StartDimDateKey 
and bo.start_dim_date_key <= s.billed_until_dim_date_key
/*REP-8318 */
and ((par.participation_state = ('CANCELLED') and (par.cancel_reason = 'NO_SHOW')) or (par.participation_state <> 'CANCELLED'))






/* Query to find out the Subscription Sale , amount that was paid(Cash + LTBucks), price per booking, price per booking minus ltbucks */

IF OBJECT_ID('tempdb.dbo.#subscriptionSales_temp_intermediate', 'U') IS NOT NULL
drop table #subscriptionSales_temp_intermediate;

/* Subscription period data for that subscription */
select 
	  s.dim_exerp_subscription_key,
	  s.dim_club_key,
	  s.subscription_id,
	  s.stop_dim_date_key,
	  sp.[dim_exerp_subscription_period_key],
	  sp.from_dim_date_key, 
	  sp.to_dim_date_key, 
	  sp.subscription_period_state,
	  sp.dim_exerp_product_key,
	  sp.net_amount sub_period_payment_amount, 
	  sp.lt_bucks_amount as sub_period_lt_bucks_amount,
	  sp.[number_of_bookings] as sub_period_number_of_booking,
	  sp.[price_per_booking] as sub_period_price_per_booking,
	  sp.[price_per_booking_less_lt_bucks] as sub_period_price_per_booking_less_lt_bucks,
	  @StartDimDateKey as FirstOfReportRangeDimDateKey ,
	  @EndtDimDateKey as EndOfReportRangeDimDateKey,
	  /* We are handling the situation where the Reporting Period spand across multiple Subscription pay periods*/
	  case when @StartDimDateKey >= sp.from_dim_date_key then @StartDimDateKey else sp.from_dim_date_key end effective_from_date_key,
      case when @EndtDimDateKey >= sp.to_dim_date_key then sp.to_dim_date_key else @EndtDimDateKey end effective_to_date_key,
	   /* Way Exerp Handles Refunds, it Cancels the Original Subscription Period Record, and Add another Row with the Pro-rated amount
	  We wish to get the initial record to calculate the Price Per Booking. So we are ranking the Subscription period records */
	  rank() over (partition by s.dim_exerp_subscription_key,sp.from_dim_date_key order by sp.subscription_period_id) sp_rank
	  into #subscriptionSales_temp_intermediate
  from 
  [marketing].[v_dim_exerp_subscription] s
  inner join [marketing].[v_dim_exerp_subscription_period] sp on s.[dim_exerp_subscription_key]= sp.[dim_exerp_subscription_key]
  inner join [marketing].[v_dim_exerp_product] p on s.dim_exerp_product_key = p.dim_exerp_product_key
  --where s.dim_exerp_subscription_key = @subscriptionkey
  where p.master_product_global_id in ('ALPHA_METCON_MONTHLY', 'ALPHA_STRONG_MONTHLY', 'GTX_BURN_MONTHLY', 'GTX_CUT_MONTHLY',
'ULTRA_FIT_COURSE_MONTHLY', 'TEAM_TRI_COURSE_MONTHLY', 'PILATES_GROUP_COURSE_MONTHLY',
'VIRTUAL_PT_MONTHLY','ALPHA_METCON_COURSE_MONTHLY','ALPHA_STRONG_COURSE_MONTHLY','GTX_BURN_COURSE_MONTHLY','GTX_CUT_COURSE_MONTHLY') /*Exclude Clipcard Subscriptions */
  and ((sp.from_dim_date_key between @StartDimDateKey and @EndtDimDateKey) or (sp.to_dim_date_key between @StartDimDateKey and @EndtDimDateKey))

  


  IF OBJECT_ID('tempdb.dbo.#subscriptionSales_temp', 'U') IS NOT NULL
  drop table #subscriptionSales_temp;

  select
      s.dim_exerp_subscription_key,
	  s.dim_club_key,
	  s.subscription_id,
	  s.stop_dim_date_key,
	  s.dim_exerp_subscription_period_key,
	  s.from_dim_date_key, 
	  s.to_dim_date_key, 
	  s.subscription_period_state,
	  s.dim_exerp_product_key,
	  s.sub_period_payment_amount, 
	  s.sub_period_lt_bucks_amount,
	  s.sub_period_number_of_booking,
	  s.sub_period_price_per_booking,
	  s.sub_period_price_per_booking_less_lt_bucks,
	  s.FirstOfReportRangeDimDateKey ,
	  s.EndOfReportRangeDimDateKey,
	  s.effective_from_date_key,
      s.effective_to_date_key,
	  s.sp_rank,
	  case when s.subscription_period_state = 'CANCELLED' then (s.sub_period_payment_amount - (lead(s.sub_period_payment_amount,1) over (Order by s.dim_exerp_subscription_key, s.sp_rank))) else 0 end refund_amount
	  into #subscriptionSales_temp
	  from #subscriptionSales_temp_intermediate s

	  /*****************/
	  /* We build a temp table to find out the total number of Bookings associated with a COMPLETED Subscription period, 
	  and compare that with the number of EXPECTED bookings for that Subscription Period.
	  That way we would know how much of the UNBOOKED reveneu we can recognize for that COMPLETED subscription period*/
	  IF OBJECT_ID('tempdb.dbo.#all_participations_temp', 'U') IS NOT NULL
  drop table #all_participations_temp;

  select 
  par.dim_exerp_subscription_key,
  par.dim_exerp_booking_key,
  bo.start_dim_date_key
  INTO #all_participations_temp
  from
  marketing.v_fact_exerp_participation par 
inner join marketing.v_dim_exerp_booking bo on bo.dim_exerp_booking_key = par.dim_exerp_booking_key
inner join [marketing].[v_dim_exerp_activity] a on bo.dim_exerp_activity_key = a.dim_exerp_activity_key
where 1=1
--and a.activity_group_name in ('Small Group Training','Pilates Class','Virtual Training')
/*REP-8318 */
and ((par.participation_state = ('CANCELLED') and (par.cancel_reason = 'NO_SHOW')) or (par.participation_state <> 'CANCELLED'))


	  IF OBJECT_ID('tempdb.dbo.#participation_Subscription_temp', 'U') IS NOT NULL
       drop table #participation_Subscription_temp;

	  select  
	  s.dim_exerp_subscription_key,
	  s.dim_exerp_subscription_period_key,
	  s.sub_period_number_of_booking,
	  s.sub_period_price_per_booking,
	  count(coalesce(par.dim_exerp_booking_key,NULL)) actual_number_of_booking
	  INTO #participation_Subscription_temp
	  from
	  #subscriptionSales_temp s
	  LEFT JOIN #all_participations_temp par on s.dim_exerp_subscription_key = par.dim_exerp_subscription_key and par.start_dim_date_key between s.from_dim_date_key and s.to_dim_date_key
	  group by
	   s.dim_exerp_subscription_key,
	   s.dim_exerp_subscription_period_key,
	  s.sub_period_number_of_booking,
	  s.sub_period_price_per_booking

	  --select * from #participation_Subscription_temp where dim_exerp_subscription_key = '2FAED66234F6782764B27BA4080D32DD'
	  --where actual_number_of_booking < sub_period_number_of_booking;

	    IF OBJECT_ID('tempdb.dbo.#unbooked_Recognized_Subscription_temp', 'U') IS NOT NULL
       drop table #unbooked_Recognized_Subscription_temp;

	  SELECT
			c.club_code,
			c.club_name,
			c.workday_region,
			mmsregion.description mmsRegion,
			mmsp.workday_cost_center,
			mmsp.workday_offering,
			p.product_name exerp_product_name,
			mmsp.product_description mms_product_description,
			s.dim_exerp_subscription_key,
			s.subscription_id,
			0 bookings_serviced_this_period,
			0 revenue_recognized_this_period,
			0 revenue_recognized_this_period_less_ltbucks,
		    0 total_outstanding_bookings,
		    0 total_outstanding_booking_revenue,
		    0 refund_amount,
		    0 sub_period_payment_amount,
			sum((s.sub_period_price_per_booking_less_lt_bucks * (isnull(pst.sub_period_number_of_booking,0) - isnull(pst.actual_number_of_booking,0) ))) unbooked_recognized_revenue
	  INTO #unbooked_Recognized_Subscription_temp
	 from #subscriptionSales_temp s
	  inner join marketing.v_dim_exerp_product p on s.dim_exerp_product_key = p.dim_exerp_product_key
      left join marketing.v_dim_mms_Product mmsp on p.dim_mms_product_key = mmsp.dim_mms_product_key
      inner join marketing.v_dim_club c on s.dim_club_key = c.dim_club_key
	  inner join marketing.v_dim_description mmsregion on c.region_dim_description_key = mmsregion.dim_description_key
      inner join #DimLocationInfo  clist on c.dim_club_key = clist.DimClubKey
	  INNER JOIN #participation_Subscription_temp pst on s.dim_exerp_subscription_period_key = pst.dim_exerp_subscription_period_key and pst.actual_number_of_booking < pst.sub_period_number_of_booking
	  where
	  s.to_dim_date_key < s.EndOfReportRangeDimDateKey
	  and s.subscription_period_state <> 'CANCELLED'
	group by
	c.club_code,
	c.club_name,
	c.workday_region,
	mmsregion.description,
	mmsp.workday_cost_center,
	mmsp.workday_offering,
	p.product_name,
	mmsp.product_description,
	s.dim_exerp_subscription_key,
	s.subscription_id


	
	  /*****************/
	 

/*Next, we are combining Subscription Sales to SGT/Pilates Participation to find out the Amount Paid / Revenue Realized / Revenue Outstanding 
  per Subscription
  In case there is a scenario where within the Selected Date Range, there is Participation accociated with a Given Subscription, 
  but no Subscription period record,that participation record will drop off from this and subsequent tables
  */

IF OBJECT_ID('tempdb.dbo.#deferred_revenue_temp', 'U') IS NOT NULL
drop table #deferred_revenue_temp;

 select
 par.club_code,
 par.club_name,
 par.workday_region,
 par.mmsRegion,
 par.workday_cost_center,
 par.workday_offering,
 par.exerp_product_name,
 par.mms_product_description,
 sub.dim_exerp_subscription_key,
 sub.subscription_id,
 sum(par.booking_serviced_this_period) bookings_serviced_this_period,
 sum(par.booking_serviced_this_period * sub.sub_period_price_per_booking) revenue_recognized_this_period,
 sum(par.booking_serviced_this_period * sub.sub_period_price_per_booking_less_lt_bucks) revenue_recognized_this_period_less_ltbucks,
 0 total_outstanding_bookings,
 0 total_outstanding_booking_revenue,
 avg(sub.refund_amount) refund_amount,
 avg(sub.sub_period_payment_amount) sub_period_payment_amount,
 0 as unbooked_recognized_revenue
 INTO #deferred_revenue_temp
 from 
 #subscriptionSales_temp sub
 INNER JOIN #participation_temp par 
	on sub.dim_exerp_subscription_key = par.dim_exerp_subscription_key 
	and par.start_dim_date_key between sub.effective_from_date_key and sub.effective_to_date_key
INNER JOIN #WDCostCenterPromptList cc on par.workday_cost_center = cc.item or cc.item = 'All Cost Centers'
INNER JOIN #WDOfferingPromptList ofr on par.workday_offering = ofr.item or ofr.item = 'All Offerings'
where sub.sp_rank = 1 
 group by
 par.club_code,
 par.club_name,
 par.workday_region,
 par.mmsRegion,
 par.workday_cost_center,
 par.workday_offering,
 par.exerp_product_name,
 par.mms_product_description,
 sub.dim_exerp_subscription_key,
 sub.subscription_id

 /*Query to find Outstanding Booking Count and Outstanding Booking Revenue */

IF OBJECT_ID('tempdb.dbo.#outstanding_bookings_temp', 'U') IS NOT NULL
drop table #outstanding_bookings_temp;

select
 par.club_code,
 par.club_name,
 par.workday_region,
 par.mmsRegion,
 par.workday_cost_center,
 par.workday_offering,
 par.exerp_product_name,
 par.mms_product_description,
 sub.dim_exerp_subscription_key,
 sub.subscription_id,
 0 bookings_serviced_this_period,
 0 revenue_recognized_this_period,
 0 revenue_recognized_this_period_less_ltbucks,
count(distinct par.start_dim_date_key) total_outstanding_bookings,
sum(par.booking_outstanding * sub.sub_period_price_per_booking_less_lt_bucks) as total_outstanding_booking_revenue,
avg(sub.refund_amount) refund_amount,
avg(sub.sub_period_payment_amount) sub_period_payment_amount,
0 as unbooked_recognized_revenue
INTO #outstanding_bookings_temp
from
#participation_temp par
INNER JOIN #subscriptionSales_temp sub
on par.dim_exerp_subscription_key = sub.dim_exerp_subscription_key
and par.start_dim_date_key between sub.from_dim_date_key and sub.to_dim_date_key
INNER JOIN #WDCostCenterPromptList cc on par.workday_cost_center = cc.item or cc.item = 'All Cost Centers'
INNER JOIN #WDOfferingPromptList ofr on par.workday_offering = ofr.item or ofr.item = 'All Offerings'
where booking_outstanding = 1 /* Bookings that are serviced Outside the Selected Reporting Date Range*/
and sub.sp_rank = 1 
group by par.club_code,
 par.club_name,
 par.workday_region,
 par.mmsRegion,
 par.workday_cost_center,
 par.workday_offering,
 par.exerp_product_name,
 par.mms_product_description,
 sub.dim_exerp_subscription_key,
 sub.subscription_id

 IF OBJECT_ID('tempdb.dbo.#final_intermediate', 'U') IS NOT NULL
drop table #final_intermediate;
 select a.* 
INTO
 #final_intermediate
 FROM #deferred_revenue_temp a
 UNION ALL
 select ob.* from #outstanding_bookings_temp ob
 UNION ALL
 select b.* from #unbooked_Recognized_Subscription_temp b



/* Final SELECT Query */
select
defr.mmsRegion,
defr.club_code,
defr.club_name,
defr.workday_region,
defr.workday_cost_center,
defr.workday_offering,
defr.exerp_product_name,
defr.mms_product_description,
defr.subscription_id,
sum(defr.bookings_serviced_this_period) as bookings_serviced_this_period,
sum(defr.revenue_recognized_this_period) as revenue_recognized_this_period,
sum(defr.revenue_recognized_this_period_less_ltbucks) as revenue_recognized_this_period_less_ltbucks,
sum(isnull(defr.total_outstanding_bookings,0)) as total_outstanding_booking_count,
sum(isnull(defr.total_outstanding_booking_revenue,0)) as total_outstanding_booking_revenue,
sum(isnull(defr.refund_amount,0)) as total_refund_amount,
sum(case when isnull(defr.refund_amount,0) > 0 then (isnull(defr.sub_period_payment_amount,0) - (isnull(defr.revenue_recognized_this_period_less_ltbucks,0) + isnull(defr.refund_amount,0))) else 0 end) trueup_amount,
sum(isnull(unbooked_recognized_revenue,0)) as unbooked_recognized_revenue
from #final_intermediate defr
group by
defr.mmsRegion,
defr.club_code,
defr.club_name,
defr.workday_region,
defr.workday_cost_center,
defr.workday_offering,
defr.exerp_product_name,
defr.mms_product_description,
defr.subscription_id

 
  END
