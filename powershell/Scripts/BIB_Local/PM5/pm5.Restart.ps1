# scrip obavlja: ############################################################
# !!! svi parametri definisani u xml config fajlu ".\pm5.xml"
# -----------------------------------------------------------
#  1. restart perfmon countera sa imenom "PerfCounterName".
#  2. pomera "pmFileMask" fajlove starije od "pmToAthTTL" dana sa "pmFilePath" na arhivsku putanju "pmArhPath" 
#  3. brise fajlove "pmFileMask" starije od "pmDelArhTTL" dana sa "pmArhPath" lokacije 
# NAPOMENA: moguce slanje podataka u bazu obavlja druga srcipta
##############################################################################


# priprema
$ErrorActionPreference='Stop';
$scriptPath = split-path -parent $MyInvocation.InvocationName;
$logFile= $MyInvocation.InvocationName.Replace('.ps1','.log');
set-location $scriptPath;
Start-Transcript -Path $logFile -Force;

# get config
$global:cfg=[xml](Get-Content .\pm5.xml); 

'# provera quorum resursa {0}' -f $global:cfg.root.Quorum; 
if ((test-path -Path $global:cfg.root.Quorum) -eq $false) {
  write-host "Nemam quorum";
  return;
} 

'# restart perfmon countera {0}' -f $global:cfg.root.PerfCounterName; 
$ErrorActionPreference='Continue';
logman stop ($global:cfg.root.PerfCounterName);  
logman start ($global:cfg.root.PerfCounterName);

'# prebaci u arhivu sve starije od {0} dana.' -f $cfg.root.pmToAthTTL;
dir $('{0}\{1}' -f $global:cfg.root.pmFilePath,  $global:cfg.root.PMFileMask) | 
  ?{$_.LastWriteTime -lt [datetime]::Now.AddDays(-[int]::Parse($cfg.root.pmToAthTTL))} |
  %{'arh:{0}' -f $_.FullName;
    move $($_.FullName) $($global:cfg.root.pmArhPath);
  }
  

'# uklanjanjanje stare arhive, starije od {0} dana.' -f $cfg.root.pmDelArhTTL;
dir $('{0}\{1}' -f $global:cfg.root.pmArhPath, $global:cfg.root.PMFileMask) |
  ?{$_.LastWriteTime -lt [datetime]::Now.AddDays(-[int]::Parse($cfg.root.pmDelArhTTL))} |
  %{'del:{0}' -f $_.FullName; 
    $_.Delete()
  }


'# bye at {0:yyyy-MM-dd hh:MM}' -f [datetime]::Now;
Stop-Transcript;
