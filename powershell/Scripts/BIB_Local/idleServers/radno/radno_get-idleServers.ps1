
[CmdletBinding()]
param
(
    [Parameter()]
    [ValidateScript( { Test-Connection -ComputerName $_ -Quiet -Count 1 })]
    [ValidateNotNullOrEmpty()]
    [string[]]$servers = $env:COMPUTERNAME
)

$out = @()
foreach ($server in $servers) {
    $Win32OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $server
    $Build = $Win32OS.BuildNumber

    if ($Build -ge 6001) {
        #ako je OS visi od Vista SP1
        $results = get-wmiobject -ComputerName $server -class Win32_UserProfile  |? {!$_.Special}
        $profili = @()
        foreach ($result in $results) {
            $userAccount = [wmi]("root/cimv2:Win32_SID.SID='{0}'" -f $result.SID)
            if ($userAccount.ReferencedDomainName -like "*deltabank*") {
                $props = @{
                    "Computer Name"    = $result.PSComputerName;
                    "User Name"        = "{0}\{1}" -f $userAccount.ReferencedDomainName, $userAccount.AccountName
                    "Last Access Time" = $result.ConvertToDateTime($result.LastUseTime)
                }
                $profil = New-Object -TypeName PSObject -Property $props
                $profili += $profil
            }
            else {
                $props = @{
                    "Computer Name"    = $result.PSComputerName;
                    "User Name"        = "{0}\{1}" -f $result.PSComputerName, "Lokalni nalog"
                    "Last Access Time" = $result.ConvertToDateTime($result.LastUseTime)
                }
                $profil = New-Object -TypeName PSObject -Property $props
                $profili += $profil
            }
        }
        $sortiraniProfili = $profili |sort "Last Access Time" -Descending |select -First 1
        $out += $sortiraniProfili
    } #kraj obrade ako je OS veci od  Vista SP1
    else {
        #obrada ako je OS manji od Vista SP1g
        $path = "\\" + $server + "\C$\Documents and Settings\"
        $props2 = @{
            "Computer Name"    = $server
            "User Name"        = "N/A";
            "Last Access Time" = "N/A"
        }
        $profil2 = New-Object -TypeName PSObject -Property $props2
        $out += $profil2
    }
}
$out."Computer Name"