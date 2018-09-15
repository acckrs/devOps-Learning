$emails="Globtech.rbojan@bancaintesa.rs","Mile.Mitrovic@bancaintesa.rs","Marko.Kovacevic@bancaintesa.rs","Neda.Milic@bancaintesa.rs","Milan.S.Jovanovic@bancaintesa.rs","Nadja.Subotic@bancaintesa.rs","dtc.nmarina@bancaintesa.rs"
foreach ($email in $emails){
    Get-ADUser -Filter {emailaddress -eq $email}|select samaccountname
}   