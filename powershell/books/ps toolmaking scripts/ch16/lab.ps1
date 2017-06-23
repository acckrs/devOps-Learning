function Set-ComputerState {
    [cmdletbinding(SupportsShouldProcess = $true)]

    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [String[]] $ComputerName,

        [ValidateSet("LogOff", "Restart", "ShutDown", "PowerOff")]
        [String] $Action,

        [Switch] $Force
    )
    switch ($Action) {
        "LogOff" {$ShutDownAction = 0}
        "ShutDown" {$ShutDownAction = 1}
        "Restart" {$ShutDownAction = 2}
        "PowerOff" {$ShutDownAction = 8}
    }
    write-verbose $ShutDownAction
    foreach ($computer in $ComputerName) {
        if ($Force) {
            $ShutDownAction = $ShutDownAction + 4
        }
        $c = get-wmiObject -Class win32_OperatingSystem  -ComputerName $computer  
        if ($PSCmdlet.ShouldProcess($computer)) {      
                $c.Win32Shutdown("$ShutDownAction")
             }
        }
        
    }
    Set-ComputerState -ComputerName localhost -Action LogOff -WhatIf -Verbose