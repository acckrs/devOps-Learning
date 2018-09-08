[CmdletBinding()]
param
(
    [Parameter()]
    [ValidateScript( { Test-Connection -ComputerName $_ -Quiet -Count 1 })]
    [ValidateNotNullOrEmpty()]
    [string[]]$server = $env:COMPUTERNAME
)
#priprema konekcije za registrovanje vremena izmene
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


#inicijalizacija varijabli
$w2k3Path = "C:\Documents and Settings"
$w2k12Path = "C:\Users"

function Obrada {
    if ($PSver -lt 3) {
        $profili = gci $OSpath -filter ntuser.dat -Recurse -force -ErrorAction SilentlyContinue  
        foreach ($profil in $profili) {
            $dir = Split-Path $profil.DirectoryName -Leaf
            $props = @{
                "ComputerName" = $Win32OS.CSName;
                "OS"           = $OSCaption;
                "ProfileName"  = $dir;
                "LastModTime"  = $profil.lastwritetimeutc
            }        
            $obj = New-Object -TypeName psobject -Property $props
            if (($obj.profilename -notlike "*default*")-and($obj.profilename -notlike "*All Users*")) {
                  
                #Upisujem u bazu
                $sqlCmd.Parameters['@hostName'].Value = $obj.ComputerName
                $sqlCmd.Parameters['@userName'].Value = $obj.ProfileName
                $sqlCmd.Parameters['@tm'].Value = $obj.LastModTime;
                $sqlCmd.ExecuteNonQuery() | Out-Null;
                $sqlCmd.Parameters | % {$_.Value = [System.DBNull]}  # cicsenje parametara 
              
                #kreiram i objekat  
                $rez = [ARRAY]$rez + $obj   
            }
        }
        $rez
    }
    else {
        $profili = gci $OSpath ntuser.dat -Recurse  -Attributes h -Depth 1 -ErrorAction SilentlyContinue
        $rez = @()
        foreach ($profil in $profili) {
            $dir = Split-Path $profil.DirectoryName -Leaf
            $props = @{
                "ComputerName" = $Win32OS.CSName;
                "OS"           = $OSCaption;
                "ProfileName"  = $dir;
                "LastModTime"  = $profil.lastwritetimeutc
            }
            $obj = New-Object -TypeName psobject -Property $props
            if ($obj.profilename -notlike "*default*") {
                         
                #Upisujem u bazu
                $sqlCmd.Parameters['@hostName'].Value = $obj.ComputerName
                $sqlCmd.Parameters['@userName'].Value = $obj.ProfileName
                $sqlCmd.Parameters['@tm'].Value = $obj.LastModTime;
                $sqlCmd.ExecuteNonQuery() | Out-Null;
                $sqlCmd.Parameters | % {$_.Value = [System.DBNull]}  # cicsenje parametara 

                #kreiram i objekat  
                $rez += $obj    
            }
        }
        $rez
    }
}

$Win32OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $server
$OSCaption = $win32OS.caption
$Build = $Win32OS.BuildNumber
$PSver = $psversiontable.psversion.Major

if ($Build -lt 6002) {
    # Ako je OS manji od W2K8
    $OSpath = $w2k3Path
    ####Pozovi funkciju####
    obrada 
} #kraj obrade ako je OS manji od W2k8
else {
    # obrada ako je OS manji od Vista SP1g
    $OSpath = $w2k12Path
    if ($build -le 7601) {
        # Ako je OS W2K8
        ####Pozovi funkciju####
        Obrada
    }
    else {
        #svi  OS > W2k8
        ####Pozovi funkciju####
        Obrada
    }
}



