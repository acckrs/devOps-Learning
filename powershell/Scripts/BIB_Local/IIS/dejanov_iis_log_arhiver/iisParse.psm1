function ConvertFrom-IISLog
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        $FilePath = (gi '\\newapp-online-1\C$\inetpub\logs\LogFiles\W3SVC2\u_ex170411.log')


    )

    Begin
    {
        $fileStream =  New-Object System.IO.FileStream -ArgumentList $filePath,([System.IO.FileMode]::Open),([System.IO.FileAccess]::Read),([System.IO.FileShare]::ReadWrite) 
        $stream = New-Object System.IO.StreamReader -ArgumentList $fileStream
        
        $theResult = New-Object System.Collections.ArrayList

    }
    Process
    {
        Do
        {
            
            $line = $stream.ReadLine()
            if ($line -notmatch "^#")
            {
                $iis = $line | % { $pr = [ordered] @{} ; $pr.date, $pr.time, <#$pr.SiteName#>, $pr.IP, $pr.Method, $pr.URI, $pr.Query, [int] $pr.Port, $pr.Username, $pr.ServerIP, $pr.Agent, $pr.Referer, $pr.Status, $pr.Substatus, $pr.Win32Status, [int] $pr.BytesSent, [int] $pr.BytesReceived, $pr.TimeTaken = -split $_ ; $pr  } 
                if ($pr.date -and $pr.time)
                {                    
                    $DateTime = [datetime] ($pr.date + " " + $pr.time ) 
                    $iis.DateTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($DateTime, [System.TimeZoneInfo]::Local) 
                    $x = $theResult.Add([pscustomobject] $iis)

                }
            }
           
        
        }
        until
        ($line -eq $null)

    }
    End
    {
        $stream.Dispose()
        $fileStream.Dispose()
        $theResult # | select Datetime,IP,Method,uri,query,port,username,agent,status,substatus,win32status,timetaken
    }
}

function Out-DataTable
{

    [CmdletBinding()]
    [OutputType([System.Data.DataTable])]
    param(
        [Parameter( Position=0,
                    Mandatory=$true,
                    ValueFromPipeline = $true)]
        [PSObject[]]$InputObject,

        [string[]]$NonNullable = @()
    )

    Begin
    {
        $dt = New-Object Data.datatable  
        $First = $true 

        function Get-ODTType
        {
            param($type)

            $types = @(
                'System.Boolean',
                'System.Byte[]',
                'System.Byte',
                'System.Char',
                'System.Datetime',
                'System.Decimal',
                'System.Double',
                'System.Guid',
                'System.Int16',
                'System.Int32',
                'System.Int64',
                'System.Single',
                'System.UInt16',
                'System.UInt32',
                'System.UInt64')

            if ( $types -contains $type ) {
                Write-Output "$type"
            }
            else {
                Write-Output 'System.String'
            }
        } 
    }
    Process
    {
        foreach ($Object in $InputObject)
        {
            $DR = $DT.NewRow()  
            foreach ($Property in $Object.PsObject.Properties)
            {
                $Name = $Property.Name
                $Value = $Property.Value
                
                #RCM: what if the first property is not reflective of all the properties?  Unlikely, but...
                if ($First)
                {
                    $Col = New-Object Data.DataColumn  
                    $Col.ColumnName = $Name  
                    
                    #If it's not DBNull or Null, get the type
                    if ($Value -isnot [System.DBNull] -and $Value -ne $null)
                    {
                        $Col.DataType = [System.Type]::GetType( $(Get-ODTType $property.TypeNameOfValue) )
                    }
                    
                    #Set it to nonnullable if specified
                    if ($NonNullable -contains $Name )
                    {
                        $col.AllowDBNull = $false
                    }

                    try
                    {
                        $DT.Columns.Add($Col)
                    }
                    catch
                    {
                        Write-Error "Could not add column $($Col | Out-String) for property '$Name' with value '$Value' and type '$($Value.GetType().FullName)':`n$_"
                    }
                }  
                
                Try
                {
                    #Handle arrays and nulls
                    if ($property.GetType().IsArray)
                    {
                        $DR.Item($Name) = $Value | ConvertTo-XML -As String -NoTypeInformation -Depth 1
                    }
                    elseif($Value -eq $null)
                    {
                        $DR.Item($Name) = [DBNull]::Value
                    }
                    else
                    {
                        $DR.Item($Name) = $Value
                    }
                }
                Catch
                {
                    Write-Error "Could not add property '$Name' with value '$Value' and type '$($Value.GetType().FullName)'"
                    continue
                }

                #Did we get a null or dbnull for a non-nullable item?  let the user know.
                if($NonNullable -contains $Name -and ($Value -is [System.DBNull] -or $Value -eq $null))
                {
                    write-verbose "NonNullable property '$Name' with null value found: $($object | out-string)"
                }

            } 

            Try
            {
                $DT.Rows.Add($DR)  
            }
            Catch
            {
                Write-Error "Failed to add row '$($DR | Out-String)':`n$_"
            }

            $First = $false
        }
    } 
     
    End
    {
        Write-Output @(,$dt)
    }

} 

function ConvertFrom-TOMCATLog
{
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        $FilePath = (gi '\\newapp-online-1\C$\inetpub\logs\LogFiles\W3SVC2\u_ex170411.log')


    )

    Begin
    {
        $fileStream =  New-Object System.IO.FileStream -ArgumentList $filePath,([System.IO.FileMode]::Open),([System.IO.FileAccess]::Read),([System.IO.FileShare]::ReadWrite) 
        $stream = New-Object System.IO.StreamReader -ArgumentList $fileStream
        
        $theResult = New-Object System.Collections.ArrayList

    }
    Process
    {
        Do
        {
            
            $line = $stream.ReadLine()
            if ($line -notmatch "^#")
            {
                $line | % `
                {
                    $x = @{}
                    $x.Ip, $x.BigUser, $x.UserName, $x.date1, $x.date2, $x.meth1, $x.meth2, $x.meth3, $x.status, $x.bytesSent, $x.timeTaken  = -split $_
                    $dateTime2 = ($x.date1 -replace "\[")
                    $dateTime2 = $dateTime2 -match "(?<date>\d{2}\/\w.*\/\d{4}):(?<time>\d{2}\:\d{2}\:\d{2})"
                    $x.DateTime = [datetime] ( $Matches['date'] + " " + $Matches['Time'])
                    $log = [pscustomobject] $x | select DateTime,Username,@{l='BytesSent';e={ if (!$_.bytessent) { [system.dbnull]::Value } else { [int] $_.bytesSent }} }, @{ l='method' ; e= { $_.meth1 -replace '"' }},@{l='Page';e={$_.meth2}},IP,status,@{l='TimeTaken';e={if (!$_.timetaken) { [System.DBNull]::Value } else {[int] $_.timeTaken} }}
                    $y = $theResult.Add($log)
                }                    
                

                
            }
           
         
        }
        until
        ($line -eq $null)

    }
    End
    {
        $stream.Dispose()
        $fileStream.Dispose()
        $theResult # | select Datetime,IP,Method,uri,query,port,username,agent,status,substatus,win32status,timetaken
    }
}
