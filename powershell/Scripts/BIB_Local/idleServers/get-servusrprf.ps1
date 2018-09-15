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
$prfpath=(dir $($env:SystemDrive+'\') | ?{"_$($_.Name)_" -match '_Users_|_Documents and settings_'}).FullName  

dir $prfPath | 
    ? {!($_.Name -match 'All users|default')} |
    % {$uName = $_.Name;
    $pfile = Get-ChildItem $_.FullName  -Force -Filter "ntuser.dat";
    if ($pFile -ne $null) {
        #write-host $uName, $pfile.LastWriteTime;
        #Upisujem u bazu
        $sqlCmd.Parameters['@hostName'].Value = $env:COMPUTERNAME
        $sqlCmd.Parameters['@userName'].Value = $uName
        $sqlCmd.Parameters['@tm'].Value = $pfile.LastWriteTime
        $sqlCmd.ExecuteNonQuery() | Out-Null;
        $sqlCmd.Parameters | % {$_.Value = [System.DBNull]}  # cicsenje parametara 
    }
}
"OK"



exit 0
