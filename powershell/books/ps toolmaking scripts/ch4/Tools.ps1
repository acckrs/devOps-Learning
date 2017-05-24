function get-osInfo {
    param(
        [parameter(Mandatory = $true)]
        [string]$computerName = 'localhost'
    )
    Get-CimInstance -ClassName win32_operatingsystem `
        -ComputerName $computerName
} 
Function Get-DiskInfo {
    Param (
        [string]$computername = 'localhost',
        [int]$MinimumFreePercent = 10
    )
    $disks = Get-WmiObject -Class Win32_Logicaldisk -Filter "Drivetype=3"
    foreach ($disk in $disks) {
        $perFree = ($disk.FreeSpace / $disk.Size) * 100;
        if ($perFree -ge $MinimumFreePercent) {$OK = $True}
        else {$OK = $False}; $disk|Select DeviceID, VolumeName, Size, FreeSpace, `
        @{Name = "OK"; Expression = {$OK}}
    }
}

Get-DiskInfo
#get-osInfo -computerName 'FC2DEVCRISPWEB2'