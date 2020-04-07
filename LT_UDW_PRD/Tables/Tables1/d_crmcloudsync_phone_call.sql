﻿CREATE TABLE [dbo].[d_crmcloudsync_phone_call] (
    [d_crmcloudsync_phone_call_id]                           BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                                CHAR (32)       NOT NULL,
    [activity_id]                                            VARCHAR (36)    NULL,
    [activity_additional_params]                             VARCHAR (8000)  NULL,
    [activity_type_code]                                     NVARCHAR (64)   NULL,
    [activity_type_code_name]                                NVARCHAR (255)  NULL,
    [actual_duration_minutes]                                INT             NULL,
    [actual_end_dim_date_key]                                CHAR (8)        NULL,
    [actual_end_dim_time_key]                                CHAR (8)        NULL,
    [actual_start_dim_date_key]                              CHAR (8)        NULL,
    [actual_start_dim_time_key]                              CHAR (8)        NULL,
    [billed_flag]                                            CHAR (1)        NULL,
    [created_by_name]                                        NVARCHAR (200)  NULL,
    [created_by_yomi_name]                                   NVARCHAR (200)  NULL,
    [created_on_behalf_by_dim_crmcloudsync_system_user_key]  VARCHAR (32)    NULL,
    [created_on_behalf_by_name]                              NVARCHAR (200)  NULL,
    [created_on_behalf_by_yomi_name]                         NVARCHAR (200)  NULL,
    [created_on_dim_date_key]                                CHAR (8)        NULL,
    [created_on_dim_time_key]                                CHAR (8)        NULL,
    [description]                                            VARCHAR (8000)  NULL,
    [dim_crmcloudsync_ltf_club_key]                          VARCHAR (32)    NULL,
    [direction_code]                                         BIT             NULL,
    [direction_code_flag]                                    CHAR (1)        NULL,
    [direction_code_name]                                    NVARCHAR (255)  NULL,
    [exchange_rate]                                          DECIMAL (28)    NULL,
    [import_sequence_number]                                 INT             NULL,
    [insert_user]                                            VARCHAR (50)    NULL,
    [inserted_date_time]                                     DATETIME        NULL,
    [is_billed_name]                                         NVARCHAR (255)  NULL,
    [is_regular_activity_name]                               NVARCHAR (255)  NULL,
    [is_workflow_created_name]                               NVARCHAR (255)  NULL,
    [left_voice_mail]                                        BIT             NULL,
    [left_voice_mail_flag]                                   CHAR (1)        NULL,
    [left_voice_mail_name]                                   NVARCHAR (255)  NULL,
    [ltf_call_sub_type]                                      INT             NULL,
    [ltf_call_sub_type_name]                                 NVARCHAR (255)  NULL,
    [ltf_call_type]                                          INT             NULL,
    [ltf_call_type_name]                                     NVARCHAR (255)  NULL,
    [ltf_caller_name]                                        NVARCHAR (100)  NULL,
    [ltf_club]                                               VARCHAR (36)    NULL,
    [ltf_club_id_name]                                       NVARCHAR (100)  NULL,
    [ltf_club_name]                                          NVARCHAR (100)  NULL,
    [ltf_most_recent_casl_dim_date_key]                      CHAR (8)        NULL,
    [ltf_most_recent_casl_dim_time_key]                      CHAR (8)        NULL,
    [ltf_program]                                            INT             NULL,
    [ltf_program_name]                                       NVARCHAR (255)  NULL,
    [ltf_wrap_up_code]                                       INT             NULL,
    [ltf_wrap_up_code_name]                                  NVARCHAR (255)  NULL,
    [modified_by_dim_crmcloudsync_system_user_key]           VARCHAR (32)    NULL,
    [modified_by_name]                                       NVARCHAR (200)  NULL,
    [modified_by_yomi_name]                                  NVARCHAR (200)  NULL,
    [modified_on_behalf_by_dim_crmcloudsync_system_user_key] VARCHAR (32)    NULL,
    [modified_on_behalf_by_name]                             NVARCHAR (200)  NULL,
    [modified_on_behalf_by_yomi_name]                        NVARCHAR (200)  NULL,
    [modified_on_dim_date_key]                               CHAR (8)        NULL,
    [modified_on_dim_time_key]                               CHAR (8)        NULL,
    [new_callid]                                             NVARCHAR (72)   NULL,
    [overridden_on_dim_date_key]                             CHAR (8)        NULL,
    [overridden_on_dim_time_key]                             CHAR (8)        NULL,
    [owner_id]                                               VARCHAR (36)    NULL,
    [owner_id_name]                                          NVARCHAR (200)  NULL,
    [owner_id_type]                                          NVARCHAR (64)   NULL,
    [owner_id_yomi_name]                                     NVARCHAR (200)  NULL,
    [owning_business_unit]                                   VARCHAR (36)    NULL,
    [owning_team]                                            VARCHAR (36)    NULL,
    [owning_user]                                            VARCHAR (36)    NULL,
    [phone_call_from]                                        VARCHAR (8000)  NULL,
    [phone_call_to]                                          VARCHAR (8000)  NULL,
    [phone_number]                                           NVARCHAR (200)  NULL,
    [priority_code]                                          INT             NULL,
    [priority_code_name]                                     NVARCHAR (255)  NULL,
    [process_id]                                             VARCHAR (36)    NULL,
    [regarding_object_id]                                    VARCHAR (36)    NULL,
    [regarding_object_id_name]                               NVARCHAR (4000) NULL,
    [regarding_object_id_yomi_name]                          NVARCHAR (4000) NULL,
    [regarding_object_type_code]                             NVARCHAR (64)   NULL,
    [regular_activity_flag]                                  CHAR (1)        NULL,
    [scheduled_duration_minutes]                             INT             NULL,
    [scheduled_end]                                          DATETIME        NULL,
    [scheduled_end_dim_date_key]                             CHAR (8)        NULL,
    [scheduled_end_dim_time_key]                             CHAR (8)        NULL,
    [scheduled_start]                                        DATETIME        NULL,
    [scheduled_start_dim_date_key]                           CHAR (8)        NULL,
    [scheduled_start_dim_time_key]                           CHAR (8)        NULL,
    [service_id]                                             VARCHAR (36)    NULL,
    [stage_id]                                               VARCHAR (36)    NULL,
    [state_code]                                             INT             NULL,
    [state_code_name]                                        NVARCHAR (255)  NULL,
    [status_code]                                            INT             NULL,
    [status_code_name]                                       NVARCHAR (255)  NULL,
    [sub_category]                                           NVARCHAR (250)  NULL,
    [subject]                                                NVARCHAR (200)  NULL,
    [time_zone_rule_version_number]                          INT             NULL,
    [transaction_currency_id]                                VARCHAR (36)    NULL,
    [transaction_currency_id_name]                           NVARCHAR (100)  NULL,
    [traversed_path]                                         NVARCHAR (1250) NULL,
    [update_user]                                            VARCHAR (50)    NULL,
    [updated_date_time]                                      DATETIME        NULL,
    [utc_conversion_time_zone_code]                          INT             NULL,
    [version_number]                                         BIGINT          NULL,
    [workflow_created_flag]                                  CHAR (1)        NULL,
    [p_crmcloudsync_phone_call_id]                           BIGINT          NOT NULL,
    [deleted_flag]                                           INT             NULL,
    [dv_load_date_time]                                      DATETIME        NULL,
    [dv_load_end_date_time]                                  DATETIME        NULL,
    [dv_batch_id]                                            BIGINT          NOT NULL,
    [dv_inserted_date_time]                                  DATETIME        NOT NULL,
    [dv_insert_user]                                         VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                                   DATETIME        NULL,
    [dv_update_user]                                         VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

