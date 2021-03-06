param ( [Parameter(Mandatory=$True,Position=1)] [string]$wsName, 
        [Parameter(Mandatory=$True,Position=2)] [string]$oj
)		
$ErrorActionPreference='stop';


#$scriptLocation='C:\PowerShell\apStanica';
$scriptLocation=Split-Path $MyInvocation.MyCommand.Path

###

# PODESITI: odakle se vuče default i gde je destinacija za configuraciju stanice.
$defLocUAT='\\ctxfsuat1\Config\Default'; 
$destLocUAT='\\ctxfsuat1\Config\Clients\'+$wsName

$defLocDEV='\\ctxfsdev1\Config\Default'; 
$destLocDEV='\\ctxfsdev1\Config\Clients\'+$wsName

$defLocMNT='\\ctxfsmnt1\Config\Default'; 
$destLocMNT='\\ctxfsmnt1\Config\Clients\'+$wsName

$defLocTRN='\\ctxfstrn1\Config\Default'; 
$destLocTRN='\\ctxfstrn1\Config\Clients\'+$wsName

$defLocFC1='\\Fc1CtxFsdev1\Config\Default'; 
$destLocFC1='\\Fc1CtxFsdev1\Config\Clients\'+$wsName

$defLocFC2='\\Fc2CtxFsdev1\Config\Default'; 
$destLocFC2='\\Fc2CtxFsdev1\Config\Clients\'+$wsName

###

#check format 
Write-Host $("Radna stanica=[$wsName]");
Write-Host $("OJ           =[$oj]");

if ($oj -notmatch '^[0-9]+$') {throw ($("Format OJ nije adekvatan. oj=$oj"))}
if ($wsName -notmatch '([a-z]{2,4}-[0-9,a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
if ($oj -eq '000001') {$nacGroup=$Matches[1]+'-NAC'}
$salter = $Matches[2];
Write-Host $("Stanica=$wsName, salter=$salter, NAC=$nacGroup");


#init script
Write-Host 'Script init and load module ActiveDirectory,".\get-newContent.ps1" ';
Set-Location $scriptLocation;
Import-Module '.\get-newContent.ps1'| Out-Null;
Import-Module -Name ActiveDirectory | Out-Null;

###

#iniciranje konfiguracije iz default fajlova
Write-Host $("inic [$destLocUAT] from [$defLocUAT]");
copy -LiteralPath $defLocUAT -Destination $destLocUAT -Force -Recurse 
#$acl=Get-Acl $defLocUAT;
$acl = (Get-Item $defLocUAT).GetAccessControl('Access')

Write-Host $("inic [$destLocDEV] from [$defLocDEV]");
copy -LiteralPath $defLocDEV -Destination $destLocDEV -Force -Recurse 
#$acl=Get-Acl $defLocDEV;
$acl = (Get-Item $defLocDEV).GetAccessControl('Access')

Write-Host $("inic [$destLocMNT] from [$defLocMNT]");
copy -LiteralPath $defLocMNT -Destination $destLocMNT -Force -Recurse 
#$acl=Get-Acl $defLocMNT;
$acl = (Get-Item $defLocMNT).GetAccessControl('Access')

Write-Host $("inic [$destLocTRN] from [$defLocTRN]");
copy -LiteralPath $defLocTRN -Destination $destLocTRN -Force -Recurse 
#$acl=Get-Acl $defLocTRN;
$acl = (Get-Item $defLocTRN).GetAccessControl('Access')

Write-Host $("inic [$destLocFC1] from [$defLocFC1]");
copy -LiteralPath $defLocFC1 -Destination $destLocFC1 -Force -Recurse 
#$acl=Get-Acl $defLocFC1;
$acl = (Get-Item $defLocFC1).GetAccessControl('Access')

Write-Host $("inic [$destLocFC2] from [$defLocFC2]");
copy -LiteralPath $defLocFC2 -Destination $destLocFC2 -Force -Recurse 
#$acl=Get-Acl $defLocFC2;
$acl = (Get-Item $defLocFC2).GetAccessControl('Access')

###

###

#dodavanje prava za ctxGroup  
$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocUAT -aclObject $acl;

$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocDEV -aclObject $acl;

$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocMNT -aclObject $acl;

$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocTRN -aclObject $acl;

$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocFC1 -aclObject $acl;

$ctxGroup=if ($oj -eq '000001') { 'citrix_centrala';} 
          elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
          elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
          elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
          elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
          else {throw $("Format OJ nije validan. oj=$oj?")};
Write-Host $("Setovanje prava za $ctxGroup");		  
$acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
    "deltabank\$ctxGroup","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl -path $destLocFC2 -aclObject $acl;

###

###

#pexim.reg - korekcija
$fileName="$destLocUAT\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocdev\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocmnt\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLoctrn\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocFC1\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocFC2\registry\pexim.reg";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");

Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
			   -targetAttrib '"SALTER"' `
			   -targetValue """$salter""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;			   
			   
Get-NewContent -filename $fileName `
               -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
			   -targetAttrib '"OJ"' `
			   -targetValue """$oj""" | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

###

#uklanjanje temp file
del $tempFileName -Force; 

###
			   
#pub.ini - korekcija
$fileName="$destLocUAT\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;	

$fileName="$destLocDEV\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;	

$fileName="$destLocMNT\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocTRN\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocFC1\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

$fileName="$destLocFC2\Windows\pub.ini";
$tempFileName=$fileName+'.tmp';
Write-Host $("prepare ($fileName)");
Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'SALTER' `
			   -targetValue $salter | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[CONFIG]' `
			   -targetAttrib 'OJ' `
			   -targetValue $oj | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;		

Get-NewContent -filename $fileName `
               -targetSeq '[PRINTER]' `
			   -targetAttrib 'SERVER' `
			   -targetValue $wsName | Out-File -FilePath $tempFileName -Force;
copy -LiteralPath $tempFileName -Destination $fileName -Force;

###

#uklanjanje temp file
del $tempFileName -Force; 


#nac group - dodavanje po potrebi.
if ($oj='000001') {
  Write-Host $("Dodavanje stanice u grupu $nacGroup");
  Add-ADGroupMember -Identity $nacGroup -Members $($wsName+'$') | Out-Null
}


