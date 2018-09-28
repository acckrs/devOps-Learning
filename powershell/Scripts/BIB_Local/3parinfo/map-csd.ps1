$3par_full_str = $3par_full_str = .\HP3PARInfo.exe -i 
Remove-Item Hp3parinfo.log*
#$3par_full_str = gc .\3par.txt
$3parvalues_rows = $3par_full_str|Select-Object -Skip 3 

$3parOutTT = @()
foreach ($3parvalues_row in $3parvalues_rows) {
    $3parvalues_row_array = $3parvalues_row -split '\s+' 
    
    $obj = New-Object -TypeName PSObject
    $obj|add-member -membertype noteproperty -name Deviceid -value $3parvalues_row_array[0] 
    $obj|add-member -membertype noteproperty -name VVName -value $3parvalues_row_array[5] 
    if ($3parvalues_row_array[8] -eq "01629541") {
        $obj|add-member -membertype noteproperty -name storageUredjaj -value "3parNS"
    }
    else {
        if ($3parvalues_row_array[8] -eq "01609980") {
            $obj|add-member -membertype noteproperty -name storageUredjaj -value "3parBG"
        }  
    }

    $3parOutTT += $obj
}
    
## get data from 3 different WMI classes and join them in an  array of objects ($s)
$disks = @()
Get-WmiObject Win32_DiskDrive | ForEach-Object {
    $disk = $_
    $partitions = "ASSOCIATORS OF " +
    "{Win32_DiskDrive.DeviceID='$($disk.DeviceID)'} " +
    "WHERE AssocClass = Win32_DiskDriveToDiskPartition"
    Get-WmiObject -Query $partitions | ForEach-Object {
        $partition = $_
        $drives = "ASSOCIATORS OF " +
        "{Win32_DiskPartition.DeviceID='$($partition.DeviceID)'} " +
        "WHERE AssocClass = Win32_LogicalDiskToPartition"
        Get-WmiObject -Query $drives | ForEach-Object {
            $diskProps = @{
                Disk        = $disk.DeviceID
                Server      = $disk.systemName
                DiskModel   = $disk.Model
                Partition   = $partition.Name
                DriveLetter = $_.DeviceID
                VolumeName  = $_.VolumeName
            }
            $disks += New-Object -Type PSCustomObject -Property $diskProps
        }
    }
} 

##  Final mapping 
$oall = @()
foreach ($d in $3parOutTT) {
    foreach ($dd in $disks) {
        if ($d.Deviceid -eq $dd.Disk) {
            $props = @{
                "DriveLetter" = $dd.DriveLetter;
                "VVName"      = $d.VVName;
                "Disk"        = $dd.Disk;
                "Server"      = $dd.Server;
                "Storage"     = $d.storageUredjaj
            }
            $obj = New-Object -TypeName psobject -Property $props
            $oall += $obj
        }
    }
}
$oall
