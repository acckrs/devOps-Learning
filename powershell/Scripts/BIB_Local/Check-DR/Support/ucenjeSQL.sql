SELECT  s1.name,s1.u_ociType
FROM [xIC].[sn].[cmdb_ci_db_mssql_instance] s1
  left JOIN [xIC].[sn].[cmdb_ci_db_mssql_instance] s2
    ON s2.name < s1.name 
WHERE s2.name IS NULL


select name from [xIC].[sn].[cmdb_ci_db_mssql_instance] s1
where not exists (
	select 1 from [xIC].[sn].[cmdb_ci_db_mssql_instance] s2
	where s2.name < s1.name
	)
