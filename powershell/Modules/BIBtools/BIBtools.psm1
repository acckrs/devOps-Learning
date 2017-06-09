$BIBErrorLogPreference = "C:\BIB-retries.txt"
$BIBConnectionString = "server='localhost\SQLEXPRESS13';database='inventory';trusted_connection='True'"
Import-Module BIBDatabase

function Get-BIBComputerNamesFromDatabase {
    <#
        .SYNOPSIS
            Reads computer names from the BIB sample database, placing them into the pipeline as strings.
    #>
    Get-BIBDatabaseData -connectionString $BIBConnectionString `
        -isSQLServer `
        -query "SELECT computername FROM computers" 
}

function Set-BIBInventoryInDatabase {
    <#
        .SYNOPSIS
            Accepts the output of Get-BIBSystemInfo and saves the results back to the BIB sample database.
        .DESCRIPTION
            get-BIBsystemInfo retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from get-BIBSystemInfo and inserts it in database . 
        .PARAMETER inputObject
            Object created as a result of get-BIBSystemInfo cmdlet. Properties of the object include: osversion, spversion, manufacturer, model, and computername
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  June 6th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-BIBsystemInfo  | get-BIBInventoryInDatabase
        #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True)]
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
            Invoke-BIBDatabaseQuery -connection $BIBConnectionString `
                -isSQLServer `
                -query $query
        }
    }
}

function insert-BIBInventoryInDatabase {
    <#
        .SYNOPSIS
            Accepts the output of Get-BIBSystemInfo and saves the results back to the BIB sample database.
        .DESCRIPTION
            get-BIBsystemInfo retrieves computer and operating system informations using Windows Management Instrumentation (WMI) from get-BIBSystemInfo and inserts it in database . 
        .PARAMETER inputObject
            Object created as a result of get-BIBSystemInfo cmdlet. Properties of the object include: osversion, spversion, manufacturer, model, and computername
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  June 6th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-BIBsystemInfo  | get-BIBInventoryInDatabase
        #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True)]
        [object[]]$inputObject
    )
    PROCESS {
        foreach ($obj in $inputobject) {
            $query = "INSERT INTO computers
                            (osversion,spversion,manufacturer,model,computername) 
                            VALUES ('$($obj.osversion)','$($obj.spversion)','$($obj.manufacturer)','$($obj.model)','$($obj.computername)')"
            Write-Verbose "Query will be $query"
            Invoke-BIBDatabaseQuery -connection $BIBConnectionString `
                -isSQLServer `
                -query $query
        }
    }
}


function get-BIBsystemInfo {
    <#
        .SYNOPSIS
            get-BIBsystemInfo retrieves info about computers from WMI
        .DESCRIPTION
            get-BIBsystemInfo retrieves computer and operating system informations using Windows Management Instrumentation (WMI). 
            Enter IP address or name of computers to query
        .PARAMETER ComputerName
            Name or IP address of computer 
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
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
            get-content names.txt | get-BIBsystemInfo 
        .EXAMPLE
            get-BIBsystemInfo -computerName computer1,computer2 -errorLog c:\errors.txt 
        #>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Computer name or IP address")] 
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = $BIBErrorLogPreference,
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
                $obj.PSObject.TypeNames.Insert(0, 'BIB.ComputerSystemInfo')
                Write-Output $obj
            } #end check if $everythingOK
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending get-computerData" 
    }
}

function get-BIBdriveSpec {
    <#
        .SYNOPSIS
            get-BIBdriveSpec retrieves info ahrd drives from computers using WMI
        .DESCRIPTION
            get-BIBdriveSpec retrieves info about computers' harddrive(s) including their names, capacity and free space size.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
        .PARAMETER ErrorLog
            Name (and path) of error log file/ Default is c:\ACCA\errorsDrives.log
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
            get-content names.txt | get-BIBdriveSpec 
        .EXAMPLE
            get-BIBdriveSpec -computerName computer1,computer2 
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
                    $obj = New-Object -TypeName psobject -Property $Props
                    $obj.PSObject.TypeNames.insert(0, "BIB.DiskInfo")                    
                    Write-Output $obj
                } # end foreach drive loop
            } # check allOK
        }# end foreach computer loop
    } # end PROCESS block

    END {
        write-verbose "Endind get-volumeData info"
    }
    
} # end function get-BIBdriveSpec()

function get-BIBrunningServicesProc {
    <#
        .SYNOPSIS
            get-BIBrunningServicesProc retrieves info about running services and their matching processes using WMI
        .DESCRIPTION
            get-BIBrunningServicesProc retrieves running services and their matching processes information using Windows Management Instrumentation (WMI)
            from one or more computers. Data to be shown include: ComputerName, ServiceDisplayName, ServiceName, ProcessName, ProcessID , ProcessThreadCount, ProcessVMSize and ProcessPageFile.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
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
            get-content names.txt | get-BIBrunningServicesProc 
        .EXAMPLE
            get-BIBrunningServicesProc -computerName computer1,computer2 -errorLog c:\errors.txt 
    #>


    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]] $computerName,

        [string] $errorLog = $BIBErrorLogPreference,

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
                        $now = get-date
                        "$now`:  Failed to get services from $computer. `"$($_.exception.message)`" "| out-file $errorLog -Append
                    } # check if errorLog exists. If yes, re-create it and write error msg to it
                }# check if switch for logging is turned on
            } # catch

            if ($allOK) {
                $runningServices = Get-WmiObject -ComputerName $computer -class win32_service| where -FilterScript {$_.state -eq "Running" }
                foreach ($service in $runningServices) {
                    Write-Verbose "Processing service $($service.DisplayName) from $computer"
                    $process = Get-WmiObject -Class Win32_Process | where -FilterScript {$_.processID -eq $service.ProcessID}   
                    $props = @{"computername"= $computer;
                        "ServiceDisplayName" = $service.DisplayName;
                        "ServiceName"        = $service.Name;
                        "ProcessName"        = $process.ProcessName;
                        "ProcessID"          = $process.processID;
                        "ProcessThreadCount" = $process.ThreadCount;
                        "ProcessVMSize"      = $process.Virtualsize;
                        "ProcessPageFile"    = $process.peakPageFileUsage
                    } # hash table cration for $obj properties
                    $obj = New-Object -TypeName psobject -Property $props  
                    $obj.PSObject.TypeNames.Insert(0, "BIB.ServiceProcessInfo")
                    Write-Output $obj
                } # end foreach service loop  
            } # end if allOK
        } # end foreach computer loop
    } # end PROCESS block

    END {}
} #end function get-BIBrunningServicesProc
function get-BIBRemoteSmbShare {
    <#
        .SYNOPSIS
            get-BIBRemoteSmbShare retrieves smb shares info from up to 5 computers
        .DESCRIPTION
            get-BIBRemoteSmbShare retrieves smb shares info  from up to 5 computers. WinRM has to be enabled on remote computers, and firewall shouldn't block network traffic
        .PARAMETER ComputerName
            Name or IP address of computer 
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
        .PARAMETER rrrorLog
            the path to erro log file. Default is c:\errors.txt
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 07th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content names.txt | get-BIBRemoteSmbShare 
        .EXAMPLE
           get-BIBRemoteSmbShare -computerName computer1,computer2 -errorLog c:\another\path\errors.txt 
        #>

    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [alias("hostname")]
        [validateCount(1, 5)]
        [String[]]$computerName,

        [string]$errorLog = "c:\errors.txt"
    )
    
    BEGIN {
        Write-verbose "Error log is $errorLog"
    }

    PROCESS {
        foreach ($computer in $computerName) {
            try {
                write-verbose "Getting shares from $computer"
                $everythingOk = $true
                $shares = invoke-command -ComputerName $computer -ScriptBlock {get-smbshare} -ErrorAction Stop -ev $errmsg
            }#end try
            catch {
                $time = get-date -format G
                $msg = "Failed getting system information from $computer."
                $everythingOk = $false
                Write-Warning $msg
                Write-Warning "Writing to log file: $time ERROR: $($_.exception.message)"
                if (!(test-path $errorLog)) {
                    new-item $errorLog
                    "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
                }
                else {
                    "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
                }
            }#end catch
            if ($everythingOk) {
                $shares = invoke-command -ComputerName $computer -ScriptBlock {get-smbshare} -ErrorAction Stop -ev $errmsg
                foreach ($share in $shares) {
                    $props = @{
                        "ComputerName"     = $computer;
                        "Sharename"        = $share.Name;
                        "SharePath"        = $share.path;
                        "ShareDescription" = $share.DESCRIPTION
                    }#end props splatting
                    $obj = New-Object -TypeName psobject -Property $props
                    $obj.PSObject.TypeNames.insert(0, "BIB.RemoteShareInfo")                    
                    Write-Output $obj
                }#end foreach share loop
            }#end if $everythingOK
        } #end forEach computer loop
    }#end PROCESS block

    END {}
} #end function get-BIBRemoteSmbShare

#create aliases
New-Alias -Name gBIBsys -Value get-BIBsystemInfo
New-Alias -name gBIBdrv -Value get-BIBdriveSpec
New-Alias -Name gBIBsrv -Value get-BIBrunningServicesProc
New-Alias -name gBIBrsmb -Value get-BIBRemoteSmbShare

Export-ModuleMember -Function * -alias *