 <# $cred = Get-Credential -UserName "spimi\u390207" -message bla

connect-viserver co-vc-bib-p01.fbisp.eu,co-vc-mb-p01.fbisp.eu -Credential $cred
connect-viserver bib-vcentar-02
 #>
function get-datastoreInfo {
    $datastores = Get-Datastore | where-object {($_.Name -notmatch "parking") -and ($_.Name -notmatch "temp") -and ($_.Name -notmatch "local") -and ($_.Name -notmatch "boot")}
    $measures = $datastores | measure -sum   freespacegb, capacitygb
    $v = @{}
    foreach ($item in $measures) {
        $v[$item.property] = '{0:N0}' -f $item.Sum
    }
    $v["Count"] = $datastores.count
    $v["pctFree"] = ($v["FreeSpaceGB"] / $v["CapacityGB"]).ToString("P")
    $v
}
function get-cpuMemInfo {
    $izv=@()
    $clusters = get-cluster
    foreach ($item in $clusters) {
        try {
            $stats=get-stat -entity (get-cluster bib-ctx-ps-01) -stat "mem.usage.average"  -MaxSamples 1 -ErrorAction stop 
            if ($stats.metricid -eq 'cpu.usage.average'){
                $AvgCPU=$stats.value
            }else
            {
                $avgMem=$stats.value
            }
            $rowProps=@{
                "ClusterName"= $stats.entity;
                

            }
            
        }
        catch  [System.Exception] {
            
            $clusters=Get-Cluster bib-dmz-pp-01,bib-int-pp-01
            $c=@()
            foreach ($cluster in $clusters) {
                $hosts=get-cluster $cluster| get-vmhost 
                #$h=@()
                $clustAvgCpuSum=0
                $clustAvgmemSum=0
                foreach ($hst in $hosts) {
                  $cpuStats= get-stat -entity $hst -stat "cpu.usage.average" -MaxSamples 1
                  $memStats= get-stat -entity $hst -stat "mem.usage.average" -MaxSamples 1
          <#         $hostStatProps=@{
                      "Cluster"=$cluster.name
                      "HostName"=$hst.Name;
                      "HostAvgCPU"=$cpuStats.value;
                      "HostAvgMem"=$memStats.value
                  }
                  $objH=new-object -TypeName psCustomObject -Property $hostStatProps
                  $h+=$objH  #>
                  $clustAvgCpuSum+=$cpuStats.value;
                  $clustAvgMemSum+=$memStats.value;
                }
                #$h
                $clustStatProps=@{
                    "ClusterName"=$cluster.name;
                    "AvgCpu %"='{0:N2}' -f ($clustAvgCpuSum/($hosts.count));
                    "AvgMem %"='{0:N2}' -f ($clustAvgMemSum/($hosts.count));
                }
                $obj=new-object -TypeName psCustomObject -Property $ClustStatProps
                  $c+=$obj
            }
           $avgClustCpu=$c |measure -average 'AvgCpu %'
           $avgClustMem=$c |measure -average 'Avgmem %'
           $avgProps=@{
            "ClusterName"="Svi";
            "AvgCpu %"= '{0:N2}' -f ($avgClustCpu.average);
            "AvgMem %"= '{0:N2}' -f ($avgClustmem.average)
           }
           $obj=new-object -TypeName psCustomObject -Property $avgProps
           $c+=$obj
           $c
        }
    }

    get-stat -entity (get-cluster bib-ctx-ps-01| get-vmhost  ) -stat "cpu.usage.average" -MaxSamples 1 |select entity, value


}
<#
$clusters = get-cluster
$v = @{}
foreach ($item in $clusters) {
    $hosts = $item| Get-Vmhost
    $v[$item.name] = $hosts.count
}
$v.GetEnumerator()|sort value -Descending
get-vmhost|Group-Object name  #>

get-datastoreInfo
#Disconnect-VIServer * -Force -Confirm:$false
