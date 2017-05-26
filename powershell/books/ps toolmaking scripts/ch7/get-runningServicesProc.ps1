function get-runningServicesProc {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [string[]] $computerName,

        [string] $errorLog = "C:\Acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\error.txt"
    )
    BEGIN {}

    PROCESS {
        foreach ($computer in $computerName) {
            $runningServices = Get-WmiObject -ComputerName $computer -class win32_service| where -FilterScript {$_.state -eq "Running" }
            foreach ($service in $runningServices) {
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

get-runningServicesProc -computerName localhost
