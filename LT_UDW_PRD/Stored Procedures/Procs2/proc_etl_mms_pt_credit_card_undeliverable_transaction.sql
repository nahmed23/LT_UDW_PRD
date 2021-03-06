﻿CREATE PROC [dbo].[proc_etl_mms_pt_credit_card_undeliverable_transaction] @current_dv_batch_id [bigint],@job_start_date_time_varchar [varchar](19) AS
begin

set nocount on
set xact_abort on

--Start!
declare @job_start_date_time datetime
set @job_start_date_time = convert(datetime,@job_start_date_time_varchar,120)

declare @user varchar(50) = suser_sname()
declare @insert_date_time datetime

truncate table stage_hash_mms_PTCreditCardUndeliverableTransaction

set @insert_date_time = getdate()
insert into dbo.stage_hash_mms_PTCreditCardUndeliverableTransaction (
       bk_hash,
       PTCreditCardUndeliverableTransactionID,
       EntryDataSource,
       AccountNumber,
       ExpirationDate,
       TranAmount,
       ReferenceCode,
       TipAmount,
       EmployeeID,
       MemberID,
       CardHolderStreetAddress,
       CardHolderZipCode,
       TransactionDateTime,
       UTCTransactionDateTime,
       TransactionDateTimeZone,
       IndustryCode,
       ReasonMessage,
       CardType,
       PTCreditCardTerminalID,
       CardOnFileFlag,
       InsertedDateTime,
       MaskedAccountNumber,
       UpdatedDateTime,
       MaskedAccountNumber64,
       CardHolderName,
       TypeIndicator,
       ThirdPartyPOSPaymentID,
       HbcPaymentFlag,
       dv_load_date_time,
       dv_inserted_date_time,
       dv_insert_user,
       dv_batch_id)
select convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(PTCreditCardUndeliverableTransactionID as varchar(500)),'z#@$k%&P'))),2) bk_hash,
       PTCreditCardUndeliverableTransactionID,
       EntryDataSource,
       AccountNumber,
       ExpirationDate,
       TranAmount,
       ReferenceCode,
       TipAmount,
       EmployeeID,
       MemberID,
       CardHolderStreetAddress,
       CardHolderZipCode,
       TransactionDateTime,
       UTCTransactionDateTime,
       TransactionDateTimeZone,
       IndustryCode,
       ReasonMessage,
       CardType,
       PTCreditCardTerminalID,
       CardOnFileFlag,
       InsertedDateTime,
       MaskedAccountNumber,
       UpdatedDateTime,
       MaskedAccountNumber64,
       CardHolderName,
       TypeIndicator,
       ThirdPartyPOSPaymentID,
       HbcPaymentFlag,
       isnull(cast(stage_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       @insert_date_time,
       @user,
       dv_batch_id
  from stage_mms_PTCreditCardUndeliverableTransaction
 where dv_batch_id = @current_dv_batch_id

--Run PIT proc for retry logic
exec dbo.proc_p_mms_pt_credit_card_undeliverable_transaction @current_dv_batch_id

--Insert/update new hub business keys
set @insert_date_time = getdate()
insert into h_mms_pt_credit_card_undeliverable_transaction (
       bk_hash,
       pt_credit_card_undeliverable_transaction_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_inserted_date_time,
       dv_insert_user)
select stage_hash_mms_PTCreditCardUndeliverableTransaction.bk_hash,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardUndeliverableTransactionID pt_credit_card_undeliverable_transaction_id,
       isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime as datetime),'Jan 1, 1753') dv_load_date_time,
       @current_dv_batch_id,
       2,
       @insert_date_time,
       @user
  from stage_hash_mms_PTCreditCardUndeliverableTransaction
  left join h_mms_pt_credit_card_undeliverable_transaction
    on stage_hash_mms_PTCreditCardUndeliverableTransaction.bk_hash = h_mms_pt_credit_card_undeliverable_transaction.bk_hash
 where h_mms_pt_credit_card_undeliverable_transaction_id is null
   and stage_hash_mms_PTCreditCardUndeliverableTransaction.dv_batch_id = @current_dv_batch_id

--calculate hash and lookup to current l_mms_pt_credit_card_undeliverable_transaction
if object_id('tempdb..#l_mms_pt_credit_card_undeliverable_transaction_inserts') is not null drop table #l_mms_pt_credit_card_undeliverable_transaction_inserts
create table #l_mms_pt_credit_card_undeliverable_transaction_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_mms_PTCreditCardUndeliverableTransaction.bk_hash,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardUndeliverableTransactionID pt_credit_card_undeliverable_transaction_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.EntryDataSource entry_data_source,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.EmployeeID employee_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.MemberID member_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardTerminalID pt_credit_card_terminal_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.ThirdPartyPOSPaymentID third_party_pos_payment_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardUndeliverableTransactionID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.EntryDataSource as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.EmployeeID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.MemberID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardTerminalID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.ThirdPartyPOSPaymentID as varchar(500)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_mms_PTCreditCardUndeliverableTransaction
 where stage_hash_mms_PTCreditCardUndeliverableTransaction.dv_batch_id = @current_dv_batch_id

--Insert all updated and new l_mms_pt_credit_card_undeliverable_transaction records
set @insert_date_time = getdate()
insert into l_mms_pt_credit_card_undeliverable_transaction (
       bk_hash,
       pt_credit_card_undeliverable_transaction_id,
       entry_data_source,
       employee_id,
       member_id,
       pt_credit_card_terminal_id,
       third_party_pos_payment_id,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #l_mms_pt_credit_card_undeliverable_transaction_inserts.bk_hash,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.pt_credit_card_undeliverable_transaction_id,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.entry_data_source,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.employee_id,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.member_id,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.pt_credit_card_terminal_id,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.third_party_pos_payment_id,
       case when l_mms_pt_credit_card_undeliverable_transaction.l_mms_pt_credit_card_undeliverable_transaction_id is null then isnull(#l_mms_pt_credit_card_undeliverable_transaction_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       2,
       #l_mms_pt_credit_card_undeliverable_transaction_inserts.source_hash,
       @insert_date_time,
       @user
  from #l_mms_pt_credit_card_undeliverable_transaction_inserts
  left join p_mms_pt_credit_card_undeliverable_transaction
    on #l_mms_pt_credit_card_undeliverable_transaction_inserts.bk_hash = p_mms_pt_credit_card_undeliverable_transaction.bk_hash
   and p_mms_pt_credit_card_undeliverable_transaction.dv_load_end_date_time = 'Dec 31, 9999'
  left join l_mms_pt_credit_card_undeliverable_transaction
    on p_mms_pt_credit_card_undeliverable_transaction.bk_hash = l_mms_pt_credit_card_undeliverable_transaction.bk_hash
   and p_mms_pt_credit_card_undeliverable_transaction.l_mms_pt_credit_card_undeliverable_transaction_id = l_mms_pt_credit_card_undeliverable_transaction.l_mms_pt_credit_card_undeliverable_transaction_id
 where l_mms_pt_credit_card_undeliverable_transaction.l_mms_pt_credit_card_undeliverable_transaction_id is null
    or (l_mms_pt_credit_card_undeliverable_transaction.l_mms_pt_credit_card_undeliverable_transaction_id is not null
        and l_mms_pt_credit_card_undeliverable_transaction.dv_hash <> #l_mms_pt_credit_card_undeliverable_transaction_inserts.source_hash)

--calculate hash and lookup to current s_mms_pt_credit_card_undeliverable_transaction
if object_id('tempdb..#s_mms_pt_credit_card_undeliverable_transaction_inserts') is not null drop table #s_mms_pt_credit_card_undeliverable_transaction_inserts
create table #s_mms_pt_credit_card_undeliverable_transaction_inserts with (distribution=hash(bk_hash), location=user_db, clustered index (bk_hash)) as 
select stage_hash_mms_PTCreditCardUndeliverableTransaction.bk_hash,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardUndeliverableTransactionID pt_credit_card_undeliverable_transaction_id,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.AccountNumber account_number,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.ExpirationDate expiration_date,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.TranAmount tran_amount,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.ReferenceCode reference_code,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.TipAmount tip_amount,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderStreetAddress card_holder_street_address,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderZipCode card_holder_zip_code,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.TransactionDateTime transaction_date_time,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.UTCTransactionDateTime utc_transaction_date_time,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.TransactionDateTimeZone transaction_date_time_zone,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.IndustryCode industry_code,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.ReasonMessage reason_message,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.CardType card_type,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.CardOnFileFlag card_on_file_flag,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime inserted_date_time,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.MaskedAccountNumber masked_account_number,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.UpdatedDateTime updated_date_time,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.MaskedAccountNumber64 masked_account_number64,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderName card_holder_name,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.TypeIndicator type_indicator,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.HbcPaymentFlag hbc_payment_flag,
       stage_hash_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime dv_load_date_time,
       convert(char(32),hashbytes('md5',('P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.PTCreditCardUndeliverableTransactionID as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.AccountNumber,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_PTCreditCardUndeliverableTransaction.ExpirationDate,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.TranAmount as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.ReferenceCode,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.TipAmount as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderStreetAddress,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderZipCode,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_PTCreditCardUndeliverableTransaction.TransactionDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_PTCreditCardUndeliverableTransaction.UTCTransactionDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.TransactionDateTimeZone,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.IndustryCode as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.ReasonMessage,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.CardType,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.CardOnFileFlag as varchar(42)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_PTCreditCardUndeliverableTransaction.InsertedDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.MaskedAccountNumber,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(convert(varchar,stage_hash_mms_PTCreditCardUndeliverableTransaction.UpdatedDateTime,120),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.MaskedAccountNumber64,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(stage_hash_mms_PTCreditCardUndeliverableTransaction.CardHolderName,'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.TypeIndicator as varchar(500)),'z#@$k%&P')+
                                         'P%#&z$@k'+isnull(cast(stage_hash_mms_PTCreditCardUndeliverableTransaction.HbcPaymentFlag as varchar(42)),'z#@$k%&P'))),2) source_hash
  from dbo.stage_hash_mms_PTCreditCardUndeliverableTransaction
 where stage_hash_mms_PTCreditCardUndeliverableTransaction.dv_batch_id = @current_dv_batch_id

--Insert all updated and new s_mms_pt_credit_card_undeliverable_transaction records
set @insert_date_time = getdate()
insert into s_mms_pt_credit_card_undeliverable_transaction (
       bk_hash,
       pt_credit_card_undeliverable_transaction_id,
       account_number,
       expiration_date,
       tran_amount,
       reference_code,
       tip_amount,
       card_holder_street_address,
       card_holder_zip_code,
       transaction_date_time,
       utc_transaction_date_time,
       transaction_date_time_zone,
       industry_code,
       reason_message,
       card_type,
       card_on_file_flag,
       inserted_date_time,
       masked_account_number,
       updated_date_time,
       masked_account_number64,
       card_holder_name,
       type_indicator,
       hbc_payment_flag,
       dv_load_date_time,
       dv_batch_id,
       dv_r_load_source_id,
       dv_hash,
       dv_inserted_date_time,
       dv_insert_user)
select #s_mms_pt_credit_card_undeliverable_transaction_inserts.bk_hash,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.pt_credit_card_undeliverable_transaction_id,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.account_number,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.expiration_date,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.tran_amount,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.reference_code,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.tip_amount,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.card_holder_street_address,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.card_holder_zip_code,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.transaction_date_time,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.utc_transaction_date_time,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.transaction_date_time_zone,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.industry_code,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.reason_message,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.card_type,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.card_on_file_flag,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.inserted_date_time,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.masked_account_number,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.updated_date_time,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.masked_account_number64,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.card_holder_name,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.type_indicator,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.hbc_payment_flag,
       case when s_mms_pt_credit_card_undeliverable_transaction.s_mms_pt_credit_card_undeliverable_transaction_id is null then isnull(#s_mms_pt_credit_card_undeliverable_transaction_inserts.dv_load_date_time,convert(datetime,'jan 1, 1753',120))
            else @job_start_date_time end,
       @current_dv_batch_id,
       2,
       #s_mms_pt_credit_card_undeliverable_transaction_inserts.source_hash,
       @insert_date_time,
       @user
  from #s_mms_pt_credit_card_undeliverable_transaction_inserts
  left join p_mms_pt_credit_card_undeliverable_transaction
    on #s_mms_pt_credit_card_undeliverable_transaction_inserts.bk_hash = p_mms_pt_credit_card_undeliverable_transaction.bk_hash
   and p_mms_pt_credit_card_undeliverable_transaction.dv_load_end_date_time = 'Dec 31, 9999'
  left join s_mms_pt_credit_card_undeliverable_transaction
    on p_mms_pt_credit_card_undeliverable_transaction.bk_hash = s_mms_pt_credit_card_undeliverable_transaction.bk_hash
   and p_mms_pt_credit_card_undeliverable_transaction.s_mms_pt_credit_card_undeliverable_transaction_id = s_mms_pt_credit_card_undeliverable_transaction.s_mms_pt_credit_card_undeliverable_transaction_id
 where s_mms_pt_credit_card_undeliverable_transaction.s_mms_pt_credit_card_undeliverable_transaction_id is null
    or (s_mms_pt_credit_card_undeliverable_transaction.s_mms_pt_credit_card_undeliverable_transaction_id is not null
        and s_mms_pt_credit_card_undeliverable_transaction.dv_hash <> #s_mms_pt_credit_card_undeliverable_transaction_inserts.source_hash)

--Run the PIT proc
exec dbo.proc_p_mms_pt_credit_card_undeliverable_transaction @current_dv_batch_id

end
