foreach ($item in $lgs) {
    (get-vm $item).extensiondata.guest.ipaddress
}

#svaki peti
$xenapps = for ($i = 01; $i -le 120; $i++) {
    if ($i -lt 10) {
        $o1 = "xenapp-" + [string]'00' + [string]$i 
        $o1
    }
    else {
        if ($i -lt 100) {
            $o1 = "xenapp-" + [string]0 + [string]$i 
            $o1 
        } 
        else {
            $o1 = "xenapp-" + [string]$i 
            $o1 
        } 
    }
}
$5Xenapps = foreach ($item in $xenapps) {
    if ( $item.Substring($item.Length - 1) -eq 5) {
        $item
    }
}
$ne5Xenapps = "xenapp-001", "xenapp-002", "xenapp-003", "xenapp-004", "xenapp-006", "xenapp-007", "xenapp-008", "xenapp-009", "xenapp-010", "xenapp-011", "xenapp-012", "xenapp-013", "xenapp-014", "xenapp-016", "xenapp-017", "xenapp-018", "xenapp-019", "xenapp-020", "xenapp-021", "xenapp-022", "xenapp-023", "xenapp-024", "xenapp-026", "xenapp-027", "xenapp-028", "xenapp-029", "xenapp-030", "xenapp-031", "xenapp-032", "xenapp-033", "xenapp-034", "xenapp-036", "xenapp-037", "xenapp-038", "xenapp-039", "xenapp-040", "xenapp-041", "xenapp-042", "xenapp-043", "xenapp-044", "xenapp-046", "xenapp-047", "xenapp-048", "xenapp-049", "xenapp-050", "xenapp-051", "xenapp-052", "xenapp-053", "xenapp-054", "xenapp-056", "xenapp-057", "xenapp-058", "xenapp-059", "xenapp-060", "xenapp-061", "xenapp-062", "xenapp-063", "xenapp-064", "xenapp-066", "xenapp-067", "xenapp-068", "xenapp-069", "xenapp-070", "xenapp-071", "xenapp-072", "xenapp-073", "xenapp-074", "xenapp-076", "xenapp-077", "xenapp-078", "xenapp-079", "xenapp-080", "xenapp-081", "xenapp-082", "xenapp-083", "xenapp-084", "xenapp-086", "xenapp-087", "xenapp-088", "xenapp-089", "xenapp-090", "xenapp-091", "xenapp-092", "xenapp-093", "xenapp-094", "xenapp-096", "xenapp-097", "xenapp-098", "xenapp-099", "xenapp-100", "xenapp-101", "xenapp-102", "xenapp-103", "xenapp-104", "xenapp-106", "xenapp-107", "xenapp-108", "xenapp-109", "xenapp-110", "xenapp-111", "xenapp-112", "xenapp-113", "xenapp-114", "xenapp-116", "xenapp-117", "xenapp-118", "xenapp-119", "xenapp-120"
$all = @()
foreach ($item in $ne5Xenapps) {
    $servis = get-service -ComputerName $item -displayname 'Firebird Server - CSMInstance' 
    if ($servis.StartType -ne 'disabled') {
        Set-Service -ComputerName $item -name $servis.name -StartupType Disabled
    }
    if ($servis.status -ne 'stopped') {
        $servis | Stop-Service
    }
    $servis = get-service -ComputerName $item -displayname 'Firebird Server - CSMInstance' 
    $props = @{
        "name"        = $item;
        "status"      = $servis.Status;
        "startupType" = $servis.StartType
    }
    $obj = New-Object -TypeName pscustomobject -Property $props
    $all += $obj    
}
$all

#region Prikazi status servisa
$allXX = @()
foreach ($item in $5Xenapps) {
    $servisXX = get-service -ComputerName $item -displayname 'Firebird Server - CSMInstance' 
    $propsXX = @{
        "name"        = $item;
        "status"      = $servisXX.Status;
        "startupType" = $servisXX.StartType
    }
    $objXX = New-Object -TypeName pscustomobject -Property $propsXX
    $allXX += $objXX
}
$allXX
#endregion
