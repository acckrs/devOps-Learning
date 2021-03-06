#postavljanje lokacije
Set-Location -path $([System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)); 

#template
$mailBodyTemplate=Get-Content '.\PSTfilesizeover40.htm'  | Out-String;
$defaultMail='ict_techsupport@bancaintesa.rs'; ###PODESITI###

#connect  
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString='Server=syssql; Database=dcinfo;trusted_connection=yes;Application name=mailAddressResolver';
$sqlSrv.Open();
$sqlcmd=$sqlsrv.CreateCommand();
$sqlcmd.CommandText='select * from [dbo].[v_PSTfilesizeover40]'; 
$dt=New-Object System.Data.DataTable;
$dt.Load($sqlcmd.ExecuteReader());
$dt | 
  %{$row=$_;
    $body=$mailBodyTemplate;
    $body=$body.Replace('#SIZE',  [math]::round($row.Size,2)); 
    $body=$body.Replace('#PST_FILE',$row.File_Path);
    $body=$body.Replace('#HOST',$row.Workstation);
    $to=$row.mail; if ($to.EndsWith('bancaintesa.rs') -eq $false) {$to=$defaultMail;};
    Write-Host '----------';
    $row;
    Send-MailMessage -Body $body `
	                -To $to `
					-Cc 'ict_techsupport@bancaintesa.rs'`
					-Subject 'Upozorenje o veličini PST datoteke na Vašem računaru' `
					-From 'ict_techsupport@bancaintesa.rs' `
					-SmtpServer mail `
					-BodyAsHtml `
					-Encoding $([System.Text.Encoding]::Unicode) ;
					

  }
#
Write-Host '----------';
Write-Host 'bye';
