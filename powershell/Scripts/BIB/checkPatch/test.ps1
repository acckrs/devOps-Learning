$result= schtasks /query /s snow-mid-dev /fo list /v /tn wsus | findstr "status"
$result = $result.substring(12)
$code=$result.trim()
write-host $code