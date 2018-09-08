#send-mailmessage -from "sysadmin.no-reply@bancaintesa.rs" -to "zarko.vuksanovic@bancaintesa.rs"  -subject "Password Expiry" -body "Log analiziranih korisnika" -Attachments "C:\SchTask\Password Expiry\log.txt" -priority Normal -dno onSuccess, onFailure -smtpServer mail
#Get-MessageTrackingLog -Server ex-node-02 -Sender sysadmin.no-reply@bancaintesa.rs -Start "10/14/2015 2:00 AM" -End "10/14/2015 10:00 AM"

Start-Transcript -Path "C:\SchTask\Password Expiry\maillog.txt"
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://ex-node-02/PowerShell/ -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session
Get-MessageTrackingLog -Server ex-node-02 -Sender sysadmin.no-reply@bancaintesa.rs -Start "10/14/2015 2:00 AM" -End "10/14/2015 11:00 AM"
#Write-Host 
Stop-Transcript