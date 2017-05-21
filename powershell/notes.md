WinRM servis mora da radi da bi radio windows remoting
5985 port za WS-MAN (radi preko http-a ali ne na portu 80)
5986 port za WS-MAN (radi preko https-a ali ne na portu 443)

https://technet.microsoft.com/en-us/library/dn372891(v=wps.630).aspx
Get-Content C:\IP_Address.txt | ForEach-Object {([system.net.dns]::GetHostByAddress($_)).hostname >> c:\hostname.txt}