get-service | Out-File services.csv 
$testCSV="C:\Users\Acca\Documents\GitHub\devOps-Learning\powershell\services.csv"
(gc $testCSV |Sort-Object  -Descending)[0 .. 7]|Set-Content -Path set.txt


Set-Content -Path hello.txt -Value "Hello World"
gc .\set.txt

$service=get-service | Where-Object {$_.Name -eq "spooler"}
$service|Export-Csv -Path .\services.csv

gc .\services.csv

