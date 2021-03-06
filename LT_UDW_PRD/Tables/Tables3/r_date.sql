﻿CREATE TABLE [dbo].[r_date] (
    [r_date_id]                                     INT          NOT NULL,
    [calendar_date]                                 DATETIME     NULL,
    [full_date_description]                         VARCHAR (18) NULL,
    [full_date_numeric_description]                 VARCHAR (10) NULL,
    [year_month_name]                               VARCHAR (16) NULL,
    [month_name_year]                               VARCHAR (14) NULL,
    [four_digit_year_dash_two_digit_month]          CHAR (7)     NULL,
    [four_digit_year_two_digit_month_two_digit_day] CHAR (8)     NULL,
    [standard_date_name]                            VARCHAR (12) NULL,
    [day_of_week_name]                              VARCHAR (9)  NULL,
    [day_of_week_abbreviation]                      VARCHAR (3)  NULL,
    [day_number_in_week]                            DECIMAL (1)  NULL,
    [day_number_in_month]                           DECIMAL (2)  NULL,
    [day_number_in_quarter]                         DECIMAL (3)  NULL,
    [day_number_in_year]                            DECIMAL (3)  NULL,
    [week_ending_date]                              DATETIME     NULL,
    [week_number_in_year]                           DECIMAL (2)  NULL,
    [month_name]                                    VARCHAR (9)  NULL,
    [month_abbreviation]                            VARCHAR (3)  NULL,
    [month_number_in_year]                          DECIMAL (2)  NULL,
    [quarter_name]                                  VARCHAR (3)  NULL,
    [quarter_number]                                DECIMAL (1)  NULL,
    [year]                                          DECIMAL (4)  NULL,
    [number_of_days_in_month]                       DECIMAL (2)  NULL,
    [weekday_flag]                                  CHAR (1)     NULL,
    [last_day_in_week_flag]                         CHAR (1)     NULL,
    [last_day_in_month_flag]                        CHAR (1)     NULL,
    [month_starting_r_date_id]                      INT          NULL,
    [month_starting_date]                           DATETIME     NULL,
    [month_ending_r_date_id]                        INT          NULL,
    [month_ending_date]                             DATETIME     NULL,
    [prior_year_date]                               DATETIME     NULL,
    [prior_year_day_number_in_week]                 DECIMAL (1)  NULL,
    [prior_year_day_number_in_month]                DECIMAL (2)  NULL,
    [prior_year_day_number_in_quarter]              DECIMAL (3)  NULL,
    [prior_year_day_number_in_year]                 DECIMAL (3)  NULL,
    [prior_year_week_number_in_year]                DECIMAL (2)  NULL,
    [prior_year]                                    DECIMAL (4)  NULL,
    [prior_month_starting_r_date_id]                INT          NULL,
    [prior_month_starting_date]                     DATETIME     NULL,
    [prior_month_ending_r_date_id]                  INT          NULL,
    [prior_month_ending_date]                       DATETIME     NULL,
    [next_month_starting_r_date_id]                 INT          NULL,
    [next_month_starting_date]                      DATETIME     NULL,
    [next_month_ending_r_date_id]                   INT          NULL,
    [next_month_ending_date]                        DATETIME     NULL,
    [next_month_name]                               VARCHAR (9)  NULL,
    [prior_day_r_date_id]                           INT          NULL,
    [next_day_r_date_id]                            INT          NULL,
    [number_of_days_in_month_for_dssr]              INT          NULL,
    [day_number_in_month_for_dssr]                  INT          NULL,
    [accounting_period_code]                        VARCHAR (6)  NULL,
    [pay_period_code]                               CHAR (9)     NULL,
    [pay_period_number_in_month]                    CHAR (12)    NULL,
    [pay_period_full_description]                   VARCHAR (50) NULL,
    [pay_period_first_day_flag]                     CHAR (1)     NULL,
    [pay_period_last_day_flag]                      CHAR (1)     NULL,
    [bi_weekly_pay_period_code]                     CHAR (7)     NULL
)
WITH (HEAP, DISTRIBUTION = REPLICATE);

