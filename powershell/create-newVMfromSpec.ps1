 [CmdletBinding()]


$template=Get-Template -Name 'Win2012R2Template'
$vmhost=Get-Cluster 'Test Cluster' | Get-VMHost -State Connected | Get-Random

$ip=''
$name=''
$nameForStart=''
$nameBase='ExNodeTest'
$baseIP='10.35.45.17'
for ($i=1;$i -lt 3;$i++){
    $ip=$baseIP+$i
    $name=$nameBase+$i
    $spec=Get-OSCustomizationSpec -Name 'testSpec2' | New-OSCustomizationSpec  -Name "tmp01+$i" -Type NonPersistent | Set-OSCustomizationSpec -Name "tmp01+$i"
     Get-OSCustomizationNicMapping -Spec $spec| Set-OSCustomizationNicMapping -IpMode UseStaticIP -IpAddress $ip -SubnetMask '255.255.255.0' -Dns '10.35.45.5' -DefaultGateway '10.35.45.1' 
New-VM -Name $name `
    -VMHost $vmhost `
    -Template $template -Datastore DS3 `
    -OSCustomizationSpec $spec 
 }

 Start-Sleep -Seconds 540
 
 for ($j=1;$j -lt 3;$j++){
    $nameForStart=$nameBase+$j
    Start-VM -VM $nameForStart
 } 
