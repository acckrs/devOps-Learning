param (
    [string[]]$computerName
)
foreach ($computer in $computerName){
    $session = New-CimSession -ComputerName $computer 
    $os= Get-CimInstance -CimSession $session -ClassName win32_operatingsystem
    $cs= Get-CimInstance -CimSession $session -ClassName win32_computersystem   

    $properties=@{computerName=$computer
                  SPVersion=$os.ServicePackMinorVersion # .ServicePackMajorVersion
                  OSVersion=$os.version
                  Model=$cs.Model
                  freeRAM=$cs.TotalPhysicalMemory/1GB
                  Mfgr=$cs.Manufacturer}

    $obj = New-Object -TypeName psobject -Property $properties 
    Write-output $obj
}