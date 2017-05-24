[CmdletBinding()]
Param
(
    # Param1 help description
    [Parameter(Mandatory=$true,
               ValueFromPipelineByPropertyName=$true,
               Position=0)]
    [string[]]
    $ComputerName,
    [switch]
    $NoFormat
    

)

    foreach ($computer in $ComputerName) 
    {
         
        try
        {     
'helloo world';       
            $wmi = Get-WmiObject -Class win32_USBControllerDevice -ComputerName $computer -ea Stop | ForEach-Object { [wmi]$_.dependent } 
        }
        catch 
        {
            Write-Error "Nedostupan $computer"
        }
        if ($PSBoundParameters.ContainsKey("NoFormat"))
        {
            $wmi 
        }
        else
        {
            $wmi | Where-Object {$_.status -eq 'error'} | Select-Object caption,description,manufacturer,deviceid,service,pscomputername  
        }
    }