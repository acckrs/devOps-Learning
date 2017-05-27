function get-driveSpec {
    [cmdletbinding()]
    param (
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true
        )]

        [string[]] $computername
    )

    BEGIN {
    }

    PROCESS {
        foreach ($computer in $computername) {
            $drives = Get-WmiObject -Class win32_volume -ComputerName $computer | Where-Object -FilterScript {$_.driveType -eq 3}
            foreach ($drive in $drives) {
                $Props = @{ "ComputerName" = $computer;
                            "Drive" = $drive.name;
                            "Size" = [math]::round($drive.Capacity/1GB,2);
                            "FreeSize"=[math]::round($drive.FreeSpace/1GB,2)

                }
                New-Object -TypeName psobject -Property $Props
                Write-Output $obj
            }
        }
    }

    END {}
    
}
get-driveSpec -computername w-cs-ws234