Get-Content C:\Acca\PowerShell_JA\ips.txt | ForEach-Object {([system.net.dns]::GetHostByAddress($_)).hostname >> C:\Acca\PowerShell_JA\hosts.txt}
gc C:\Acca\PowerShell_JA\ips.txt | ForEach-Object {"$_,"+([system.net.dns]::GetHostByAddress($_)).hostname }
gc C:\Acca\PowerShell_JA\ips.txt

([system.net.dns]::GetHostByAddress( '10.34.2.10'   )).hostname