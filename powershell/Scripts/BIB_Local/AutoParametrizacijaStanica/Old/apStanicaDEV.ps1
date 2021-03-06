param ( [Parameter(Mandatory=$True,Position=1)] [string]$wsName, 
        [Parameter(Mandatory=$True,Position=2)] [string]$oj
)		
$ErrorActionPreference='stop';


#$scriptLocation='C:\PowerShell\apStanica';
$scriptLocation=Split-Path $MyInvocation.MyCommand.Path

# PODESITI: odakle se vuče default i gde je destinacija za configuraciju stanice.
$defLoc='\\ctxfsdev1\Config\Default'; 
$destLoc='\\ctxfsdev1\Config\Clients\'+$wsName

#check format 
Write-Host $("Radna stanica=[$wsName]");
Write-Host $("OJ           =[$oj]");

if ($oj -notmatch '^[0-9]+$') {throw ($("Format OJ nije adekvatan. oj=$oj"))}
if ($wsName -notmatch '([a-z]{2,4}-[0-9][a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
if ($oj -eq '000001') {$nacGroup=$Matches[1]+'-NAC'}
$salter = $Matches[2];
Write-Host $("Stanica=$wsName, salter=$salter, NAC=$nacGroup");


#init script
Write-Host 'Script init and load module ActiveDirectory,".\get-newContent.ps1" ';
Set-Location $scriptLocation;
Import-Module '.\get-newContent.ps1'| Out-Null;
Import-Module -Name ActiveDirectory | Out-Null;

#iniciranje konfiguracije iz default fajlova
Write-Host $("inic [$destLoc] from [$defLoc]");
copy -LiteralPath $defLoc -Destination $destLoc -Force -Recurse 
#$acl=Get-Acl $defLoc;
$acl = (Get-Item $defLoc).GetAccessControl('Access')

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
Set-Acl -path $destLoc -aclObject $acl;


#pexim.reg - korekcija
$fileName="$destLoc\registry\pexim.reg";
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

#uklanjanje temp file
del $tempFileName -Force; 
			   
#pub.ini - korekcija
$fileName="$destLoc\Windows\pub.ini";
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

#uklanjanje temp file
del $tempFileName -Force; 


#nac group - dodavanje po potrebi.
if ($oj='000001') {
  Write-Host $("Dodavanje stanice u grupu $nacGroup");
  Add-ADGroupMember -Identity $nacGroup -Members $($wsName+'$') | Out-Null
}


