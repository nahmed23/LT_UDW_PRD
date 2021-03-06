﻿CREATE TABLE [dbo].[stage_hash_medallia_field_answer_enumeration] (
    [stage_hash_medallia_field_answer_enumeration_id] BIGINT         IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                         CHAR (32)      NOT NULL,
    [answer_enumeration_id]                           VARCHAR (4000) NULL,
    [answer_name]                                     VARCHAR (4000) NULL,
    [enumeration_value]                               VARCHAR (4000) NULL,
    [dummy_modified_date_time]                        DATETIME       NULL,
    [dv_load_date_time]                               DATETIME       NOT NULL,
    [dv_batch_id]                                     BIGINT         NOT NULL
)
WITH (HEAP, DISTRIBUTION = HASH([bk_hash]));

