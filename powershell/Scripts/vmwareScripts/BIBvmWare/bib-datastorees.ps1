    $BIBvmwareErrors = "C:\errors.txt"
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
        if ($global:DefaultVIServer) {
            Disconnect-VIServer -Server $global:DefaultVIServers  -Confirm:$false
        }
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
            
            $brojDS = $datastores.count 
            $datastoresObj = @()

            $sviDSfree = 0
            $sviDScapacity = 0

            foreach ($ds in $datastores) {
                
                write-verbose "---datastore is $ds---"
                $sviDSfree += $ds.FreespaceGB 
                $props = @{
                    "vCenter"     = $vcenter
                    "DatastoreName" = $ds.name;
                    "freeSpaceGB"      = $ds.FreespaceGB 
                }#end props splatting
                $obj = New-Object -TypeName psobject -Property $props 
                #$obj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
                $datastoresObj += $obj
            }#end foreach cluster loop
        
        }#end if $everythingOK
    }#end PROCESS block

    END {
        $totDSprop = @{
            "vCenter"     = $vcenter
            "DatastoreName" = "TOTAL";
            "freeSpaceGB"      =  $sviDSfree 
        }
        $totDSobj = New-Object -TypeName psobject -Property $totDSprop    
        #$cpuMEMobj.PSObject.TypeNames.Insert(0, 'BIB.clusterPerf')
        $datastoresObj += $totDSobj     
        
        write-output $datstoresObj 
       
        #disconnect-viserver -Server $vCenter -Confirm:$false 
    }
} #end function get-BIBdatastoreStats
Update-FormatData -PrependPath .\BIBvmWare.format.ps1xml    
get-BIBdatastoreStats -vCenter "ict-test1"  -verbose
