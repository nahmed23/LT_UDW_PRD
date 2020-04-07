﻿CREATE PROC [dbo].[proc_fact_mms_membership_modification_request] @dv_batch_id [varchar](500) AS
begin

set xact_abort on
set nocount on

declare @max_dv_batch_id bigint = (select max(isnull(dv_batch_id,-1)) from fact_mms_membership_modification_request)
declare @current_dv_batch_id bigint = @dv_batch_id
declare @load_dv_batch_id bigint = case when @max_dv_batch_id < @current_dv_batch_id then @max_dv_batch_id else @current_dv_batch_id end

if object_id('tempdb..#d_mms_membership_modification_request') is not null drop table #d_mms_membership_modification_request
create table dbo.#d_mms_membership_modification_request with(distribution=hash(fact_mms_membership_modification_request_key), location=user_db, heap) as
select d_mms_membership_modification_request.bk_hash as fact_mms_membership_modification_request_key,
d_mms_membership_modification_request.membership_modification_request_id as membership_modification_request_id,
d_mms_membership_modification_request.dim_mms_membership_key as dim_mms_membership_key,
d_mms_membership_modification_request.membership_modification_request_type_dim_description_key as request_type_dim_description_key,
d_mms_membership_modification_request.request_date_time as request_date_time,
d_mms_membership_modification_request.request_dim_date_key as request_dim_date_key,
d_mms_membership_modification_request.request_dim_time_key as request_dim_time_key,
d_mms_membership_modification_request.membership_modification_request_status_dim_description_key as request_status_dim_mms_description_key,
d_mms_membership_modification_request.status_changed_date_time as request_status_changed_date_time,
d_mms_membership_modification_request.status_changed_dim_date_key as request_status_changed_dim_date_key,
d_mms_membership_modification_request.status_changed_dim_time_key as request_status_changed_dim_time_key,
d_mms_membership_modification_request.flex_reason_dim_description_key as flex_downgrade_reason_dim_description_key,
d_mms_membership_type.dim_mms_product_key as membership_type_dim_mms_product_key,
d_mms_membership_modification_request.dim_employee_key as modification_dim_employee_key,
d_mms_membership_modification_request.dim_mms_member_key as requesting_dim_mms_member_key,
d_mms_membership_modification_request.undiscounted_price as undiscounted_price,
d_mms_membership_modification_request.new_primary_id as new_primary_id,
d_mms_membership_modification_request.val_membership_modification_request_source_id as val_membership_modification_request_source_id,
d_mms_membership_modification_request.membership_modification_request_source_dim_description_key as membership_modification_request_source_dim_description_key,
d_mms_membership_modification_request.dv_load_date_time as dv_load_date_time,
d_mms_membership_modification_request.dv_load_end_date_time as dv_load_end_date_time,
d_mms_membership_modification_request.dv_batch_id as dv_batch_id
from d_mms_membership_modification_request d_mms_membership_modification_request
join d_mms_membership_type d_mms_membership_type
on d_mms_membership_type.dim_mms_membership_type_key = d_mms_membership_modification_request.dim_mms_membership_type_key
where d_mms_membership_modification_request.dv_batch_id >= @load_dv_batch_id

/*----load data into fact_mms_membership_modification_request --------------*/
 begin tran
    delete dbo.fact_mms_membership_modification_request
    where fact_mms_membership_modification_request_key in (select fact_mms_membership_modification_request_key from dbo.#d_mms_membership_modification_request) 
	
insert dbo.fact_mms_membership_modification_request
(
fact_mms_membership_modification_request_key,
membership_modification_request_id,
dim_mms_membership_key,
request_type_dim_description_key,
request_date_time,
request_dim_date_key,
request_dim_time_key,
request_status_dim_mms_description_key,
request_status_changed_date_time,
request_status_changed_dim_date_key,
request_status_changed_dim_time_key,
flex_downgrade_reason_dim_description_key,
membership_type_dim_mms_product_key,
modification_dim_employee_key,
requesting_dim_mms_member_key,
undiscounted_price,
new_primary_id,
val_membership_modification_request_source_id,
membership_modification_request_source_dim_description_key,
dv_load_date_time,
dv_load_end_date_time,
dv_batch_id,
dv_inserted_date_time,
dv_insert_user
)
select 
fact_mms_membership_modification_request_key,
membership_modification_request_id,
dim_mms_membership_key,
request_type_dim_description_key,
request_date_time,
request_dim_date_key,
request_dim_time_key,
request_status_dim_mms_description_key,
request_status_changed_date_time,
request_status_changed_dim_date_key,
request_status_changed_dim_time_key,
flex_downgrade_reason_dim_description_key,
membership_type_dim_mms_product_key,
modification_dim_employee_key,
requesting_dim_mms_member_key,
undiscounted_price,
new_primary_id,
val_membership_modification_request_source_id,
membership_modification_request_source_dim_description_key,
dv_load_date_time,
dv_load_end_date_time,
dv_batch_id,
getdate() as dv_inserted_date_time,
suser_sname() as dv_insert_user
from #d_mms_membership_modification_request

commit tran

end

