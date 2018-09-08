function Get-HBAWin {  
    param(  
    [String[]]$ComputerName = $ENV:ComputerName, 
    [Switch]$LogOffline  
    )  
    $computername=gc .\serveri.txt      
    $ComputerName | ForEach-Object {  
    try { 
        $Computer = $_ 
         
        $Params = @{ 
            Namespace    = 'root\WMI' 
            Class        = 'MSFC_FCAdapterHBAAttributes'  
            ComputerName = $Computer  
            ErrorAction  = 'Stop' 
            } 
         
        Get-WmiObject @Params  | ForEach-Object {  
            $InstanceName = $_.InstanceName -replace '\\','\\' 
            $Params['class']='MSFC_FibrePortHBAAttributes' 
            $Params['filter']="InstanceName='$InstanceName'"  
            $Ports = @(Get-WmiObject @Params | Select -Expandproperty Attributes | % { ($_.PortWWN | % {"{0:x2}" -f $_}) -join ":"}) 
            #$NodeWWN = @(Get-WmiObject @Params | Select -Expandproperty Attributes | % { ($_.NodeWWN | % {"{0:x2}" -f $_}) -join ":"}) 
     
            $hash=@{  
                    ComputerName     = $_.__SERVER  
                    NodeWWN          = (($_.NodeWWN) | ForEach-Object {'{0:x2}' -f $_}) -join ':' 
                    PortWWN          = $Ports 
                    Active           = $_.Active  
                    DriverName       = $_.DriverName  
                    DriverVersion    = $_.DriverVersion  
                    FirmwareVersion  = $_.FirmwareVersion  
                    Model            = $_.Model  
                    ModelDescription = $_.ModelDescription 
                    UniqueAdapterId  = $_.UniqueAdapterId 
                    NumberOfPorts    = $_.NumberOfPorts 
                      }  
                New-Object psobject -Property $hash  
            }#Foreach-Object(Adapter)  
    }#try 
    catch { 
        Write-Warning -Message "$Computer is offline or not supported" 
        if ($LogOffline) 
        { 
            "$Computer is offline or not supported" >> "$home\desktop\Offline.txt" 
        } 
    } 
     
    }#Foreach-Object(Computer)  
      
    }#Get-HBAWin
    Get-HBAWin