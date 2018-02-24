
$3par_full_str = Get-Content .\3par.txt

$3parvalues_rows = $3par_full_str|Select-Object -Skip 3 
$all=@()
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
    $all+=$obj
    
}
$all



$templateWinDiskInfo=@'


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
DriveLetter : G:
RawSize     : 1181112860672
VolumeName  : G_new
FreeSpace   : 125851123712
DiskModel   : 3PARdata VV  Multi-Path Disk Device
DiskSize    : 1181109081600
Partition   : Disk #2, Partition #0
'@


Get-Content .\associate.txt| ConvertFrom-String -TemplateContent $templateWinDiskInfo -OutVariable slova |Out-Null
$slova|measure

$template3parInfo=@'
Device File Name                         Size [MB]       Tgt       Lun                               LUN WWN                             VV Name          Code Rev     Serial#
==============================================================================================================================================================================
{PhysicalDrive*:\\.\PhysicalDrive8}                           10240        00        {Lun:07}      {WWN:60002ac00000000000000090000026fc}                        {VVName:VaultMSMQ-EV}         3.1.2 MU3    01609980
{PhysicalDrive*:\\.\PhysicalDrive9}                            1024        00        {Lun:08}     {WWN:60002ac00000000000000091000026fc}                           {VVName:VaultQ-EV}         3.1.2 MU3    01609980
{PhysicalDrive*:\\.\PhysicalDrive10}                        1048576        00        {Lun:09}      {WWN:60002ac000000000000000a1000026fc}                        {VVName:VaultStoreD}         3.1.2 MU3    01609980
{PhysicalDrive*:\\.\PhysicalDrive11}                        2097152        01        {Lun:0a}      {WWN:60002ac000000000000000cb000026fc}                         {VVName:VaultStoreE}         3.1.2 MU3    01609980

'@

Get-Content .\3par.txt | ConvertFrom-String -TemplateContent $template3parInfo -OutVariable 3par |Out-Null


foreach($disk in $slova){
    foreach ($3p in $3par){
        if 
    }
}