function disable-scheduledTask {

    <#
        .SYNOPSIS
            disable-scheduledTask disables task with given name on computers
        .DESCRIPTION
            disable-scheduledTask disables task with given name on computers
            enter computer names and at least one task name
        .PARAMETER ComputerName
            Name  of computer. Pipelene input accepted 
        .PARAMETER TaskName
            Name of task to be disabled
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
            Creation Date:  July 03rd, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content computers.txt | disable-scheduledTask -taskName wsus
        .EXAMPLE
            disable-scheduledTask -computerName computer1,computer2 -taskName wsus,pm3 -errorLog c:\errors.txt 
        #>

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Computer name")] 
        [ValidateNotNullOrEmpty()]
        [alias('hostname')]
        [string[]] $computerName,

        <#[Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter the name of task to disable")] 
        [ValidateNotNullOrEmpty()]
        [alias('task')]
        [string[]] $taskName,#>

        [string] $errorLog = $BIBErrorLogPreference,

        [switch] $logErrors
    )
    BEGIN {
        $counter = 0
        Write-Verbose "BEGIN block: Error log will be $errorLog"
    }
    PROCESS {
        Write-Verbose "Starting Get-ComputerData"

        foreach ($computer in $computerName) {
            write-verbose "Disabling task wsus on $computer"
                schtasks /change  /s $computer /tn wsus /disable 
                $counter++
  
        } # end forEach loop for computers
    } # end PROCESS block

    END {
        Write-Verbose "Ending..." 
        Write-Verbose "Disabled task on $counter servers"
    }
}
disable-scheduledTask -computerName (gc servers.txt) -verbose