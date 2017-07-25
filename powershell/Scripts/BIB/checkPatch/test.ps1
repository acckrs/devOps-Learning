function vms1 {
    $clusters = Get-Cluster
    $totalVMS = 0
    $totalHosts = 0
    $sve = @()
    foreach ($cluster in $clusters) {
        $props = @{
            "cluster"    = $cluster.name;
            "vmscount"   = ($cluster|get-vm).count
            "hostsCount" = ($cluster|get-vmhost).count
        }
        $totalVMS = $totalvms + ($cluster|get-vm).count
        $totalHosts += ($cluster|get-vmhost).count
        $obj = New-Object -TypeName PSobject -Property $props
        #Write-Output $obj
        $sve += $obj
       
    }
    $propTot = @{
        "cluster"    = "Total";
        "vmscount"   = $totalVMS;
        "hostsCount" = $totalHosts
    }
    $objTot = new-object -TypeName psobject -Property $propTot
    $sve += $objTot
    Write-Output $sve
}

function vms2 {
    $clusters = get-view -ViewType computeresource
    $totalVMS = 0
    $totalHosts = 0
    $sve = @()
    foreach ($cluster in $clusters) {
        $props = @{
            "cluster"    = $cluster.name;
            "vmscount"   = ($cluster|get-vm).count
            "hostsCount" = ($cluster|get-vmhost).count
        }
        $totalVMS = $totalvms + ($cluster|get-vm).count
        $totalHosts += ($cluster|get-vmhost).count
        $obj = New-Object -TypeName PSobject -Property $props
        #Write-Output $obj
        $sve += $obj
       
    }
    $propTot = @{
        "cluster"    = "Total";
        "vmscount"   = $totalVMS
        "hostsCount" = $totalHosts
    }
    $objTot = new-object -TypeName psobject -Property $propTot
    $sve += $objTot
    Write-Output $sve 
}

function check-datastores{
    $datastores=Get-Datastore
    $totFree=0
    $tot=0
    foreach ($ds in $datastores){
        $totFree+=$ds.freespacegb
        $tot+=$ds.capacityGB
    }
    write-output ($totFree/$tot)
}
#vms1
check-datastores

 #get-vm  | select name,vmhost,@{n="Cluster";e={$_|get-cluster|?{$_.name -eq "type2"}}},@{n="datastore";e={$_|get-datastore}}