﻿CREATE TABLE [dbo].[wrk_pega_customer_attribute] (
    [wrk_pega_customer_attribute_id]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [assess_junior_member_dues_flag]        VARCHAR (50)    NULL,
    [date_of_birth]                         VARCHAR (8)     NULL,
    [dim_mms_member_key]                    VARCHAR (32)    NULL,
    [dim_mms_membership_key]                VARCHAR (32)    NULL,
    [entity_id]                             BIGINT          NULL,
    [first_name]                            VARCHAR (50)    NULL,
    [global_opt_in]                         BIT             NULL,
    [last_name]                             VARCHAR (50)    NULL,
    [member_active_flag]                    VARCHAR (1)     NULL,
    [member_gender]                         VARCHAR (1)     NULL,
    [member_id]                             INT             NULL,
    [member_join_date]                      VARCHAR (8)     NULL,
    [member_mms_home_club_id]               INT             NULL,
    [member_type]                           VARCHAR (50)    NULL,
    [membership_address_city]               VARCHAR (50)    NULL,
    [membership_address_country]            VARCHAR (50)    NULL,
    [membership_address_line_1]             VARCHAR (50)    NULL,
    [membership_address_line_2]             VARCHAR (50)    NULL,
    [membership_address_postal_code]        VARCHAR (11)    NULL,
    [membership_address_state_abbreviation] VARCHAR (11)    NULL,
    [membership_cancellation_request_date]  VARCHAR (8)     NULL,
    [membership_created_date_time]          DATETIME        NULL,
    [membership_current_price]              DECIMAL (26, 6) NULL,
    [membership_expiration_date]            VARCHAR (8)     NULL,
    [membership_home_dim_club_key]          VARCHAR (32)    NULL,
    [membership_id]                         INT             NULL,
    [membership_phone]                      VARCHAR (300)   NULL,
    [membership_product_description]        CHAR (50)       NULL,
    [membership_product_id]                 INT             NULL,
    [membership_source]                     VARCHAR (50)    NULL,
    [membership_status]                     VARCHAR (50)    NULL,
    [membership_termination_reason]         VARCHAR (50)    NULL,
    [membership_type]                       VARCHAR (50)    NULL,
    [nps_score]                             VARCHAR (255)   NULL,
    [nps_survey_date]                       VARCHAR (8)     NULL,
    [party_id]                              INT             NULL,
    [primary_activity_segment_name]         CHAR (255)      NULL,
    [promotion_opt_in]                      BIT             NULL,
    [sequence_number]                       INT             NULL,
    [sum_expected_value_60_months]          DECIMAL (26, 6) NULL,
    [term_risk_segment_name]                CHAR (255)      NULL,
    [dv_load_date_time]                     DATETIME        NULL,
    [dv_load_end_date_time]                 DATETIME        NULL,
    [dv_batch_id]                           BIGINT          NOT NULL,
    [dv_inserted_date_time]                 DATETIME        NOT NULL,
    [dv_insert_user]                        VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                  DATETIME        NULL,
    [dv_update_user]                        VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = REPLICATE);

