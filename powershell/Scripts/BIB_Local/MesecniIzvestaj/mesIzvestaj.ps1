
$disks = gwmi -ComputerName ex-node-01 -Class win32_logicaldisk |? {$_.drivetype -eq "3"}
$count = $disks.count
$count
$tot = 0
$free = 0
foreach ($disk in $disks) {
    $tot += $disk.size
    $free += $disk.freespace
}
write-host [math]::round(($tot/$count)/1GB,2)
write-host "Free average is:",($free/$count)