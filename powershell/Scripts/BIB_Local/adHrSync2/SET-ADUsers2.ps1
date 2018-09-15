# Set-ADUsers
cls
$ErrorActionPreference='stop';
$DebugPreference='silentlycontinue';
$Error.Clear();

Set-Location 'C:\script\adhrsync2\';

#config file
$cfg=[xml] (Get-Content '.\Sync-AD-HR.xml')

## inic sql connection ## 
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString=$cfg.HA.SqlConnectionString
"Try to connect $($sqlSrv.ConnectionString)"
$sqlSrv.Open()


"## Uzimanje razlika"
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand=$sqlSrv.CreateCommand()
$SqlAdapter.SelectCommand.CommandText= `
@'
select * from AD.ChangeToApply
'@  

# obrada
$DataTable = New-Object System.Data.DataTable
$n=$SqlAdapter.Fill($DataTable) 
"[$n] AD usera za sinhronizaciju"
$MaxChange=[Int32] $cfg.HA.AD.MaxChangePerSession;
$DataTable |
#%{Write-Host $_.distinguishedname}

  %{
    $u=$_;
    $adUser=[ADSI]"LDAP://$($u.distinguishedname)";
    ## 
	Write-Host $u.distinguishedname
	write-host $adUser.Name
	"Change: $($adUser.sAMAccountName)";
    $adUser.givenName        = $u.givenName;
    $adUser.sn               = $u.sn;             
    $adUser.company          = $u.company                      
    $adUser.department       = $u.department;             
    $adUser.title            = $u.title;             
    $adUser.telephoneNumber  = $u.telephoneNumber;             
    $adUser.streetAddress    = $u.streetAddress;  
           
    #if ($u.manager -ne 'n/a') { $adUser.manager = $u.manager; } 
    $adUser.manager.Clear()
       
    $adUser.physicalDeliveryOfficeName = $u.physicalDeliveryOfficeName;    
    $adUser.mobile           = $u.mobile;              
    $adUser.ipPhone          = $u.ipPhone;              
    $adUser.L                = $u.L;              
    $adUser.otherTelephone   = $u.otherTelephone;              
    $adUser.C                = $u.C;             


    $adUser.Properties["thumbnailPhoto"].Clear() 
    if ($u.thumbnailPhoto -ne [System.DBNull]::Value ) {
    	$adUser.Properties["thumbnailPhoto"].Add($u.thumbnailPhoto) | Out-Null
    }



    ##
    $adUser.SetInfo();
    if ((--$MaxChange) -le 0) {
      "Dostignut limit od [$($cfg.HA.AD.MaxChangePerSession)] izmena po sesiji";
      break;
    }
  } 


"Pokretanje slanja novog stanja sa AD na sql server";
"Bye";

### operativno pozivanje scripte ###
#.\GET-ADUsers.ps1
####################################

 
