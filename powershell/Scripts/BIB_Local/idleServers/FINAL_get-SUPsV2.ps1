Measure-Command {
[CmdletBinding()]
param
(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string[]]$server = $env:COMPUTERNAME
)
<#priprema konekcije za registrovanje vremena izmene
$sqlSrv = New-Object 'System.Data.SqlClient.SqlConnection';
$sqlSrv.ConnectionString = "Server=octopus; Database=SSMON; Integrated Security=false; User ID=smshost; Password=sh1234.";
$sqlSrv.Open();
#priprema commande
$sqlCmd = $sqlSrv.CreateCommand();
$sqlcmd.CommandText = '[enum].[RegServerUserProfile]';
$sqlCmd.CommandType = 'storedprocedure';
$sqlCmd.Parameters.Add('@hostName', [System.Data.SqlDbType]::VarChar) | Out-Null;
$sqlCmd.Parameters.Add('@userName', [System.Data.SqlDbType]::varchar) | Out-Null;
$sqlCmd.Parameters.Add('@tm', [System.Data.SqlDbType]::DateTime) | Out-Null;
#>

#inicijalizacija varijabli
    $w2k3Path = "C:\Documents and Settings"
    $w2k12Path = "C:\Users"
    $Win32OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $server
    $Build = $Win32OS.BuildNumber

function Obrada {
    $profili = Get-ChildItem $OSpath | ForEach-Object{Get-ChildItem $_.FullName  -Force -Filter "ntuser.dat"} 
    foreach ($profil in $profili) {
        $dir = Split-Path $profil.DirectoryName -Leaf
        $props = @{
            "ComputerName" = $Win32OS.CSName;
            "ProfileName"  = $dir;
            "LastModTime"  = $profil.lastwritetimeutc
        }        
        $obj = New-Object -TypeName psobject -Property $props
        if (($obj.profilename -notlike "*default*") -and ($obj.profilename -notlike "*All users*") ) {
                  
           <#Upisujem u bazu
            $sqlCmd.Parameters['@hostName'].Value = $obj.ComputerName
            $sqlCmd.Parameters['@userName'].Value = $obj.ProfileName
            $sqlCmd.Parameters['@tm'].Value = $obj.LastModTime;
            $sqlCmd.ExecuteNonQuery() | Out-Null;
            $sqlCmd.Parameters | % {$_.Value = [System.DBNull]}  # cicsenje parametara 
            #>  
            #kreiram i objekat  
    #        $rez = [ARRAY]$rez + $obj   
        }
    }
   # $rez
}

if ($Build -lt 6002) {
    # Ako je OS manji od W2K8
    $OSpath = $w2k3Path
    Obrada 
} 
else {
    # obrada ako je OS manji od Vista SP1g
    $OSpath = $w2k12Path
    Obrada
}

}