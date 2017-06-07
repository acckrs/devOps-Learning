function get-BIBRemoteSmbShare {
    <#
        .SYNOPSIS
            get-BIBRemoteSmbShare retrieves smb shares info from up to 5 computers
        .DESCRIPTION
            get-BIBRemoteSmbShare retrieves smb shares info  from up to 5 computers. WinRM has to be enabled on remote computers, and firewall shouldn't block network traffic
        .PARAMETER ComputerName
            Name or IP address of computer 
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
        .PARAMETER rrrorLog
            the path to erro log file. Default is c:\errors.txt
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 07th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-content names.txt | get-BIBRemoteSmbShare 
        .EXAMPLE
           get-BIBRemoteSmbShare -computerName computer1,computer2 -errorLog c:\another\path\errors.txt 
        #>

    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [alias("hostname")]
        [validateCount(1, 5)]
        [String[]]$computerName,

        [string]$errorLog = "c:\errors.txt"
    )
    
    BEGIN {
        Write-verbose "Error log is $errorLog"
    }

    PROCESS {
        foreach ($computer in $computerName) {
            try {
                write-verbose "Getting shares from $computer"
                $everythingOk = $true
                $shares = invoke-command -ComputerName $computer -ScriptBlock {get-smbshare} -ErrorAction Stop -ev $errmsg
            }#end try
            catch {
                $time = get-date -format G
                $msg = "Failed getting system information from $computer."
                $everythingOk = $false
                Write-Warning $msg
                Write-Warning "Writing to log file: $time ERROR: $($_.exception.message)"
                if (!(test-path $errorLog)) {
                    new-item $errorLog
                    "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
                }
                else {
                    "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
                }
            }#end catch
            if ($everythingOk) {
                $shares = invoke-command -ComputerName $computer -ScriptBlock {get-smbshare} -ErrorAction Stop -ev $errmsg
                foreach ($share in $shares) {
                    $props = @{
                        "ComputerName"     = $computer;
                        "Sharename"        = $share.Name;
                        "SharePath"        = $share.path;
                        "ShareDescription" = $share.DESCRIPTION
                    }#end props splatting
                    $obj = New-Object -TypeName psobject -Property $props
                    $obj.PSObject.TypeNames.insert(0, "BIB.RemoteShareInfo")                    
                    Write-Output $obj
                }#end foreach share loop
            }#end if $everythingOK
        } #end forEach computer loop
    }#end PROCESS block

    END {}
} #end function get-BIBRemoteSmbShare
Update-FormatData -PrependPath .\BIBtools.format.ps1xml
get-BIBRemoteSmbShare -computerName "snow-mid-dev","se-bg-safeguard" -verbose