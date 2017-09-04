$BIBvmwareErrors = "C:\errors.txt"
function get-BIBclusterPerf {
    <#
        .SYNOPSIS
            get-BIBclusterPerf retrieves clusters' average cpu and memory statistics for previous month. 
        .DESCRIPTION
            get-BIBclusterPerf retrieves clusters' average cpu and memory statistics for previous month. Choose vCenter, enter credential. 
        .PARAMETER vCenter
            vCenter name to connect to.
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 08th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
             get-BIBclusterPerf-vcenter bib-vcentar-01
   #>

    param(
        [Parameter(Mandatory = $true, 
                    ValueFromPipeline = $true)]
        [alias("vc")]
        [String]$vCenter,

        [string]$errorLog = $BIBvmwareErrors
    )
    
    BEGIN {
        if ($global:DefaultVIServer) {
            Disconnect-VIServer -Server $global:DefaultVIServers  -Confirm:$false
        }
        $today = (Get-Date).Date
        $lastDayOfMonth = $today.AddDays( - $today.Day)
        $firstDayOfMonth = $lastDayOfMonth.AddDays( - $lastDayOfMonth.Day + 1)
	
		
		
		
        Write-verbose "Error log is $errorLog"
        write-verbose "Connecting to vCenter $vcenter"

     foreach ($vc in $vCenter){  
          try {
            $everythingOk = $true
            connect-viserver $vc -ErrorAction Stop -ev $errmsg
             }#end try
        catch {
            $time = get-date -format G
            $msg = "Connecting to vCenter $vcenter failed."
            $everythingOk = $false
            Write-Warning $msg
            Write-Warning "Writing to error log file: $time ERROR: $($_.exception.message)"
            if (!(test-path $errorLog)) {
                new-item $errorLog
                "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
            }
            else {
                "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
            }
        }#end catch
      }#loop vCenters
    } #end BEGIN block

    PROCESS {
       
       foreach () {
        if ($everythingOk) {
            $clusters = VMware.VimAutomation.Core\Get-Cluster | ?{($_.name -ne 'extension') -and ($_.name -ne 'bib-test') -and ($_.name -ne 'Security')}
			$brojClustera=$clusters.count
            $clustersObj = @()

            if ($vCenter -notlike '*fbisp*') {
                $sviClustCPU = 0
                $sviClustMEM = 0
                foreach ($cluster in $clusters) {
                    $statsCPU = Get-Stat -Entity $cluster -Stat "cpu.usage.average" -Start $firstDayOfMonth -Finish $lastDayOfMonth | measure-object -average -Property value | select Average
                    $statsMem = Get-Stat -Entity $cluster -Stat  "mem.usage.average" -Start $firstDayOfMonth -Finish $lastDayOfMonth | Measure-Object -Average -Property Value | select Average
                
                    $sviClustCPU += $statsCPU.average
                    $sviClustMEM += $statsMem.average

                    $props = @{
                        "vCenter"     = $vcenter;
                        "ClusterName" = $cluster.name;
                        "avgCPU"      = "{0:N2}" -f $statsCPU.average ;
                        "avgMem"      = "{0:N2}" -f $statsMem.average
                    }#end props splatting
                    $obj = New-Object -TypeName psobject -Property $props 
                    $obj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
                    $clustersObj += $obj
			    }#end foreach cluster loop
				
            } #end if ako nije vcentar u Italiji, onda radi get-stat -entity cluster
            else {
                $sviClustCPU = 0
                $sviClustMEM = 0

                foreach ($cluster in $clusters) {
                    write-verbose "---Cluster is $cluster---"
                    $clusterCPUsum = 0 
                    $clusterMEMsum = 0
                    $clusterCPUavg = 0
                    $clusterMEMavg = 0

                    $vmHosts = $cluster|Get-VMHost
                    $brojHostovauKlasteru = $vmhosts.count
                    write-verbose "broj hostova u klasteru je $brojHostovauKlasteru"
                    foreach ($vmHost in $vmHosts) {
                        write-verbose "host is $vmHost"
                        $statsCPU = Get-Stat -Entity $vmhost -Stat "cpu.usage.average" -Start  $firstDayOfMonth -Finish  $lastDayOfMonth | measure-object -average -Property value | select Average
                        $statsMem = Get-Stat -Entity $vmhost -Stat  "mem.usage.average" -Start  $firstDayOfMonth -Finish  $lastDayOfMonth | Measure-Object -Average -Property Value | select Average
                        $clusterCPUsum += $statsCPU.average
                        $clusterMEMsum += $statsMem.average
                    }
                
                    $clusterCPUavg += $clusterCPUsum / $brojHostovauKlasteru
                    $clusterMEMavg += $clusterMEMsum / $brojHostovauKlasteru

                    $props = @{
                        "vCenter"     = $vcenter
                        "ClusterName" = $cluster.name;
                        "avgCPU"      = "{0:N2}" -f $clusterCPUavg ;
                        "avgMem"      = "{0:N2}" -f $clusterMEMavg
                    }#end props splatting
                    $obj = New-Object -TypeName psobject -Property $props 
                    $obj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
                    $clustersObj += $obj
                    $sviClustCPU += $clusterCPUavg
                    $sviClustMEM += $clusterMEMavg
                }#end foreach cluster loop
            }# end if ako je vcentar u Italiji, onda ne radi get-stat -entity cluster i mora da se proverava po vmhostovima
        
        }#end if $everythingOK
    }
    }#end PROCESS block

    END {
        $propsCPUMEM = @{
            "vCenter"     = $vcenter
            "ClusterName" = "SVI";
            "avgCPU"      = "{0:N2}" -f ($sviClustCPU/$brojClustera) ;
            "avgMem"      = "{0:N2}" -f ($sviClustMEM/$brojClustera)
        }
        $cpuMEMobj = New-Object -TypeName psobject -Property $propsCPUMEM    
        $cpuMEMobj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
        $clustersObj += $cpuMEMobj     
        
        write-output $clustersObj | ft
       
        Disconnect-VIServer -Server $global:DefaultVIServers  -Confirm:$false
    }
} #end function get-clusterPerf

function count-BIBesxObjects {
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
Export-ModuleMember -Function * -alias *