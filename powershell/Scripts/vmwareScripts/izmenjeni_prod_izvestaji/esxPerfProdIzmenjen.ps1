
[cmdletbinding()]

param 
(
    [string] $ReportPath
)



Connect-VIServer -Server "be-vce-bib.fbisp.eu" -Credential (Get-Credential "spimi\") -ea Stop
Connect-VIServer -Server "bib-vcentar-01.deltabank.co.yu" -Credential (Get-Credential) -ea Stop


$today = (Get-Date).Date
$lastDayOfMonth = $today.AddDays( - $today.Day)
$firstDayOfMonth = $lastDayOfMonth.AddDays( - $lastDayOfMonth.Day + 1)
$clusterSum = New-Object System.Collections.ArrayList 
$clusters = "CITRIX-PR", "CITRIX-ST", "TYPE2", "FLEX-PR","SATELITTE-ST"

Write-Progress -Activity "Getting counters" -Status "..." -PercentComplete (3 / 5 * 100) -Id 1

foreach ($clus in $clusters) {
    $CitrixSTMem = 0
    $CitrixSTCPu = 0
    $vms = Get-Cluster $clus -ea SilentlyContinue | Get-VMHost  
    $ukupno = $vms.Count 
    $i = 0 
    foreach ($c in $vms) {
        if ($c.powerstate -match "on") {
    
            $memAvg = Get-Stat -Entity $c -Start $firstDayOfMonth -Finish $lastDayOfMonth -Stat mem.usage.average 
            $cpuAvg = Get-Stat -Entity $c -Start $firstDayOfMonth -Finish $lastDayOfMonth -Stat cpu.usage.average 
            if ($memAvg) {
                $avgMem = ($memAvg | measure -Property value -Sum).Sum / $memAvg.count 
                #Write-Host "VM === $($c.name) AVGMem === $avgMem" -ForegroundColor Green
            }
            else {
                $avgMem = 0 
            }
            if ($cpuAvg) {
                $avgCPU = ($cpuAvg | measure -Property value -Sum).Sum / $cpuAvg.count 
                #Write-Host "VM === $($c.name) AVGCPU === $avgCPU" -ForegroundColor Green
            }
            else {
                $avgCPU = 0 
            }
    
            $CitrixSTMem += $avgMem
            $CitrixSTCPu += $avgCPU
        }
        $i ++
        Write-Progress -Activity "Vm $($c.Name)" -Status "AVGCPU === $avgCPU ; AVGMem === $avgMem" -PercentComplete ($i / $ukupno * 100) -Id 2
    
    }

    [void] $clusterSum.Add([pscustomobject] @{ ClusterName = $clus ; AVGCpu = "{0:n2}" -f ($CitrixSTCPu / $ukupno) ; AvgMem = "{0:n2}" -f ($CitrixSTMem / $ukupno)} )
    

}



Write-Progress -Status "Racunam proseke" -Activity "Proseci" -PercentComplete (4 / 5 * 100) -Id 1


$cpuMeasure = $clusterSum | measure -Sum -Property avgCpu 
$memMeasure = $clusterSum | measure -Sum -Property avgMem

[void] $clusterSum.Add( [pscustomobject] @{ ClusterName = "SVI" ; AVGCpu = "{0:n2}" -f ($cpuMeasure.Sum / $cpuMeasure.Count) ; AvgMem = "{0:n2}" -f ($memMeasure.Sum / $memMeasure.Count ) })

if ($PSBoundParameters.ContainsKey("ReportPath")) {
    $clusterSum | Export-Csv -NoTypeInformation (Join-Path $ReportPath ("vCenterPerf{0}.csv" -f (Get-Date -Format "ddMMyyyy")) )
}

$clusterSum | ft 

Write-Progress -Status "Diskonektujem se" -Activity "Disconnecting..." -PercentComplete 100 -Id 1

Disconnect-VIServer * -Confirm:$false
