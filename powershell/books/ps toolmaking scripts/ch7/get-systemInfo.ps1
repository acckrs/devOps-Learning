function get-systemInfo {
    [cmdletbinding()]
    param(
        [string[]] $computerName,

        [string] $errorLog
    )
    BEGIN {}
    PROCESS {
        foreach ($computer in $computerName) {
            $os = Get-WmiObject -Class win32_operatingSystem -ComputerName $computer
            $comp = Get-WmiObject -Class win32_computerSystem -ComputerName $computer
            $bios = Get-WmiObject -Class win32_BIOS -ComputerName $computer

            $props = @{'ComputerName' = $computer;
                'OSVersion'           = $os.version;
                'SPVersion'           = $os.servicepackmajorversion;
                'BIOSserial'          = $bios.serialNumber;
                'Manufacturer'        = $comp.manufacturer;
                'Model'               = $comp.model
            }

            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj

        }
    }
    END {}
}
get-systemInfo -computerName ict-211-4723, ict-211-5888 -errorLog "c:\acca\errorLog.txt"