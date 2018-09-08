[cmdletbinding()]
param(
    [string[]] $urlToCheck
)

function check-Url () {
    
    $WebRequest = [System.Net.WebRequest]::Create("$urltocheck")
    $WebRequest.Method = "GET"
    $response = $WebRequest.GetResponse()
    $response
}

try {
    $result = 0
  check-Url -ErrorVariable ev -ErrorAction stop
}
catch {
    $result = 2
    $err = $error[0]
}
$result
#$err.exception.GetType().fullname
#$err.exception|select *

#$err |select *
<#if ($everythingOK) {
    if ($rex -eq "OK") {
        $result = 0
    }
}
else {
    $result = 2
}
#>