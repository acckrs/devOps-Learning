function get-systemInfo {
        
    <#
        .SYNOPSIS
            get-systemInfo retrieves info about up to 10 computers from WMI
        .DESCRIPTION
            get-systemINfo retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from one to ten pcs. 
            Enter IP address or name of computers to query
        .PARAMETER ComputerName
            Name or IP address of computer (maximum 10)
        .PARAMETER errorLog
            The path to error log. Default is C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt
        .PARAMETER logError
            Switch parameter to log or not to log errors. If not specified, default is not to log (false)
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
            get-content names.txt | get-systemInfo 
        .EXAMPLE
            get-systemInfo -computerName computer1,computer2 -errorLog c:\errors.txt 
        #>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Computer name or IP address")] 
        [validateCount(1, 10)]
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = "C:\Users\Acca\Documents\GitHub\devOps-Learning\powershell\books\ps toolmaking scripts\ch8\errorLog.txt",
        [switch] $logErrors
    )
    BEGIN {
        Write-Verbose "BEGIN block: Error log will be $errorLog"
    }
    PROCESS {
        Write-Verbose "Starting Get-ComputerData"
        foreach ($computer in $computerName) {
            Write-Verbose "Getting data from $computer"
            Write-Verbose "Win32_ComputerSystem"
            try {
                $everythingOK = $True
                $os = Get-WmiObject -Class win32_operatingSystem -ComputerName $computer -ErrorAction Stop -ev err
            }
            catch {
                Write-Warning "$computer failed"
                $everythingOK = $false
                if ($logErrors) {
                    Write-Warning "Writing to log file"
                    "$computer is not online. ERROR is: $err" | Out-File $errorLog -Append
                }
            }
            if ($everythingOK) {
                $comp = Get-WmiObject -Class win32_computerSystem -ComputerName $computer
                Write-Verbose "Win32_OperatingSystem"
                $os = Get-WmiObject -Class win32_operatingSystem -ComputerName $computer
                Write-Verbose "Win32_BIOS"
                $bios = Get-WmiObject -Class win32_BIOS -ComputerName $computer

                switch ($comp.AdminPasswordStatus) {
                    0 { $admPasswordStatus = "Disabled" }
                    2 { $admPasswordStatus = "Enabled" }
                    3 { $admPasswordStatus = "NA" }
                    4 { $admPasswordStatus = "Unknown" }
                } #end switch statement

                $props = @{'ComputerName'= $computer;
                    "Workgroup"          = $comp.Workgroup;
                    "Domain"             = $comp.Domain;
                    'OSVersion'          = $os.version;
                    'SPVersion'          = $os.servicepackmajorversion;
                    'BIOSserial'         = $bios.serialNumber;
                    'Manufacturer'       = $comp.manufacturer;
                    'Model'              = $comp.model;
                    'AdminPaswordStatus' = $admPasswordStatus
                } #end hash table for properties
                Write-Verbose "WMI queries complete"

                $obj = New-Object -TypeName psobject -Property $props
                Write-Output $obj
            } #end check if $everythingOK
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending get-computerData" 
    }
}
"localhost2" | get-systemInfo   -verbose  -logErrors 
