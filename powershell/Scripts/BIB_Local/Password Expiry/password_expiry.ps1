$maxpwdagedays=60
$dayswarn=7
[int]$Next=65
$Start=(Get-Date).AddDays(-$maxpwdagedays)
$End=(Get-Date).AddDays(-($maxpwdagedays-$next))

[string]$SearchBase=([ADSI]"LDAP://$env:userdnsdomain").distinguishedname


Get-ADUser -searchBase $SearchBase -filter {
     Enabled -eq $True -AND PasswordNeverExpires -eq $False -AND PasswordLastSet -ge $Start.Date -AND PasswordLastSet -le $End.Date
     } -properties SAMAccountName,PasswordLastSet  -ErrorAction SilentlyContinue | % {
	 
	 $username=$_.SAMAccountName
	 $pwdlastset=$_.PasswordLastSet
	 $age=(get-Date) - $pwdlastset
	 #Write-Host $username 
	 if ($age.Days -ge ($maxpwdagedays-$dayswarn)) {
	 if ( ($username -match "admin_([a-z]+)" ) -or `
	 	  ($username -match "([a-z]+)_prf" ) -or `
		  ($username -match "spec_([a-z]+)" )
		  ) {
	   
	   Write-Host "$($username) password age: $($age.Days) and appropriate user is:  $($matches[1])@deltabank.co.yu  password will expire in: $($maxpwdagedays - $age.Days)  days"
	   if ((Get-ADUser $($matches[1]) -properties mail).mail -ne $null) {
	   $to=(Get-ADUser $($matches[1]) -properties mail).mail
	   #$to = "$($matches[1])@deltabank.co.yu" 
	   }
	   }
	   elseif ($username -match "([a-z]+)") {
	   #Write-Host $matches[1]
	 	if ((Get-ADUser $username -properties mail).mail -ne $null) {
		 $to=(Get-ADUser $username -properties mail).mail
		}
		else {$to="sysadmin@bancaintesa.rs"}
		Write-Host "UsrName=$($username),AprUser=$($matches[1]),PswExr=$($maxpwdagedays - $age.Days), mailTo=[$to]"
	 }
	   	  

     
	 $daysleft=$maxpwdagedays - $age.Days

 
	Add-PSSnapin Microsoft.Exchange.Management.Powershell.Admin -erroraction silentlyContinue
	$smtpServer = "mail"
	$att = new-object Net.Mail.Attachment("C:\temp\image001.gif")
	$att.ContentId = "att"
	$msg = new-object Net.Mail.MailMessage
	$smtp = new-object Net.Mail.SmtpClient($smtpServer)
	$style = “BODY{font-family: Arial; font-size: 10pt;}”
	$body = @"
	<font face="Calibri">Poštovani,<br/><br/>
	Vaša lozinka ističe za <b><font color=green>$($daysleft) dan(a)</b></font>. Promenite Vašu lozinku pre isteka roka za korisničko ime <b><font color=green>$($username)</b></font>. <br/>
	<font face="Calibri" size="2" color="#696969"><a href="http://windows.microsoft.com/en-us/windows/change-windows-password#change-windows-password=windows-7">Uputstvo za promenu lozinke</font></a><br/> <br/>

	<font face="Calibri" size="2" color="#696969">Služba za ICT Sistemsku Infrastrukturu</font><br/>
	<font face="Calibri" size="2" color="#696969">Sektor za Informacione i Komunikacione Tehnologije</font><br/><br/>

	<img src="cid:att" /></font> <br/><br/>
	<font face="Calibri" size="2" color="#696969">Omladinskih Brigada 90b</font><br/>
	<font face="Calibri" size="2" color="#696969">11070 Novi Beograd</font><br/> 
	<font face="Calibri" size="2" color="#696969">Tel: 011 201 66 20; IP: 11620</font><br/>

	<font face="Calibri" size="2" color="#696969"><a href="http://www.bancaintesa.rs">www.bancaintesa.rs</font></a><br/>
	<font face="Calibri" size="2" color="#696969"><a href="mailto:sysadmin@bancaintesa.rs" >sysadmin@bancaintesa.rs</font></a>

	</font> 

"@
	$msg.From = "Password Expiry <sysadmin@bancaintesa.rs>"
	#$msg.To.Add("sysadmin@bancaintesa.rs")
	#Write-Host $to
	#$msg.To.Add("amir.zahirovic@bancaintesa.rs")
	$msg.To.Add($to)
	$msg.Subject = "Promena lozinke"
	$msg.Body = $body
	$msg.IsBodyHTML = $true
	$msg.Attachments.Add($att)
	#$smtp.Send($msg)
	$att.Dispose()
	$to = $null 
	 }

	}
	 