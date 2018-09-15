param(  
    [String[]]$destPath = "\c$\temp\",
    [String[]]$fileToCopy,
    [String[]]$computerName  
    )  
foreach ($computer in $computerName){
    $fullDestPath="\\" + "$computer" + $destPath
    cp $fileToCopy $fullDestPath -Force -Confirm:$false
    Write-Output "Iskopiran na $computer"
    #rm  $fileToCopy -Force -Confirm:$false
}