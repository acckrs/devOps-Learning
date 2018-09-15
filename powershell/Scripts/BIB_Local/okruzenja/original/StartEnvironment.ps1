####################################
#  Logon script za podešavanje radnog okruženja za masine u NE-produkcionim okruženjima
#  Scripta se može pozvati i direktno bez forsiranog logobvanja
#  Skripta se izvršava u kontekstu korisnika 
####################################


$ErrorActionPreference='stop';
$logFile="$($MyInvocation.MyCommand.Source).log";
#$Error.Clear();
Start-Transcript -LiteralPath $logFile;

"Login time $([datetime]::Now.ToString('yyyy.MM.dd HH:mm:ss')) for user $($env:USERNAME)";
try{
$env=Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\BIB' -Name 'Environment';
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
Invoke-Expression "net use x: \\$($cfg.r.$env.ctxfs)\config\Clients\$($env:COMPUTERNAME) /PERSISTENT:NO";
Invoke-Expression "net use";

# set podesavanje WI
@('HKCU:\Software\Citrix\PNAgent', 'HKCU\SOFTWARE\Wow6432Node\Citrix\PNAgent\ServerURL')|
?{test-path $_}|
%{Set-ItemProperty -LiteralPath $_ -Name ServerURLCopy -Value $cfg.r.$env.ctxwi -Force;
  get-ItemPropertyValue -LiteralPath $_ -Name ServerURLCopy;
 }

#ako je sve ok log fajl nam ne treba
Stop-Transcript;
del -LiteralPath $logFile -Force;

}
catch{
  $Error;
}


