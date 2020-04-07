﻿CREATE TABLE [dbo].[stage_hash_fitmetrix_api_appointments] (
    [stage_hash_fitmetrix_api_appointments_id] BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                  CHAR (32)       NOT NULL,
    [APPOINTMENTID]                            INT             NULL,
    [NAME]                                     VARCHAR (255)   NULL,
    [FACILITYLOCATIONID]                       INT             NULL,
    [ACTIVITYID]                               INT             NULL,
    [ACTIVE]                                   VARCHAR (255)   NULL,
    [DESCRIPTION]                              VARCHAR (255)   NULL,
    [INSTRUCTORID]                             INT             NULL,
    [STARTDATETIME]                            VARCHAR (255)   NULL,
    [ENDDATETIME]                              VARCHAR (255)   NULL,
    [EXTERNALID]                               VARCHAR (255)   NULL,
    [EXTERNALIDALT]                            VARCHAR (255)   NULL,
    [ISAVAILABLE]                              VARCHAR (255)   NULL,
    [HIDDEN]                                   VARCHAR (255)   NULL,
    [ISCANCELLED]                              VARCHAR (255)   NULL,
    [ISENROLLED]                               VARCHAR (255)   NULL,
    [ISWAITLISTAVAILABLE]                      VARCHAR (255)   NULL,
    [MAXCAPACITY]                              INT             NULL,
    [TOTALBOOKED]                              INT             NULL,
    [TOTALBOOKEDWAITLIST]                      INT             NULL,
    [WEBBOOKED]                                INT             NULL,
    [WEBBOOKEDCAPACITY]                        INT             NULL,
    [MESSAGES]                                 VARCHAR (255)   NULL,
    [DATEMODIFIED]                             VARCHAR (255)   NULL,
    [DATEADDED]                                VARCHAR (255)   NULL,
    [FACILITYLOCATIONRESOURCEID]               INT             NULL,
    [DATECOMPLETED]                            VARCHAR (255)   NULL,
    [COLORCODE]                                INT             NULL,
    [ACTIVITYTYPEID]                           INT             NULL,
    [ADDITIONALNOTES]                          VARCHAR (255)   NULL,
    [STARTED]                                  VARCHAR (255)   NULL,
    [ISENROLLMENT]                             VARCHAR (255)   NULL,
    [ISSUBSTITUTE]                             VARCHAR (255)   NULL,
    [CANCELOFFSET]                             INT             NULL,
    [PTPCOMPLETED]                             VARCHAR (255)   NULL,
    [ISAPPOINTMENT]                            VARCHAR (255)   NULL,
    [INSTRUCTORFIRSTNAME]                      VARCHAR (255)   NULL,
    [INSTRUCTORLASTNAME]                       VARCHAR (255)   NULL,
    [INSTRUCTORIMAGE]                          VARCHAR (255)   NULL,
    [INSTRUCTORGENDER]                         VARCHAR (255)   NULL,
    [OPENSPOTS]                                VARCHAR (255)   NULL,
    [BOOKEDSPOTS]                              VARCHAR (255)   NULL,
    [WAITLISTSIZE]                             VARCHAR (255)   NULL,
    [PTPNOTEST]                                VARCHAR (255)   NULL,
    [CHECKEDIN]                                INT             NULL,
    [WORKOUTID]                                INT             NULL,
    [APP]                                      VARCHAR (255)   NULL,
    [APPICON]                                  VARCHAR (255)   NULL,
    [MANUALCAPACITY]                           VARCHAR (255)   NULL,
    [ISEDITABLE]                               VARCHAR (255)   NULL,
    [EXTERNALID_base64_decoded]                VARBINARY (255) NULL,
    [EXTERNALIDALT_base64_decoded]             VARBINARY (255) NULL,
    [dummy_modified_date_time]                 DATETIME        NULL,
    [dv_load_date_time]                        DATETIME        NOT NULL,
    [dv_updated_date_time]                     DATETIME        NULL,
    [dv_update_user]                           VARCHAR (50)    NULL,
    [dv_batch_id]                              BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));

