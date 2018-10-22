
[CmdletBinding()]
param (
    #Imena servera razdvojena ','
    [String[]] $servers,
    #Putanja do bin-a
    [String] $binPath,
    #Funkcija koju pokrecemo - Check proverava, Upgrade azurira firmware
    [parameter(Mandatory = $true)]
    [ValidateSet("Check", "Upgrade")]
    [String]$funkcija
)
$SecurePassword = Read-Host -Prompt "iLO password (nalazi se u pwd manageru)" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

function find-HPiLOversions {
    $ilos = @()
    foreach ($server in $servers) {
        $ilo = Get-HPiLOFirmwareVersion -Server $Server -Username Administrator -Password $PlainPassword -DisableCertificateAuthentication
        $props = @{
            "IP"               = $ilo.IP;
            "Hostname"         = $ilo.Hostname;
            "Mgmt processor"   = $ilo.MANAGEMENT_PROCESSOR;
            "Firmware version" = $ilo.firmware_version;
            "Firmware date"    = $ilo.FIRMWARE_DATE;
            "License type"     = $ilo.LICENSE_TYPE
        }
        $obj = New-Object -Type psobject -Property $props
        $ilos += $obj
    }
    Write-Output $ilos
}
function update-HPiLO {
    foreach ($server in $servers) {
        write-host "Radim upgrade iLO firmwera na serveru $server"
        Update-HPiLOFirmware -Server $Server -Username Administrator -Password $PlainPassword -TPMEnabled -Location $binPath -DisableCertificateAuthentication
    }
}

if ($funkcija -eq "Upgrade") {
    update-HPiLO
}
else {
    find-HPiLOversions    
}
