param ($SnowTable)
#$SnowTable='cmdb_ci_server';

#priprema
#$cPath='S:\SqlPlus\PS\PullSnow'
$cPath=$([System.IO.Path]::GetDirectoryName($MyInvocation.InvocationName));
set-location $cPath
$logFile="$cPath\log\$($SnowTable+'.log')"
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

# pull data
'{0:hh:mm:ss} Start pull {1}' -f [datetime]::Now, $SnowTable
$sqlcmd.CommandText="exec sn.SetSyncStat '{0}', 'pull'" -f $SnowTable;
$sqlcmd.ExecuteNonQuery()| Out-Null;
$pullconn = New-Object System.Data.Odbc.OdbcConnection($connectstring)
$pullconn.open()
$pullQuery='select * from {0}' -f $SnowTable;
$pullcmd = New-Object system.Data.Odbc.OdbcCommand($pullQuery,$pullconn)
$pullcmd.CommandTimeout=300
$dt = New-Object system.Data.datatable
$dt.Load($pullcmd.ExecuteReader())
$pullconn.Close();

#create temp #tabele 
'{0:hh:mm:ss} Create #{1}' -f [datetime]::Now, $SnowTable
$colType=@{'String'='varchar(1024)'; 'Int32'='int'; 'Boolean'='bit'; 'DateTime'='varchar(32)'; 'Decimal'='float'; 'Double'='float'}
$colIsNull=@{'True'='null'; 'False'='not null'}
$colList=$dt.Columns | 
         select -Property ColumnName, DataType, AllowDBNull |
          %{'[{0}] {1} {2}' -f $_.ColumnName, $colType.$($_.DataType.Name), $colIsNull.$($_.AllowDBNull.toString())};
$colList=[string]::Join(',
',$colList)
$sqlcmd.CommandText=@'
exec sn.SetSyncStat '{0}', '#tmpCreate';
create table #{0} (
  {1}
);
'@ -f $SnowTable, $colList;
$sqlcmd.ExecuteNonQuery()|Out-Null;

#pull data into #temp tabelu
'{0:hh:mm:ss} pull data into #{1}' -f [datetime]::Now, $SnowTable
$sqlcmd.CommandText="exec sn.SetSyncStat '{0}', '#bulk'" -f $SnowTable;
$sqlcmd.ExecuteNonQuery()| Out-Null;
$bulkCopy = New-Object Data.SqlClient.SqlBulkCopy($sqlSrv);
$bulkCopy.DestinationTableName='#{0}' -f $SnowTable
$bulkCopy.BatchSize=1000;
$bulkCopy.BulkCopyTimeout=60;
$bulkCopy.WriteToServer($dt);

#prepis u odredisnu tabelu
'{0:hh:mm:ss} Prepis is #{1} u odredišnu tabelu sn.{1}' -f [datetime]::Now, $SnowTable
$sqlcmd.CommandText=@'
exec sn.SetSyncStat '{0}', 'prepis;' 
if (object_id('sn.[{0}]') is not null) drop table sn.[{0}];
select * into sn.[{0}] from #{0};
exec sn.SetSyncStat '{0}', 'ok' 
'@ -f $SnowTable
$sqlcmd.ExecuteNonQuery()|Out-Null

#bye
'{0:hh:mm:ss} bye' -f [datetime]::Now
$sqlSrv.Close();

#end
Stop-Transcript;




