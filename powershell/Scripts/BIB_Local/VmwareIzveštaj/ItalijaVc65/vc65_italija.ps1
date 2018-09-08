
$hostsObj = @()
$vmObj = @()
$clusters = get-cluster

foreach ($cluster in $clusters) {
<# $hosts = get-vmhost
foreach ($hst in $Hosts) {
    $sockets=$hst.ExtensionData.Hardware.CpuInfo.NumCpuPackages
    $hsProps = @{
        "Name"                = $hst.name;
        "RAM"                 = [math]::round($hst.MemoryTotalGB, 0);
        "CPU Count"        = $sockets;
        "CPU core count" = $hst.NumCpu/$sockets;
        "CPU type"            = $hst.ProcessorType;
        "Manufacturer"        = $hst.manufacturer;
        "Model"               = $hst.Model;
        "Operating System"    = "vmWare ESXi";
        "OS Version"          = $hst.version

    }
    $objHS = New-Object -TypeName pscustomObject -Property $hsProps
    $hostsObj += $objHS
}


 #>   $vms = get-cluster $cluster|get-vm
    foreach ($vm in $vms) {
        $VMprops = @{
            "vm"      = $vm.name;
            "host"    = $vm.VMHost;
            "cluster" = $cluster
        }
        $objVM = New-Object -TypeName pscustomObject -Property $VMprops
        $vmObj += $objVM
    }
} 
$vmobj

#$hostsObj |export-excel .\2_hosts65.xlsx

<# 
$vms="DEV_NLB14","EGAIN-WEB","MTSCOBRAND","DEVTFSERVER","EGAIN-APP","DEV_NLB12","DEV_NLB13","DBAF3","DEV_NLB11","TFSERVERSQL","B2B-BE-01","TFSERVER"
$v=@{}
foreach ($item in $vms) {
   $v[$item]=(get-vm $item).vmhost.parent.name
}
$v #>
