#Startuj logovanje skripte
Start-Transcript -Path 'C:\SchTask\Password Expiry\log.txt'
#############################
$maxpwdagedays=60
$dayswarn=7
$Start=(Get-Date).AddDays(-($maxpwdagedays)-5);
$End=(Get-Date).AddDays(-($maxpwdagedays-$dayswarn));
[string]$SearchBase=([ADSI]"LDAP://$env:userdnsdomain").distinguishedname
Get-ADUser -searchBase $SearchBase `
    -filter {Enabled -eq $True -AND PasswordNeverExpires -eq $False -AND PasswordLastSet -ge $Start.Date -AND PasswordLastSet -le $End.Date} `
    -properties SAMAccountName,PasswordLastSet  | 
    % {
	     $username=$_.SAMAccountName
	     $pwdlastset=$_.PasswordLastSet
	     $age=(get-Date) - $pwdlastset
         $daysleft=$maxpwdagedays - $age.Days
         $to='sysadmin@bancaintesa.rs';
         $aprUsr=$username;

         if ( ($username -match "admin_([a-z]+)" ) -or `
	          ($username -match "([a-z]+)_prf" ) -or `
		      ($username -match "spec_([a-z]+)" )
		  ) {
	        $aprUsr=$matches[1];
	        if ((Get-ADUser $aprUsr -properties mail).mail -ne $null) {$to=(Get-ADUser $aprUsr -properties mail).mail}
	      }
          else {
            if ((Get-ADUser $username -properties mail).mail -ne $null) {
		      $to=(Get-ADUser $username -properties mail).mail
            }
	      }

          Add-PSSnapin Microsoft.Exchange.Management.Powershell.Admin -erroraction silentlyContinue
	      $smtpServer = "mail"
	      $att = new-object Net.Mail.Attachment("C:\temp\image001.gif")
	      $att.ContentId = "att"
	      $msg = new-object Net.Mail.MailMessage
	      $smtp = new-object Net.Mail.SmtpClient($smtpServer)
	      $style = “BODY{font-family: Arial; font-size: 10pt;}”
  	      $body = @"
	<font face="Calibri">Poštovana(i) <b><font color=green>$($username)</b></font>,<br/>
	Vaša lozinka ističe za <b><font color=green>$($daysleft) dan(a)</b></font>.<br/>
    Da bi ste promenili lozinku pritisnite tastere CTRL+ALT+DELETE i izaberite „Change a password...“<br/>
    Srdačan pozdrav<br/><br/>

    Dear <b><font color=green>$($username)</b></font>,<br/>
    Your password will expire in <b><font color=green>$($daysleft) day(s)</b></font><br/>
    To change your password, press CRTL+ALT+DELETE and then click „Change a password...“<br/>
    Best regards<br/><br/>

	<img src="cid:att" /></font> <br/><br/>
	</font> 
"@
	    $msg.From = "sysadmin.no-reply@bancaintesa.rs"
	    $msg.To.Add($to)
        #$msg.To.Add("zarko.vuksanovic@bancaintesa.rs")
	    $msg.Subject = "Obaveštenje o isticanju passworda/consider changing your password"
	    $msg.Body = $body
	    $msg.IsBodyHTML = $true
	    $msg.Attachments.Add($att)
        Write-Host "UsrName=$($username),AprUser=$aprUsr,PswExp=$daysleft, mailTo=[$to]"
	    $smtp.Send($msg)
	    $att.Dispose()
	    $to = $null 
	}

#Stopiraj logovanje skripte
Stop-Transcript
Send-MailMessage -SmtpServer mail -From "no.reply-sysadmin@bancaintesa.rs" -Subject Pass Expiry log -Attachments "C:\SchTask\Password Expiry\log.txt" -To "zarko.vuksanovic@bancaintesa.rs" 