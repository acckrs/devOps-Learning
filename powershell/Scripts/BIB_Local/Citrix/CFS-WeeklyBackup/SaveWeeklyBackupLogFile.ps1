## Save weekly log file in format BackupLogFile_"d-MMM-yyyy"_"H-mm-ss".log

$LogFileDate = Get-Date -Format "d-MMM-yyyy"
$LogFileTime = Get-Date -Format "H-mm-ss"
$LogFolder = "X:\SCHTASK\Citrix\CFS-WeeklyBackup\"
$WorkingLog = "BackupLogFile"
$WorkingLogPath = $LogFolder + $WorkingLog + ".log"
$CurrentLogPath = $LogFolder + "Logs\" + $WorkingLog + "_" + $LogFileDate + "_" + $LogFileTime + ".log"

if(Test-Path $WorkingLogPath -pathType leaf){Copy-Item $WorkingLogPath $CurrentLogPath}


