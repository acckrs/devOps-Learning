[cmdletbinding()]
param 
(
    [string] $appPool,
    [string] $hostName,
    [string] $path 
)
Import-Module "C:\SCHTASK\iisParser\iisParse.psm1"

$date = Get-Date -Format "dd-MM-yyyy"
$logName = "{0}---{1}.{2}" -f $date,$hostName,$appPool
$errorLogFolder = Join-Path (Split-Path $MyInvocation.MyCommand.Definition) -ChildPath $hostName
if (!(Test-Path $errorLogFolder))
{
    mkdir $errorLogFolder
}
$errorPath = Join-Path $errorLogFolder $logName

$files =  dir $path -Filter *localhost_access*.txt| sort CreationTime -Descending | select -Skip 1


$conn = new-object System.Data.SqlClient.SqlConnection 
$conn.ConnectionString = "Server=octopus; Database=ssmon; User Id=rsusr; Password=RSbgd123"
$conn.Open()
$bulk = New-Object System.Data.SqlClient.SqlBulkCopy -ArgumentList $conn
$bulk.DestinationTableName = "iis.bufTable"

foreach ($file in $files)
{
    $logs = ConvertFrom-TOMCATLog $file.fullname |  select @{l='hostname';e={$hostname}},@{l='appPool';e={$appPool}},Datetime,IP,Method,@{l='uri';e={ [system.dbnull]::Value}} ,@{l='port';e={ [System.DBNull]::Value}},username,@{l='agent';e={ [System.DBNull]::Value}},status,@{l='substatus';e={ [system.dbnull]::Value}},@{l='win32status';e={ [System.DBNull]::Value}},@{l='TimeTaken';e={if (!$_.timetaken) { [System.DBNull]::Value } else {[int] $_.timeTaken} }},BytesSent,BytesReceived
    $dt = $logs | Out-DataTable
    try 
    {        
        $archPath = Join-Path $path Arhiva
        if (!(Test-Path $archPath))
        {
            mkdir $archPath
        }
        move $file.fullname $archPath -ea Stop
        $bulk.WriteToServer($dt)
        "{0}`nParsiran file {1} u {2}`n{0}" -f ("*"*100),$file.fullname,(Get-Date -f hh:mm:ss) | Out-File $errorPath -Append
    }
    catch 
    {

        $greska = "{1}`nDogodila se greska u {0} `n{1}`n{2}`nFileName --- {3}`n{1}" -f (Get-Date -f hh:mm:ss),("-"*100),$Error[0],$file.fullname | Out-File $errorPath -Append
    }
    $SQLcmd = $conn.CreateCommand()
    $SQLcmd.CommandType = [System.Data.CommandType]"StoredProcedure"
    $SQLcmd.CommandText = "iis.bye"
    $SQLcmd.Parameters.AddWithValue("@hostname",$hostName) | Out-Null
    $SQLcmd.Parameters.AddWithValue("@appPool",$appPool) | Out-Null
    $message = "{6}`nCalled {0}, with parameters {1} - {2} and {3} - {4} --- {5}`n{6}" -f $SQLcmd.CommandText,$SQLcmd.Parameters[0].ParameterName,$SQLcmd.Parameters[0].Value,$SQLcmd.Parameters[1].ParameterName,$SQLcmd.Parameters[1].Value,(Get-Date -f hh:mm:ss),("+"*100)
    Add-Content -Path $errorPath -Value $message
    try
    {
        $SQLcmd.ExecuteNonQuery()
    }
    catch 
    {
        
        Add-Content -PassThru $errorPath -Value ("`n***********`n" + $Error[0] + "`n***********`n")
    }

}


$conn.Close()
