$DiskInfo= @()
$Vm = "sasmeta"
 
$i=0
 
 
$disks=Get-VM $vm| Get-HardDisk -DiskType "RawPhysical","RawVirtual"
$logtopart=Get-WmiObject -Class Win32_LogicalDiskToPartition -computername $VM
$disktopart=Get-WmiObject Win32_DiskDriveToDiskPartition -computername $VM
$logical=get-wmiobject win32_logicaldisk -computername $Vm
$volume=get-wmiobject win32_volume -computername $Vm
$partition=get-wmiobject win32_diskpartition -computername $Vm
if (($VmView = Get-View -ViewType VirtualMachine -Filter @{"Name" = $Vm})) {
    $WinDisks = Get-WmiObject -Class Win32_DiskDrive -ComputerName $VmView.Name
    foreach ($VirtualSCSIController in ($VMView.Config.Hardware.Device | where {$_.DeviceInfo.Label -match "SCSI Controller"})) {
        foreach ($VirtualDiskDevice in ($VMView.Config.Hardware.Device | where {$_.ControllerKey -eq $VirtualSCSIController.Key})) {
            $VirtualDisk = "" | Select SCSIController, DiskName, SCSI_Id, DiskFile,  DiskSize, WindowsDisk, NAA,drive, volumename
            $VirtualDisk.SCSIController = $VirtualSCSIController.DeviceInfo.Label
            $VirtualDisk.DiskName = $VirtualDiskDevice.DeviceInfo.Label
            $VirtualDisk.SCSI_Id = "$($VirtualSCSIController.BusNumber) : $($VirtualDiskDevice.UnitNumber)"
            $VirtualDisk.DiskFile = $VirtualDiskDevice.Backing.FileName
            $VirtualDisk.DiskSize = $VirtualDiskDevice.CapacityInKB * 1KB / 1GB
            $virtualdisk.naa=$disks|? {$_.name -like $VirtualDiskDevice.DeviceInfo.Label}|select -expand scsicanonicalname
 
 
 
 
            # Match disks based on SCSI ID
            $DiskMatch = $WinDisks | ?{($_.SCSIPort -2 ) -eq $VirtualSCSIController.BusNumber -and $_.SCSITargetID -eq $VirtualDiskDevice.UnitNumber}
            if ($DiskMatch){
                $VirtualDisk.WindowsDisk = "Disk $($DiskMatch.Index)"
            $i++
            }
            else {Write-Host "No matching Windows disk found for SCSI id $($VirtualDisk.SCSI_Id)"}
             
 
            $matchdisktopar=$disktopart|Where {$_.Antecedent -eq $diskmatch.__Path}
             $matchlogtopart=$logtopart| Where {$_.Antecedent -eq $matchdisktopar.Dependent}
             $logicalmatch=$logical| where {$_.path.path -eq $matchlogtopart.dependent}
             $VirtualDisk.volumename=$logicalmatch.volumename
             $virtualdisk.drive=$logicalmatch.deviceid
 
 
             $DiskInfo += $VirtualDisk
        }
    }
    $DiskInfo | Out-GridView
}
else {Write-Host "VM $Vm Not Found"}