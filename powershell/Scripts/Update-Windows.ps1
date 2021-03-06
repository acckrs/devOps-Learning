Param (
[bool]$forceWork=$false
)

Function MyLogger {

Param(
[string]$message = $(throw "Neophodan parametar"), 
$logpath="c:\users\admin_zamir\desktop\findOJreplace.txt", 
$type="Info"
) 
$messagetoFile='[{0:yyyy-MM-dd HH:mm:ss}] - {1}' -f [datetime]::Now,$message;

switch ($type)
{
"Info" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-INFO-]" -BackgroundColor White -ForegroundColor DarkBlue -NoNewline
	Write-Host (" {0}" -f $message)
	   }
"Warning" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-WARNING-]" -BackgroundColor DarkGray -ForegroundColor Yellow -NoNewline
	Write-Host (" {0}" -f $message)
		  }
"Error" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-ERROR-]" -BackgroundColor Black -ForegroundColor Red -NoNewline
	Write-Host (" {0}" -f $message) -BackgroundColor Black -ForegroundColor RED
		  }
}

if ((Test-Path $logpath) -and (Get-Item $logpath).length -gt 2mb) { 

Move-Item -Path $logpath "$($logpath)_old" -Force

}
$messagetoFile | Out-File -append -FilePath $logpath -Force;
}

Function MyUpdates {
mylogger -logpath $logpath -type "info" -message "Listing installed updates";
mylogger -logpath $logpath -type "info" -message "-----------------------------------------------------";
$sqlLog.Parameters['@msg'].value="i:Listing installed updates"
$sqlLog.ExecuteNonQuery() | Out-Null;
#Clear updates
$sqlKBInstalled.Parameters['@kb'].value='clear';
$sqlKBInstalled.ExecuteNonQuery() | Out-Null
sleep -Seconds 3
Get-HotFix | % {
mylogger -logpath $logpath -type "info" -message "$($_.HotFixID)";
$sqlKBInstalled.Parameters['@kb'].value=$_.HotFixID;
$sqlKBInstalled.ExecuteNonQuery() | Out-Null
}
mylogger -logpath $logpath -type "info" -message "-----------------------------------------------------";
}

$logpath = "C:\schTask\wsus\windows-update.log";
$Criteria = "IsInstalled=0";
$file = Get-Item "c:\schTask\wsus\Update-Windows.ps1";
$version=("{0:yyyyMMddhhmm}" -f $file.LastWriteTime);
$foundCriticalRes=$false;

$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString= "Server=OCTOPUS,8653; Database=SSMON; user id=wsusUsr; password=Wsus4.usr; Application Name=WSUS_UPD;";
$sqlSrv.Open();

$sqlhello=$sqlSrv.CreateCommand();
$sqlhello.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlhello.CommandText='[wsus].[Hello2]';
$sqlhello.Parameters.Add('@noPatchToInstall',[System.Data.SqlDbType]::Int) | Out-Null;
$sqlhello.Parameters.Add('@version',[System.Data.SqlDbType]::VarChar) | Out-Null;
$dthello = New-Object system.Data.DataTable;

$sqlLog=$sqlSrv.CreateCommand();
$sqlLog.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlLog.CommandText='[wsus].[PrintLog]';
$sqlLog.Parameters.Add('@msg',[System.Data.SqlDbType]::VarChar) | Out-Null;

$sqlKBInstalled=$sqlSrv.CreateCommand();
$sqlKBInstalled.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlKBInstalled.CommandText='[wsus].[kbInstalled]';
$sqlKBInstalled.Parameters.Add('@kb',[System.Data.SqlDbType]::VarChar) | Out-Null;

mylogger -logpath $logpath -type "info" -message "Script windows update started ... logpath > $($logpath)";
$sqlLog.Parameters['@msg'].value="i:Starting script, log on server: $($logpath)";
$sqlLog.ExecuteNonQuery() | Out-Null;

$Searcher = New-Object -ComObject Microsoft.Update.Searcher;
try {
    MyLogger -logpath $logpath -type "info" -message "Searching for updates ...";
	$SearchResult = $Searcher.Search($Criteria).Updates;
	$sqlhello.Parameters['@noPatchToInstall'].value=$SearchResult.Count;
	$sqlhello.Parameters['@version'].value=$version;
	$dthello.Load($sqlhello.ExecuteReader());
	if ($dthello.Rows[0]["needKbreport"] -eq "1") {
	  MyLogger -logpath $logpath -type "info" -message "We are required to provide updates.";
	  MyUpdates;
	}
	else {
	  MyLogger -logpath $logpath -type "info" -message "We are not required to provide updates.";
	}
	
	MyLogger -logpath $logpath -type "info" -message "Are we allowed to work?";
	if ($dthello.Rows[0]["startPatch"] -eq 0 -and $forceWork -eq $false) {
	  MyLogger -logpath $logpath -type "warning" -message "We are not allowed to work (SQL said so), exiting ...";
	  $sqlLog.Parameters['@msg'].value="i:We are not allowed to work, exiting";
	  $sqlLog.ExecuteNonQuery() | Out-Null;
	  $sqlLog.Parameters['@msg'].value="exit:NO-Restart";
	  $sqlLog.ExecuteNonQuery() | Out-Null ;
	  exit
	}
	else {
	  if ($forceWork) {
	  MyLogger -logpath $logpath -type "info" -message "WORK OVERRIDE DETECTED!";
	  $sqlLog.Parameters['@msg'].value="i:Work override detected."
	  $sqlLog.ExecuteNonQuery() | Out-Null;
	  }
	  MyLogger -logpath $logpath -type "info" -message "We are allowed to work, continuing ...";
	  $sqlLog.Parameters['@msg'].value="i:We are allowed to work, continuing ..."
	  $sqlLog.ExecuteNonQuery() | Out-Null;
	}
	
	MyLogger -logpath $logpath -type "info" -message "Checking critical resource if exist and is it alive?";
	if (Test-Path c:\schTask\wsus\criticalresurce.xml) {
	  MyLogger -logpath $logpath -type "info" -message "Found criticalresource.xml file ...";
	  $sqlLog.Parameters['@msg'].value="i:Found criticalresource.xml file.";
	  $sqlLog.ExecuteNonQuery() | Out-Null;
      [xml]$critres = Get-Content c:\schTask\wsus\criticalresurce.xml;
	  $critres.root.CriticalRes.Split(',') | % {
	    if (Test-Path $_.trim()) {
		$foundCriticalRes=$true;
		MyLogger -logpath $logpath -type "warning" -message "Found critical resource $($_.trim())";
		}
	  }
	  if ($foundCriticalRes) {
	    MyLogger -logpath $logpath -type "warning" -message "Critical resource is accessible, ABORT ABORT ABORT!!!";
	    $sqlLog.Parameters['@msg'].value="i:Critical resource is alive, ABORT!!!";
		$sqlLog.ExecuteNonQuery() | Out-Null;
	    $sqlLog.Parameters['@msg'].value="exit:NO-Restart"
	    $sqlLog.ExecuteNonQuery() | Out-Null ;
		exit
	  }
	  else {
	   MyLogger -logpath $logpath -type "info" -message "Critical resource is not accessible, continiue.";
	   	    $sqlLog.Parameters['@msg'].value="i:Critical resource is not accessible, continiue.";
	    $sqlLog.ExecuteNonQuery() | Out-Null;
	  }
    }
    	
	if ($SearchResult.Count -eq 0) {
      MyLogger -logpath $logpath -type "info" -message "There are no applicable updates.";
	  $sqlLog.Parameters['@msg'].value="i:There are no applicable updates";
	  $sqlLog.ExecuteNonQuery() | Out-Null ;
	  $sqlLog.Parameters['@msg'].value="exit:NO-Restart";
	  $sqlLog.ExecuteNonQuery() | Out-Null ;
	  exit;
	} 
	else {
      MyLogger -logpath $logpath -type "info" -message "There are [ $($SearchResult.Count) ] aplicable updates";
	  $sqlLog.Parameters['@msg'].value="i:There are $($SearchResult.Count) aplicable updates";
	  $sqlLog.ExecuteNonQuery() | Out-Null;
	  MyLogger -logpath $logpath -type "info" -message "-----------------------------------------------------";
	  $SearchResult | % { 
		  MyLogger -logpath $logpath -type "info" -message "$($_.title)";
		  $_.title -match '(KB[0-9]*)' |Out-Null;
		  $sqlLog.Parameters['@msg'].value="kb=$($Matches[0])";
		  $sqlLog.ExecuteNonQuery() | Out-Null;
		  };
		  MyLogger -logpath $logpath -type "info" -message "-----------------------------------------------------";
		  mylogger -logpath $logpath -type "info" -message "Starting updates download ...";
		  $sqlLog.Parameters['@msg'].value="i:Starting updates download";
		  $sqlLog.ExecuteNonQuery() | Out-Null;
		  $Session = New-Object -ComObject Microsoft.Update.Session;
		  $Downloader = $Session.CreateUpdateDownloader();
		  $Downloader.Updates = $SearchResult;
		  $Downloader.Download();
		  mylogger -logpath $logpath -type "info" -message "Updates downloaded.";
		  $sqlLog.Parameters['@msg'].value="i:Updates downloaded";
		  $sqlLog.ExecuteNonQuery() | Out-Null;
		  mylogger -logpath $logpath -type "info" -message "Starting installation ...";
		  $sqlLog.Parameters['@msg'].value="i:Starting installation";
		  $sqlLog.ExecuteNonQuery() | Out-Null ;
		  $Installer = New-Object -ComObject Microsoft.Update.Installer;
		  $Installer.Updates = $SearchResult;
		  $Result = $Installer.Install();
		  mylogger -logpath $logpath -type "info" -message "Updates installed ...";
		  $sqlLog.Parameters['@msg'].value="i:Updates installed";
		  $sqlLog.ExecuteNonQuery() | Out-Null ;
	    }
}
catch {
	MyLogger -logpath $logpath -type "error" -message "There was error in process, error details: $($error[0])";
	$sqlLog.Parameters['@msg'].value="e:$($error[0])"
	$sqlLog.ExecuteNonQuery() | Out-Null ;
}

mylogger -logpath $logpath -type "info" -message "Update proces completed, checking if restart is required: $($Result.rebootRequired)";
if ($Result.rebootRequired) { 
	MyLogger -logpath $logpath -type "warning" -message "Windows is going to restart in 10 sec to aply updates !!!";
	$sqlLog.Parameters['@msg'].value="exit:Restart"
	$sqlLog.ExecuteNonQuery() | Out-Null ;
	sleep -Seconds 10
	Restart-Computer -Force
	}
	else {
	$sqlLog.Parameters['@msg'].value="exit:NO-Restart"
	$sqlLog.ExecuteNonQuery() | Out-Null ;
	}
	