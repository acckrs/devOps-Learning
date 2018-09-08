$dsFolders=get-folder -Type Datastore
foreach ($dsFolder in $dsFolders) {
    $datastores=get-datastore -location $dsFolder    
    Write-output "U folderu ",$dsFolder.name, "se nalaze sledeci datastorovi", $datastores
}