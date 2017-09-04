function get-vmtools {
    $vms = "Procur02", "Procur01"
    $sve = @()
    foreach ($vm in $vms) {
        $vmr = get-vm -Name $vm
        $vmm = $vmr|get-view
        $vmh = $vmr|get-vmhost
        #  write-host $vmr.name, $vmr.version , $vmm.config.Tools.ToolsVersion, $vmm.Guest.GuestFullName
        $props = @{
            "vm"          = $vmr.name;
            "hw"          = $vmr.version;
            "tools"       = $vmm.Config.Tools.ToolsVersion;
            "os"          = $vmm.config.guestfullname;
            "host"        = $vmh.Name;
            "hostVersion" = $vmh.config.hostbuild;
            "state"       = $vmm.Runtime.PowerState
        }
        $obj = New-Object -TypeName PSobject -Property $props
        $sve += $obj
    } 
    Write-Output $sve 
}
