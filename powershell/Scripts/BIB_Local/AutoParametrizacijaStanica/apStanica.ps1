param ( [Parameter(Mandatory = $True, Position = 1)] [string]$wsName, 
    [Parameter(Mandatory = $True, Position = 2)] [string]$oj
)		
$ErrorActionPreference = 'stop';

#$scriptLocation='C:\PowerShell\apStanica';
$scriptLocation = Split-Path $MyInvocation.MyCommand.Path
$wss = 'tst-111-1111', 'tst-111-1112'
$okruzenja = @('UAT', 'DEV', 'MNT', 'TRN', 'FC1', 'FC2')
$oj = '000001'
if ($oj -notmatch '^[0-9]+$') {throw ($("Format OJ nije adekvatan. oj=$oj"))}
if ($oj -eq '000001') {$nacGroup = $Matches[1] + '-NAC'}
$salter = $Matches[2];
###
# PODESITI: odakle se vuče default i gde je destinacija za configuraciju stanice.
#region produkcija podesavanje okruzenja
<# 
$okr = @()
foreach ($wsname in $wss) {
        if ($wsName -notmatch '([a-z]{2,4}-[0-9,a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
    foreach ($okruzenje  in $okruzenja) {
        switch ($okruzenje) {
            'FC1' {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\FC1ctxfsdev1\Config\Default";
                    "destOkr" = "\\FC1CtxFsdev1\Config\Clients\" + "$wsName";
                    "stanica"=$wsname
                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
            'FC2' {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\FC2ctxfsdev1\Config\Default";
                    "destOkr" = "\\FC2CtxFsdev1\Config\Clients\" + "$wsName";
                    "stanica"=$wsname
                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
            Default {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\ctxfs" + "$okruzenje" + "\Config\Default";
                    "destOkr" = "\\ctxfs" + "$okruzenje" + "\Config\Clients\" + "$wsName";
                    "stanica"=$wsname
                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
        }
    }
}
 #>
#endregion 
#region Test podesavanje okruzenja
$okr = @()
foreach ($wsname in $wss) {
    if ($wsName -notmatch '([a-z]{2,4}-[0-9,a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
    if ($oj -notmatch '^[0-9]+$') {throw ($("Format OJ nije adekvatan. oj=$oj"))}
    if ($oj -eq '000001') {$nacGroup = $Matches[1] + '-NAC'}
    $salter = $Matches[2];
    foreach ($okruzenje  in $okruzenja) {
        $props = @{
            "imeOkr"  = $okruzenje;
            "defOkr"  = ".\" + "$okruzenje" + "\Config\Default";
            "destOkr" = ".\" + "$okruzenje" + "\Config\Clients\" + "$wsName" + "\";
            "stanica" = $wsname
        }
        $obj = New-Object -Type pscustomobject -Property $props
        $okr += $obj
    }
}
#endregion
#check format 




#init script
Write-Host 'Script init and load module ActiveDirectory,".\get-newContent.ps1" ';
Set-Location $scriptLocation;
Import-Module '.\get-newContent.ps1'| Out-Null;
Import-Module -Name ActiveDirectory | Out-Null;

###
#iniciranje konfiguracije iz default fajlova
$oj = '000001'
foreach ($okrz in $okr) {
    Write-output $("Radna stanica=[$okrz.name]");
    Write-output $("OJ           =[$oj]");
    write-output  $("inic[" + $okrz.destOkr + "] from [" + $okrz.defOkr + "]")
    if (!(test-path $okrz.destOkr)) {
        copy -LiteralPath $okrz.defOkr-Destination $okrz.destOkr -Force -Recurse 
        $acl = (Get-Item $okrz.defOkr).GetAccessControl('Access')   
        $ctxGroup = if ($oj -eq '000001') { 'citrix_centrala'; } 
        elseif ($oj -match '0051[0-9]{2}') { 'citrix_rcbeograd'}
        elseif ($oj -match '0053[0-9]{2}') { 'citrix_rckragujevac'}
        elseif ($oj -match '0054[0-9]{2}') { 'citrix_rcnis'}
        elseif ($oj -match '0058[0-9]{2}') { 'citrix_rcnovisad'}
        else {throw $("Format OJ nije validan. oj=$oj?")};
        #dodavanje prava za ctxGroup  
        Write-output $("Setovanje prava za $ctxGroup na " + $okrz.destOkr )	
        $acl.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(
                    "deltabank\$ctxGroup", "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
        Set-Acl -path $okrz.destOkr -aclObject $acl;
    }
    
    Write-output $("Stanica=$wsName, salter=$salter, NAC=$nacGroup");


    #pexim.reg - korekcija
    $fileName = $okrz.destOkr + "\registry\pexim.reg";
    $tempFileName = $fileName + '.tmp';
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
}

#pexim.reg - korekcija
$fileName = "$destLocUAT\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocdev\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocmnt\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLoctrn\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocFC1\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocFC2\registry\pexim.reg";
$tempFileName = $fileName + '.tmp';
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
$fileName = "$destLocUAT\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocDEV\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocMNT\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocTRN\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocFC1\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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

$fileName = "$destLocFC2\Windows\pub.ini";
$tempFileName = $fileName + '.tmp';
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
if ($oj = '000001') {
    Write-Host $("Dodavanje stanice u grupu $nacGroup");
    Add-ADGroupMember -Identity $nacGroup -Members $($wsName + '$') | Out-Null
}


