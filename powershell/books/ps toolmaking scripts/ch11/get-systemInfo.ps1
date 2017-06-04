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

        [string] $errorLog = "C:\Acca\Errors2.txt",
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
                $msg = "Failed getting system information from $computer."
                $everythingOK = $false
                if ($logErrors) {
                    #create an error message 
                    Write-Warning $msg
                    Write-Warning "Writing to log file: $computer is not online. ERROR is: $($_.exception.message)"
                    if (!(test-path $errorLog)) {
                        new-item $errorLog
                        "$computer is not online. ERROR is: $($_.exception.message)" | Out-File $errorLog -Append
                    }
                    else {
                        "$computer is not online. ERROR is: $($_.exception.message)" | Out-File $errorLog -Append
                    }
                } # if $logErrors -eq $true
            } #catch
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
         #       $obj.PSObject.TypeNames.Insert(0,'ACCA.SystemInfo')
                Write-Output $obj
            } #end check if $everythingOK
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending get-computerData" 
    }
}
#Measure-Command {"localhost2222", "w-cs-ws234" | get-systemInfo   -verbose  -logErrors -errorLog "C:\acca\errors3.txt" }

get-systemInfo -computerName localhost
