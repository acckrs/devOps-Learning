Param (
$SourceFiles,
$XmlFileName,
$Name
)

Function MyLogger {
Param(
[string]$message = $(throw "Neophodan parametar"), 
$logpath=".\skritpa.txt", 
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
$messagetoFile | Out-File -append -FilePath $logpath -Force;
}

try {
if ( ($SourceFiles -eq $null) -or ($XmlFileName -eq $null) -or ($Name -eq $null)) { throw "Some parameters are null, exiting"}

 mylogger -message "Copying ... from $($sourcefiles) to c:\windows\bib\$($Name)\" -type "Info" ;
 if ((Test-Path "c:\windows\bib") -ne $True) {
  mylogger -message "There is no BIB folder, making one..." -type "Warning";
  mkdir "c:\windows\bib" -Force | Out-Null 
 }
 
  if ((Test-Path "c:\windows\bib\$($Name)\") -ne $True) {
  mylogger -message "There is no $($Name), making one..." -type "Warning";
  mkdir "c:\windows\bib\$($Name)\" -Force | Out-Null 
 }
 
 Copy-Item -Path  "$($sourcefiles)\*" -Destination "c:\windows\bib\$($Name)\" -Force -Recurse;

 if ($Error.Count -gt 0) {
  $msg = $Error[0].ToString();
  mylogger -message "Error in copy files, please check! Error message is $($msg)" -type "Error" ;
  $msg = $null;
  throw "Error in copy files, please check! Error message is $($msg)"
  exit 99
 }
 mylogger -message "Finished copying" -type "Info";

$command = "schtasks /create /xml `"c:\windows\bib\$($Name)\$($XmlFileName)`" /F /RU SYSTEM /TN `"$Name`""
 $x="nok"
 $x = Invoke-Expression -Command $command #| Out-Null
 if ($x -match "has successfully been created.") {
  mylogger -message "Successfully created task on server $($server)"  -type "Info"
  #if ($runAfterCreate) {
  $runCMD = "schtasks /run /tn $($name)"
  $runSch= Invoke-Expression $runCMD
  mylogger -message $runSch  -type "Info"
  #}
  }
 else {
  mylogger -message "Error creating task on server $($server)"  -type "Error"
 }
$runAfterCreate = $false
exit 0 
}

catch {
 $Error[0]
 exit 99
}