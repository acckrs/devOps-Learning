# Get-ADUsers
$ErrorActionPreference='stop';
$DebugPreference='silentlycontinue';
$Error.Clear();

Set-Location 'C:\script\adhrsync2\';

#config file
$cfg=[xml] (Get-Content '.\Sync-AD-HR.xml')

## inic sql connection, gde se cuvaju podaci ## 
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString=$cfg.HA.SqlConnectionString;
"Try to connect [$($sqlSrv.ConnectionString)]";
$sqlSrv.Open()

"inic command za cuvanje podataka (procedura)"
$sqlProc=$sqlSrv.CreateCommand()      
$sqlProc.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlProc.CommandText='[AD].[Get-ADUser]'

"iniciranje parametara procedure (definicija)"
$cfg.HA.Properties.ChildNodes |
  %{ $sb='$sqlProc.Parameters.Add(''@'+$_.Name+''', [System.Data.SqlDbType]::'+$_.Type+') | Out-Null';  
     Write-Debug "add procedure parameters: $sb";
     $exp=$executioncontext.invokecommand.NewScriptBlock($sb);
     & $exp; 
  }
$c=$n=0;
"get and save ad users"
$searcher = New-Object DirectoryServices.DirectorySearcher([ADSI]"");
#$searcher.filter = "(&(sAMAccountType=805306368)(sAMAccountName=*)(!userAccountControl:1.2.840.113556.1.4.803:=2))";
$searcher.filter = "(&(objectCategory=user)(objectClass=person)(sAMAccountName=*))";
$searcher.PageSize=1000;
$searcher.findall() | 
  %{
    $n++;
	$Userko = [ADSI]$_.Path
	$IsUserDisabled = $Userko.PsBase.InvokeGet("AccountDisabled")
	if ($IsUserDisabled) {$DalDisejblovan=1} else {$DalDisejblovan=0}
	#Region Djura
	
    $user=$_.Properties;
    $cfg.HA.Properties.ChildNodes | 
    %{ #priprema komande - punjenje parametara
       $prop=$_.Name.toLower();
	     
	   if ($prop -eq "DalDisejblovan") {
		   $sb='$sqlProc.Parameters[''@'+$prop+'''].value='+$DalDisejblovan; 
	       Write-Host "register parameters: $sb"
	       $cmd=$executioncontext.invokecommand.NewScriptBlock($sb);
	       & $cmd; 
	   } 
	   
	   else 
	   
	   {
	   
	       $val=if ($user.$prop -eq $null) {'[System.DBNull]::Value'} else {'$user.'+$prop+'.item(0)'} ;
		   $sb='$sqlProc.Parameters[''@'+$prop+'''].value='+$val; 
	      # Write-Host "register parameters: $sb"
	       $cmd=$executioncontext.invokecommand.NewScriptBlock($sb);
	       & $cmd; 
	   }
     } 
	#EndRegion Djura
#	 $sb='$sqlProc.Parameters[''@'+"DalDisejblovan"+'''].value='+ $DalDisejblovan; 
#       Write-Host "register parameters: $sb"
#       $cmd=$executioncontext.invokecommand.NewScriptBlock($sb);
#       & $cmd;
    
	## izvrsavanje i tamo gde je bilo promena u odnosu na sql bazu se prijavljuje 
    "check[$n]:$($user.samaccountname.item(0))"
	$sqlProc.CommandText
    if ($sqlProc.ExecuteScalar() -ne 0) {
      $user.samaccountname.item(0);
      $c++;
      "*** Change[$c]:$($user.samaccountname.item(0))";
    } ;
  }

"ADUsers [$n], Changed [$c], bye"
 