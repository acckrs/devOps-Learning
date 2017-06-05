[cmdletbinding(DefaultParameterSetName = 'filter')]
    param 
    ( 
        [ValidateSet('minutes','hours','days','months')]
        [string] $unit,
        [switch] $whatIf,
        [string] $logName,
        [string] $logPath = (Split-Path $MyInvocation.MyCommand.Path), 
        [int] $Interval,
        [string] $PathForCleaning,
        [Parameter(ParameterSetName='filter')]
        [string] $Filter,
        [Parameter(ParameterSetName='include')]
        [string] $IncludeRecurse
         
    )
    if (!(Test-Path $logPath))
    {
        mkdir $logPath
    }
    if ($logName -notmatch "\.log$")
    {
        $logName += ".log" 
    }
    $logFullName = Join-Path $logPath $logName
    Write-Verbose "Logname: $logName"
    Write-Verbose "Logpath: $logPath"
    Write-Verbose "LogFullName: $logFullName"

    Set-Content $logFullName -Value (Get-Date)

    if (!(Test-Path $logFullName))
    {        
        New-Item -Path $logPath -Name $logName -ItemType File
    }
    
    
    $DirParams = New-Object hashtable
    $rmParams = New-Object hashtable

    $newDate = 
    switch ($unit)
    {
        "days" { (Get-Date).AddDays(-$Interval) }
        "months" { (Get-Date).AddMonths(-$Interval) }
        "minutes" { (Get-Date).AddMinutes(-$Interval) }
        "hours" { (Get-Date).AddHours(-$Interval) } 

    }
    
    Write-Verbose $newDate 
    switch ($PSBoundParameters.Keys)
    {
         "filter" { $DirParams.Filter = $Filter }  
         "whatif" { $rmParams.whatif = $true }
         "PathForCleaning" { $DirParams.path = $PathForCleaning } 
         "IncludeRecurse" { $DirParams.include = $IncludeRecurse ; $DirParams.recurse = $true }
    }
    
    Write-Verbose (([pscustomobject] $DirParams) | Out-String)
    Write-Verbose (([pscustomobject] $rmParams)  | Out-String)
    
    Start-Transcript -Path (Join-Path $logPath $logName) 
    
    dir @DirParams | ? {$_.LastWriteTime -lt $newDate } | rm -Force -Verbose @rmParams

    Stop-Transcript 
    
     
