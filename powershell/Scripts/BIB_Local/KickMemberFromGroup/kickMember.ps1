Function KickMemberFromGroup {
param ($username,$fromGroupName)

$userismemberofnewGroup=0
$searcher = New-Object DirectoryServices.DirectorySearcher([ADSI]"");
$searcher.PageSize=1000;
$searcher.Filter = "(&(objectCategory=group)(objectClass=group)(sAMAccountName=$fromGroupName))";
$searcher.findall() | % {$groupfrom=[ADSI]$_.path}
$searcher.filter = "(&(objectCategory=user)(objectClass=person)(sAMAccountName=$($username.trim())))";
$searcher.findall() | % {$Userko = [ADSI]$_.Path}
if ($Userko -eq $null) {
Write-Host $username "has not been found in system!!!"
return
}
foreach ($groupDN in $userko.memberOf)
{
	 if ($groupDN -eq $groupfrom.distinguishedName) {
	  $groupfrom.member.Remove($Userko.distinguishedName.ToString())
	  $groupfrom.CommitChanges(); 
	  Write-Host "User" $Userko.name "removed from group" $groupfrom.name.ToString()
	 }
}

}
$spisak = "C:\SchTask\KickMemberFromGroup\spisakzaodstrel.txt"
Get-Content $spisak | % {
KickMemberFromGroup -fromGroupName Internet3 -username $_
}
