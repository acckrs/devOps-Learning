function get-driveSpec {

    <#
        .SYNOPSIS
            get-driveSpec retrieves info ahrd drives from computers using WMI
        .DESCRIPTION
            get-systemINfo retrieves info about computers' harddrive(s) including their names, capacity and free space size.
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
            get-content names.txt | get-driveSpec 
        .EXAMPLE
            get-driveSpec -computerName computer1,computer2 
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
    
}

Update-FormatData -PrependPath "C:\Users\Acca\Documents\GitHub\devOps-Learning\powershell\books\ps toolmaking scripts\customViews\CustomViewB.format.ps1xml"
get-driveSpec -computername localhost