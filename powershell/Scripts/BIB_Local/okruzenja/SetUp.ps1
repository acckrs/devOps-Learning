#############################
#
# skripta kojom se setup-uje sistem za izbor radnog okruženja za NE produkcione stanice
# skripta se izvršava pod nalogom koji ima ADMIN privilegije 
# skripta se izvršava samo jednom i ona radi sledeće:
#
# 1. kreira registry ključ kojim se identifikuje željeno okruženje. 
# 2. daje pravo korisnicima da menjaju novi ključ
# 3. daje pravo korisnicima na lokaciji gde se nalaze skripte "c:\windows\bib\IzborOkruzenja" da kreiraju log fajlove. 
#
############################
$scriptPath='c:\windows\bib\IzborOkruzenja';
$propName='Environment';
$keyName='HKLM:\SOFTWARE\BIB';

#
$ErrorActionPreference='stop';
$logFile="$($MyInvocation.MyCommand.Definition).log";
@'
--------------------------------------
*** Error log setovanja okruženja. ***
Desila se greška tokom procesa i potrebno je da se obratite ict_techsuppor@bancaintesa.rs
--------------------------------------
'@ | Out-File $logFile;
Start-Transcript -Path $logFile -Append;

try{
"#setovanje registry key: $keyName";
if (!(Test-Path $keyName)){
  cd 'HKLM:\';
  New-Item -Name $($keyName.replace('HKLM:\','')) -Force;
  cd $scriptPath
}

"#dodavanje proprety vredosti 'Environment'='FC2'"; 
try{$env=(Get-ItemProperty -Path $keyName -Name $propName ).Environment }
catch{New-ItemProperty -Path $keyName -PropertyType 'STRING' -Name $propName -Value 'FC2'}

"#setovanje prava da korisnici mogu da menjaju ovu vrednost."
$acl=get-acl $keyName;
$fullUserRights = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","FullControl","Allow");
$acl.AddAccessRule($fullUserRights);
$acl | set-acl -Path $acl.Path;
 
"#davanje prava i na systemskom registry 'PNAgent'";
@('HKLM:\SOFTWARE\WOW6432Node\Citrix\PNAgent','HKLM:\SOFTWARE\Citrix\PNAgent')|
?{test-path $_} |
%{$keyNAme=$_;
  $acl=get-acl $keyName;
  $acl.AddAccessRule($fullUserRights);
  $acl | set-acl -Path $acl.Path;
}


"#kreiranje lokacije skripte ($scriptPath) i davanje prava korisnicima po potrebi";
if (!(test-path $scriptPath)) {md $scriptPath;}
$acl=get-acl $scriptPath;
$spec=New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Users","CreateFiles, ReadAndExecute, Synchronize","Allow")
$acl.AddAccessRule($spec);

#
Stop-Transcript;
del -Path $logFile -Force;
"bye";
}

catch {
  Stop-Transcript;
  &'notepad.exe' $logFile;
  throw 'uf, sra??e';
}