
$comps = "leasingb2bfe"
$all=@()
foreach ($comp in $comps) {
    $os=gwmi -ComputerName $comp -class win32_operatingsystem
     $iis_Sites=Invoke-Command  -ComputerName $comp -ScriptBlock {Import-Module WebAdministration; get-website |select name,physicalPath}
     $iis_webApps=Invoke-Command  -ComputerName $comp -ScriptBlock {Import-Module WebAdministration; get-webapplication }
     $naCompu=@()
     foreach ($iisSite in $iis_Sites){
        if ($iisSite.physicalPath -like '*%system*'){
            $p=$iisSite.physicalPath.ToString()
            $r=$p -replace "%SystemDrive%","\c$\"
            $pp="\\"+"$comp"+"$r"
        }else {
            $p=$iisSite.physicalPath.ToString()
            $r=$p -replace "c:\\","\c$\"
            $pp="\\"+"$comp"+"$r"
        }
        $props=@{
            "SiteName"=$iisSite.name;
            "Path"=$iisSite.physicalPath;
            "OS"=$os.caption
        }
      

        $obj=New-Object -TypeName psobject -Property $props
        $obj|add-member -membertype noteproperty -name server -value $comp
        $obj|add-member -membertype noteproperty -name pathContent -value (ls $pp) 
        $naCompu+=$obj
     }
     $all+=$naCompu
}
$all |ft -a




$comps = gc .\w2k12r2.txt
$all=@()
foreach ($comp in $comps) {
    $os=gwmi -ComputerName $comp -class win32_operatingsystem
     $iis_Sites=gwmi -Namespace root\MicrosoftIISv2 -ComputerName $comp -class IISWebServerSetting|select servercomment 
     #$iis_paths=gwmi -Namespace root\MicrosoftIISv2 -ComputerName $comp -class IIsWebVirtualDirSetting|select path 
     $naCompu=@()
     foreach ($iisSite in $iis_Sites){
        $props=@{
            "SiteName"=$iis_Site.servercomment;
      #      "Path"=$iis_paths.path;
            "OS"=$os.caption
        }
        $obj=New-Object -TypeName psobject -Property $props
        $obj|add-member -membertype noteproperty -name server -value $comp
        $naCompu+=$obj
     }
     $all+=$naCompu
}
$all
