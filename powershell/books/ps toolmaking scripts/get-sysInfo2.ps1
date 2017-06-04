function Get-SystemInfo {
          <#
        .SYNOPSIS
            get-sysInfo2 retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from computers. 
        .DESCRIPTION
            get-sysInfo2 retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from computers. 
            It displays last bootUp time, name, model, manufacturer and operating system version
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
            get-content names.txt | get-sysInfo2
        .EXAMPLE
            get-sysInfo2 -computerName computer1,computer2 -errorLog c:\errors.txt 
    #>
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$ComputerName
    )
    PROCESS {
        foreach ($computer in $computerName) {
            write-verbose "Getting WMI data from $computer"
            $os = Get-WmiObject -class Win32_OperatingSystem `
                -computerName $computer
            $cs = Get-WmiObject -class Win32_ComputerSystem `
                -computerName $computer
            $props = @{'ComputerName' = $computer;
                'LastBootTime'        = ($os.ConvertToDateTime($os.LastBootupTime));
                 'InstallTime'        = ($os.ConvertToDateTime($os.Installdate));
                'OSVersion'           = $os.version;
                'Manufacturer'        = $cs.manufacturer;
                'Model'               = $cs.model
            }
            $obj = New-Object -TypeName PSObject -Property $props
            Write-Output $obj
        }
    }
}
Get-SystemInfo -computerName fc1iibsql