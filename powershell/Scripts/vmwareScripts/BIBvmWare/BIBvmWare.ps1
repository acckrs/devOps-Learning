$BIBvmwareErrors = "C:\errors.txt"
function get-BIBclusterPerf {
    [cmdletbinding()]
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
        [Parameter(Mandatory = $true)]
        [alias("vc")]
        [String]$vCenter,

        [string]$errorLog = $BIBvmwareErrors
    )
    
    BEGIN {
        $today = (Get-Date).Date
        $lastDayOfMonth = $today.AddDays( - $today.Day)
        $firstDayOfMonth = $lastDayOfMonth.AddDays( - $lastDayOfMonth.Day + 1)

        Write-verbose "Error log is $errorLog"
        write-verbose "Connecting to vCenter $vcenter"

        $clusterCPUsumSUM = 0
        $clusterMEMsumSUM = 0

        try {
            $everythingOk = $true
            connect-viserver $vcenter -ErrorAction Stop -ev $errmsg
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
         
    } #end BEGIN block

    PROCESS {
        
        if ($everythingOk) {
            $clusters = VMware.VimAutomation.Core\Get-Cluster 
            $brojClustera = $clusters.count 
            $clustersObj = @()
            write-verbose "getting stats for period from  $firstDayOfMonth to  $lastDayOfMonth"
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
                $sviClustCPU+=$clusterCPUavg
                $sviClustMEM+=$clusterMEMavg
            }#end foreach cluster loop
        
        }#end if $everythingOK
    }#end PROCESS block

    END {
        $propsCPUMEM = @{
            "vCenter"     = $vcenter
            "ClusterName" = "SVI";
            "avgCPU"      = "{0:N2}" -f ($sviClustCPU / $brojClustera) ;
            "avgMem"      = "{0:N2}" -f ($sviClustMEM / $brojClustera)
        }
        $cpuMEMobj = New-Object -TypeName psobject -Property $propsCPUMEM    
        $cpuMEMobj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
        $clustersObj += $cpuMEMobj     
        
        write-output $clustersObj | ft
       
        disconnect-viserver -Server $vCenter -Confirm:$true
    }
} #end function get-clusterPerf
Update-FormatData -PrependPath .\BIBvmWare.format.ps1xml    
get-BIBclusterPerf -vCenter "bib-vcentar-01" -Verbose

