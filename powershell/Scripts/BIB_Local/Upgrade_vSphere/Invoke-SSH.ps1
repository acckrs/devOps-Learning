function Invoke-SSH {
    <#
    .SYNOPSIS
    Execute a command via SSH on a remote system.
    .DESCRIPTION
    Execute a command via SSH on a remote system.
    .PARAMETER Computer
    Computer to execute script/command against.
    .PARAMETER Credential
    PSCredential to use for remote authentication
    .PARAMETER Username
    Username to use for remote authentication
    .PARAMETER Password

    Password to use for remote authentication
    .PARAMETER FilePath
    Path to a script to execute on the remote machine
    .PARAMETER ScriptText
    ScriptText to execute on the remote system
    .EXAMPLE
    Invoke-SSH -Credential $Creds `
    -Computer 10.1.1.2 `
    -FilePath .\installtools.sh
    .EXAMPLE
    Invoke-SSH -Credential $Creds `
    -Computer $VM.name `
    -ScriptText 'rpm -qa' |
    Select-String ssh
    #>
    [CmdletBinding(DefaultParameterSetName = 'Command')]
    Param(
        [parameter(Mandatory = $True
            , ValueFromPipeline = $True
            , ValueFromPipelineByPropertyName = $True
            , HelpMessage = 'ip or hostname of remote computer'
            , ParameterSetName = 'Script'
        )]
        [parameter(Mandatory = $True
            , ValueFromPipeline = $True
            , ValueFromPipelineByPropertyName = $True
            , HelpMessage = 'ip or hostname of remote computer'
            , ParameterSetName = 'Command'
        )]
        [string]$Computer,
        [parameter(Mandatory = $False
            , ValueFromPipeline = $True
            , ParameterSetName = 'Script'
        )]
        [parameter(Mandatory = $False
            , ValueFromPipeline = $True
            , ParameterSetName = 'Command'
        )]
        [System.Management.Automation.PSCredential]$Credential,
        [parameter(ParameterSetName = 'Script')]
        [parameter(ParameterSetName = 'Command')]
        [string]$Username,
        [parameter(ParameterSetName = 'Script')]
        [parameter(ParameterSetName = 'Command')]
        [AllowEmptyString()]
        [string] $Password,

        [parameter(Mandatory = $True
            , ParameterSetName = 'Script'
            , ValueFromPipelineByPropertyName = $True
            , HelpMessage = 'Path to shell script'
        )]
        [ValidateScript( {Test-Path $_})]
        [Alias("PSPath", "FullName")]
        [string] $FilePath,
        [parameter(Mandatory = $True
            , ParameterSetName = 'Command'
            , ValueFromRemainingArguments = $True
            , HelpMessage = 'Command to execute'
        )]
        [string]$ScriptText
    )

    Begin {
        $PLink = "${env:ProgramFiles(x86)}\PuTTY\plink.exe", "plink.exe" |
            Get-Command -EA SilentlyContinue |
            Select-Object -First 1 -ExpandProperty Definition
        if (-not $PLink) {
            throw "PLink could not be found, please install putty!"
            exit 1;
        }
        if ($Credential) {
            $Cred = $Credential.GetNetworkCredential()
            $Username = $Cred.UserName
            $Password = $Cred.Password
        }
    }

    Process {
        switch ($PSCmdlet.ParameterSetName) {
            "Script" {
                & $Plink -l $Username -pw $Password $Computer -m $FilePath
            }
            "Command" {
                & $Plink -l $Username -pw $Password $Computer $ScriptText
            }
        }
    }
}

$VM = Get-VM nagios-test
Mount-Tools -VM $VM
Invoke-SSH -Username root `
-Password 'Simfuj5!' `
-Computer 10.35.39.22 `
-FilePath .\linux-vmtools-install.sh
$VM = Get-VM nagios-test
Dismount-Tools -VM $VM