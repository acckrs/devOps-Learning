function new-VMfromSpec {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $vmName,

        [Parameter(Mandatory = $true)]
        [string] $ip,

        
        [string] $vcenter="bib-vcentar-01",

        [Parameter(Mandatory = $true)]
        [validateSet("SECURITY","BIB-LOCAL","BIB-DMZ")]
        [string] $cluster
        
    )

    BEGIN {
        Connect-VIServer -Server $vcenter
        $template = Get-Template -Name "Win2012R2Template"
        $vmhost = Get-Cluster $cluster | Get-VMHost -State Connected | Get-Random
        $spec=Get-OSCustomizationSpec -Name  "CustomOsSpec1" | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"

    }

    PROCESS {

        Get-OSCustomizationNicMapping -Spec $spec.name| Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask '255.255.255.0' -Dns '10.35.170.22' -DefaultGateway '10.35.221.1' 
        New-VM -Name $vmName `
            -VMHost $vmhost `
            -Template $template `
            -Datastore DS3 `
            -OSCustomizationSpec $spec 
    }

    END {}


}

new-VMfromSpec -vmName "se-bg-safeguard" -ip "10.35.221.194" -cluster "SECURITY"
