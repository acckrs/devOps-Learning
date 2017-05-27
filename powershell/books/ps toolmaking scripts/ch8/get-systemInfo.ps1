function get-systemInfo {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
            [validateCount(1,0)]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = "C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt"

    )
    BEGIN {
        Write-Verbose "BEGIN block: Error log will be $errorLog"
    }
    PROCESS {
        Write-Verbose "Beginning PROCESS block"
        foreach ($computer in $computerName) {
            Write-Verbose "Begin querying WMI from $computer for computer info"
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
                "Workgroup"          = $comp.Workgroup;
                "Domain"             = $comp.Domain;
                'OSVersion'          = $os.version;
                'SPVersion'          = $os.servicepackmajorversion;
                'BIOSserial'         = $bios.serialNumber;
                'Manufacturer'       = $comp.manufacturer;
                'Model'              = $comp.model;
                'AdminPaswordStatus' = $admPasswordStatus
            }
            Write-Verbose "WMI queries complete"

            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj

        }
    }
    END {
        Write-Verbose "END block"
    }
}
get-systemInfo -hostname localhost, 'ict-211-0205' -verbose