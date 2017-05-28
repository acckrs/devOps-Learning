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
            The path to error log. Default is C:\acca\errorServicesLog.txt
        .PARAMETER logErrors
            Switch parameter to indicate wheter tio log erross or not. If ommited, defaults to disabled logging 
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

        [string] $errorLog = "C:\Acca\errorServicesLog.txt",

        [switch] $logErrors
    )
    BEGIN {
        Write-Verbose "Starting get-serviceInfo" 
    }

    PROCESS {
        foreach ($computer in $computerName) {
            Write-Verbose "Getting services from $computer"
            try {
                $allOK = $true
                $runningServices = Get-WmiObject -ComputerName $computer -class win32_service -ea stop
            }
            catch {
                $allOK = $false
                Write-Warning "Failed to get services from $computer"
                if ($logErrors) {
                    if (test-path $errorLog) {
                        Write-Warning "Deleting old $errorLog!"
                        rm $errorLog -Force
                        write-verbose "Creating new error log at $errorLog"
                        new-item $errorLog 
                        Write-Warning "Writing error `"$($_.exception.message)`" to $errorLog" 
                        $now=get-date
                        "$now`:  Failed to get services from $computer. `"$($_.exception.message)`" "| out-file $errorLog -Append
                    } # check if errorLog exists. If yes, re-create it and write error msg to it
                }# check if switch for logging is turned on
            } # catch

            if ($allOK) {
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
                    } # hash table cration for $obj properties
                    $obj = New-Object -TypeName psobject -Property $props  
                    Write-Output $obj
                } # end foreach service loop  
            } # end if allOK
        } # end foreach computer loop
    } # end PROCESS block

    END {}

}

"localhost2","localhost" | get-runningServicesProc -verbose -logErrors | select -first 3