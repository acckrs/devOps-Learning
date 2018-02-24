
$3par_full_str = Get-Content .\3par.txt

$3parvalues_rows = $3par_full_str|Select-Object -Skip 3 
$3parOut=@()
foreach($3parvalues_row in $3parvalues_rows){
    $3parvalues_row_array=$3parvalues_row -split '\s+' 
    $props_hash = @{}
    for ($i = 0; $i -lt $3parvalues_row_array.Count; $i++) {
        $prop_name = "Prop " + "$i"
        $props = @{
            "$prop_name" = $3parvalues_row_array[$i];
        }
        $props_hash += $props
    }
    $obj = New-Object -TypeName PSObject -Property $props_hash
    $3parOut+=$obj
}

$templateWinDiskInfo = @'
Size        : {Size*:1073738674176}
Disk        : {Disk:\\.\PHYSICALDRIVE1}
DriveLetter : {DriveLetter:F:}
RawSize     : 1073738678272
VolumeName  : F_new
FreeSpace   : 543734018048
DiskModel   : 3PARdata VV  Multi-Path Disk Device
DiskSize    : 1073736276480
Partition   : Disk #1, Partition #0

Size        : {Size*:1181112856576}
Disk        : {Disk:\\.\PHYSICALDRIVE2}
DriveLetter : {DriveLetter:G:}
RawSize     : 1181112860672
VolumeName  : G_new
FreeSpace   : 125851123712
DiskModel   : 3PARdata VV  Multi-Path Disk Device
DiskSize    : 1181109081600
Partition   : Disk #2, Partition #0
'@

$slova = Get-Content .\associate.txt| ConvertFrom-String -TemplateContent $templateWinDiskInfo

foreach ($d in $3parOut) {
    foreach ($slovo in $slova) {
        if ($d.PhysicalDrive -eq $slovo.Disk) {
            $props = @{
                "DriveLetter" = $slovo.DriveLetter;
                "VVName"      = $d.VVName;
                "Disk"        = $slovo.Disk
            }
            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj
        }
    }
}


