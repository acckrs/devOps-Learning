param (
    [string[]]$computerName
)
foreach ($computer in $computerName){
   try {
    $session = New-CimSession -ComputerName $computer  -ErrorAction Stop
    $os= Get-CimInstance -CimSession $session -ClassName win32_operatingsystem
    $cs= Get-CimInstance -CimSession $session -ClassName win32_computersystem   

    $properties=@{computerName=$computer
                  status='Connected'
                  SPVersion=$os.ServicePackMinorVersion # .ServicePackMajorVersion
                  OSVersion=$os.version
                  Model=$cs.Model
                  RAM=$cs.TotalPhysicalMemory/1GB
                  Mfgr=$cs.Manufacturer}

    }
    catch{

    $properties=@{computerName=$computer
                  status='Disconnected'
                  SPVersion=$null
                  OSVersion=$null
                  Model=$null
                  RAM=$null
                  Mfgr=$null}
        }
        finally {
            $obj = New-Object -TypeName psobject -Property $properties 
            Write-output $obj
        }
}