
$computername = Read-Host -Prompt "Enter computer to delete from AD and SCCM: "
$SCCMSite = "BIB"
$SCCMSitePath = $SCCMSite + ":"
Import-Module (Join-Path $(Split-Path $env:SMS_ADMIN_UI_PATH) ConfigurationManager.psd1)
#Set current directory to SCCM site
Set-Location -Path $SCCMSitePath

try {
    $ResourceIDOfComputername = Get-CMDevice -name $computername -ErrorAction Stop
}

catch {
    Write-error "Computername: $Computername not found"
    Break
}

#Remove-CMDevice -DeviceName $computername
#Write-output "$computername removed from SCCM"




<# try {
    Remove-ADComputer -identity $computername -ErrorAction Stop
}

catch {
    Write-error "Computername: $Computername not found in AD"
    Break
} #>