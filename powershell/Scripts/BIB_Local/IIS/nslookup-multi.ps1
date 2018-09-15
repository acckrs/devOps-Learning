$servers = gc C:\Acca\Powershell_local\BIB\IIS\online_iiss.txt
$outAll = @()
foreach ($server in $servers) {
    try {
        $allOK=$true
        $wmi=gwmi -ComputerName $server -Class win32_operatingsystem    
    }
    catch {
        $allOK=$true
    }
    
    $addresses = [System.Net.Dns]::GetHostAddresses($server)
    foreach ($a in $addresses) {
        $props = @{
            "Name"       = $server;
            "IP Address" = $a.IPAddressToString   
        }
        $obj = New-Object -Type psobject -Property $props
        if ($allOK) {
            $obj | Add-Member -NotePropertyName OS -NotePropertyValue $wmi.caption    
        }else {
            $obj | Add-Member -NotePropertyName OS -NotePropertyValue "N/A"    
        }
        
        $outAll += $obj
    }
}
Write-Output $outAll