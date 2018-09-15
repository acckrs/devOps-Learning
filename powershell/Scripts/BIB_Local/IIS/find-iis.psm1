
$comps = "backup-node1"
$all = @()
foreach ($comp in $comps) {
        {
            $iis = Invoke-Command  -ComputerName $comp -ScriptBlock {Import-Module WebAdministration; get-website |select name}
            $props = @{
                "server"   = $comp;
                "SiteName" = $iis.name;
                "Count"    = $iis.name.count
            }
            $obj = New-Object -TypeName psobject -Property $props
            $all += $obj
        }
        $all 
}