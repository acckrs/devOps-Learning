SELECT [u_ocitype] "oCiType",[name] "oName",[dv_location] "LocId",[u_ocitype] "osName",[os_domain] "Domain",[dv_os] "Operating_System"
  FROM [xIC].[sn].[cmdb_ci_server]
  where u_ocitype!='os.esx' and u_dr=1 and u_ocitype!='hw.srv' and dv_u_env='Production'