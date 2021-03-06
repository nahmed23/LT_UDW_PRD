﻿CREATE TABLE [dbo].[stage_hash_hybris_productslp] (
    [stage_hash_hybris_productslp_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                         CHAR (32)       NOT NULL,
    [ITEMPK]                          BIGINT          NULL,
    [ITEMTYPEPK]                      BIGINT          NULL,
    [LANGPK]                          BIGINT          NULL,
    [p_specifications]                BIGINT          NULL,
    [p_size]                          NVARCHAR (255)  NULL,
    [p_description]                   VARCHAR (8000)  NULL,
    [p_offermedia]                    BIGINT          NULL,
    [p_localizedasset]                BIGINT          NULL,
    [p_summary]                       VARCHAR (8000)  NULL,
    [p_caption]                       NVARCHAR (255)  NULL,
    [p_localizedpdfasset]             BIGINT          NULL,
    [p_nutritionweight]               NVARCHAR (255)  NULL,
    [p_flavor]                        NVARCHAR (255)  NULL,
    [p_localizedassetpicture]         BIGINT          NULL,
    [p_manufacturertypedescription]   NVARCHAR (255)  NULL,
    [p_offerlink]                     NVARCHAR (1000) NULL,
    [p_style]                         NVARCHAR (255)  NULL,
    [p_segment]                       NVARCHAR (255)  NULL,
    [p_name]                          NVARCHAR (255)  NULL,
    [p_restriction]                   VARCHAR (8000)  NULL,
    [p_instruction]                   VARCHAR (8000)  NULL,
    [p_other]                         BIGINT          NULL,
    [p_option]                        NVARCHAR (255)  NULL,
    [p_instructions]                  VARCHAR (8000)  NULL,
    [p_package]                       NVARCHAR (255)  NULL,
    [p_type]                          NVARCHAR (255)  NULL,
    [p_version]                       NVARCHAR (255)  NULL,
    [p_resistance]                    NVARCHAR (255)  NULL,
    [p_model]                         NVARCHAR (255)  NULL,
    [p_weightvariant]                 NVARCHAR (255)  NULL,
    [p_scent]                         NVARCHAR (255)  NULL,
    [p_color]                         NVARCHAR (255)  NULL,
    [createdTS]                       DATETIME        NULL,
    [modifiedTS]                      DATETIME        NULL,
    [dv_load_date_time]               DATETIME        NOT NULL,
    [dv_inserted_date_time]           DATETIME        NOT NULL,
    [dv_insert_user]                  VARCHAR (50)    NOT NULL,
    [dv_updated_date_time]            DATETIME        NULL,
    [dv_update_user]                  VARCHAR (50)    NULL,
    [dv_batch_id]                     BIGINT          NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

