cls
Function MyLogger {
Param(
[string]$message = $(throw "Neophodan parametar"), 
$logpath="C:\Users\zmilan\Desktop\VmwareIzveštaj\findOJreplace.txt", 
$type="Info") 
$messagetoFile='[{0:yyyy-MM-dd HH:mm:ss}] - {1}' -f [datetime]::Now,$message;
switch ($type){
"Info" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-INFO-]" -BackgroundColor White -ForegroundColor DarkBlue -NoNewline
	Write-Host (" {0}" -f $message) }
"Warning" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-WARNING-]" -BackgroundColor DarkGray -ForegroundColor Yellow -NoNewline
	Write-Host (" {0}" -f $message) }
"Error" {
	Write-Host ("[{0:yyyy-MM-dd HH:mm:ss}] " -f [datetime]::Now) -NoNewline
	Write-Host "[-ERROR-]" -BackgroundColor Black -ForegroundColor Red -NoNewline
	Write-Host (" {0}" -f $message) -BackgroundColor Black -ForegroundColor RED} }
if ((Test-Path $logpath) -and (Get-Item $logpath).length -gt 2mb) { 
Move-Item -Path $logpath "$($logpath)_old" -Force }
$messagetoFile | Out-File -append -FilePath $logpath -Force; }
#parameters
$logpath = ".\VMwareStats.log"
[array]$cluster = ("CITRIX-PR","FLEX-PR","TYPE2","BIB-DMZ","BIB-LOCAL")
[array]$vcenters= ("be-vce-bib.fbisp.eu","bib-vcentar-01.deltabank.co.yu")
#$numMonthsAgo = -1
#-------------------------------------------------------------------------------------
Mylogger -logpath $logpath -type info -message "Starting script - get VMware statisctics";
Mylogger -logpath $logpath -type info -message "====================================================================";
Mylogger -logpath $logpath -type info -message "Check if VMware snappin is loaded";
if ( (Get-PSSnapin -Name VMware.VimAutomation.Core -ErrorAction SilentlyContinue) -eq $null ) {
  Mylogger -logpath $logpath -type warning -message "Vmware snapping is not loaded, loading it now";
  try {
  Add-PsSnapin VMware.VimAutomation.Core }
  catch {
	Mylogger -logpath $logpath -type error -message "Error message: $($_.Exception.Message).";
    Mylogger -logpath $logpath -type error -message "Error loading VMware snapping, exiting ...";
	exit }
  Mylogger -logpath $logpath -type info -message "Vmware snapping loaded."; }
Mylogger -logpath $logpath -type info -message "Connecting to VMware Vcenters, please provide valid username and password when asked.";
Start-Sleep -Seconds 5
foreach ($v in $vcenters) {
	Mylogger -logpath $logpath -type info -message "Connecting to $($v) ...";
  	Start-Sleep  -Seconds 3
  try {
    Connect-VIServer -Server $v -Protocol https -Force -ErrorAction Stop }
  catch {
    Mylogger -logpath $logpath -type error -message "Error message: $($_.Exception.Message).";
    Mylogger -logpath $logpath -type error -message "Unable to connect to server $($v), exiting ...";
    exit } }
$numMonthsAgo = -1
$date = Get-Date
$firstDayOfMonth = Get-Date ((((Get-Date $date).Month).ToString() + "/1/" + ((Get-Date $date).Year).ToString() + " 00:00:00"))
$lastDayOfMonth = ((Get-Date ((((Get-Date $firstDayOfMonth).AddMonths(1)).Month).ToString() + "/1/" + (((Get-Date $firstDayOfMonth).AddMonths(1)).Year).ToString()))) - (New-TimeSpan -seconds 1)
$firstDayOfMonth = $firstDayOfMonth.AddMonths($numMonthsAgo)
$lastDayOfMonth = $lastDayOfMonth.AddMonths($numMonthsAgo)
#$numMonthsAgo = -1
#$firstDayOfMonth = Get-Date ((("01/" + (Get-Date $date).Month).ToString() + "/" + ((Get-Date $date).Year).ToString() + " 00:00:00"))
#$lastDayOfMonth = (Get-Date ((("01/" + ((($firstDayOfMonth).AddMonths(1)).Month).ToString() + "/" + ((($firstDayOfMonth).AddMonths(1)).Year).ToString())))) - (New-TimeSpan -seconds 1)
#$firstDayOfMonth = $firstDayOfMonth.AddMonths($numMonthsAgo)
#$lastDayOfMonth = $lastDayOfMonth.AddMonths($numMonthsAgo)
Mylogger -logpath $logpath -type info -message ("Starting performance gathering for period from: {0:dd.MM.yyyy} to: {1:dd.MM.yyyy}" -f $firstDayOfMonth,$lastDayOfMonth);
Mylogger -logpath $logpath -type info -message "------------------------------------------------------------------";
foreach ($i in $cluster) {
  $b=0
  $cpu=0
  $mem=0
  Mylogger -logpath $logpath -type info -message "Processing cluster $($i) ...";
  Get-Stat -Entity $i -Stat cpu.usage.average -Start $firstDayOfMonth -Finish $lastDayOfMonth |
  Select-Object Value | % { $b++;
    $cpu= $cpu + $_.value }
  Get-Stat -Entity $i -Stat mem.usage.average -Start $firstDayOfMonth -Finish $lastDayOfMonth | 
  Select-Object Value |% {
    $mem= $mem + $_.value } 
  $cpuavg= $cpu / $b
  $memavg= $mem / $b
  Mylogger -logpath $logpath -type info -message ("For cluster $($i) avegrage CPU is: {0:N2} and average MEM is: {1:N2} " -f $cpuavg,$memavg);
  $totalcpu=$totalcpu + $cpuavg
  $totalmem=$totalmem + $memavg }
$avgCPUTOTAL = $totalcpu / $cluster.Count
$avgMEMTOTAL = $totalmem / $cluster.Count
Mylogger -logpath $logpath -type info -message "------------------------------------------------------------------";
Mylogger -logpath $logpath -type info -message "====================================================================";
Mylogger -logpath $logpath -type info -message ("For all clusters avegrage CPU is: {0:N2}  and average MEM is: {1:N2} " -f $avgCPUTOTAL,$avgMEMTOTAL);
Mylogger -logpath $logpath -type info -message "====================================================================";