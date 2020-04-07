﻿CREATE TABLE [dbo].[dim_mms_membership] (
    [dim_mms_membership_id]                        BIGINT          IDENTITY (1, 1) NOT NULL,
    [dim_mms_membership_key]                       CHAR (32)       NULL,
    [membership_id]                                INT             NULL,
    [advisor_employee_id]                          INT             NULL,
    [attrition_date]                               DATETIME        NULL,
    [created_date_time]                            DATETIME        NULL,
    [created_date_time_key]                        CHAR (8)        NULL,
    [crm_opportunity_id]                           VARCHAR (36)    NULL,
    [current_price]                                DECIMAL (26, 6) NULL,
    [dim_crm_opportunity_key]                      CHAR (32)       NULL,
    [dim_mms_company_key]                          CHAR (32)       NULL,
    [dim_mms_membership_type_key]                  CHAR (32)       NULL,
    [eft_option]                                   VARCHAR (50)    NULL,
    [home_dim_club_key]                            CHAR (32)       NULL,
    [membership_activation_date]                   DATETIME        NULL,
    [membership_address_city]                      VARCHAR (50)    NULL,
    [membership_address_country]                   VARCHAR (50)    NULL,
    [membership_address_line_1]                    VARCHAR (50)    NULL,
    [membership_address_line_2]                    VARCHAR (50)    NULL,
    [membership_address_postal_code]               VARCHAR (11)    NULL,
    [membership_address_state_abbreviation]        VARCHAR (11)    NULL,
    [membership_cancellation_request_date]         DATETIME        NULL,
    [membership_expiration_date]                   DATETIME        NULL,
    [membership_sales_channel_dim_description_key] VARCHAR (532)   NULL,
    [membership_source]                            VARCHAR (50)    NULL,
    [membership_status]                            VARCHAR (50)    NULL,
    [membership_type]                              VARCHAR (50)    NULL,
    [membership_type_id]                           INT             NULL,
    [money_back_cancellation_flag]                 VARCHAR (1)     NULL,
    [non_payment_termination_flag]                 VARCHAR (1)     NULL,
    [original_sales_dim_team_member_key]           CHAR (32)       NULL,
    [prior_plus_membership_type]                   VARCHAR (50)    NULL,
    [prior_plus_membership_type_key]               CHAR (32)       NULL,
    [prior_plus_price]                             DECIMAL (26, 6) NULL,
    [prior_plus_undiscounted_price]                DECIMAL (26, 6) NULL,
    [revenue_reporting_category_description]       VARCHAR (100)   NULL,
    [sales_reporting_category_description]         VARCHAR (50)    NULL,
    [termination_reason]                           VARCHAR (50)    NULL,
    [undiscounted_price]                           DECIMAL (26, 6) NULL,
    [val_country_id]                               INT             NULL,
    [val_eft_option_id]                            INT             NULL,
    [val_membership_source_id]                     INT             NULL,
    [val_membership_status_id]                     INT             NULL,
    [val_revenue_reporting_category_id]            INT             NULL,
    [val_sales_reporting_category_id]              INT             NULL,
    [val_state_id]                                 INT             NULL,
    [val_termination_reason_id]                    INT             NULL,
    [p_mms_membership_id]                          BIGINT          NULL,
    [dv_load_date_time]                            DATETIME        NULL,
    [dv_load_end_date_time]                        DATETIME        NULL,
    [dv_batch_id]                                  BIGINT          NOT NULL,
    [dv_inserted_date_time]                        DATETIME        NOT NULL,
    [dv_insert_user]                               VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                         DATETIME        NULL,
    [dv_update_user]                               VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([dim_mms_membership_key]));
