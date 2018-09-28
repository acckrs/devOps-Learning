$username="zamir"
$GroupName = "sqladmin"

function add-groupMembers ([string] $username, [string] $GroupName) {}

$searcher = New-Object DirectoryServices.DirectorySearcher([ADSI]"");
$searcher.PageSize=1000;
$searcher.Filter = "(&(objectCategory=group)(objectClass=group)(sAMAccountName=$GroupName))";
$searcher.findall() | % {$group=[ADSI]$_.path}
$searcher.filter = "(&(objectCategory=user)(objectClass=person)(sAMAccountName=$($username.trim())))";
$searcher.findall() | % {$user = [ADSI]$_.Path}
#izbacuje error ????
$group.member.Add($user) 
