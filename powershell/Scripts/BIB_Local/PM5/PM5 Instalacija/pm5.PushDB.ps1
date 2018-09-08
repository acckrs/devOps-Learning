#################################################################################### 
# Učitava podatke o performansama iz "pmFileMask" fajlova na lokaciji "pmFilePath"
# Podaci se smešatju u pripremljenohj bazi "SqlConnectionString"
# Nakon učitavanja fajlova, fajlovi se pomeraju na arhivsku lokaciju "pmArhPath"
####################################################################################
$global:badFileList='.\badFileList.log';

# priprema
$ErrorActionPreference='stop';
$scriptPath = split-path -parent $MyInvocation.InvocationName;
$logFile= $MyInvocation.InvocationName.Replace('.ps1','.log');
$ver='{0:yyyyMMddhhmm}' -f  (get-item '.\pm5.PushDb.ps1').LastWriteTime;
set-location $scriptPath;
Start-Transcript -Path $logFile -Force;
'# hello at {0:yyyy-MM-dd hh:MM:ss}' -f [datetime]::Now;

# get config
$global:cfg=[xml](Get-Content .\pm5.xml); 

#priprema konekcije
$sqlSrv=New-Object 'System.Data.SqlClient.SqlConnection';
$sqlSrv.ConnectionString=$global:cfg.root.SqlConnectionString;
$sqlSrv.Open();
#priprema commande
$sqlCmd=$sqlSrv.CreateCommand();
$sqlcmd.CommandText='[pm5].[RegCntValue]';
$sqlCmd.CommandType='storedprocedure';
$sqlCmd.Parameters.Add('@counter', [System.Data.SqlDbType]::VarChar) | Out-Null;
$sqlCmd.Parameters.Add('@value', [System.Data.SqlDbType]::Float) | Out-Null;
$sqlCmd.Parameters.Add('@hostname', [System.Data.SqlDbType]::VarChar) | Out-Null;
$sqlCmd.Parameters.Add('@time', [System.Data.SqlDbType]::SmallDateTime) | Out-Null;
$sqlCmd.Parameters.Add('@ver', [System.Data.SqlDbType]::VarChar) | Out-Null;


#trajno briše loše fajlove
if (Test-Path $global:badFileList) {
  Get-Content $global:badFileList |
  ?{test-path $_} |
  %{rm $_ -Force};
  rm $global:badFileList -Force;
}



#lista fajlova koji se obradjuju. 
#Prvi (najmladji) fajl ako je uz to i mladji od 20 min se ignorise jer se smatra aktivnim
$n=0; $files=@();
dir $('{0}\{1}' -f $global:cfg.root.pmFilePath, $global:cfg.root.pmFileMask) |
sort  -Property LastWriteTime -Descending |
%{if ($n++ -gt 0  -or $_.LastWriteTime -lt [datetime]::Now.AddMinutes(-20)) {$files+=$_;}}




#func:otvara blg file ili ga uklanja ako je poznata greška.
function my-import-counter($pmFile ) {
  $ErrorActionPreference='stop'; 
  try{ import-counter -Path $pmFile;}
  catch {
    $e=$Error[-1];
    if ($e.Exception -match 'fewer than two data samples') {
      Add-Content -Path $global:badFileList -Value $pmFile;
      'bad file:"{0}' -f $pmFile;
    }
  } 
}


$ErrorActionPreference ='stop';
# slanje u bazu
$files | 
%{$pmFile=$_.FullName;
  #$pmFile='C:\SCHTASK\PM5\pmfile\pm5_12040903.blg';
  'obrada fajla "{0}"' -f $pmFile;
  my-import-counter $pmFile |
  ?{$_.GetType().Name -eq  'PerformanceCounterSampleSet'} | #samo ako je učitao countere
  %{$cs=$_; 
    $tm=$c.Timestamp;    '...cnt tm:{0:yyyyMMdd hh:mm}' -f $tm;
    $cs.CounterSamples|
    %{$c=$_;
      $pos=$c.Path.IndexOf('\',2);
      if ($global:cfg.root.HostName -ne 'default') {$hName=$global:cfg.root.HostName} else {$hName=$c.Path.Substring(2,$pos-2)}
      if ($hName -eq 'localhost') {$hName=$env:COMPUTERNAME;}
      $counter=$c.Path.Substring($pos);
      #'host={0} tm={1} Counter="{2}" Val={3}' -f $hName, $tm, $counter, $c.CookedValue;
      $sqlCmd.Parameters['@counter'].Value =$counter;
      $sqlCmd.Parameters['@value'].Value   =$c.CookedValue;
      $sqlCmd.Parameters['@hostname'].Value=$hName;
      $sqlCmd.Parameters['@ver'].Value=$ver;
      $sqlCmd.Parameters['@time'].Value    =$tm;
      $sqlCmd.ExecuteNonQuery() | Out-Null;
      $sqlCmd.Parameters | %{$_.Value=[System.DBNull]}
    }
  }
  '# Arhive: "{0}"' -f $pmFile;
  move $pmFile $($global:cfg.root.pmArhPath) -Force;
}

#
'# bye at {0:yyyy-MM-dd hh:MM:ss}' -f [datetime]::Now;
Stop-Transcript;
