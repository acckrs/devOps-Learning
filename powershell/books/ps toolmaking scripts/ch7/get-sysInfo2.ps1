function get-sysInfo2 {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [string[]] $computerName
    )

    BEGIN {}

    PROCESS {
        foreach ($computer in $ComputerName) {
            $os = Get-WmiObject -Class win32_operatingSystem -ComputerName $Computer
            $comp = Get-WmiObject -Class win32_computerSystem -ComputerName $Computer

            $props=@{"ComputerName"=$computer;
                        "Model"=$comp.Model;
                        "Manufacturer"=$comp.Manufacturer;
                        "OSVersion"=$os.Version;
                        "LastBootTime"=$os.convertToDateTime($os.lastBootUpTime);
                        "InstallDate"=$os.convertToDateTime($os.InstallDate)}
            
            $obj=New-Object -TypeName psobject -Property $props
            Write-Output $obj
        }
    }

    END {}
}
get-sysInfo2 -computerName localhost