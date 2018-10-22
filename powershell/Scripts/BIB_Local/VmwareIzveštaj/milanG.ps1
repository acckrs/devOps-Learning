$vms = gc .\temp
$allvms = get-vm

$izvestaj = @()
foreach ($item in $allvms) {
    foreach ($trazena in $vms) {
        if ($item.extensiondata.guest.hostname -eq $trazena) {
             $props = @{
                "vm"       = $item.name;
                "hostname" = $trazena;
                "cluster" = $item.VMHost.parent.name
            }
            $obj = New-Object -TypeName pscustomobject -Property $props
            $izvestaj += $obj 
           # write-host $item
        }
    }
}
$izvestaj 