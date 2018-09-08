<#.Synopsis
   Import Performance monitor data collector from XML-file to a local\remote computers
.DESCRIPTION
   You can create an data collector set on remote or local computer from prepared xml-file template.
   You have to create template file using Windows perfomance monitor, and distribute it to set of computers.
   If data collector uses SQL database as datasource, necessary ODBC DSN will be automatically created on remote computer.
   In this case, you will be promted to specify credentials to access SQL Database
.EXAMPLE
   Use this statement if your data collector writes perfomance data into SQL database
   ImportPerfomanceDataCollector -ComputerName Comp1,Comp2 -XMLFilePath .\DataSet.xml -SQLServer SQLSRV1 -DataBase PerfData -Start
.EXAMPLE
   Use this statement if your data collector writes perfomance data into a blg-file
   ImportPerfomanceDataCollector -ComputerName Comp1,Comp2 -XMLFilePath .\DataSet.xml -Start
#>

[CmdletBinding()]
param (
    #Computer names separated by ','
    [String[]]$ComputerName = $env:COMPUTERNAME,
    #Path to xml template file
    [parameter(Mandatory=$True)] $XMLFilePath,
    #Name of data collector
    [parameter(Mandatory=$True)] $DataCollectorName,
    #Vaiable to pass credentials
    [Parameter(ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True)]
    [System.Management.Automation.PSCredential] $Credentials,
    #SQL Serve Name
    [String] $SQLServer,
    #SQL DataBase Name
    [String] $DataBase,
    #Start data collector
    [switch] $Start
)


$xml = Get-Content $XMLFilePath
$SQLDataCollector = $False
$DSNName =([xml]$xml).DataCollectorSet.PerformanceCounterDataCollector.DataSourceName
if($DSName -ne "")
{
    $SQLDataCollector = $True
    If($Credentials -eq $null)
    {
        $Credentials = Get-Credential -Message "Enter credentials to access SQL database"
    }
}

foreach ($Computer in $ComputerName)
{
    Write-Verbose "[$(Get-Date -Format "HH:mm:ss")] Creating Data Collector Set on $Computer"
    $ScriptBlock = {
        param(
            $DataCollectorName,
            $XML,
            $Start,
            $DSNName,
            $Credentials,
            $SQLServer,
            $DataBase,
            $SQLDataCollector
        )


        If($SQLDataCollector)
        {
            $RootPath = "HKLM:\SOFTWARE\ODBC\ODBC.INI" 
            If(!(Test-Path "$RootPath\$DSNName"))
            {
                New-Item $RootPath -Name $DSNName | Out-Null
            }
            if (!(Test-Path "$RootPath\ODBC Data Sources"))
            {
                New-Item $RootPath -Name "ODBC Data Sources" | Out-Null
            }
            New-ItemProperty -Path "$RootPath\ODBC Data Sources" -Name $DSNName -PropertyType String -Value "SQL Server"  -Force | Out-Null
            New-ItemProperty -Path $RootPath\$DSNName -Name "Database" -PropertyType String -Value $DataBase  -Force | Out-Null
            New-ItemProperty -Path $RootPath\$DSNName -Name "Driver" -PropertyType String -Value "C:\Windows\system32\SQLSRV32.dll"  -Force | Out-Null
            New-ItemProperty -Path $RootPath\$DSNName -Name "LastUser" -PropertyType String -Value "Citrix-Monitor"  -Force | Out-Null
            New-ItemProperty -Path $RootPath\$DSNName -Name "Server" -PropertyType String -Value $SQLServer  -Force | Out-Null
            New-ItemProperty -Path $RootPath\$DSNName -Name "Trusted_Connection" -PropertyType String -Value "Yes"  -Force | Out-Null           
        }

        $DataCollectorSet = New-Object -COM Pla.DataCollectorSet
        $DataCollectorSet.SetXml($xml)
        if($Credentials -ne $null)
        {
            $DataCollectorSet.SetCredentials("$($Credentials.UserName)","$($Credentials.GetNetworkCredential().Password)")
        }
        $DataCollectorSet.Commit("$DataCollectorName" , $null , 0x0003) | Out-Null
        If($Start)
        {
            $DataCollectorSet.Start($false)
        }
    }
    Invoke-Command -ComputerName $Computer -ArgumentList $DataCollectorName,$XML,$Start,$DSNName,$Credentials,$SQLServer,$DataBase,$SQLDataCollector -ScriptBlock $ScriptBlock
    Write-Verbose "[$(Get-Date -Format "HH:mm:ss")] Done"
}