CREATE PROC [dbo].[proc_fact_exerp_participation] @dv_batch_id [varchar](500) AS
BEGIN
	SET XACT_ABORT ON
	SET NOCOUNT ON

	DECLARE @max_dv_batch_id BIGINT = ( SELECT max(isnull(dv_batch_id,-1)) FROM fact_exerp_participation  )
	DECLARE @current_dv_batch_id BIGINT = @dv_batch_id
	DECLARE @load_dv_batch_id BIGINT = CASE  WHEN @max_dv_batch_id < @current_dv_batch_id   THEN @max_dv_batch_id  ELSE @current_dv_batch_id  END

	if object_id('tempdb..#etl_step1') is not null
		   drop table #etl_step1
	create table dbo.#etl_step1	with ( distribution = hash(fact_exerp_participation_key), location = user_db ) as

	select
		d_exerp_participation.fact_exerp_participation_key
		,d_exerp_participation.participation_id
		,d_exerp_participation.cancel_dim_date_key
		,d_exerp_participation.cancel_dim_time_key
		,d_exerp_participation.cancel_interface_type
		,d_exerp_participation.cancel_reason
		,d_exerp_participation.creation_dim_date_key
		,d_exerp_participation.creation_dim_time_key
		,d_exerp_participation.dim_club_key dim_club_key
		,d_exerp_participation.dim_exerp_booking_key
		, case when d_exerp_participation.bk_hash in ('-997','-998','-999') then d_exerp_participation.bk_hash
			   when clipcard_d_exerp_access_privilege_usage.source_dim_exerp_clipcard_key is null then '-998'
				else clipcard_d_exerp_access_privilege_usage.source_dim_exerp_clipcard_key
		 end dim_exerp_clipcard_key
		,case when d_exerp_participation.bk_hash in ('-997','-998','-999') then d_exerp_participation.bk_hash
			  when subscription_d_exerp_access_privilege_usage.source_dim_exerp_subscription_key is null then '-998'
				else subscription_d_exerp_access_privilege_usage.source_dim_exerp_subscription_key
		 end dim_exerp_subscription_key
		,d_exerp_participation.dim_mms_member_key
		,d_exerp_participation.ets
		,d_exerp_participation.participation_state
		,d_exerp_participation.show_up_dim_date_key
		,d_exerp_participation.show_up_dim_time_key
		,d_exerp_participation.show_up_interface_type
		,d_exerp_participation.show_up_using_card_flag
		,d_exerp_participation.user_interface_type
		,d_exerp_participation.was_on_waiting_list_flag
		,d_exerp_participation.seat_obtained_dim_date_key
		,d_exerp_participation.seat_obtained_dim_time_key
		,d_exerp_participation.participant_number
		,d_exerp_participation.seat_id
		,d_exerp_participation.seat_state
		,case when isnull(d_exerp_participation.dv_load_date_time,'Jan 1, 1753') >= isnull(clipcard_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1, 1753')
			 and isnull(d_exerp_participation.dv_load_date_time,'Jan 1, 1753') >= isnull(subscription_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1, 1753')
				then isnull(d_exerp_participation.dv_load_date_time,'Jan 1, 1753')
			when isnull(clipcard_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1, 1753') >= isnull(subscription_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1,1753')	   then isnull(clipcard_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1, 1753')
			else isnull(subscription_d_exerp_access_privilege_usage.dv_load_date_time,'Jan 1, 1753')  end dv_load_date_time
		,convert(datetime,'99991231',112) dv_load_end_date_time
		,case when isnull(d_exerp_participation.dv_batch_id,'-1') >= isnull(clipcard_d_exerp_access_privilege_usage.dv_batch_id,'-1')
			and isnull(d_exerp_participation.dv_batch_id,'-1') >= isnull(subscription_d_exerp_access_privilege_usage.dv_batch_id,'-1')
				then isnull(d_exerp_participation.dv_batch_id,'-1')
			when isnull(clipcard_d_exerp_access_privilege_usage.dv_batch_id,'-1') >= isnull(subscription_d_exerp_access_privilege_usage.dv_batch_id,'-1')
				then isnull(clipcard_d_exerp_access_privilege_usage.dv_batch_id,'-1')
			else isnull(subscription_d_exerp_access_privilege_usage.dv_batch_id,'-1')  end dv_batch_id
	from d_exerp_participation
    left join d_exerp_access_privilege_usage clipcard_d_exerp_access_privilege_usage
        on d_exerp_participation.bk_hash = clipcard_d_exerp_access_privilege_usage.target_fact_exerp_participation_key
        and clipcard_d_exerp_access_privilege_usage.source_type = 'CLIPCARD'
        and clipcard_d_exerp_access_privilege_usage.target_type = 'PARTICIPATION'
    left join d_exerp_access_privilege_usage subscription_d_exerp_access_privilege_usage
        on d_exerp_participation.bk_hash = subscription_d_exerp_access_privilege_usage.target_fact_exerp_participation_key
        and subscription_d_exerp_access_privilege_usage.source_type = 'SUBSCRIPTION'
        and subscription_d_exerp_access_privilege_usage.target_type = 'PARTICIPATION'
	where (d_exerp_participation.dv_batch_id >= @load_dv_batch_id
        or clipcard_d_exerp_access_privilege_usage.dv_batch_id >= @load_dv_batch_id
        or subscription_d_exerp_access_privilege_usage.dv_batch_id >= @load_dv_batch_id)

	/*   Delete records from the table that exist*/
	/*   Insert records from records from current and missing batches*/
	BEGIN TRAN

	DELETE dbo.fact_exerp_participation WHERE fact_exerp_participation_key IN (SELECT fact_exerp_participation_key FROM dbo.#etl_step1 )

	INSERT INTO fact_exerp_participation(
		 fact_exerp_participation_key
		,participation_id
		,cancel_dim_date_key
		,cancel_dim_time_key
		,cancel_interface_type
		,cancel_reason
		,creation_dim_date_key
		,creation_dim_time_key
		,dim_club_key
		,dim_exerp_booking_key
		,dim_exerp_clipcard_key
		,dim_exerp_subscription_key
		,dim_mms_member_key
		,ets
		,participation_state
		,show_up_dim_date_key
		,show_up_dim_time_key
		,show_up_interface_type
		,show_up_using_card_flag
		,user_interface_type
		,was_on_waiting_list_flag
		,seat_obtained_dim_date_key
		,seat_obtained_dim_time_key
		,participant_number
		,seat_id
		,seat_state
		,dv_load_date_time
		,dv_load_end_date_time
		,dv_batch_id
		,dv_inserted_date_time
		,dv_insert_user
	)
	select
		fact_exerp_participation_key
		,participation_id
		,cancel_dim_date_key
		,cancel_dim_time_key
		,cancel_interface_type
		,cancel_reason
		,creation_dim_date_key
		,creation_dim_time_key
		,dim_club_key
		,dim_exerp_booking_key
		,dim_exerp_clipcard_key
		,dim_exerp_subscription_key
		,dim_mms_member_key
		,ets
		,participation_state
		,show_up_dim_date_key
		,show_up_dim_time_key
		,show_up_interface_type
		,show_up_using_card_flag
		,user_interface_type
		,was_on_waiting_list_flag
		,seat_obtained_dim_date_key
		,seat_obtained_dim_time_key
		,participant_number
		,seat_id
		,seat_state
		,dv_load_date_time
		,dv_load_end_date_time
		,dv_batch_id
		,getdate()
		,suser_sname()
	from #etl_step1

	COMMIT TRAN

END
