param ( [Parameter(Mandatory = $True, Position = 1)] [string[]]$wss, 
    [Parameter(Mandatory = $True, Position = 2)] [string]$oj
)		
$ErrorActionPreference = 'stop';

$scriptLocation = Split-Path $MyInvocation.MyCommand.Path
$okruzenja = @('UAT', 'DEV', 'MNT', 'TRN', 'FC1', 'FC2')
#check format 
if ($oj -notmatch '^[0-9]+$') {throw ($("Format OJ nije adekvatan. oj=$oj"))}

# PODESITI: odakle se vuče default i gde je destinacija za configuraciju stanice.
#region produkcija podesavanje okruzenja

$okr = @()
foreach ($wsname in $wss) {
    if ($wsName -notmatch '([a-z]{2,4}-[0-9,a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
    if ($oj -eq '000001') {$nacGroup = $Matches[1] + '-NAC'}
    $salter = $Matches[2];
    foreach ($okruzenje  in $okruzenja) {
        switch ($okruzenje) {
            'FC1' {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\FC1ctxfsdev1\Config\Default";
                    "destOkr" = "\\FC1CtxFsdev1\Config\Clients\" + "$wsName";
                    "stanica"=$wsname;
                    "salter"   = $salter;
                    "nacGroup" = $nacGroup;
                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
            'FC2' {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\FC2ctxfsdev1\Config\Default";
                    "destOkr" = "\\FC2CtxFsdev1\Config\Clients\" + "$wsName";
                    "stanica"=$wsname;
                    "salter"   = $salter;
                    "nacGroup" = $nacGroup;

                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
            Default {
                $props = @{
                    "imeOkr"  = $okruzenje;
                    "defOkr"  = "\\ctxfs" + "$okruzenje" + "1\Config\Default";
                    "destOkr" = "\\ctxfs" + "$okruzenje" + "1\Config\Clients\" + "$wsName";
                    "stanica"=$wsname;
                    "salter"   = $salter;
                    "nacGroup" = $nacGroup;
                }
                $obj = New-Object -Type pscustomobject -Property $props
                $okr += $obj
            }
        }
    }
}
 
#endregion 
<#
#region Test podesavanje okruzenja
$okr = @()
foreach ($wsname in $wss) {
    #check format 
    if ($wsName -notmatch '([a-z]{2,4}-[0-9,a-z]{2,4})-([0-9]{4})') {throw $("Ime masine ($wsName) nije u ocekivanom formatu.")}
    if ($oj -eq '000001') {$nacGroup = $Matches[1] + '-NAC'}
    $salter = $Matches[2];
    foreach ($okruzenje  in $okruzenja) {
        $props = @{
            "imeOkr"   = $okruzenje
            "defOkr"   = ".\" + "$okruzenje" + "\Config\Default";
            "destOkr"  = ".\" + "$okruzenje" + "\Config\Clients\" + "$wsName" + "\";
            "stanica"  = $wsname;
            "salter"   = $salter;
            "nacGroup" = $nacGroup;
        }
        $obj = New-Object -Type pscustomobject -Property $props
        $okr += $obj
    }
}
#endregion
#>

#init script
Write-Host 'Script init and load module ActiveDirectory,".\get-newContent.ps1" ';
Set-Location $scriptLocation;
Import-Module '.\get-newContent.ps1'| Out-Null;
Import-Module -Name ActiveDirectory | Out-Null;

###

#region OBRADA
foreach ($okrz in $okr) {
    Write-Output "####"
    Write-output $("Radna stanica=["+$okrz.stanica+"]");
    Write-output $("OJ           =[$oj]");
    if (!(test-path $okrz.destOkr)) {
        #iniciranje konfiguracije iz default fajlova
        write-output  $("Kreiranje foldera [" + $okrz.destOkr + "] iz [" + $okrz.defOkr + "]")
        copy -LiteralPath $okrz.defOkr-Destination $okrz.destOkr -Force -Recurse 
        #region acl podesavanje
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
        #endregion
        
        #region pexim.reg - korekcija
        Write-output $("Podesavanje pexim.reg na $wsName, za salter $salter i NAC $nacGroup")	
        $fileNamePex = $okrz.destOkr + "\registry\pexim.reg";
        $tempFileNamePex = $fileNamePex + '.tmp';
        Write-Host $("Priprema fajla ($fileNamePex)");
    
        Get-NewContent -filename $fileNamePex `
            -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
            -targetAttrib '"OJ"' `
            -targetValue """$oj""" | Out-File -FilePath $tempFileNamePex -Force;
        copy -LiteralPath $tempFileNamePex -Destination $fileNamePex -Force;			   
        
        $ss = "`"" + $okrz.salter + "`""          
        Get-NewContent -fileName $fileNamePex `
            -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\CONFIG]' `
            -targetAttrib '"SALTER"' `
            -targetValue $ss | Out-File -FilePath $tempfileNamePex -Force;
        copy -LiteralPath $tempfileNamePex -Destination $fileNamePex -Force;			   
               
        Get-NewContent -fileName $fileNamePex `
            -targetSeq '[HKEY_LOCAL_MACHINE\software\pexim\PostNet]' `
            -targetAttrib '"OJ"' `
            -targetValue """$oj""" | Out-File -FilePath $tempfileNamePex -Force;
        copy -LiteralPath $tempfileNamePex -Destination $fileNamePex -Force;  
        #uklanjanje temp file
        del $tempfileNamePex -Force; 

        #endregion
                			   
        #region pub.ini - korekcija
        Write-output $("Podesavanje PUB.INI na $wsName, za salter $salter i NAC $nacGroup")	
        $fileNamePUB = $okrz.destOkr + "\Windows\pub.ini";
        $tempFileNamePUB = $fileNamePUB + '.tmp';
        Write-Host $("Priprema fajla ($fileNamePUB)");
        Get-NewContent -filename $fileNamePUB `
            -targetSeq '[CONFIG]' `
            -targetAttrib 'SALTER' `
            -targetValue $okrz.salter | Out-File -FilePath $tempFileNamePUB -Force;
        copy -LiteralPath $tempFileNamePUB -Destination $fileNamePUB -Force;		

        Get-NewContent -filename $fileNamePUB `
            -targetSeq '[CONFIG]' `
            -targetAttrib 'OJ' `
            -targetValue $oj | Out-File -FilePath $tempFileNamePUB -Force;
        copy -LiteralPath $tempFileNamePUB -Destination $fileNamePUB -Force;		

        Get-NewContent -filename $fileNamePUB `
            -targetSeq '[PRINTER]' `
            -targetAttrib 'SERVER' `
            -targetValue $wsName | Out-File -FilePath $tempFileNamePUB -Force;
        copy -LiteralPath $tempFileNamePUB -Destination $fileNamePUB -Force;	
        #uklanjanje temp file
        del $tempfileNamePUB -Force; 
        #endregion
    }
}
#endregion

###
	
<# #nac group - dodavanje po potrebi.
if ($oj = '000001') {
    Write-Host $("Dodavanje stanice u grupu $nacGroup");
    Add-ADGroupMember -Identity $nacGroup -Members $($wsName + '$') | Out-Null
} #>


