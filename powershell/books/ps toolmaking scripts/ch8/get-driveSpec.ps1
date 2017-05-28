function get-driveSpec {

     <#
        .SYNOPSIS
            get-driveSpec retrieves info ahrd drives from computers using WMI
        .DESCRIPTION
            get-systemINfo retrieves info about computers' harddrive(s) including their names, capacity and free space size.
        .PARAMETER ComputerName
            Name(s) or IP address(es) of computer(s) to query
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
        [string[]] $computername
    )

    BEGIN {
        Write-Verbose "Starting get-VolumeData"
    }

    PROCESS {
        foreach ($computer in $computername) {
            write-verbose "Getting data from $computerName"
            $drives = Get-WmiObject -Class win32_volume -ComputerName $computer | Where-Object -FilterScript {$_.driveType -eq 3}
            foreach ($drive in $drives) {
                Write-Verbose "Processing volume $($drive.name)"
                $Props = @{ "ComputerName" = $computer;
                    "Drive"                = $drive.name;
                    "Size"                 = [math]::round($drive.Capacity / 1GB, 2);
                    "FreeSize"             = [math]::round($drive.FreeSpace / 1GB, 2)

                }
                New-Object -TypeName psobject -Property $Props
                Write-Output $obj
            }
        }
    }

    END {
        write-verbose "Endind get-volumeData info"
    }
    
}
get-help get-driveSpec -full