$cijiGroupMembershipKopiramo="admin_mmarinko"
$kogaUbacujemuuGrupe="admin_kaleksandar"
Get-ADPrincipalGroupMembership $cijiGroupMembershipKopiramo | select name | export-csv groupsmembership.csv 
$groups=import-csv groupsmembership.csv 
$groups | % {Add-ADGroupMember -Identity $_.name -members $kogaUbacujemuuGrupe}
