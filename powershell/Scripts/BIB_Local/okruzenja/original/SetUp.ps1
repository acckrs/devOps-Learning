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

$propName='Environment';
$keyName='HKLM:\SOFTWARE\BIB';

#
$ErrorActionPreference='stop';
$logFile="$($MyInvocation.MyCommand.Source).log";
Start-Transcript -LiteralPath $logFile;

try{
# setovanje registry kew
if (!(Test-Path $keyName)){New-Item -Name $keyName -Force}

#dodavanje proprety
try{$env=Get-ItemPropertyValue -LiteralPath $keyName -Name $propName }
catch{New-ItemProperty -LiteralPath $keyName -PropertyType 'STRING' -Name $propName -Value 'DEV'}

#setovanje prava da korisnici mogu da menjaju ovu vrednost.
$acl=get-acl $keyName;
$fullUserRights = New-Object System.Security.AccessControl.RegistryAccessRule ("BUILTIN\Users","FullControl","Allow");
$acl.AddAccessRule($fullUserRights);
$acl | set-acl -Path $acl.Path;

#kreiranje lokacije skripte i davanje prava koriosnicima po potrebi
$scriptPath='c:\windows\bib\IzborOkruzenja';
if (!(test-path $scriptPath)) {md $scriptPath;}
$acl=get-acl $scriptPath;
$spec=New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Users","CreateFiles, ReadAndExecute, Synchronize","Allow")
$acl.AddAccessRule($spec);

#
Stop-Transcript;
del -LiteralPath $logFile -Force;
"bye";
}
catch {
  throw 'uf, sra??e';
}