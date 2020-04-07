﻿CREATE TABLE [dbo].[stage_hash_udwcloudsync_enterpriseclubdata] (
    [stage_hash_udwcloudsync_enterpriseclubdata_id]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [bk_hash]                                        CHAR (32)       NOT NULL,
    [Abbr]                                           NVARCHAR (4000) NULL,
    [Address_Line_1]                                 NVARCHAR (4000) NULL,
    [Address_Line_2]                                 NVARCHAR (4000) NULL,
    [Amenity_Conditioner]                            NVARCHAR (4000) NULL,
    [Amenity_Cotton_Balls]                           NVARCHAR (4000) NULL,
    [Amenity_Deodorant]                              NVARCHAR (4000) NULL,
    [Amenity_Free_Lockers_and_Towels]                NVARCHAR (4000) NULL,
    [Amenity_Hairspray]                              NVARCHAR (4000) NULL,
    [Amenity_Mouthwash]                              NVARCHAR (4000) NULL,
    [Amenity_Plasma_Big_Screen_TVs]                  NVARCHAR (4000) NULL,
    [Amenity_Razors]                                 NVARCHAR (4000) NULL,
    [Amenity_Shampoo]                                NVARCHAR (4000) NULL,
    [Amenity_Wireless_Internet_Access]               NVARCHAR (4000) NULL,
    [App_Created_By]                                 NVARCHAR (4000) NULL,
    [App_Modified_By]                                NVARCHAR (4000) NULL,
    [City]                                           NVARCHAR (4000) NULL,
    [Club_Hours]                                     NVARCHAR (4000) NULL,
    [Club_Level]                                     NVARCHAR (4000) NULL,
    [Club_Status]                                    NVARCHAR (4000) NULL,
    [Compliance_Asset_Id]                            NVARCHAR (4000) NULL,
    [Content_Type]                                   NVARCHAR (4000) NULL,
    [Country]                                        NVARCHAR (4000) NULL,
    [Created]                                        DATETIME        NULL,
    [Created_By]                                     NVARCHAR (4000) NULL,
    [Feature_Advanced_Training_Studio]               NVARCHAR (4000) NULL,
    [Feature_Alpha_Field]                            NVARCHAR (4000) NULL,
    [Feature_Bar]                                    NVARCHAR (4000) NULL,
    [Feature_Basketball_Courts]                      NVARCHAR (4000) NULL,
    [Feature_Boxing_Gym]                             NVARCHAR (4000) NULL,
    [Feature_Business_Center]                        NVARCHAR (4000) NULL,
    [Feature_Cardio_Equipment]                       NVARCHAR (4000) NULL,
    [Feature_Child_Center]                           NVARCHAR (4000) NULL,
    [Feature_Connected_Technology]                   NVARCHAR (4000) NULL,
    [Feature_Deluge]                                 NVARCHAR (4000) NULL,
    [Feature_Fitness_Studios]                        NVARCHAR (4000) NULL,
    [Feature_Free_Weights_and_Equipment]             NVARCHAR (4000) NULL,
    [Feature_Functional_Training_Area]               NVARCHAR (4000) NULL,
    [Feature_Hamam]                                  NVARCHAR (4000) NULL,
    [Feature_Indoor_Cycle_Studio]                    NVARCHAR (4000) NULL,
    [Feature_Indoor_Golf_Center]                     NVARCHAR (4000) NULL,
    [Feature_Indoor_Lap_Pool]                        NVARCHAR (4000) NULL,
    [Feature_Indoor_Leisure_Pool]                    NVARCHAR (4000) NULL,
    [Feature_Indoor_Tennis_Courts]                   NVARCHAR (4000) NULL,
    [Feature_Indoor_Turf_Field]                      NVARCHAR (4000) NULL,
    [Feature_Indoor_Water_Slides]                    NVARCHAR (4000) NULL,
    [Feature_Indoor_Whirlpool]                       NVARCHAR (4000) NULL,
    [Feature_Infant_Room]                            NVARCHAR (4000) NULL,
    [Feature_Kids_Academy]                           NVARCHAR (4000) NULL,
    [Feature_Kids_Gym]                               NVARCHAR (4000) NULL,
    [Feature_Kids_Language_Arts_Studio]              NVARCHAR (4000) NULL,
    [Feature_Kids_Learning_Lab]                      NVARCHAR (4000) NULL,
    [Feature_Kids_Media_Room]                        NVARCHAR (4000) NULL,
    [Feature_Kids_Movement_Studio]                   NVARCHAR (4000) NULL,
    [Feature_Kids_Outdoor_Play_Area]                 NVARCHAR (4000) NULL,
    [Feature_Kids_Tumbling_Studio]                   NVARCHAR (4000) NULL,
    [Feature_Lazy_River]                             NVARCHAR (4000) NULL,
    [Feature_LifeCafe]                               NVARCHAR (4000) NULL,
    [Feature_LifeCafe_Poolside_Bistro]               NVARCHAR (4000) NULL,
    [Feature_LifeSpa]                                NVARCHAR (4000) NULL,
    [Feature_Mixed_Combats_Arts_Studio]              NVARCHAR (4000) NULL,
    [Feature_Outdoor_Fitness_Trail]                  NVARCHAR (4000) NULL,
    [Feature_Outdoor_Lap_Pool]                       NVARCHAR (4000) NULL,
    [Feature_Outdoor_Swimming_Pool]                  NVARCHAR (4000) NULL,
    [Feature_Outdoor_Tennis_Courts]                  NVARCHAR (4000) NULL,
    [Feature_Outdoor_Turf_Field]                     NVARCHAR (4000) NULL,
    [Feature_Outdoor_Water_Slides]                   NVARCHAR (4000) NULL,
    [Feature_Outdoor_Whirlpool]                      NVARCHAR (4000) NULL,
    [Feature_Pickleball_Court]                       NVARCHAR (4000) NULL,
    [Feature_Pilates_Studio]                         NVARCHAR (4000) NULL,
    [Feature_Play_Maze]                              NVARCHAR (4000) NULL,
    [Feature_Pre_School]                             NVARCHAR (4000) NULL,
    [Feature_Proactive_Care_Clinic]                  NVARCHAR (4000) NULL,
    [Feature_Racquetball_Courts]                     NVARCHAR (4000) NULL,
    [Feature_Rare]                                   NVARCHAR (4000) NULL,
    [Feature_Rehabilitation_and_Chiropractic_Clinic] NVARCHAR (4000) NULL,
    [Feature_Resistance_Training_Area]               NVARCHAR (4000) NULL,
    [Feature_Retail_Store]                           NVARCHAR (4000) NULL,
    [Feature_Rock_Wall]                              NVARCHAR (4000) NULL,
    [Feature_Rooftop_Patio]                          NVARCHAR (4000) NULL,
    [Feature_Sand_Volleyball_Court]                  NVARCHAR (4000) NULL,
    [Feature_Saunas]                                 NVARCHAR (4000) NULL,
    [Feature_Splash_Pad]                             NVARCHAR (4000) NULL,
    [Feature_Squash_Courts]                          NVARCHAR (4000) NULL,
    [Feature_Steam_Rooms]                            NVARCHAR (4000) NULL,
    [Feature_Volleyball_Courts]                      NVARCHAR (4000) NULL,
    [Feature_Walking_Running_Track]                  NVARCHAR (4000) NULL,
    [Feature_Weight_Machines]                        NVARCHAR (4000) NULL,
    [Feature_Yoga_Studio]                            NVARCHAR (4000) NULL,
    [Feature_Zero_Depth_Entry_Pool]                  NVARCHAR (4000) NULL,
    [Folder_Child_Count]                             NVARCHAR (4000) NULL,
    [General_Manager]                                NVARCHAR (4000) NULL,
    [General_Manager_Email]                          NVARCHAR (4000) NULL,
    [General_Manager_Phone]                          NVARCHAR (4000) NULL,
    [ID]                                             INT             NULL,
    [Item_Child_Count]                               NVARCHAR (4000) NULL,
    [Item_Type]                                      NVARCHAR (4000) NULL,
    [Label_Applied]                                  NVARCHAR (4000) NULL,
    [Label_applied_by]                               NVARCHAR (4000) NULL,
    [Label_setting]                                  NVARCHAR (4000) NULL,
    [Labels]                                         NVARCHAR (4000) NULL,
    [Latitude]                                       NVARCHAR (4000) NULL,
    [Longitude]                                      NVARCHAR (4000) NULL,
    [Member_Services_Manager]                        NVARCHAR (4000) NULL,
    [Member_Services_Manager_Email]                  NVARCHAR (4000) NULL,
    [Member_Services_Manager_Phone]                  NVARCHAR (4000) NULL,
    [MMS_Club_ID]                                    NVARCHAR (4000) NULL,
    [Modified]                                       DATETIME        NULL,
    [Modified_By]                                    NVARCHAR (4000) NULL,
    [OMS]                                            NVARCHAR (4000) NULL,
    [Open_Date]                                      DATETIME        NULL,
    [Path]                                           NVARCHAR (4000) NULL,
    [Phone]                                          NVARCHAR (4000) NULL,
    [Program_Badminton]                              NVARCHAR (4000) NULL,
    [Program_Barre]                                  NVARCHAR (4000) NULL,
    [Program_Basketball]                             NVARCHAR (4000) NULL,
    [Program_Birthday_Parties]                       NVARCHAR (4000) NULL,
    [Program_Boxing]                                 NVARCHAR (4000) NULL,
    [Program_Golf]                                   NVARCHAR (4000) NULL,
    [Program_Handball]                               NVARCHAR (4000) NULL,
    [Program_Indoor_Cycle]                           NVARCHAR (4000) NULL,
    [Program_Kids_Academy]                           NVARCHAR (4000) NULL,
    [Program_Kids_Activities]                        NVARCHAR (4000) NULL,
    [Program_Kids_Camps]                             NVARCHAR (4000) NULL,
    [Program_Kids_Sports_and_Fitness]                NVARCHAR (4000) NULL,
    [Program_Kids_Swim]                              NVARCHAR (4000) NULL,
    [Program_Mixed_Combat_Arts]                      NVARCHAR (4000) NULL,
    [Program_Outdoor_Cycle]                          NVARCHAR (4000) NULL,
    [Program_Personal_Training]                      NVARCHAR (4000) NULL,
    [Program_Pickleball]                             NVARCHAR (4000) NULL,
    [Program_Pilates]                                NVARCHAR (4000) NULL,
    [Program_Racquetball]                            NVARCHAR (4000) NULL,
    [Program_Rock_Climbing]                          NVARCHAR (4000) NULL,
    [Program_Run_Club]                               NVARCHAR (4000) NULL,
    [Program_Soccer]                                 NVARCHAR (4000) NULL,
    [Program_Squash]                                 NVARCHAR (4000) NULL,
    [Program_Studio]                                 NVARCHAR (4000) NULL,
    [Program_Swimming]                               NVARCHAR (4000) NULL,
    [Program_Table_Tennis]                           NVARCHAR (4000) NULL,
    [Program_TEAM_Training]                          NVARCHAR (4000) NULL,
    [Program_Tennis]                                 NVARCHAR (4000) NULL,
    [Program_Volleyball]                             NVARCHAR (4000) NULL,
    [Program_Weight_Loss]                            NVARCHAR (4000) NULL,
    [Program_Yoga]                                   NVARCHAR (4000) NULL,
    [Region]                                         NVARCHAR (4000) NULL,
    [Service_Bar]                                    NVARCHAR (4000) NULL,
    [Service_Basketball_Training]                    NVARCHAR (4000) NULL,
    [Service_Child_Center]                           NVARCHAR (4000) NULL,
    [Service_Golf_Instruction]                       NVARCHAR (4000) NULL,
    [Service_Hair]                                   NVARCHAR (4000) NULL,
    [Service_Health_Assessments]                     NVARCHAR (4000) NULL,
    [Service_Kids_Academy]                           NVARCHAR (4000) NULL,
    [Service_Kids_Birthday_Parties]                  NVARCHAR (4000) NULL,
    [Service_Kids_Camps]                             NVARCHAR (4000) NULL,
    [Service_Kids_Swim_Lessons]                      NVARCHAR (4000) NULL,
    [Service_LifeCafe]                               NVARCHAR (4000) NULL,
    [Service_Marathon_Training]                      NVARCHAR (4000) NULL,
    [Service_Massage]                                NVARCHAR (4000) NULL,
    [Service_Medi_Spa]                               NVARCHAR (4000) NULL,
    [Service_Nails]                                  NVARCHAR (4000) NULL,
    [Service_Nutritional_Coaching]                   NVARCHAR (4000) NULL,
    [Service_Proactive_Care]                         NVARCHAR (4000) NULL,
    [Service_Racquetball_Lessons]                    NVARCHAR (4000) NULL,
    [Service_Rare]                                   NVARCHAR (4000) NULL,
    [Service_Rehabilitation_Chiropractic]            NVARCHAR (4000) NULL,
    [Service_Run_Training]                           NVARCHAR (4000) NULL,
    [Service_Skin]                                   NVARCHAR (4000) NULL,
    [Service_Soccer_Training]                        NVARCHAR (4000) NULL,
    [Service_Squash_Lessons]                         NVARCHAR (4000) NULL,
    [Service_Swim_Assessments]                       NVARCHAR (4000) NULL,
    [Service_TEAM_Training]                          NVARCHAR (4000) NULL,
    [Service_Tennis_Lessons]                         NVARCHAR (4000) NULL,
    [Service_Tri_Training]                           NVARCHAR (4000) NULL,
    [Service_Weight_Loss]                            NVARCHAR (4000) NULL,
    [Square_Footage]                                 NVARCHAR (4000) NULL,
    [StateProvince]                                  NVARCHAR (4000) NULL,
    [Title]                                          NVARCHAR (4000) NULL,
    [Web_Free_Pass]                                  NVARCHAR (4000) NULL,
    [Web_Inquiry]                                    BIT             NULL,
    [Web_PreSale_Waitlist]                           BIT             NULL,
    [Web_Price_Request]                              BIT             NULL,
    [Zip]                                            NVARCHAR (4000) NULL,
    [inserteddatetime]                               DATETIME        NULL,
    [dv_load_date_time]                              DATETIME        NOT NULL,
    [dv_updated_date_time]                           DATETIME        NULL,
    [dv_update_user]                                 VARCHAR (50)    NULL,
    [dv_batch_id]                                    BIGINT          NOT NULL
)
WITH (CLUSTERED INDEX([bk_hash]), DISTRIBUTION = HASH([bk_hash]));

