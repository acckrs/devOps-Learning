# Parameter help description
Param(
[String] $userToChange,
[String] $userToCopy)

$groupsToCopy=Get-ADPrincipalGroupMembership $userToCopy

foreach ($group in $groupsToCopy) {
    Add-ADGroupMember $group -Members $userToChange -Confirm:$false
}