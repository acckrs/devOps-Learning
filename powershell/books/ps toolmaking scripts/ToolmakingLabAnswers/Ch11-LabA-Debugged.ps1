Function Get-ServiceInfo {
    [cmdletbinding()]
    Param([string]$Computername=$env:COMPUTERNAME)
    $services = Get-WmiObject -Class Win32_Service -computername $computername -Filter "state='running'"
    Write-Host "Found $($services.count) on $computername" –Foreground Green
    $services | sort -Property startname, name | Select  -property  `
        startname, name, startmode,systemname
}