Write-Host "Unesite putanju do source file-a, na primer: " -NoNewline
Write-Host "C:\IIBFramework\21082018\Auxiliary\Auxiliary.txt " -ForegroundColor Yellow -NoNewline
Write-Host ": " -NoNewline
$source = Read-Host
Write-Host "Unesite putanju destinacionog foldera, na primer: " -NoNewline
Write-Host "C:\IIBFramework\21082018\Auxiliary\ " -ForegroundColor Yellow -NoNewline
Write-Host ": " -NoNewline
$destination = Read-Host
$string = Get-Content  $source  | % {$_.split(" ")[7]}
foreach ($s in $string)
{
$bar = $s.trim("'")
Foreach-Object { copy-item -Path $bar -Destination $destination}

$bar = $s.Replace(".bar" , ".properties")
$properties = $bar.trim("'")
Foreach-Object { copy-item -Path $properties -Destination $destination}
}