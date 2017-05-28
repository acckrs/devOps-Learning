function get-runningServicesProc {
    
      <#
        .SYNOPSIS
            get-runninServicesProc retrieves info about running services and their matching processes using WMI
        .DESCRIPTION
            get-systemInfo retrieves running services and their matching processes information using Windows Management Instrumentation (WMI)
            from one or more computers. Data to be shown include: ComputerName, ServiceDisplayName, ServiceName, ProcessName, ProcessID , ProcessThreadCount, ProcessVMSize and ProcessPageFile.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
        .PARAMETER errorLog
            The path to error log. Default is C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt
        .INPUTS
            None
        .OUTPUTS
             Log file stored in $errorLog
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 25th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content names.txt | get-runningServicesProc 
        .EXAMPLE
            get-runningServiceProc -computerName computer1,computer2 -errorLog c:\errors.txt 
    #>


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

get-help get-runningServiceProc -Full