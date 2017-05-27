function get-runningServicesProc {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
            [ValidateNotNullOrEmpty()]
        [string[]] $computerName,

        [string] $errorLog = "C:\Acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\error.txt"
    )
    BEGIN {
        Write-Verbose "Starting get-serviceInfo" 
    }

    PROCESS {
        foreach ($computer in $computerName) {
            Write-Verbose "Getting services from $computer"
            $runningServices = Get-WmiObject -ComputerName $computer -class win32_service| where -FilterScript {$_.state -eq "Running" }
            foreach ($service in $runningServices) {
                Write-Verbose "Processing service $($service.DisplayName) from $computer"
                $process = Get-WmiObject -Class Win32_Process | where -FilterScript {$_.processID -eq $service.ProcessID}   
                $props = @{"ComputerName"= $computer;
                    "ServiceDisplayName" = $service.DisplayName;
                    "ServiceName"        = $service.Name;
                    "ProcessName"        = $process.ProcessName;
                    "ProcessID"          = $process.processID;
                    "ProcessThreadCount" = $process.ThreadCount;
                    "ProcessVMSize"      = $process.Virtualsize;
                    "ProcessPageFile"    = $process.peakPageFileUsage


                } 
                $obj = New-Object -TypeName psobject -Property $props  
                Write-Output $obj   
            }
        }
    }

    END {}

}

"ict-211-0205" | get-runningServicesProc -Verbose | select -First 6

