﻿CREATE TABLE [dbo].[dim_magento_product] (
    [dim_magento_product_id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [color]                               INT             NULL,
    [created_dim_date_key]                CHAR (8)        NULL,
    [created_dim_time_key]                CHAR (8)        NULL,
    [default_dim_reporting_hierarchy_key] VARCHAR (32)    NULL,
    [description]                         VARCHAR (8000)  NULL,
    [dim_club_key]                        CHAR (32)       NULL,
    [dim_magento_product_key]             CHAR (32)       NULL,
    [dim_mms_product_key]                 CHAR (32)       NULL,
    [free_shipping]                       INT             NULL,
    [has_options_flag]                    CHAR (1)        NULL,
    [height]                              DECIMAL (12, 4) NULL,
    [length]                              DECIMAL (12, 4) NULL,
    [lt_bucks_eligible]                   VARCHAR (255)   NULL,
    [manufacturer]                        VARCHAR (255)   NULL,
    [product_id]                          INT             NULL,
    [product_name]                        VARCHAR (255)   NULL,
    [required_options_flag]               CHAR (1)        NULL,
    [short_description]                   VARCHAR (8000)  NULL,
    [sku]                                 VARCHAR (64)    NULL,
    [status]                              INT             NULL,
    [type_id]                             VARCHAR (32)    NULL,
    [updated_dim_date_key]                CHAR (8)        NULL,
    [updated_dim_time_key]                CHAR (8)        NULL,
    [vendor]                              INT             NULL,
    [weight]                              DECIMAL (12, 4) NULL,
    [width]                               DECIMAL (12, 4) NULL,
    [workday_costcenter_id]               VARCHAR (255)   NULL,
    [workday_offering_id]                 VARCHAR (255)   NULL,
    [workday_region_id]                   VARCHAR (255)   NULL,
    [workday_revenue_id]                  VARCHAR (255)   NULL,
    [workday_spending_id]                 VARCHAR (255)   NULL,
    [dv_load_date_time]                   DATETIME        NULL,
    [dv_load_end_date_time]               DATETIME        NULL,
    [dv_batch_id]                         BIGINT          NOT NULL,
    [dv_inserted_date_time]               DATETIME        NOT NULL,
    [dv_insert_user]                      VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]                DATETIME        NULL,
    [dv_update_user]                      VARCHAR (50)    NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([dim_magento_product_key]));

