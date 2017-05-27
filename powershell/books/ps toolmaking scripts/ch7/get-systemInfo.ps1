function get-systemInfo {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = "C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt"

    )
    BEGIN {
        Write-Verbose "Error log will be $errorLog"
    }
    PROCESS {
        
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
                "Workgroup"=$comp.Workgroup;
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
            Write-Verbose "end\"

        }
    }
    END {}
}
get-systemInfo  -errorLog "c:\acca\errorLog.txt" -hostname localhost -verbose