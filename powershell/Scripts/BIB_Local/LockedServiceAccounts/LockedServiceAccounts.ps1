import-module ActiveDirectory;
$msg='';
#
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString='Server=syssql; Database=dcInfo;trusted_connection=yes;Application name=CheckLockAccount';
$sqlSrv.Open();
$sqlcmd=$sqlsrv.CreateCommand();
$sqlcmd.CommandText=@'
select GroupName
  from [AD].[AdGroupMembers]
  where Groupname in ('Domain Admins','servisninalozi') 
  and cn=@cn
'@;
$sqlcmd.Parameters.Add('@cn',[System.Data.SqlDbType]::NVarChar) | Out-Null;
#
Search-ADAccount –LockedOut | 
  select SamAccountName |
  %{$cn=$_.SamAccountName;
    $sqlcmd.Parameters['@cn'].value=$cn;
    $gname=$sqlcmd.ExecuteScalar(); 
    if ($gname -ne $null) {
      $msg=$msg+'Lokovan je nalog nalog [{0}]. Član grupe {1}' -f $cn, $gname ;
    }
  }
#
if ($msg -ne '') {
  Send-MailMessage -SmtpServer 'mail' -Subject 'Lock account' -From "$($Env:COMPUTERNAME)@deltabank.co.yu" -body $msg -To 'ict_ssmon@bancaintesa.rs';
  }
