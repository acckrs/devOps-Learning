[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")            
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer("wsus1", $False)
#$wsus.SearchComputerTargets("FC1XENAPPDBDEV1ww")

$serv = $wsus.SearchComputerTargets("xenapp-119") 
$serv[0].GetComputerTargetGroups()| where -FilterScript {$_.name -ne "All Computers"}
$membGroup = $wsus.GetComputerTargetGroups() | where -FilterScript {$_.name -eq "Test"}; $membGroup
$membGroup.AddComputerTarget($serv[0])   
$serv[0].GetComputerTargetGroups()

$servs = gc .\pcs2.txt
foreach ($s in $servs) {
   try {
        schtasks.exe /s $s /tn wsus /query /fo csv | convertfrom-csv -ErrorAction SilentlyContinue | out-null 
        write-host "Task is present at $s"
    }
    catch {
        write-host "No task on $s"
    }
}
    #schtasks.exe /s xenapp-db-dev01 /tn wsus /query /fo csv | convertfrom-csv 
}

