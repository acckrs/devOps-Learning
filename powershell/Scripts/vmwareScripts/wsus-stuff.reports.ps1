[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")            
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer("wsus1", $False)
        
$computerscope = New-Object Microsoft.UpdateServices.Administration.ComputerTargetScope
$computerscope | gm
#$Wsus.GetComputerStatus($computerscope,[ Microsoft.UpdateServices.Administration.UpdateSources]::All)
#$kbs="KB4012598","KB4012213","KB4012212","KB4012214","KB4012215","KB4012216","KB4012217","KB4012218"
$kbs="KB4012214"
foreach ($kb in $kbs) {
    $updates = $wsus.SearchUpdates("$kb") 
    $update = $updates[0]
    #$update.GetSummary($computerscope)
    $update.GetSummary($computerscope) | gm
    $props = @{
        "KB"=$kb;
        "installed"=$update.GetSummary($computerscope).InstalledCount;
        "Unknown"=$update.GetSummary($computerscope).unknownCount;
        "NotApplicable"=$update.GetSummary($computerscope).notapplicablecount;
        "NotInstalled"=$update.GetSummary($computerscope).installedCount
    }
    #$obj=New-Object -TypeName psobject -Property $props
    #Write-Output $obj
}

