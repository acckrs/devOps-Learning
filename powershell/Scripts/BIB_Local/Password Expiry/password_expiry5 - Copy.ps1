#Startuj logovanje skripte
Start-Transcript -Path 'C:\SchTask\Password Expiry\log.txt'
#############################
$dayswarn=15

#[string]$SearchBase=([ADSI]"LDAP://$env:userdnsdomain").distinguishedname

Get-ADUser -filter {Enabled -eq $True -AND PasswordNeverExpires -eq $False} –Properties "SAMAccountName", "msDS-UserPasswordExpiryTimeComputed", "mail", "DisplayName", "SAMAccountName"  |
Where-Object { [datetime]::FromFileTime(($_)."msDS-UserPasswordExpiryTimeComputed") -le [datetime]::Now.AddDays($dayswarn) -and `
			   [datetime]::FromFileTime(($_)."msDS-UserPasswordExpiryTimeComputed") -ne '01.01.1601 01:00:00' -and `
			   [datetime]::FromFileTime(($_)."msDS-UserPasswordExpiryTimeComputed") -gt [datetime]::Now} |           
Select-Object -Property "DisplayName" `
					   ,"SAMAccountName" `
					   ,"mail" `
					   ,@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} `
					   ,@{Name="DaysLeft";Expression={[math]::Round(([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")-[datetime]::Now).TotalDays)-1}} | 

    % {
		 $skipmail=$false
	     $username=$_.SAMAccountName
         if ($_.mail -eq $null) {
		 $to = 'sysadmin@bancaintesa.rs'
		 } else {
		 $to=$_.mail 
		 }
		 
		 $aprUsr=$username;

		#sredi admin naloge
         if ( ($username -match "admin_([a-z]+)" ) -or `
	          ($username -match "([a-z]+)_prf" ) -or `
		      ($username -match "spec_([a-z]+)" )
		  ) {
		  	  $aprUsr=$matches[1];
	       
			 if ((Get-ADUser $username -properties mail).mail -ne $null){
			 $to=(Get-ADUser $username -properties mail).mail
			 }
			 else {$to=(Get-ADUser $aprUsr -properties mail).mail}
			 
		#sredi naloge koji nam ne trebaju

			}
		     else {
			       if(
				   ($username -match "[a-z]+\.[a-z]+" -or `
				    $username -match "testcomplete([0-9]+)" -or `
					$username -match "op\.[a-z]+" -or `
					$username -match "ug\.[a-z]+" -or `
					$username -match "adv\.[a-z]+") -and  `
                   !( $username -match "ud\.[a-z]+")
				   
				   ){
	               $skipmail = $true
	               }
				   }
	#Write-Host "$($username) , $($_.DisplayName), $($_.ExpiryDate.ToString('yyyy-MM-dd HH:mm:ss')), to je za : $($_.DaysLeft) dana, na mail: $($to) "
	
	
		  Add-PSSnapin Microsoft.Exchange.Management.Powershell.Admin -erroraction silentlyContinue
	      $smtpServer = "mail"
	      $att = new-object Net.Mail.Attachment("C:\temp\image001.gif")
	      $att.ContentId = "att"
	      $msg = new-object Net.Mail.MailMessage
	      $smtp = new-object Net.Mail.SmtpClient($smtpServer)
	      $style = “BODY{font-family: Arial; font-size: 10pt;}”
  	      $body = @"
<font face="Calibri">Poštovana(i) ,<br/>
Lozinka za Vaš korisnički nalog <b><font color=green>$($username)</b></font> ističe za <b><font color=green>$($_.DaysLeft) dan(a)</b></font>.<br/>
Da bi ste promenili lozinku pritisnite tastere CTRL+ALT+DELETE i izaberite „Change a password...“<br/>
Srdačan pozdrav<br/><br/>

Dear ,<br/>
Password for your account <b><font color=green>$($username)</b></font> will expire in <b><font color=green>$($_.DaysLeft) day(s)</b></font><br/>
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
        
	    if ($skipmail -eq $true) {
		  Write-Host "UsrName=$($username),AprUser=$aprUsr,PswExp=$daysleft, mailTo=NOT SENDING MAIL"
		}
		else {
		  Write-Host "UsrName=$($username),AprUser=$aprUsr,PswExp=$daysleft, mailTo=[$to]"
		  $smtp.Send($msg)
		}
	    $to = $null 

} 	
##Stopiraj logovanje skripte
Stop-Transcript
#
Send-MailMessage -SmtpServer mail -From "no.reply-sysadmin@bancaintesa.rs" -Subject "Pass Expiry log" -Attachments "C:\SchTask\Password Expiry\log.txt" -To "zarko.vuksanovic@bancaintesa.rs" 