function get-BIBdatastoreStats {
    [cmdletbinding()]
    <#
        .SYNOPSIS
           get-BIBdatastoreStats retrieves datastore statistics for specified vCenter. 
        .DESCRIPTION
           get-BIBdatastoreStats retrieves datastore statistics for specified vCenter. Choose vCenter, enter credential. 
        .PARAMETER vCenter
            vCenter name to connect to.
        .PARAMETER errorLog
            The path to error log. Default is $BIBErrorLogPreference
        .NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 12th, 2017
            Purpose/Change: Initial script development
        
        .EXAMPLE
            get-BIBdatastoreStats-vcenter bib-vcentar-01
   #>

    param(
        [Parameter(Mandatory = $true)]
        [alias("vc")]
        [String]$vCenter,

        [string]$errorLog = $BIBvmwareErrors
    )
    
    BEGIN {
        Write-verbose "Error log is $errorLog"
        <#if ($global:DefaultVIServer) {
            Disconnect-VIServer -Server $global:DefaultVIServers  -Confirm:$false
        }#>
        write-verbose "Connecting to vCenter $vcenter"
        try {
            $everythingOk = $true
            connect-viserver $vcenter -ErrorAction Stop -ev $errmsg
        }#end try
        catch {
            $time = get-date -format G
            $msg = "Connecting to vCenter $vcenter failed."
            $everythingOk = $false
            Write-Warning $msg
            Write-Warning "Writing to error log file: $time ERROR: $($_.exception.message)"
            if (!(test-path $errorLog)) {
                new-item $errorLog
                "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
            }
            else {
                "$time ERROR: $($_.exception.message)`n" | Out-File $errorLog -Append
            }
        }#end catch
         
    } #end BEGIN block

    PROCESS {
        
        if ($everythingOk) {
            $datastores = get-datastore 
            $dsObj = @()
            $dsSum = 0
            $dsSumFree = 0
            $dsCount = $datastores.count

            foreach ($datastore in $datastores) {
                $propsDS = @{
                    "Datastore"            = $datastore.name;
                    "DatastoreCapacityGB"  = $datastore.CapacityGB;
                    "DataStoreFreeSpaceGB" = [math]::round($datastore.FreeSpaceGB,2);
                    "FreeSpace%"=[math]::round(($datastore.FreeSpaceGB/$datastore.CapacityGB)*100,0)
                }                    
                $obj = new-object -TypeName psobject  -Property $propsDS
                $dsObj += $obj
                $dsSum += $datastore.CapacityGB
                $dsSumFree += [math]::round($datastore.FreeSpaceGB,2)
            }# end foreach $datastore loop
        }#end if $everythingOK
    }#end PROCESS block

    END {
        $propsSUMDS = @{
            "Datastore"            = "TOTAL";
            "DatastoreCapacityGB"  = $dsSum;
            "DataStoreFreeSpaceGB" = $dsSumFree;
            "FreeSpace%"=[math]::round(($dsSumFree/$dsSum)*100,0)
        }                    
        $dsSumObj = new-object -TypeName psobject  -Property $propsSUMDS
        $dsObj += $dsSumObj
        Write-Output $dsObj | ft
        }

}
get-BIBdatastoreStats -vcenter "ict-test1" 