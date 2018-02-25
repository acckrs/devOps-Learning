# Kreiram niz imena propertija
$prop_names = @("DeviceID", "SizeMB", "Tgt", "Lun", "WWN", "VVName", "Code", "Rev", "Serial")
# Pripremam 3par output
$3par_full_str = Get-Content .\3par.txt
$3parvalues_rows = $3par_full_str|Select-Object -Skip 3 

$3parOutTT = @() #inicijalizujem niz objekata 
foreach ($3parvalues_row in $3parvalues_rows) {
    # Kreiram niz vrednosti iz jednog reda - razdvojene su spejsom
    $3parvalues_row_array = $3parvalues_row -split '\s+' 
    
    $obj = New-Object -TypeName PSObject
    for ($i = 0; $i -lt $3parvalues_row_array.Count; $i++) {
        $prop_name = $prop_names[$i]
        $obj|add-member -membertype noteproperty -name $prop_names[$i] -value $3parvalues_row_array[$i] 
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
                DiskModel   = $disk.Model
                Partition   = $partition.Name
                DriveLetter = $_.DeviceID
                VolumeName  = $_.VolumeName
            }
            $disks += New-Object -Type PSCustomObject -Property $diskProps
        }
    }
}
<# ## Define template for 3parinfo output parsing ---  use if WMF > 5

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
#>

##  Final mapping 
$oall = @()
foreach ($d in $3parOutTT) {
    foreach ($dd in $disks) {
        if ($d.Deviceid -eq $dd.Disk) {
            $props = @{
                "DriveLetter" = $dd.DriveLetter;
                "VVName"      = $d.VVName;
                "Disk"        = $dd.Disk
            }
            $obj = New-Object -TypeName psobject -Property $props
            $oall += $obj
        }
    }
}
$oall
