$ACCAErrorLogPreference=C:\Acca-retries.txt
$ACCAConnectionString="server=localhost\SQLEXPRESS;database=inventory;trusted_connection=True"
Import-Module ACCADatabase

function Get-ACCAComputerNamesFromDatabase {
<#
.SYNOPSIS
Reads computer names from the ACCA sample database,
placing them into the pipeline as strings.
#>
    Get-ACCADatabaseData -connectionString $ACCAConnectionString `
                        -isSQLServer `
                        -query "SELECT computername FROM computers" 
}

function Set-ACCAInventoryInDatabase {
<#
.SYNOPSIS
Accepts the output of Get-ACCASystemInfo and saves
the results back to the ACCA sample database.
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True,
                   ValueFromPipeline=$True)]
        [object[]]$inputObject
    )
    PROCESS {
        foreach ($obj in $inputobject) {
            $query = "UPDATE computers SET
                      osversion = '$($obj.osversion)',
                      spversion = '$($obj.spversion)',
                      manufacturer = '$($obj.manufacturer)',
                      model = '$($obj.model)'
                      WHERE computername = '$($obj.computername)'"
            Write-Verbose "Query will be $query"
            Invoke-ACCADatabaseQuery -connection $ACCAConnectionString `
                                    -isSQLServer `
                                    -query $query
        }
    }
}


function get-ACCAsystemInfo {
    <#
        .SYNOPSIS
            get-ACCAsystemInfo retrieves info about up to 10 computers from WMI
        .DESCRIPTION
            get-ACCAsystemInfo retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from one to ten pcs. 
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
            get-content names.txt | get-ACCAsystemInfo 
        .EXAMPLE
            get-ACCAsystemInfo -computerName computer1,computer2 -errorLog c:\errors.txt 
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
                $obj.PSObject.TypeNames.Insert(0,'ACCA.ComputerSystemInfo')
                Write-Output $obj
            } #end check if $everythingOK
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending get-computerData" 
    }
}

function get-ACCAdriveSpec {
    <#
        .SYNOPSIS
            get-ACCAdriveSpec retrieves info ahrd drives from computers using WMI
        .DESCRIPTION
            get-ACCAdriveSpec retrieves info about computers' harddrive(s) including their names, capacity and free space size.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
        .PARAMETER ErrorLog
            Name (and path) of error log file/ Default is c:\acca\errorsDrives.log
        .INPUTS
            None
        .OUTPUTS
             None
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 25th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content names.txt | get-ACCAdriveSpec 
        .EXAMPLE
            get-ACCAdriveSpec -computerName computer1,computer2 
    #>
    [cmdletbinding()]

    param (
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $computername,

        [string] $errorLog
    )

    BEGIN {
        Write-Verbose "Starting get-VolumeData"
    }

    PROCESS {
        foreach ($computer in $computername) {
            write-verbose "Getting data from $computerName"
            try {
                $allOK = $true
                $drives = Get-WmiObject -Class win32_volume -ComputerName $computername -ea Stop -ev err 
            }
            catch {
                $allOK = $false
                write-warning "Failed getting drive info from $computer"
                if (!(test-path $errorLog)) {
                    new-item $errorLog 
                    Write-Warning "Writing error $($_.exception.message) to log file at $errorLog"
                    "$computer is not online. ERROR is: $($_.exception.message)" | out-file $errorLog -Append
                }
                else {
                    Write-Warning "Writing error `"$($_.exception.message)`" to log file at $errorLog"
                    "$computer is not online. ERROR is: $($_.exception.message)" | out-file $errorLog -Append
                }
            } #catch

            if ($allOK) {
                $drives = Get-WmiObject -Class win32_volume -ComputerName $computer | Where-Object -FilterScript {$_.driveType -eq 3}
                foreach ($drive in $drives) {
                    Write-Verbose "Processing volume $($drive.name)"
                    $Props = @{ "ComputerName" = $computer;
                        "Drive"                = $drive.name;
                        "Size"                 = [math]::round($drive.Capacity / 1GB, 2);
                        "FreeSize"             = [math]::round($drive.FreeSpace / 1GB, 2)

                    } # created hash table for $obj properties
                   $obj= New-Object -TypeName psobject -Property $Props
                    $obj.PSObject.TypeNames.insert(0,"ACCA.DiskInfo")                    
                    Write-Output $obj
                } # end foreach drive loop
            } # check allOK
        }# end foreach computer loop
    } # end PROCESS block

    END {
        write-verbose "Endind get-volumeData info"
    }
    
} # end function get-ACCAdriveSpec()

function get-ACCArunningServicesProc {
    <#
        .SYNOPSIS
            get-ACCArunningServicesProc retrieves info about running services and their matching processes using WMI
        .DESCRIPTION
            get-ACCArunningServicesProc retrieves running services and their matching processes information using Windows Management Instrumentation (WMI)
            from one or more computers. Data to be shown include: ComputerName, ServiceDisplayName, ServiceName, ProcessName, ProcessID , ProcessThreadCount, ProcessVMSize and ProcessPageFile.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
        .PARAMETER errorLog
            The path to error log. Default is C:\acca\errorServicesLog.txt
        .PARAMETER logErrors
            Switch parameter to indicate wheter to log erross or not. If ommited, defaults to disabled logging 
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
            get-content names.txt | get-ACCArunningServicesProc 
        .EXAMPLE
            get-ACCArunningServicesProc -computerName computer1,computer2 -errorLog c:\errors.txt 
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
                    $obj.PSObject.TypeNames.Insert(0,"ACCA.ServiceProcessInfo")
                    Write-Output $obj
                } # end foreach service loop  
            } # end if allOK
        } # end foreach computer loop
    } # end PROCESS block

    END {}
} #end function get-ACCArunningServicesProc

#create aliases
New-Alias -Name gACCsys -Value get-ACCAsystemInfo
New-Alias -name gACCdrv -Value get-ACCAdriveSpec
New-Alias -Name gACCsrv -Value get-ACCArunningServicesProc


Export-ModuleMember -Function * -alias *