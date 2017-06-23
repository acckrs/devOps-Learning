Import-Module activedirectory
Import-Module lync

$aduser = @()

$groupmember = Get-ADGroupMember "Lync Users" -Server 'dc-bg-01' | Get-AdUser
foreach ($member in $groupmember)
{
$aduser += Get-CsAdUser -Identity $member.UserPrincipalName | Where-Object {$_.enabled -ne "true"}
}

$aduser | sort Name | ft Name,UserPrincipalName -AutoSize | out-file c:\temp\zaenable.txt -Force

if($aduser.count -gt 0)
{
 send-mailmessage -from "lync13-fe@bancaintesa.rs" -To "marinko.marinko@bancaintesa.rs" -subject "Lync enable lista" -SMTPServer "mail" -Attachments C:\temp\zaenable.txt
}
else
{
 send-mailmessage -from "lync13-fe@bancaintesa.rs" -To "marinko.marinko@bancaintesa.rs" -subject "Lync enable lista" -SMTPServer "mail" -Body "Nema usera za enable"
}