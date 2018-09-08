$vms = get-vm |?{$_.name -like "fc2*"}
$views = $vms|Get-View
foreach ($view in $views ) {
    write-host $view.name
    write-host $view.guest.guestfullname
}


$vms = get-vm -Name (gc .\fc2vms.txt)
$allobj = @()
$obj = New-Object -TypeName psobject -Property $props 
foreach ($vm in $vms) {
    $vmview = $vm|Get-View
    if ($vmview.config.GuestFullName -like "*windows*") {
        $OSc = $vmview.config.GuestFullName }
        else {
            $OSc="Not Windows"
        }
    $props = @{
        "vmName" = $vm.name;
        "OS"     = $OSc;
    }
    $obj = New-Object -TypeName psobject -Property $props 
    $allobj+=$obj
   }
   $allobj|Export-Excel 2fc2oss.xlsx


   $vms=Get-Vm -Name (gc .\fc2NOTonline.txt.txt)
   $obj = New-Object -TypeName psobject -Property $props 
   foreach ($vm in $vms){
       $vmview=$vm|Get-View
       $props=@{
           "vmName"=$vm.name;
           "OSName"=$vmview.guest.hostname;
           "OS"=$vmview.config.GuestFullName;
   
       }
       $obj = New-Object -TypeName psobject -Property $props 
       write-output $obj
   }
   