function new-VMfromSpec {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $vmName,

        [Parameter(Mandatory = $true)]
        [string] $ip,

        
        [string] $vcenter = "bib-vcentar-01",

        [Parameter(Mandatory = $true)]
        [validateSet("SECURITY", "BIB-LOCAL", "BIB-DMZ")]
        [string] $cluster
        
    )

    BEGIN {
        Connect-VIServer -Server $vcenter
        $usedDS = (Get-Datastore | sort FreeSpaceGB -Descending | select -ExpandProperty name -first 1 | Out-String)
        $template = Get-Template -Name "blank_w2k12r2"
        $vmhost = Get-Cluster $cluster | Get-VMHost -State Connected | Get-Random

        if (Get-OSCustomizationspec -name tmp01) {
            Remove-OSCustomizationSpec -OSCustomizationSpec tmp01
            $spec = Get-OSCustomizationSpec -Name  "w2k12r2_spec1" | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"
        }
        else {
            $spec = Get-OSCustomizationSpec -Name  "w2k12r2_spec1" | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"
        }
    } #end BEGIN

    PROCESS {

        Get-OSCustomizationNicMapping -Spec $spec.name| Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask '255.255.255.0' -Dns '10.35.170.22' -DefaultGateway '10.35.221.1' 
        Write-Verbose "Creating vm $vmname on host $vmhost with IP address $ip from $template template. Vm will be on $usedDS datastore"
        New-VM -Name $vmName `
            -VMHost $vmhost `
            -Template $template `
            -Datastore $usedDS `
            -OSCustomizationSpec $spec 
        Start-VM -VM $vmName
    }

    END {}


}

new-VMfromSpec -vmName "se-bg-safeguard" -ip "10.35.221.194" -cluster "SECURITY" -verbose
