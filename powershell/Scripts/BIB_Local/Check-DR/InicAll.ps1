[CmdletBinding()]
param (
    [parameter(Mandatory = $true)]
    [ValidateSet("PRM", "SRB")]
    [String]$DrLoc,
    [switch]$dmz
)
#set clocation
#$cd = 'C:\SchTask\Check-DR';
#if ($MyInvocation.MyCommand.Path -ne $null) {$cd = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path); }
#Set-Location $cd;
#
Write-Host "Iniciranje log fajlova za check-dr lokacija=[$DrLoc] domen=[DMZ]";
Write-Host "Brisanje starih sadržaja podfoldera <toCheck> i <ok>";
Write-Host '---------------------------------'
del ok\*.log -Force;
del toCheck\*.log -Force;

$sss = @{}
$oss = @{}
$hosts = import-csv -Delimiter ',' -Path '.\check-dr.csv'
foreach ($r in $hosts) { 
    #pogodili lokaciju
    if ($r.LocId.StartsWith($DrLoc.toUpper())) {
        if ($dmz -eq $true) {
            # ako radimo u dmzu  
            if ($r.Domain -in ("workgroup", "dmz") ) {
                $fName = 'toCheck\{0}~{1}.log' -f $r.oCiType, $r.oName;
                Write-Host "Gen file:$fName";
                $props = @{
                    "IncTime"  = [datetime]::Now.ToString('yyyy-MM-dd hh:mm:ss');
                    "FileName" = $fName.TrimStart(' ');
                    "oCiType"  = $r.oCiType;
                    "oName"    = $r.oName;
                    "Domain"   = $r.Domain;
                    "LocId"    = $r.LocId;
                    "osType"   = $r.osType;
                    "osName"   = $r.Operating_System
                }
                $fMsg = New-Object -TypeName pscustomobject -Property $props
            }
            else {
                continue
            }
        }# kraj provere da li smo u dmzu
        else {
            if ($r.Domain -eq $env:USERDOMAIN) {
                $fName = 'toCheck\{0}~{1}.log' -f $r.oCiType, $r.oName;
                Write-Host "Gen file:$fName";
                $props = @{
                    "IncTime"  = [datetime]::Now.ToString('yyyy-MM-dd hh:mm:ss');
                    "FileName" = $fName;
                    "oCiType"  = $r.oCiType;
                    "oName"    = $r.oName;
                    "Domain"   = $r.Domain;
                    "LocId"    = $r.LocId;
                    "osType"   = $r.osType;
                    "osName"   = $r.Operating_System
                }
                $fMsg = New-Object -TypeName pscustomobject -Property $props
            }
            else {
                continue
            }
        }
    }
    else {
        continue
    }
    $fMsg | Out-File -FilePath $fName -Force;
    if (!$sss[$r.oCiType]) {
        $sss[$r.oCiType] = 1
    }
    else {
        $sss[$r.oCiType]++
    }
    if (!$oss[$r.oName]){
        $oss[$r.oName]=$r.operating_System
    }
} #kraj foreach loop-a
$sss
$sss | % { ($sss.values |measure -Sum).sum}

$oss
