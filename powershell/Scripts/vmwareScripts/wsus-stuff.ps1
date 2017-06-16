$BIBErrorLogPreference = "C:\BIB-retries.txt"

function add-wsusGroupMembership {

    <#
        .SYNOPSIS
            add-wsusGroupMembership adds computers to wsus group
        .DESCRIPTION
            change-wsusGroupMembership adds computers to wsus group(s).  
            Enter name of computers to query
        .PARAMETER ComputerName
            Name  of computer. pipelene input accepted 
        .PARAMETER groupName
            Name of group in which computer should be added
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
            get-content computers.txt | add-wsusGroupMembership -group 
        .EXAMPLE
            add-wsusGroupMembership -computerName computer1,computer2 -errorLog c:\errors.txt -logErrors
        #>

    [cmdletbinding(SupportsShouldProcess = $True)]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Computer name")] 
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Group name")] 
        [ValidateSet("PreTest", "Test", "Prod3", "Pilot")]
        [ValidateNotNullOrEmpty()]
        [string[]] $groupName,


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
        foreach ($computer in $computerName) {
            Write-Verbose "Create obj $computer"
            $serv = $wsus.SearchComputerTargets("$computer")
            foreach ($group in $groupName) {
                Write-Verbose "loop through groups"
                $membGrouptoAdd = $wsus.GetComputerTargetGroups() | where -FilterScript {$_.name -eq $group}
                write-verbose "add computer $computer to group $group"
                $membGrouptoAdd.AddComputerTarget($serv[0])   
            } # end forEach loop for groups
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending..." 
    }
}

function remove-wsusGroupMembership {

    <#
        .SYNOPSIS
            remove-wsusGroupMembership removes computers from wsus group membership
        .DESCRIPTION
            remove-wsusGroupMembership removes computers from wsus group(s).  
            Enter name of computers to query
        .PARAMETER ComputerName
            Name  of computer. pipelene input accepted 
        .PARAMETER groupName
            Name of group from which computer should be removed
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
            get-content computers.txt | remove-wsusGroupMembership -group 
        .EXAMPLE
            remove-wsusGroupMembership -computerName computer1,computer2 -errorLog c:\errors.txt 
        #>

    [cmdletbinding(SupportsShouldProcess = $True)]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Computer name")] 
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            HelpMessage = "Group name")] 
        [ValidateSet("PreTest", "Test", "Prod3", "Pilot")]
        [ValidateNotNullOrEmpty()]
        [string[]] $groupName,


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
        foreach ($computer in $computerName) {
            Write-Verbose "Create obj $computer"
            $serv = $wsus.SearchComputerTargets("$computer")
            foreach ($group in $groupName) {
                Write-Verbose "loop through groups"
                $membGrouptoRemove = $wsus.GetComputerTargetGroups() | where -FilterScript {$_.name -eq $group}
                write-verbose "removing computer $computer from group $group"
                $membGroupToremove.RemoveComputerTarget($serv[0])   
            } # end forEach loop for groups
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending..." 
    }
}

function get-wsusGroupMembership {

    <#
        .SYNOPSIS
            get-wsusGroupMembership retrieves computers wsus group membership 
        .DESCRIPTION
            get-wsusGroupMembership retrieves computers wsus group membership 
            Enter name of computers to query
        .PARAMETER ComputerName
            Name  of computer. pipelene input accepted 
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
            get-content computers.txt | get-wsusGroupMembership 
        .EXAMPLE
            get-wsusGroupMembership -computerName computer1,computer2 -errorLog c:\errors.txt 
        #>

    [cmdletbinding(SupportsShouldProcess = $True)]
    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
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
        foreach ($computer in $computerName) {
            
            Write-Verbose "Create obj $computer"
            $serv = $wsus.SearchComputerTargets("$computer")
            if (!$serv) {
                $props = @{
                    'Computer' = $computer;
                    'Groups'   = "Not in WSUS"
                }
            }
            else {
                $groups = ($serv[0].GetComputerTargetGroups() | where -FilterScript {$_.name -ne "All Computers"}).name
                $props = @{
                    'Computer' = $computer;
                    'Groups'   = $groups
                }
            }
            $obj = New-Object -TypeName psobject -Property $props 
            write-output $obj 
            
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Verbose "Ending..." 
    }
}

get-wsusGroupMembership  -computerName ("FC1XENAPPDBDEV1","FC1XENAPP-DEV01","FC1XENAPP-DEV02","FC1XENAPP-DEV03","FC1XENAPPPFDEV1")  -verbose