﻿CREATE TABLE [dbo].[stage_hash_magento_customer_address_entity] (
    [stage_hash_magento_customer_address_entity_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                       CHAR (32)      NOT NULL,
    [entity_id]                                     INT            NULL,
    [increment_id]                                  VARCHAR (50)   NULL,
    [parent_id]                                     INT            NULL,
    [created_at]                                    DATETIME       NULL,
    [updated_at]                                    DATETIME       NULL,
    [is_active]                                     INT            NULL,
    [city]                                          VARCHAR (255)  NULL,
    [company]                                       VARCHAR (255)  NULL,
    [country_id]                                    VARCHAR (255)  NULL,
    [fax]                                           VARCHAR (255)  NULL,
    [firstname]                                     VARCHAR (255)  NULL,
    [lastname]                                      VARCHAR (255)  NULL,
    [middlename]                                    VARCHAR (255)  NULL,
    [postcode]                                      VARCHAR (255)  NULL,
    [prefix]                                        VARCHAR (40)   NULL,
    [region]                                        VARCHAR (255)  NULL,
    [region_id]                                     INT            NULL,
    [street]                                        VARCHAR (8000) NULL,
    [suffix]                                        VARCHAR (40)   NULL,
    [telephone]                                     VARCHAR (255)  NULL,
    [vat_id]                                        VARCHAR (255)  NULL,
    [vat_is_valid]                                  INT            NULL,
    [vat_request_date]                              VARCHAR (255)  NULL,
    [vat_request_id]                                VARCHAR (255)  NULL,
    [vat_request_success]                           INT            NULL,
    [m1_customer_address_id]                        INT            NULL,
    [dv_load_date_time]                             DATETIME       NOT NULL,
    [dv_batch_id]                                   BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);
