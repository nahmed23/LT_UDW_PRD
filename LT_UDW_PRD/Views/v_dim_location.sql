﻿CREATE VIEW [marketing].[v_dim_location]
AS select dim_location.business_key business_key,
       dim_location.business_source_name business_source_name,
       dim_location.created_by created_by,
       dim_location.created_dim_date_key created_dim_date_key,
       dim_location.deleted_by deleted_by,
       dim_location.deleted_dim_date_key deleted_dim_date_key,
       dim_location.description description,
       dim_location.dim_location_key dim_location_key,
       dim_location.display_name display_name,
       dim_location.hierarchy_level hierarchy_level,
       dim_location.location_type_display_name location_type_display_name,
       dim_location.location_type_group_display_name location_type_group_display_name,
       dim_location.location_type_group_name location_type_group_name,
       dim_location.location_type_name location_type_name,
       dim_location.managed_by_udw_flag managed_by_udw_flag,
       dim_location.parent_dim_location_key parent_dim_location_key,
       dim_location.top_level_dim_location_key top_level_dim_location_key,
       dim_location.updated_by updated_by,
       dim_location.updated_dim_date_key updated_dim_date_key
  from dbo.dim_location;