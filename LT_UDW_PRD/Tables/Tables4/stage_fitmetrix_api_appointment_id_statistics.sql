﻿CREATE TABLE [dbo].[stage_fitmetrix_api_appointment_id_statistics] (
    [stage_fitmetrix_api_appointment_id_statistics_id] BIGINT        NOT NULL,
    [PROFILEAPPOINTMENTID]                             INT           NULL,
    [PROFILEID]                                        INT           NULL,
    [EXTERNALID]                                       VARCHAR (255) NULL,
    [APPOINTMENTID]                                    INT           NULL,
    [ZONE1TIME]                                        VARCHAR (255) NULL,
    [ZONE1CALORIES]                                    INT           NULL,
    [ZONE2TIME]                                        VARCHAR (255) NULL,
    [ZONE2CALORIES]                                    INT           NULL,
    [ZONE3TIME]                                        VARCHAR (255) NULL,
    [ZONE3CALORIES]                                    INT           NULL,
    [ZONE4TIME]                                        VARCHAR (255) NULL,
    [ZONE4CALORIES]                                    INT           NULL,
    [ZONE0TIME]                                        VARCHAR (255) NULL,
    [ZONE0CALORIES]                                    INT           NULL,
    [DISTANCE]                                         INT           NULL,
    [MAXSPEED]                                         INT           NULL,
    [AVERAGESPEED]                                     INT           NULL,
    [MAXPOWER]                                         INT           NULL,
    [AVERAGEPOWER]                                     INT           NULL,
    [AVERAGEWATTS]                                     INT           NULL,
    [MAXWATTS]                                         INT           NULL,
    [MAXHEARTRATE]                                     INT           NULL,
    [MINHEARTRATE]                                     INT           NULL,
    [AVGHEARTRATE]                                     INT           NULL,
    [DEVICEID]                                         INT           NULL,
    [TOTALCALORIES]                                    INT           NULL,
    [TOTALPOINTS]                                      INT           NULL,
    [APPOINTMENTNAME]                                  VARCHAR (255) NULL,
    [STARTDATETIME]                                    VARCHAR (255) NULL,
    [FIRSTNAME]                                        VARCHAR (255) NULL,
    [LASTNAME]                                         VARCHAR (255) NULL,
    [HEARTRATEBREAKDOWN]                               VARCHAR (255) NULL,
    [DESCRIPTION]                                      VARCHAR (255) NULL,
    [RANK]                                             INT           NULL,
    [TOTALRANK]                                        INT           NULL,
    [CLASSDURATION]                                    INT           NULL,
    [TOTALMINUTES]                                     INT           NULL,
    [EMAIL]                                            VARCHAR (255) NULL,
    [NAME]                                             VARCHAR (255) NULL,
    [INSTRUCTORFIRSTNAME]                              VARCHAR (255) NULL,
    [INSTRUCTORLASTNAME]                               VARCHAR (255) NULL,
    [RPMBREAKDOWN]                                     VARCHAR (255) NULL,
    [WATTSBREAKDOWN]                                   VARCHAR (255) NULL,
    [SPEEDBREAKDOWN]                                   VARCHAR (255) NULL,
    [WEIGHT]                                           VARCHAR (255) NULL,
    [GENDER]                                           VARCHAR (255) NULL,
    [PTP]                                              INT           NULL,
    [ZONE1PTPTIME]                                     INT           NULL,
    [ZONE2PTPTIME]                                     INT           NULL,
    [ZONE3PTPTIME]                                     INT           NULL,
    [ZONE4PTPTIME]                                     INT           NULL,
    [ZONE0PTPTIME]                                     INT           NULL,
    [ZONE1RPMTIME]                                     VARCHAR (255) NULL,
    [ZONE1RPMCALORIES]                                 VARCHAR (255) NULL,
    [ZONE2RPMTIME]                                     VARCHAR (255) NULL,
    [ZONE2RPMCALORIES]                                 VARCHAR (255) NULL,
    [ZONE3RPMTIME]                                     VARCHAR (255) NULL,
    [ZONE3RPMCALORIES]                                 VARCHAR (255) NULL,
    [ZONE4RPMTIME]                                     VARCHAR (255) NULL,
    [ZONE4RPMCALORIES]                                 VARCHAR (255) NULL,
    [ZONE0RPMTIME]                                     VARCHAR (255) NULL,
    [ZONE0RPMCALORIES]                                 VARCHAR (255) NULL,
    [LOANERDEVICEID]                                   INT           NULL,
    [SPOTNUMBER]                                       INT           NULL,
    [SPOTDEVICEID]                                     VARCHAR (255) NULL,
    [BOOKINGPRIORITY]                                  INT           NULL,
    [PTPSTORED]                                        VARCHAR (255) NULL,
    [BIRTHDATE]                                        VARCHAR (255) NULL,
    [CREATEDATE]                                       VARCHAR (255) NULL,
    [WAITLIST]                                         VARCHAR (255) NULL,
    [CHECKEDIN]                                        VARCHAR (255) NULL,
    [WAITLISTPOSITION]                                 INT           NULL,
    [WAITLISTDATETIME]                                 VARCHAR (255) NULL,
    [dummy_modified_date_time]                         DATETIME      NULL,
    [dv_batch_id]                                      BIGINT        NOT NULL
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN);
