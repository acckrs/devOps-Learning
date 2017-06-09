cls
Function MyLogger {
    Param(
        [string]$message = $(throw "Neophodan parametar"), 
        $logpath = "C:\Users\nmarinkovic\Desktop\VmwareIzveštaj\findOJreplace.txt", 
        $type = "Info") 
    $messagetoFile = '[{0:yyyy-MM-dd HH:mm:ss}] - {1}' -f [datetime]::Now, $message;
    switch ($type) {
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

$logpath = ".\VMware-DS-Stats.log"
[array]$vcenters = ("bib-vcentar-01.deltabank.co.yu")
#-------------------------------------------------------------------------------------
Mylogger -logpath $logpath -type info -message "Starting script - get VMware Data Store statisctics";
Mylogger -logpath $logpath -type info -message "====================================================================";

Mylogger -logpath $logpath -type info -message "Connecting to VMware Vcenters, please provide valid username and password when asked.";
Start-Sleep -Seconds 5
foreach ($v in $vcenters) {
    Mylogger -logpath $logpath -type info -message "Connecting to $($v) ...";
    Start-Sleep  -Seconds 3
    try {
        Connect-VIServer -Server $v -Protocol https -Force -ErrorAction Stop 
    }
    catch {
        Mylogger -logpath $logpath -type error -message "Error message: $($_.Exception.Message).";
        Mylogger -logpath $logpath -type error -message "Unable to connect to server $($v), exiting ...";
        exit 
    } 
}

Mylogger -logpath $logpath -type info -message ("Starting performance gathering for period from: {0:dd.MM.yyyy} to: {1:dd.MM.yyyy}" -f $firstDayOfMonth, $lastDayOfMonth);
Mylogger -logpath $logpath -type info -message "------------------------------------------------------------------";

[array]$datastores = Get-Datastore | where-object {($_.Name -notmatch "parking") -and ($_.Name -notmatch "temp") -and ($_.Name -notmatch "local")}
$CapacityGBSum = 0
$FreeSpaceGBSum = 0

foreach ($ds in $datastores) {

    Mylogger -logpath $logpath -type info -message "Processing Datastores $($ds) ...";
  
    $CapacityGBSum += $ds.CapacityGB
    $FreeSpaceGBSum += $ds.FreeSpaceGB
  
    Mylogger -logpath $logpath -type info -message ("For Datastore $($ds) free disk space is: {0:N2} and datastore capacity is: {1:N2} " -f $FreeSpaceGBSum, $CapacityGBSum);
}

$PercentFreeAvg = ($FreeSpaceGBSum / $CapacityGBSum) * 100

Mylogger -logpath $logpath -type info -message "------------------------------------------------------------------";
Mylogger -logpath $logpath -type info -message "====================================================================";
Mylogger -logpath $logpath -type info -message ("For all Datastores free average disk space is: {0:N2} % " -f $PercentFreeAvg);
Mylogger -logpath $logpath -type info -message "====================================================================";