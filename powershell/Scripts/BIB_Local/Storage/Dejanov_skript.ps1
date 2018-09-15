
Measure-Command{
$o = get-content .\3par.txt | select -Skip 3 |
    % {$ln = $_; 
    $x = $_ -split '\s+';
    '' | select @{Name = 'DeviceId'; Exp = {$x[0]}}, @{Name = 'WWName'; Exp = {$x[5]}};
}
}

cls
$ln = '\\.\PhysicalDrive8        10240       00    07     60002ac00000000000000090000026fc     VaultMSMQ-EV   3.1.2   MU3  01609980'
$ln -match '(.+)[ \t]+(.+)\s+(.+)\s+(.+)\s+(.+)\s+(.+)\s+(.+)\s+(.+)\s+(.+)\s+(.+)\s+'
$Matches

# Ovo ga nije interesovalo
<# ## Definisem template za  3parinfo output parsing ---  use if WMF > 5 --vrlo kool feature

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



