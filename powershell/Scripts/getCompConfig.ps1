[CmdletBinding()]
param
(
    [switch]$PassThru,
    [string[]] $computerName = 'localhost'

    
)

$me = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$dummy = New-Object System.Security.Principal.WindowsPrincipal -ArgumentList $me
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
$amIAdmin = $dummy.IsInRole($adm)

if (!$amIAdmin)
{
   Throw "Morate biti ulogovani kao lokalni administrator!"
}



foreach ($computer in $computerName)
{
    if ($computer -eq 'localhost')
    {
        $path = "C:\Windows\bib\sysprep"
        $computer = $env:COMPUTERNAME
    }
    else
    {
        $path = "\\$computer\c$\Windows\bib\sysprep"
    }     
    $isTherePath = Test-Path $path
    if (!$isTherePath)
    {
        $newDir = mkdir $path
        Write-Host "Napravljen folder $($newDir.fullname)" -ForegroundColor Yellow
    }
    $netConfig = gwmi -Class win32_networkadapterconfiguration -ComputerName $computer | ? {$_.ipaddress}
    $NICS = New-Object System.Collections.ArrayList
    foreach ($config in $netConfig)
    {
        $netAdapter = $config.GetRelated('win32_NetworkAdapter')
        try
        {
            $router = $config.DefaultIPGateway[0]
        }
        catch
        {
            $router = $null
        }
    
        $result = [pscustomobject] @{ 
                                        ComputerName = $computer ; 
                                        NetAdapterName = $netAdapter.netconnectionID ; 
                                        NetAdapterDescription = $netAdapter.Description ;
                                        NetAdapterIndex = $config.Index  
                                        IP = $config.IPAddress[0] ; 
                                        Subnet = $config.IPSubnet[0] ; 
                                        Router = $router 
                                        DNS = $config.DNSServerSearchOrder -join ';'
                                    }
    [void]$NICS.Add($result)
    }
    
    if ($PSBoundParameters.ContainsKey('PassThru'))
    {
        $NICS 
        
    }
    $NICS | Export-Clixml -Path (Join-Path $path -ChildPath GetCompConfig.cfg)
}



