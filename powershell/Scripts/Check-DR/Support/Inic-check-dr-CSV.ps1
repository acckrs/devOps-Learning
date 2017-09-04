cls;
$ErrorActionPreference='stop';
#set clocation
$cd='C:\SchTask\Check-DR\support';
if($MyInvocation.MyCommand.Path -ne $null) {$cd=[System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path);}
Set-Location $cd;
#
Write-Host "Conektovanje na sql radi dobijanja podataka o DR sistemima";
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString='Server=syssql; Database=xIC;trusted_connection=yes; User Id=beta155;Password=web; Application name=check-dr';
$sqlSrv.Open();
$sqlcmd=$sqlsrv.CreateCommand();
$sqlcmd.CommandText=Get-Content '.\ObjectForCheck.sql' -Delimiter [char]13
#
#-----
$dt=New-Object System.Data.DataTable;
$dt.Load($sqlcmd.ExecuteReader());
$dt | Export-Csv -Delimiter ',' -Force -Path 'C:\SchTask\Check-DR\check-dr.csv' -NoTypeInformation -Encoding UTF8
#----
Write-Host "<ok>"
