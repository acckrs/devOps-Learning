param ($workerNo)

#priprema
#$cPath='S:\SqlPlus\PS\PullSnow'
$cPath=$([System.IO.Path]::GetDirectoryName($MyInvocation.InvocationName));
set-location $cPath
$logFile=[System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.InvocationName)+".$workerNo.log"
Start-Transcript $logFile -Force;
$ErrorActionPreference='stop'

# get cfg file
$c=[xml] [IO.File]::ReadAllText("$cPath\PullSnow.cfg")
$connectstring = $c.cfg.SNOW
$SqlConnectionString=$c.cfg.SQL

#connect to sql
'{0:hh:mm:ss} Connect to sql ' -f [datetime]::Now
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString=$SqlConnectionString;
$sqlSrv.Open();
$sqlcmd=$sqlsrv.CreateCommand();

$sqlcmd.CommandText='exec sn.GetTableForSync';
$SnowTable=$sqlcmd.ExecuteScalar();
while ($SnowTable -isnot  [System.DBNull]){  
  '{0:hh:mm:ss} Start pull {1}' -f [datetime]::Now, $SnowTable
  .\PullSingleTable.ps1 -SnowTable $SnowTable;
  $SnowTable=$sqlcmd.ExecuteScalar();
}

#bye
'{0:hh:mm:ss} bye' -f [datetime]::Now


#end
Stop-Transcript;



