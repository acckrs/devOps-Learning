$BIBErrorLogPreference = "C:\BIB-retries.txt"

function add-BIBwsusGroupMembership {

    <#
        .SYNOPSIS
            add-BIBwsusGroupMembership adds computers to wsus group
        .DESCRIPTION
            add-BIBwsusGroupMembership adds computers to wsus group(s).  
            Enter name of computers to add either comma separated or from get-content lista.txt
        .PARAMETER ComputerName
            Name  of computer. Pipelene input accepted 
        .PARAMETER groupName
            Name of group where the computer should be added
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
            get-content computers.txt | add-BIBwsusGroupMembership -groupName Test 
        .EXAMPLE
            add-BIBwsusGroupMembership -computerName computer1,computer2 -groupName "Test","Pilot" -errorLog c:\errors.txt -logErrors
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
        [ValidateSet("PreTest", "Test", "Pilot", "Prod1", "Prod2", "Prod3")]
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
}# end function add-BIBwsusGroupMembership

function remove-BIBwsusGroupMembership {

    <#
        .SYNOPSIS
            remove-BIBwsusGroupMembership removes computers from wsus group membership
        .DESCRIPTION
            remove-BIBwsusGroupMembership removes computers from wsus group(s).  
            Enter name of computers to remove, and group name from which to remove
        .PARAMETER ComputerName
            Name  of computer. Pipelene input accepted 
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
            get-content computers.txt | remove-BIBwsusGroupMembership -groupName Prod3
        .EXAMPLE
            remove-BIBwsusGroupMembership -computerName computer1,computer2 -groupName "Prod1","Prod3" -errorLog c:\errors.txt 
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
        [ValidateSet("PreTest", "Test", "Pilot", "Prod1", "Prod2", "Prod3")]
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
            
            Write-Verbose "Create obj $computer"
            $serv = $wsus.SearchComputerTargets("$computer")
            if (!$serv) {
                $props = @{
                    'Computer' = $computer;
                    'Groups'   = "Not in WSUS"
                }
            }
            else {
                $groups = ($serv[0].GetComputerTargetGroups())
                foreach ($group in $groups) {
                    $props = @{
                        'Computer' = $computer;
                        'Groups'   = $group.name
                    }
                    $obj = New-Object -TypeName psobject -Property $props 
                    $compObjs += $obj
                }# end foreach group
            } # end check if $computer exists in WSUS
        } # end forEach loop for computers
    } # end PROCESS block
    END {
        Write-Output $compObjs 
        Write-Verbose "Ending..." 
    }
}

function approve-BIBwsusPatch {
    <#
        .SYNOPSIS
            approve-BIBwsusPatch approves patches to wsus group(s)
        .DESCRIPTION
            approve-BIBwsusPatch approves patches to wsus group(s)
            Enter patche KB IDs (or any other unique descriptor) and the name(s) of groups for which they should be approved.
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
            Creation Date:  June 21th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            approve-BIBwsusPatch -patches "KB4022010" -groupName prod3  
        .EXAMPLE
            approve-BIBwsusPatch -patches (get-content listaPatcheva.txt) -groupName "prod1","prod2"
        #>
    [cmdletbinding(SupportsShouldProcess = $True)]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "KB patch ID")] 
        [ValidateNotNullOrEmpty()]
        [alias('kb')]
        [string[]] $patches,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Group name")] 
        [ValidateSet("PreTest", "Test", "Pilot", "Prod1", "Prod2", "Prod3")]
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
        Write-Verbose "Starting approving patches"
        foreach ($patch in $patches) {
            Write-Verbose "Create obj $computer"
            $update = $wsus.SearchUpdates("$patch")
            foreach ($group in $groupName) {
                if ($groupName.Count -gt 1) {
                    Write-Verbose "Loop through groups"
                }
                $membGrouptoPatch = $wsus.GetComputerTargetGroups() | where -FilterScript {$_.name -eq $group}
                write-verbose "Approving $patch to group $group"
                $update.Approve("Install", $membGrouptoPatch)   
            } # end forEach loop for groups
        } # end forEach loop for patches
    } # end PROCESS block
    END {
        Write-Verbose "Ending..." 
    }
}#end function approve-BIBwsusPatch
New-Alias -Name add-Wsus -Value add-BIBwsusGroupMembership
New-Alias -name rem-Wsus -Value remove-BIBwsusGroupMembership
New-Alias -Name get-Wsus -Value get-BIBwsusGroupMembership
New-Alias -name appr-Patch -Value approve-BIBwsusPatch

Export-ModuleMember -Variable BIBErrorLogPreference 
Export-ModuleMember -Function * -alias *