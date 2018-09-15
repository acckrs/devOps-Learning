 param(
   [String]$ComputerName=$env:COMPUTERNAME
) 


$PortResult = Test-NetConnection $ComputerName -Port 25 -InformationLevel Quiet
if ($PortResult -eq $True) {
    Write-Host "servis radi"
    exit 0
    }
        else {
        Write-Host "ne radi"
        exit 2
        }
  