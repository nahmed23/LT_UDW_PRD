﻿CREATE TABLE [dbo].[stage_hash_exerp_clipcard_usage] (
    [stage_hash_exerp_clipcard_usage_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                            CHAR (32)      NOT NULL,
    [id]                                 INT            NULL,
    [clipcard_id]                        VARCHAR (4000) NULL,
    [type]                               VARCHAR (4000) NULL,
    [state]                              VARCHAR (4000) NULL,
    [employee_person_id]                 VARCHAR (4000) NULL,
    [clips]                              INT            NULL,
    [commission_units]                   INT            NULL,
    [usage_datetime]                     DATETIME       NULL,
    [center_id]                          INT            NULL,
    [ets]                                BIGINT         NULL,
    [dummy_modified_date_time]           DATETIME       NULL,
    [dv_load_date_time]                  DATETIME       NOT NULL,
    [dv_batch_id]                        BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);

