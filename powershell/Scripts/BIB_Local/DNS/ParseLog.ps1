## The log file you specified in the debug logging dialog box
$DnsDebugLogFilePath = '\\dc-parma-12\c$\temp\Dnslog6.log'
$OutputFilePath = 'C:\Acca\Powershell_local\BIB\DNS\DNSDebugLogSummary.csv'
## Find all of the DNS server IPs in the current domain
$DnsServerIPs = ((Get-ADDomain).ReplicaDirectoryServers | Resolve-DnsName).IPAddress
 
## Find all lines in the log file that don't contain the strings 'NOERROR' or are blank.  This
## retrieves only the lines with errors in them.
Select-String -Pattern 'NOERROR|^\s*$' -Path $DnsDebugLogFilePath -NotMatch | foreach {
    try {
        ## Find lines containing an IP address
        if ($_.Line -match '\b(?:\d{1,3}\.){3}\d{1,3}\b') {
            $IP = $Matches[0]
            ## If the IP isn't a DNS server it must be a client IP
            if ($DnsServerIPs -notcontains $IP) {
                Write-Verbose "Processing IP '$IP'"
                $Split = $_.Line.Split(' ')
                $Date = $Split[0]
                $Time = $Split[1] + $Split[2]
                $Err = [regex]::Match($_.Line, '\[(.*)\]').Groups[1].Value
                [pscustomobject]@{ 'Date' = "$Date $Time"; 'IP' = $IP; 'Error' = $Err }
            }
        }
    } catch {
        Write-Warning $_.Exception.Message
    }
}| Export-Csv -Path $OutputFilePath -Append -NoTypeInformation

