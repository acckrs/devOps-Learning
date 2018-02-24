## get data from 3 different WMI classes and join them in an  array of objects ($s)
$s = @()
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
                DiskModel   = $disk.Model
                Partition   = $partition.Name
                DriveLetter = $_.DeviceID
                VolumeName  = $_.VolumeName
            }
            $s += New-Object -Type PSCustomObject -Property $diskProps
        }
    }
}

## Define template for 3parinfo output parsing   
$template3parInfo = @'
Device File Name                         Size [MB]       Tgt       Lun                               LUN WWN                             VV Name          Code Rev     Serial#
==============================================================================================================================================================================
{PhysicalDrive*:\\\.\PhysicalDrive8}                           10240        00        {Lun:07}      {WWN:60002ac00000000000000090000026fc}                        {VVName:VaultMSMQ-EV}         3.1.2 MU3    01609980
{PhysicalDrive*:\\\.\PhysicalDrive9}                            1024        00        {Lun:08}     {WWN:60002ac00000000000000091000026fc}                           {VVName:VaultQ-EV}         3.1.2 MU3    01609980
{PhysicalDrive*:\\\.\PhysicalDrive10}                        1048576        00        {Lun:09}      {WWN:60002ac000000000000000a1000026fc}                        {VVName:VaultStoreD}         3.1.2 MU3    01609980
{PhysicalDrive*:\\\.\PhysicalDrive11}                        2097152        01        {Lun:0a}      {WWN:60002ac000000000000000cb000026fc}                         {VVName:VaultStoreE}         3.1.2 MU3    01609980
'@
##  Apply template and create array of objects from 3par 
$3parOut = Get-Content .\3par.txt | ConvertFrom-String -TemplateContent $template3parInfo 

##  Final mapping 
$oall = @()
foreach ($d in $3parOut) {
    foreach ($slovo in $s) {
        if ($d.PhysicalDrive -eq $slovo.Disk) {
            $props = @{
                "DriveLetter" = $slovo.DriveLetter;
                "VVName"      = $d.VVName;
                "Disk"        = $slovo.Disk
            }
            $obj = New-Object -TypeName psobject -Property $props
            $oall += $obj
        }
    }
}
$oall
