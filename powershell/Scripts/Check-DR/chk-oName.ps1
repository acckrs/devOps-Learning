cls;
$ErrorActionPreference='stop';
#$cd='C:\SchTask\Check-DR';
if($MyInvocation.MyCommand.Path -ne $null) {$cd=[System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path);}
Set-Location $cd;

#poziv funkcija
.\chk-func.ps1

#prihvat argumenta
#$global:logFile=Get-Item 'E:\BIB\Check-DR\toCheck\MSSQL.SRV~WB6$WBSQL.log';
if ($args.Length -eq 0) {Throw ('Nije naveden log fajl!');}
#$global:logFile=Get-Item 'toCheck\DNS.MS~DC-BG-02.log';
$global:logFile=Get-Item $('toCheck\'+$args[0]);
if (!($logFile.Name -match '([^~]+)~([^~]+)\.log')) {Chk-UnknownType; return;}

try{
  #priprema
  $global:ciType=$Matches[1]; 
  $global:oName =$Matches[2];
  $Matches.Clear();

  # ako u imenu ima jos tačkica, samo prvi deo se uzima.
  if ($oName -match '([^\.]+)\.') {$oName=$Matches[1]; $Matches.Clear();}

  $global:IsWindows=$false;
  $IsWindows=Get-Content $logFile | ?{$_ -match 'osName[ ]+:(.+)'} | %{$_ -match 'Windows'};
  $global:oName =Get-Content $logFile | ?{$_ -match 'oName[ ]+:(.+)'} | %{$Matches[1]};

  Log -msg $('Windows={0}, oName={1}, ciType={2}' -f $IsWindows, $oName, $ciType);
  ## obrada ##
  switch ($ciType.ToUpper()) {
    'MSSQL.SRV' {Chk-MSSQL; break;}
    'MSSQL.SRV.CLUS' {Chk-MSSQL; break;}
    'IIS' {Chk-IIS; break;}
    'Domino' {Chk-IIS; break;}
    'Share' {Chk-Share; break;}
    'Share.Clus' {Chk-Share; break;}
    'DCOM' {Chk-DCOM; break;}
    'ORACLE.DB' {Chk-ORACLE; break;}
    'ORACLE.DB.RAC' {Chk-ORACLE; break;}
    default {Chk-Default; break;};
  }
}
catch {
  Log -msg $Error[0];
}


