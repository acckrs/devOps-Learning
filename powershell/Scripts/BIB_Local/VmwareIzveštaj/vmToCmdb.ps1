# po izboru...
$esx='bib-vcentar-01'
$esx='be-vce-bib.fbisp.eu'

# po izboru...
Connect-VIServer -Server $esx -Protocol https -User spimi\??? -Password ??? 
Connect-VIServer -Server $esx -Protocol https 




#sql command ------------------------------------
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString='Server=syssql; Database=xIC;trusted_connection=yes;Application name=checkVM';
$sqlSrv.Open();
$sqlCmd=$sqlSrv.CreateCommand();
$sqlCmd.CommandType='StoredProcedure';
$sqlCmd.CommandText='prop.CheckVm';
$sqlCmd.Parameters.Add('@vm', [System.Data.SqlDbType]::nVarChar) | Out-Null;
$sqlCmd.Parameters.Add('@cpu', [System.Data.SqlDbType]::int) | Out-Null;
$sqlCmd.Parameters.Add('@memMb', [System.Data.SqlDbType]::int) | Out-Null;
$sqlCmd.Parameters.Add('@DiskSpecGb', [System.Data.SqlDbType]::VarChar) | Out-Null;

get-vm | 
  %{ $vm=$_; 
     'Process {0} ' -f $vm.Name;
     $sqlCmd.Parameters['@vm'].value=$vm.name;
     $sqlCmd.Parameters['@cpu'].value=$vm.NumCpu;
     $sqlCmd.Parameters['@memMb'].value=$vm.MemoryMB;
     $sqlCmd.Parameters['@DiskSpecGb'].value= '' 
     Get-HardDisk -VM ($vm) | 
       %{$sqlCmd.Parameters['@DiskSpecGb'].value += '+'+$_.CapacityGB.ToString()};
     $sqlCmd.Parameters['@DiskSpecGb'].value=$sqlCmd.Parameters['@DiskSpecGb'].value.Substring(1)
     $sqlCmd.ExecuteNonQuery() | Out-Null;
     foreach ($p in $sqlCmd.Parameters) {$p.value=$null};
    }


#odjava
disConnect-VIServer -Server $esx -Force;


