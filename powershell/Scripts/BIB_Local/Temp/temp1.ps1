# ping the specified servers with a given timeout (milliseconds)
$TimeoutMillisec = 50

Get-WmiObject -Class Win32_PingStatus -Filter "(Address='microsoft.com' or Address='r13-c14' or Address='google.com') and timeout=$TimeoutMillisec" |select *