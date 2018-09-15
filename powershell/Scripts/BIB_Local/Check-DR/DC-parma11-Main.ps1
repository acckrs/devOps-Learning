cls;
$ErrorActionPreference='stop';
#set clocation
$cd='C:\SchTask\Check-DR';
if($MyInvocation.MyCommand.Path -ne $null) {$cd=[System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path);}
Set-Location $cd;


## 
cls;
Write-Host '------------------------< S T A R T >-----------------------------'

#lista za proveru
$chkList=dir 'toCheck' -Filter '*.log' |
           select  -Property Name, @{Name='OsType'; Exp={if ($_.Name.StartsWith('OS')) {1} else {0}}} |
           sort -Property OsType, Name -Descending;
$chkList |
  %{$fName=$_.Name;
    $arg="-noLogo -NoProfile -file ""$cd\chk-oName.ps1"" ""$fName""";
    Write-Host "powershell.exe $arg";
    Start-Process -FilePath 'powershell.exe'  -ArgumentList $arg -WindowStyle  'Minimized';
    sleep -Milliseconds 1000;
  }

Write-Host '--------------------------< E N D >-------------------------------'


