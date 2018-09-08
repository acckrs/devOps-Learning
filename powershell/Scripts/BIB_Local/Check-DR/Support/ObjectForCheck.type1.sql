;with 
os2 as (
-- exclude serveri tip 2 !!!
select distinct osTip2=parsename(oName,2)
  from dep.Ci_Dependency
  where dependonCiType like 'storag%' and dependonCiname ='PRM.TP2'
),
-- operativni sistemi 
os as (
select osType='OS', osName=oName, 
       Domain=replace(Domain,'.co.yu',''), LocId, Operating_System, DR
  from prop.OS  
  where DR=1 and Operating_System is not null and oName not like 'free%'
    and not exists(select * from os2 where osTip2=oName) -- exclude tip 2 !!!
union all
select osType='OS.VM', osName=oName, 
       Domain=replace(Domain,'.co.yu',''), LocId, Operating_System, DR
  from prop.[OS.VM] 
  where DR=1 and Operating_System is not null and oName not like 'free%'
    and not exists(select * from os2 where osTip2=oName) -- exclude tip 2 !!!
union all
select osType='OS.AIX', osName=oName, 
       Domain=replace(Domain,'.co.yu',''), LocId, Operating_System, DR
  from prop.[OS.AIX] 
  where DR=1 and Operating_System is not null and oName not like 'free%'
    and not exists(select * from os2 where osTip2=oName) -- exclude tip 2 !!!
),
-- presek DR OS-ova i servisa
rpt as ( 
-- 'DCOM', 'DCOM.NLB', 'DNS', 'DNS.MS', 'Domino', 'FTP.SRV', 'IIS'
select s.oCiType, s.oName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from dep.ci_object s
  cross apply dep.BaseOs(s.oCiType, s.oName,1) bos
  join os on os.osName=bos.oName
  where s. oCiType in ('DCOM', 'DCOM.NLB', 'DNS', 'DNS.MS', 'Domino', 'FTP.SRV', 'IIS') and os.DR=1
union all  
-- 'MSSQL.SRV.CLUS'
select oCiType='MSSQL.SRV.CLUS', s.oName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from prop.[MSSQL.SRV.Clus] s
  cross apply dep.BaseOs('MSSQL.SRV.CLUS', s.oName, 2) bos
  join os on os.osName=bos.oName
  where os.DR=1
union all
-- 'MSSQL.SRV'  
select oCiType='MSSQL.SRV', s.oName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from prop.[MSSQL.SRV] s
  cross apply dep.BaseOs('MSSQL.SRV', s.oName, 1) bos
  join os on os.osName=bos.oName
  where os.DR=1  
union all  
-- 'ORACLE.DB.RAC''  -- samo ping hosta
select oCiType='ORACLE.DB.RAC', dbName=os.osName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from prop.[ORACLE.DB.RAC] s
  cross apply dep.BaseOs('ORACLE.DB.RAC', s.oName, 2) bos
  join os on os.osName=bos.oName
  where os.DR=1   
union all  
-- 'ORACLE.DB'  -- samo ping hosta
select oCiType='ORACLE.DB', dbName=os.osName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from prop.[ORACLE.DB] s
  cross apply dep.BaseOs('ORACLE.DB', s.oName, 1) bos
  join os on os.osName=bos.oName
  where os.DR=1  
union all
-- 'Share.Clus'
select s.oCiType, s.oName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from dep.ci_object s
  cross apply dep.BaseOs(s.oCiType, s.oName, 2) bos
  join os on os.osName=bos.oName
  where s.oCiType='Share.Clus' and os.DR=1
union all  
-- 'Share'
select s.oCiType, s.oName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from dep.ci_object s
  cross apply dep.BaseOs(s.oCiType, s.oName, 1) bos
  join os on os.osName=bos.oName
  where s.oCiType='Share' and os.DR=1
--
)
select distinct oCiType, 
       oName=case 
               when charindex('.',oName)>0 then substring(oName, 1, charindex('.',oName)-1) 
               when charindex('\',oName)>0 and oCiType like 'MSSQL.SRV%' then replace(oName,'\','$') 
               when charindex('\',oName)>0 and oCiType not like 'MSSQL.SRV%' then substring(oName,1, charindex('\',oName)-1)
               else oName 
             end,
--             replace(replace(oName,'[','('),']', ')'),
       LocId, osType, osName, 
       Domain, Operating_System
  from rpt
union all
select oCitype=osType, oName=osName, os.LocId, os.osType, os.osName, os.Domain, os.Operating_System
  from os
  order by oCiType
