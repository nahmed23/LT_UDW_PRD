﻿CREATE PROC [dbo].[proc_Update_DeleteData_LTFEB] AS
BEGIN

SET NOCOUNT ON


declare @sql varchar(max)

if object_id('tempdb..#RequiredTables') is not null drop table #RequiredTables
CREATE TABLE dbo.#RequiredTables
with(distribution=round_robin, location=user_db, heap) as
SELECT ROW_NUMBER() OVER (ORDER BY d.dv_table ) AS table_rank,d.dv_table, d.dv_column, d.source_column,d.source_table
FROM dv_etl_map d
join (select distinct table_name from s_ltfeb_deleted_data WHERE bk_hash not in ('-999','-998','-997')) x-- stage_mms_deletedData) x
ON d.source_table like 'stage_ltfeb_'+table_name+''
WHERE dv_table like 'h[_]%'
and business_key_sort_order is not null

DECLARE @table_start int = (select min(table_rank) from #RequiredTables)
DECLARE @table_end int  = (select max(table_rank) from #RequiredTables)

WHILE @table_start <= @table_end
BEGIN
 SET @SQL = 'UPDATE' + '  ' + (SELECT dv_table FROM #RequiredTables WHERE table_rank =@table_start ) +char(13)+char(10)+
'SET  '+  'dv_deleted = 1' +char(13)+char(10)+
',dv_updated_date_time = convert(datetime,getdate(),120)' +char(13)+char(10)+ 
',dv_update_user = ''InformaticaUser''' +char(13)+char(10)+  
'WHERE '+ (SELECT dv_table FROM #RequiredTables WHERE table_rank =@table_start )+'.'+(SELECT dv_column FROM #RequiredTables WHERE table_rank =@table_start ) +
 ' IN (SELECT  PrimaryKey  FROM stage_ltfeb_DeletedData where Tablename ='+''''+ (SELECT REPLACE(source_table,'stage_LTFEB_','') FROM #RequiredTables WHERE table_rank =@table_start )+''')' +char(13)+char(10)+
  'AND dv_deleted = 0' +char(13)+char(10) 
 


--PRINT @SQL
EXEC (@SQL)

 SET @table_start = @table_start+1
  
END

DROP TABLE #RequiredTables

END








