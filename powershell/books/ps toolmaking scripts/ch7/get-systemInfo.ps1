function get-systemInfo {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        [string[]] $computerName,

        [string] $errorLog = "C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt"

    )
    BEGIN {}
    PROCESS {
        foreach ($computer in $computerName) {
            $os = Get-WmiObject -Class win32_operatingSystem -ComputerName $computer
            $comp = Get-WmiObject -Class win32_computerSystem -ComputerName $computer
            $bios = Get-WmiObject -Class win32_BIOS -ComputerName $computer

            switch ($comp.AdminPasswordStatus) {
                0 { $admPasswordStatus = "Disabled" }
                2 { $admPasswordStatus = "Enabled" }
                3 { $admPasswordStatus = "NA" }
                4 { $admPasswordStatus = "Unknown" }
            }

            $props = @{'ComputerName'= $computer;
                'OSVersion'          = $os.version;
                'SPVersion'          = $os.servicepackmajorversion;
                'BIOSserial'         = $bios.serialNumber;
                'Manufacturer'       = $comp.manufacturer;
                'Model'              = $comp.model;
                'AdminPaswordStatus' = $admPasswordStatus
            }

            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj

        }
    }
    END {}
}
get-systemInfo  -errorLog "c:\acca\errorLog.txt"