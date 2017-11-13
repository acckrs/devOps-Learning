function restart-BIBservice {

    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true,
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]] $serviceNames,
        [string] $errorLog = "C:\Acca\githubRepos\devOps-Learning\powershell\Scripts\test\errorLogs.txt",
        [switch] $logErrors
    )
    BEGIN {
        Write-Verbose "Starting get-serviceInfo" 
        $now = get-date
    }

    PROCESS {
        foreach ($service in $serviceNames) {
            
            try {
                $allOK = $true
                get-service $service -ea stop
            }
            catch {
                $allOK = $false
                Write-Warning "Failed to get services"
                
                if (!(test-path $errorLog)) {
                    Write-Warning "create errorLog"
                    write-verbose "Creating new error log at $errorLog"
                    new-item $errorLog 
                    Write-Warning "Writing error `"$($_.exception.message)`" to $errorLog" 
                    "$now`:  Failed to get services from $computer. `"$($_.exception.message)`" "| out-file -filePath $errorLog -Append
                } # check if errorLog exists. If no, create it and write error msg to it
                else {
                    Write-Warning "Writing error `"$($_.exception.message)`" to $errorLog" 
                    "$now`:  Failed to get services from $computer. `"$($_.exception.message)`" "| out-file -filePath $errorLog -Append
                }
                
            } # catch

            if ($allOK) {
                get-service $service |restart-service 
                "$now`: Restartovao sam servis $service " | Out-File -Append -filePath $errorLog 

            } # end if allOK
        } # 
    } # end PROCESS block

    END {}
} #end function restart-BIBservice

restart-BIBservice -serviceNames spoolerrr, spooler -logErrors:$true