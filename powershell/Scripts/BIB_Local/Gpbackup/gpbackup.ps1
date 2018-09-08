Backup-GPO -all -Path \\dd2500\Backups\GP -Comment "Weekly GP Backup"| Export-Csv C:\SchTask\Gpbackup\list.csv
get-childItem \\dd2500\Backups\GP -recurse | where { ((get-date)-$_.creationTime).days -gt 32 }| Remove-Item -force -recurse
$date=get-date
Send-MailMessage -To sysadmin@bancaintesa.rs -Subject "Group Policy Weekly Bakup"-BodyasHtml "$date : Spisak bekapovanih polisa je u attachmentu. Sve starije od 30 dana su obrisane" -attachment C:\SchTask\Gpbackup\list.csv -SmtpServer mail -From dc-bg-01@bancaintesa.rs
