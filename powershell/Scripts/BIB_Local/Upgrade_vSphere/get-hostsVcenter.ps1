function get-vcenterFromHost{
    param(
        [parameter(Mandatory=$true)]$vmhost
    )
    $vmview=get-vmhost $vmhost |Get-View
    $vCenterIP=$vmview.summary.managementServerIP
    $vcenterIP
}

get-vcenterFromHost 


$vm=get-vm fxservicetest 
$vm.ExtensionData.Config.Uuid


get-aduser 