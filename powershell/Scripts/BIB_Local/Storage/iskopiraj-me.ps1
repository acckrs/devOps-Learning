$hostovi=get-3parhost|select name -unique|?{($_.name -notlike '*esx*')-and($_.name -notlike '210*') -and ($_.name -notlike 'dlp-db*')-and ($_.name -notlike '50*')}
$names=$hostovi.name.ForEach({"\\"+"$_"+"\c$\schtask\3parinfo\"})
foreach ($name in $names){
    write-host "Putanja je ","$name"
    ls $name
    #$file="$name"+"1map-csd.ps1"
    #rm $file
   # cp C:\Acca\Powershell_local\BIB\Storage\map-csd.ps1 $name -Force -Confirm:$false
    #rm  "$name","1map-csd.ps1" -Force -Confirm:$false
}

$names |write-host "$_"

mkdir "\\bems02\c$\schtask\3parinfo\"
mkdir \\drbackup-node2\c$\schtask\3parinfo\
cp C:\Acca\Powershell_local\BIB\Storage\HP3PARInfo.exe  \\syssql12-node1\c$\schtask\3parinfo\
cp C:\Acca\Powershell_local\BIB\Storage\map-csd.ps1  \\syssql12-node1\c$\schtask\3parinfo\