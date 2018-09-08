[CmdletBinding(SupportsShouldProcess=$true)]

param
(
    [ValidateSet('fc1','fc2','fc3')]
    [Parameter(Mandatory=$true)]
    [string]
    $Okruzenje
)



$me = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$dummy = New-Object System.Security.Principal.WindowsPrincipal -ArgumentList $me
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
$amIAdmin = $dummy.IsInRole($adm)

if (!$amIAdmin)
{
   Throw "Morate biti ulogovani kao lokalni administrator!"
}

$netConf = Import-Clixml -Path $env:windir\bib\sysprep\GetCompConfig.cfg
Write-Verbose "GetCompConf"
Write-Verbose ($netConf | Out-String) 


#region NovoIme
if (($netConf | measure).Count -gt 1)
{
    $computerName = $netConf[0].ComputerName
}
else
{
    $computerName = $netConf.ComputerName
}

 switch ($Okruzenje) 
 {
    'fc1' 
    { 
        if ($computerName.length -gt 16)
        {
            $computerName = $computerName.substring(0,16)   
            
        }
        $newIpBase = "10.35.158."   
        $newComputerName = 'fc1' + $computerName
    }
    'fc2' 
    {
       if ($computerName.length -gt 16)
       {
           $computerName = $computerName.substring(0,16)
           
       }
       $newComputerName = 'fc2' + $computerName
       $newIpBase = "10.35.159."   
    }
    'fc3'  
    {
        if ($computerName.length -gt 16)
        {
            $computerName = $computerName.substring(0,16)   
            
        }
        $newComputerName = 'fc3' + $computerName
        $newIpBase = "10.35.160."
     }
}
 #endregion

foreach ($nic in $netConf)
{
    $nicIndex = $nic.NetAdapterIndex
  
    
    $netAdapter = gwmi -Class win32_networkAdapterConfiguration -Filter "Index = '$nicIndex'"
    Write-Verbose "Novi adapter"
    Write-Verbose ($netAdapter | Out-String)

    $dnsSearchOrder = $nic.DNS -split ';'
    $ip = $nic.IP
    $ip -match "\.(?<octet>\d{1,3}$)" | Out-Null
    $newIP = $newIpBase + $Matches['octet'] 
    $mask = $nic.Subnet
    $gateway = $nic.Router
    

    $newProps = [pscustomobject] @{ OldIP = $ip ; NewIP = $newIP ; NewComputerName = $newComputerName }
    Write-Verbose "NewProps"
    Write-Verbose ($newProps | Out-String)

    
    #region SetIP
        if ($PSCmdlet.ShouldProcess("$ip","Change into $newIp"))
        {            
            $setIP = $netAdapter.EnableStatic($newIP, $mask)
            if ($setIP)
            {
                Write-Host "Setovana IP adresa $ip" -ForegroundColor Yellow
            }
        }
    #endregion
    
    #region SetDefaultGateway
        if ($nic.Router)
        {
            $newGateway = "$newIpBase"+"1"
            if ($PSCmdlet.ShouldProcess("Gateway","Set to $newGateway"))
            {
                $setGateways = $netAdapter.SetGateways($newGateway, 1)
                if ($setGateways.ReturnValue -eq 0)
                {
                    Write-Host "Setovan Gateway $newGateway" -ForegroundColor Yellow
                }
            }
        }
    #endregion
    
    #region SetDNSSearchOrder
        if ($nic.DNS)
        {
            if ($PSCmdlet.ShouldProcess("DNSServerSearchOrder","set to $dnsSearchOrder"))
            {            
                $setDns = $netAdapter.SetDNSServerSearchOrder($dnsSearchOrder)
                if ($setDns.returnValue -eq 0)
                {
                    Write-Host "Setovani DNS serveri $($nic.DNS)" -ForegroundColor Yellow
                }
            }
        }
    #endregion
}


    
#region NameChange
if ($PSCmdlet.ShouldProcess("Old name $env:COMPUTERNAME","change $computerName to $newComputerName"))
{        
    if ($PSVersionTable.PSVersion.Major -ge 3)
    {
        Rename-Computer -NewName $newComputerName -PassThru -Restart -Force
    }
    else 
    {
        $sys = Get-WmiObject -Class win32_ComputerSystem
        $sys.Rename($newComputerName)   
        Restart-Computer -Force
    }
}
#endregion
