/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct [xIC].[sn].[cmdb_rel_ci].[dv_child]
  FROM [xIC].[sn].[cmdb_rel_ci] join [xIC].[sn].[cmdb_ci_service]
  on [xIC].[sn].[cmdb_ci_service].[Name]=[xIC].[sn].[cmdb_rel_ci].dv_child
  where [xIC].[sn].[cmdb_ci_service].[u_ocitype]='func' and [xIC].[sn].[cmdb_rel_ci].[dv_type] = 'Used by::Uses'
  
