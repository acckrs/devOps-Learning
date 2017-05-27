function get-systemInfo {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Computer name or IP address")] 
        [validateCount(1, 10)]
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = "C:\acca\githubRepos\devOps-Learning\powershell\books\ps toolmaking scripts\ch7\errorLog.txt",
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
        Write-Verbose "Ending get-computerData" 
    }
}
"localhost" | get-systemInfo   -verbose 