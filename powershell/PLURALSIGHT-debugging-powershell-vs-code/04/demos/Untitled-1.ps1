. .\Get-ServiceProperty.ps1

#Get-ServiceProperty -Name remoteregistry -Property *

#Get-ServiceProperty -Name RemoteRegistry -Property StartName,DelayedAutoStart,PathName

Get-Service RemoteRegistry | Get-ServiceProperty

