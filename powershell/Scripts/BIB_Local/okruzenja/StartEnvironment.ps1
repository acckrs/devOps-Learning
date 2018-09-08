####################################
#  Logon script za podešavanje radnog okruženja za masine u NE-produkcionim okruženjima
#  Scripta se može pozvati i direktno bez forsiranog logobvanja
#  Skripta se izvršava u kontekstu korisnika 
####################################

$keyName='HKLM:\SOFTWARE\BIB';
$ErrorActionPreference='stop';
$logFile="$($MyInvocation.MyCommand.Definition).log";
@'
--------------------------------------------
*** Error log PODIZANJE NOVOG OKRUZENJA  ***
Desila se greška tokom procesa i potrebno je da se obratite ict_techsuppor@bancaintesa.rs
--------------------------------------------
'@ | Out-File $logFile;

Start-Transcript -Path $logFile;

"Login time $([datetime]::Now.ToString('yyyy.MM.dd HH:mm:ss')) for user $($env:USERNAME)";
try{
$env=(Get-ItemProperty -Path $keyName).Environment;
"Okruzenje=$env";

#config
$cfg=[xml] @'
<r> 
  <PROD ctxwi="http://xenapp-wi/Citrix/PNAgent/config.xml" ctxfs="citrix-fs"/>
  <DEV  ctxwi="http://dev-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsdev1"/>
  <MNT  ctxwi="http://mnt-wi/Citrix/PNAgent/config.xml"    ctxfs="CtxfsMNT1"/>
  <TRN  ctxwi="http://trn-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfstrn1"/>
  <UAT  ctxwi="http://uat-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsuat1"/>
  <FC1  ctxwi="http://fc1-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev2"/>
  <FC2  ctxwi="http://fc2-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev1"/>
</r>  
'@

#set x: drive
if (Test-Path 'x:\') {Invoke-Expression "cmd.exe /C net use x: /delete /yes"};
$cmd="net use x: \\$($cfg.r.$env.ctxfs)\config\Clients\$($env:COMPUTERNAME) /PERSISTENT:NO";
$cmd;
Invoke-Expression $cmd;
if ($LASTEXITCODE -ne 0) {throw 'Greska prilikom mapiranja x: drive';}
Invoke-Expression "net use";
$LASTEXITCODE;

"# set podesavanje korisnički deo WI"
@('HKCU:\Software\Citrix\PNAgent', 'HKCU\SOFTWARE\Wow6432Node\Citrix\PNAgent\ServerURL')|
?{test-path $_}|
%{Set-ItemProperty -Path $_ -Name ServerURLCopy -Value $cfg.r.$env.ctxwi -Force;
  (Get-ItemProperty -path 'HKCU:\Software\Citrix\PNAgent').ServerURLCopy;
 }


"# set podesavanje systemski deo WI"
@('HKLM:\SOFTWARE\WOW6432Node\Citrix\PNAgent','HKLM:\SOFTWARE\Citrix\PNAgent')|
?{test-path $_}|
%{Set-ItemProperty -Path $_ -Name ServerURL -Value $cfg.r.$env.ctxwi -Force;
  (Get-ItemProperty -path 'HKCU:\Software\Citrix\PNAgent').ServerURL;
 }


"# start bg-info"
@('c:\Windows\bib\bginfo\startbginfo_win10_x64.bat', 'C:\Program Files\bginfo\startbginfo.bat') |
?{test-path  $_} |
select -First 1 |
%{"start ($_)"; 
  Start-Process -FilePath $_
 }
  #Invoke-Expression -Command '"C:\Program Files\bginfo\startbginfo.bat"'

"#ako je sve ok log fajl nam ne treba"
Stop-Transcript;
del -Path $logFile -Force;

}
catch{
  Stop-Transcript;
  &'notepad.exe' $logFile;
  throw $error;
}


