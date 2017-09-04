Connect-VIServer -Server "dr-vcentar"
$vms = get-resourcepool -name "dr" | get-vm 
$vms | 
$vms | Get-NetworkAdapter |group parent |select parent,connectionstate| Set-NetworkAdapter -Connected:$true -StartConnected:$true -Confirm:$false 