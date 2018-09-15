
# Parameter help description
param(  
    [parameter(Mandatory = $true,
        ValueFromPipeline = $true)]
    [ValidateNotNullOrEmpty()]
    [String[]] $computerName
)

$all=@()
foreach ($computer in $computerName) {
    $qry = "SELECT SMS_Collection.* FROM SMS_FullCollectionMembership, SMS_Collection where name = '$computer' and SMS_FullCollectionMembership.CollectionID = SMS_Collection.CollectionID and SMS_Collection.name LIKE 'Serveri%'"
    $Collections = (Get-WmiObject -ComputerName sccm-bg-01  -Namespace root\SMS\site_BIB -Query "$qry").Name
    $props=@{
        "server"=$computer;
        "patch grupe"=$collections
    }
    $obj=New-Object -TypeName psobject -Property $props 
    $all+=$obj
}
$all

