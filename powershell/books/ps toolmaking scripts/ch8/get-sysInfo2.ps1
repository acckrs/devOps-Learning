function Get-SystemInfo {
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$ComputerName
    )
    PROCESS {
        foreach ($computer in $computerName) {
            write-verbose "Getting WMI data from $computer"
            $os = Get-WmiObject -class Win32_OperatingSystem `
                -computerName $computer
            $cs = Get-WmiObject -class Win32_ComputerSystem `
                -computerName $computer
            $props = @{'ComputerName' = $computer;
                'LastBootTime'        = ($os.ConvertToDateTime($os.LastBootupTime));
                'OSVersion'           = $os.version;
                'Manufacturer'        = $cs.manufacturer;
                'Model'               = $cs.model
            }
            $obj = New-Object -TypeName PSObject -Property $props
            Write-Output $obj
        }
    }
}
"localhost","ict-211-0205" | Get-SystemInfo -Verbose