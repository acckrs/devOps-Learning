Import-Module activedirectory
Import-Module lync

$groupmember = Get-ADGroupMember "Lync Users" -Server 'dc-bg-01' | Get-AdUser
foreach ($member in $groupmember)
{
$aduser = Get-CsAdUser -Identity $member.UserPrincipalName | Where-Object {$_.enabled -ne "true"}
if($aduser -ne $())
{
Enable-CsUser -identity $aduser.identity -RegistrarPool lync13-fe.deltabank.co.yu -SipAddressType EmailAddress
}
}