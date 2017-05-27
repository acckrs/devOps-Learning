function new-VMfromSpec {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $vmName,

        [Parameter(Mandatory = $true)]
        [string] $ip
    )

    BEGIN {
        $template = Get-Template -Name 'Win2012R2Template'
        $vmhost = Get-Cluster 'Test Cluster' | Get-VMHost -State Connected | Get-Random
        $spec=Get-OSCustomizationSpec -Name 'testSpec2' | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"

    }

    PROCESS {

        Get-OSCustomizationNicMapping -Spec $spec.name| Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask '255.255.255.0' -Dns '10.35.45.5' -DefaultGateway '10.35.45.1' 
        New-VM -Name $vmName `
            -VMHost $vmhost `
            -Template $template `
            -Datastore DS3 `
            -OSCustomizationSpec $spec 
    }

    END {}


}

new-VMfromSpec -vmName evNode11 -ip "10.35.45.131"
