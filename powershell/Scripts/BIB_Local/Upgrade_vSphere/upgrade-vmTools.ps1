Get-View -ViewType "VirtualMachine" `
    -Property Guest, Name `
    -Filter @{
    "Guest.GuestFamily" = "windowsGuest";
    "Guest.ToolsStatus" = "ToolsOld";
    #"Guest.GuestState"  = "^running$"
}|
    Get-VIObjectByVIView |
    Update-Tools -NoReboot

    New-VIProperty -Name ToolsVersion -ObjectType VirtualMachine  -ValueFromExtensionProperty 'Config.tools.ToolsVersion'   -Force