cls;
$ErrorActionPreference='stop';
#
$DrLoc=$args[0];
if ($DrLoc -notmatch 'PRM|SRB') {throw 'Error. dr lokacija je PRM ili SRB';}
$DrLoc=$DrLoc.toUpper()+'.';

#set clocation
$cd='C:\SchTask\Check-DR';
if($MyInvocation.MyCommand.Path -ne $null) {$cd=[System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path);}
Set-Location $cd;
#
Write-Host "Iniciranje log fajlova za check-dr lokacija=[$DrLoc] domen=[DMZ]";
Write-Host "Brisanje starih sadržaja podfoldera <toCheck> i <ok>";
Write-Host '---------------------------------'
del ok\*.log -Force;
del toCheck\*.log -Force;

import-csv -Delimiter ',' -Path '.\check-dr.csv' |
  ?{$_.Domain.toUpper() -match "DMZ|workgroup"} |
  ?{$_.LocId.StartsWith($DrLoc)} |
  %{$r=$_;
    $fName='toCheck\{0}~{1}.log' -f $r.oCiType, $r.oName.Replace('\','$');
    Write-Host "Gen file:$fName";
    $fMsg='
IncTime :{0}
FileName:{1}
oCiType :{2}
oName   :{3}
Domain  :{4}
LocId   :{5}
osType  :{6}
osName  :{7}
' -f [datetime]::Now.ToString('yyyy-MM-dd hh:mm:ss'), $fName, $r.oCiType, $r.oName, $r.Domain, $r.LocId , $r.osType , $r.Operating_System;
  #
  $fMsg | Out-File -FilePath $fName -Force;
  }
#------
Write-Host "----< ok, finish >-----";

  