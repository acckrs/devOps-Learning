function get-BIBwsusGroupMembership {

    <#
        .SYNOPSIS
            get-BIBwsusGroupMembership retrieves computers' wsus group membership 
        .DESCRIPTION
            get-BIBwsusGroupMembership retrieves computers' wsus group membership 
            Enter name of computers to query
        .PARAMETER ComputerName
            Name  of computer. Pipelene input accepted 
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
        .PARAMETER logError
            Switch parameter to log or not to log errors. If not specified, default is not to log (false)
        .INPUTS
            None
        .OUTPUTS
             Log file stored in $errorLog
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  June 16th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content computers.txt | get-BIBwsusGroupMembership 
        .EXAMPLE
            get-BIBwsusGroupMembership -computerName computer1,computer2 -errorLog c:\errors.txt 
        #>

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Computer name")] 
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [string] $errorLog = $BIBErrorLogPreference,
        [switch] $logErrors
    )
    BEGIN {
        [void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")            
        $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer("wsus1", $False)
        Write-Verbose "BEGIN block: Error log will be $errorLog"
    }
    PROCESS {
        Write-Verbose "Starting Get-ComputerData"
        $compObjs = @()
        foreach ($computer in $computerName) {
            
            Write-Verbose "Computer $computer loop"
            $serv = $wsus.SearchComputerTargets("$computer")
            if (!$serv) {
                $props = @{
                    'Computer' = $computer;
                    'Groups'   = "Not in WSUS"
                }
                $obj = New-Object -TypeName psobject -Property $props 
                $compObjs += $obj
            }
            else {
                $groups = ($serv[0].GetComputerTargetGroups()) | where {$_.name -ne 'All Computers'}
                foreach ($group in $groups) {
                    $props = @{
                        'Computer' = $computer;
                        'Groups'   = $group.name
                    }
                    write-verbose "Group $group loop" 
                    $obj = New-Object -TypeName psobject -Property $props 
                    $compObjs += $obj
                }# end foreach group
            } 
            # end check if $computer exists in WSUS
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Output $compObjs 
        Write-Verbose "Ending..." 
    }
}
get-BIBwsusGroupMembership -computerName "FC2XenApp-DEV01" -verbose