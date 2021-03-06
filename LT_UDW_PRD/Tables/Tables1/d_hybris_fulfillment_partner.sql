﻿CREATE TABLE [dbo].[d_hybris_fulfillment_partner] (
    [d_hybris_fulfillment_partner_id]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                          CHAR (32)      NOT NULL,
    [d_hybris_fulfillment_partner_key] CHAR (32)      NULL,
    [fulfillment_partner_pk]           BIGINT         NULL,
    [acl_ts]                           INT            NULL,
    [created_ts]                       DATETIME       NULL,
    [hjmpts]                           BIGINT         NULL,
    [modified_ts]                      DATETIME       NULL,
    [owner_pk_string]                  BIGINT         NULL,
    [p_code]                           NVARCHAR (255) NULL,
    [p_display_name]                   NVARCHAR (255) NULL,
    [p_export_file_format]             BIGINT         NULL,
    [p_ftp_from]                       NVARCHAR (255) NULL,
    [p_ftp_to]                         NVARCHAR (255) NULL,
    [p_import_file_format]             BIGINT         NULL,
    [p_inventory_file_format]          NVARCHAR (255) NULL,
    [p_inventory_to]                   NVARCHAR (255) NULL,
    [p_receiver_code_id]               NVARCHAR (255) NULL,
    [p_receiver_id]                    NVARCHAR (255) NULL,
    [p_receiver_qualifier]             NVARCHAR (255) NULL,
    [p_sender_id]                      NVARCHAR (255) NULL,
    [p_sender_qualifier]               NVARCHAR (255) NULL,
    [p_work_day_supplier_id]           NVARCHAR (255) NULL,
    [prop_ts]                          INT            NULL,
    [type_pk_string]                   BIGINT         NULL,
    [p_hybris_fulfillment_partner_id]  BIGINT         NOT NULL,
    [dv_load_date_time]                DATETIME       NULL,
    [dv_load_end_date_time]            DATETIME       NULL,
    [dv_batch_id]                      BIGINT         NOT NULL,
    [dv_inserted_date_time]            DATETIME       NOT NULL,
    [dv_insert_user]                   VARCHAR (50)   NOT NULL,
    [dv_updated_date_time]             DATETIME       NULL,
    [dv_update_user]                   VARCHAR (50)   NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

