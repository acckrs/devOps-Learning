
#upgrade tools
$collection = "xenapp-ad1", "xenapp-dc1", "xenapp-wi1"
<# for ($i = 066; $i -le 120; $i++) {
    if ($i -lt 100) {
        $o1 = "xenapp-" + [string]0 + [string]$i 
    }
    else {
        $o1 = "xenapp-" + [string]$i 
        $vmo = Get-VM -Name $o1
    } #>
foreach ($vmo in $collection) {
    update-tools -vm $vmo -NoReboot 
    stop-vm $vmo -Confirm:$false
    Set-VM -vm $vmo -Version v13 -Confirm:$false
    start-vm $vmo
}

#report
<# $all = @()
for ($i = 066; $i -le 120; $i++) {
    if ($i -lt 100) {
        $o1 = "xenapp-" + [string]0 + [string]$i 
    }
    else {
        $o1 = "xenapp-" + [string]$i 
    } #>
$all = @()
$collection = get-vm
foreach ($vmo in $collection) {

    if (($vmo.ExtensionData.summary.guest.ToolsVersionStatus -ne 'guestToolsCurrent') -or ($vmo.extensiondata.config.version -ne 'vmx-13') -or ($vmo.extensiondata.config.version -ne 'vmx-13')) {
        $props = @{
            "vm"             = $vmo.name;
            "vmTools"        = $vmo.extensiondata.summary.guest.ToolsStatus;
            "vmToolsVersion" = $vmo.extensiondata.summary.guest.ToolsVersionStatus;
            "vmToolsState"   = $vmo.extensiondata.summary.guest.ToolsRunningStatus;
            "hwVersion"      = $vmo.extensiondata.config.version;
            "ToolsVersion"   = $vmo.extensiondata.guest.ToolsVersion;
        }
        $obj = new-object -type psCustomObject -Property $props
        $all += $obj
    }

}
    
#}
$all |export-excel xenappTools3.xlsx
