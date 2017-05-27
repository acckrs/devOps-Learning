function get-driveSpec {
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
"localhost" | get-driveSpec -verbose