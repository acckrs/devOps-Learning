function new-VMfromSpec {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $vmName,

        [Parameter(Mandatory = $true)]
        [string] $ip,

        
        [string] $vcenter = "ict-test1",

        [Parameter(Mandatory = $true)]
        [validateSet("test cluster")]
        [string] $cluster
        
    )

    BEGIN {
        Connect-VIServer -Server $vcenter
        $usedDS = (Get-Datastore | Sort-Object FreeSpaceGB -Descending |where -FilterScript {$_.name -notlike 'esxVmMigration2test'} | Select-Object -first 1 )
        $template = Get-Template -Name "w2k12r2_core"
        $vmhost = Get-Cluster $cluster | Get-VMHost -State Connected| Get-Random

        if (Get-OSCustomizationspec -name tmp01) {
            Remove-OSCustomizationSpec -OSCustomizationSpec tmp01 -Confirm:$false
            $spec = Get-OSCustomizationSpec -Name  "w2k12r2_core" | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"
        }
        else {
            $spec = Get-OSCustomizationSpec -Name  "w2k12r2_core" | New-OSCustomizationSpec  -Name "tmp01" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01"
        }
    } #end BEGIN

    PROCESS {

        Get-OSCustomizationNicMapping -Spec $spec.name| Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask '255.255.255.0' -Dns '10.35.45.5' -DefaultGateway '10.35.45.1' 
        Write-Verbose "Creating vm $vmname on host $vmhost with IP address $ip from $template template. Vm will be on $usedDS datastore"
        New-VM -Name $vmName -VMHost $vmhost -Template $template -Datastore $usedDS  -OSCustomizationSpec $spec 
        
    }

    END {}


}

new-VMfromSpec -vmName "iis1-test" -ip "10.35.45.90" -cluster "test cluster" -verbose
