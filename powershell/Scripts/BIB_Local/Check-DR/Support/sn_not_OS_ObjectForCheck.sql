-- create view AcaK.AK_checkDR as 
with
  rpt
  as
  (
    SELECT ci.[u_ocitype] as oCiType
       , ci.[name] as oName
	   , serv.[dv_location] as LocId
     , serv.[u_ocitype] as osType
	   , serv.name as osName
	   , serv.os_domain as Domain
	   , serv.os as Operating_System
    FROM [sn].[cmdb_rel_ci] rel
      join [sn].[cmdb_ci] ci on ci.[Name]=rel.dv_child
      join [sn].[cmdb_ci_computer] serv on serv.[name]=rel.dv_parent
    where  ci.[u_ocitype] in ('DCOM','DNS','DNS.MS','Domino', 'IIS','ORACLE.DB','share')
      and serv.[dv_sys_class_name] in ('Linux Server','Windows Server', 'Computer', 'ESX Server')
      and serv.[u_dr] in ('1','2')

  ),
  oss
  as
  (
    SELECT
      u_ocitype as oOciType
       , name as oName
	     , dv_location
	     , u_ocitype
       , name =case
                        when charindex('.',name)>0 then substring(name, 1, charindex('.',name)-1) 
                        else name
                        end
	     , os_domain = case
                        when charindex('.',os_domain)>0 then substring(os_domain, 1, charindex('.',os_domain)-1) 
                        else os_domain
                        end
	    , dv_os
    FROM [sn].[cmdb_ci_computer]
    where  u_ocitype!='os.esx' and u_dr in ('1','2') and u_ocitype!='hw.srv' and dv_u_env='Production'
  ),
  sqls
  AS
  (
    select max(u_ocitype) as ociType, name as oName, max(dv_location) as LocId, max(rel.[dv_parent]) as osName
    FROM [xIC].[sn].[cmdb_ci_db_mssql_instance] as sqls
      left join [xIC].[sn].[cmdb_rel_ci] as rel on  sqls.name =rel.[dv_child]
    where sqls.[u_dr]=1 and rel.[dv_type] like '%hosted%'
    group by name

  )

  select distinct oCiType,
    oName=case 
               when charindex('.',oName)>0 then substring(oName, 1, charindex('.',oName)-1) 
               when charindex('\',oName)>0 and oCiType like 'MSSQL.SRV%' then replace(oName,'\','$') 
               when charindex('\',oName)>0 and oCiType not like 'MSSQL.SRV%' then substring(oName,1, charindex('\',oName)-1)
               else oName 
             end
    , LocId
    , osType
    , osName = case
                        when charindex('.',osName)>0 then substring(osName, 1, charindex('.',osName)-1) 
                        else osName
                        end
    , Domain = case
                        when charindex('.',Domain)>0 then substring(Domain, 1, charindex('.',Domain)-1) 
                        else Domain
                        end
   , Operating_System
  from rpt
union all
  select oOciType
        , oName =case
                        when charindex('.',name)>0 then substring(name, 1, charindex('.',name)-1) 
                        else name
                        end 
        , dv_location
        , u_ocitype
        , name
        , os_domain
        , dv_os
  from oss
union ALL
  select sqls.ociType, sqls.oName, sqls.LocId, oss.oOciType as osType, sqls.osName, oss.os_domain, oss.dv_os
  from sqls
    left join oss
    on  sqls.oName=oss.oName

