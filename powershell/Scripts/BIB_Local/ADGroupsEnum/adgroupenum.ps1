$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString= "Server=SYSSQL,1433; Database=dcinfo; user id=smshost; password=sh1234.; Application Name=ADEmptyGroups;";
$sqlSrv.Open();


$sqlEmptyGroups=$sqlSrv.CreateCommand();
$sqlEmptyGroups.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlEmptyGroups.CommandText='[dcinfo].[AD].[RegEmptyGroup]';
$sqlEmptyGroups.Parameters.Add('@GroupName',[System.Data.SqlDbType]::VarChar) | Out-Null;
$sqlEmptyGroups.Parameters.Add('@dn',[System.Data.SqlDbType]::VarChar) | Out-Null;
$sqlEmptyGroups.Parameters.Add('@dsc',[System.Data.SqlDbType]::VarChar) | Out-Null;


Get-ADGroup -Filter * -Properties Members,name,DistinguishedName,Description | where {-not $_.members} | %{

$name=$_.name;
$dn=$_.DistinguishedName;
$dsc=$_.Description;
if ((Get-ADGroupMember -Identity $name) -eq $null) {

#write-host "Prazna"
$sqlEmptyGroups.Parameters['@GroupName'].value=$name;
$sqlEmptyGroups.Parameters['@dn'].value=$dn;
$sqlEmptyGroups.Parameters['@dsc'].value=$dsc;
$sqlEmptyGroups.ExecuteNonQuery() | Out-Null;
}


}