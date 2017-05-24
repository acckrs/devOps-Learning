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
            $wmi = gwmi -Class win32_USBControllerDevice -ComputerName $computer -ea Stop | % { [wmi]$_.dependent } 
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
            $wmi | ? {$_.status -eq 'error'} | select caption,description,manufacturer,deviceid,service,pscomputername  
        }
    }