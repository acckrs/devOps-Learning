function Get-StatReference {
    <#
    .SYNOPSIS
    Creates an HTML reference of all the available metrics
    .DESCRIPTION
    The function returns a simple HTML page which contains all the
    available metrics in the environment where you are connected.
    .EXAMPLE
    Get-StatReference | Out-File "$env:temp\metricRef.html"
    #>
    Begin {
        # In API 4.0 there is a bug.
        # There are 4 duplicate metrics that only differ in the case
        # These are excluded with the -notcontains condition
        $badMetrics = 'mem.reservedcapacity.average',
        'cpu.reservedcapacity.average',
        'managementAgent.swapin.average',
        'managementAgent.swapout.average'
        $si = Get-View ServiceInstance
        $perfMgr = Get-View $si.content.perfManager
    }
    Process {
        # Create performance counter hashtables
        $metricRef = foreach ($pC in $perfMgr.PerfCounter) {
            if ($pC.Level -ne 99) {
                $pKeyComponents = $pC.GroupInfo.Key,
                $pC.NameInfo.Key,
                $pC.RollupType
                $pCKey = $pKeyComponents -join '.'
                if ($badMetrics -notcontains $pCKey) {
                    $pCKey = $pCKey.ToLower()
                    New-Object PSObject -Property @{
                        Metric      = $PCKey
                        Level       = $pC.Level
                        Unit        = $pC.UnitInfo.Label
                        Description = $pC.NameInfo.Summary
                    }
                }
            }
        }
    }
    End {
        $metricRef | Sort-Object -Property Metric | `
            ConvertTo-Html -Property Metric, Level, Unit, Description
    }
}

Get-StatReference |out-file metricref.html