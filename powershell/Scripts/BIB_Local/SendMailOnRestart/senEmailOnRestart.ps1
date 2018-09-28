param(
[String[]]$Recipients="crm@BancaIntesa.rs"
)
$date=get-date
foreach ($recipient in $recipients) {
    Send-MailMessage -SmtpServer mail -from "sasanalytics@bancaintesa.rs"  -to "$Recipients" -subject "Server rebooted" -Body "Server SASANALYTICS je upravo restartovan`n $date"    
}
