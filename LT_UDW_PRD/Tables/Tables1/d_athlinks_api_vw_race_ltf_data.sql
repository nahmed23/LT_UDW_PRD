﻿CREATE TABLE [dbo].[d_athlinks_api_vw_race_ltf_data] (
    [d_athlinks_api_vw_race_ltf_data_id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                         CHAR (32)       NOT NULL,
    [race_id]                                         INT             NULL,
    [city]                                            NVARCHAR (128)  NULL,
    [company_d_athlinks_api_vw_race_ltf_data_bk_hash] VARCHAR (32)    NULL,
    [country_id]                                      CHAR (2)        NULL,
    [country_id_3]                                    CHAR (3)        NULL,
    [country_name]                                    NVARCHAR (64)   NULL,
    [create_date]                                     DATETIME        NULL,
    [create_dim_date_key]                             VARCHAR (8)     NULL,
    [create_dim_time_key]                             INT             NULL,
    [d_athlinks_api_vw_master_event_bk_hash]          VARCHAR (32)    NULL,
    [date_sort]                                       VARCHAR (8)     NULL,
    [elevation]                                       INT             NULL,
    [latitude]                                        DECIMAL (26, 6) NULL,
    [longitude]                                       DECIMAL (26, 6) NULL,
    [master_id]                                       INT             NULL,
    [race_company_id]                                 INT             NULL,
    [race_date]                                       DATETIME        NULL,
    [race_dim_date_key]                               VARCHAR (8)     NULL,
    [race_dim_time_key]                               INT             NULL,
    [race_end_date]                                   DATETIME        NULL,
    [race_end_dim_date_key]                           VARCHAR (8)     NULL,
    [race_end_dim_time_key]                           INT             NULL,
    [race_name]                                       NVARCHAR (256)  NULL,
    [result_count]                                    INT             NULL,
    [state_prov_abbrev]                               NVARCHAR (8)    NULL,
    [state_prov_id]                                   NVARCHAR (8)    NULL,
    [state_prov_name]                                 NVARCHAR (70)   NULL,
    [status]                                          INT             NULL,
    [temperature]                                     INT             NULL,
    [weather_notes]                                   NVARCHAR (512)  NULL,
    [website]                                         NVARCHAR (256)  NULL,
    [p_athlinks_api_vw_race_ltf_data_id]              BIGINT          NOT NULL,
    [deleted_flag]                                    INT             NULL,
    [dv_load_date_time]                               DATETIME        NULL,
    [dv_load_end_date_time]                           DATETIME        NULL,
    [dv_batch_id]                                     BIGINT          NOT NULL,
    [dv_inserted_date_time]                           DATETIME        NOT NULL,
    [dv_insert_user]                                  VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                            DATETIME        NULL,
    [dv_update_user]                                  VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([bk_hash]));

