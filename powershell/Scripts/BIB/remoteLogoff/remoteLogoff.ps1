$servers="ALMPRO2","ALMPROTEST01","APPSVC1","APPWINSVC1","ARISPS","BIBCOISS-APP3","BIBCO-NODE2","BI-NODE2","COMMSERVER01","CRISPWEB2","CSAPP1","DBAF2","DBPARMA","DBRP02","DC-PARMA-02","EDMS05","FOGLIGHT","IAM12-SQL","IIB-NODE2","INEXNLB1","LEASING2","OB-ADAPTER1","OCR-NODE21","PARMASHARE","PPAP-NODE22","SASANALYTICS","SASMETA","SE-BG-SQL","SE-PA-CONN","SFB-EDGE","SPK2RETAIL-02","TFSERVER2015","TSHPRN-CU-01","TSPARMA","WBNODE3","WRPSQLNODE2","WSACRINTESA01"


foreach ($server in $servers){
    write-host -ForegroundColor Yellow "Server is $server"
    query session /server tsparma

}

1
2
3
$userName = 'administrator'
$sessionId = ((quser /server:almpro2 ) -split ' +')[9]
$sessionId

If (!(Get-module PSTerminalServices )) 
{
    try 
    {
        Import-Module PSTerminalServices
        Write-Host "PSTerminalServices Module Loaded" -ForegroundColor Green
    } 
    catch 
    {
        Write-Host "PSTerminalServices module does not exist, please install" -ForegroundColor Red
    }
}

function Get-HostToIP($hostname) {     
    $result = [system.Net.Dns]::GetHostByName($hostname)     
    $result.AddressList | ForEach-Object {$_.IPAddressToString } 
} 
 
"ACS3","B2B-BE-01","BACKUP-NODE3","BEMS02","BERZA2","BGD-47-4604","BGDPRNTEST","BIBCO-APP1","BIZSQL","CW-WEB-01","CW-WEB-GATEWAY","DC-BG-01","DCEBANK82","DC-NS-01","DCONLINE81","DEV_NLB12","DLP-ENDPOINT","DLP-MAIL2","EBANK-NODE22","EBANKSYSMNG","ECAWEBENROLL2","ELEARNING","EPOSERVER12","ERASERNEW2","EX-GC-02","EXNLB1","EXNLB2","EX-NODE-02","FAKTORING","FC1BILABNODE2","FC1DEVSQL8","FC1IIB","FC1IIBSQL","FC1MOBI-WEBTEST","FC1ONLINEWEBTES","FC1SQLDEV1NODE2","FC2BILABNODE2","FC2DEVTICATAURO","FC2IIBSQL","FC2MOBI-APPTEST","FC2MOBI-WEBTEST","FC2ONLINEWEBTES","FC2SQLDEV1NODE1","FC3BILABNODE1","FC3SQLDEV1NODE1","HVSERVER","ICT-SYSLOG-01","INEXNLB1","KRG-01-PRN-01","LOGSRV","MB-APP-2","MOBI-APP-1","MOBI-WEB-1","NETFLOW","NEWAPP-ONLINE-1","NEWWEB-ONLINE-1","NSD-01-PRN-01","OB-ADAPTER1","OB-ADAPTER-VIP","OB-GATEWAY","OBR-MAS-17","OBR-MAS-32","ONLINE-NODE21","PAN-01-PRN-01","PARAGRAF-01","PHONEX","PP_NLB12","SE-BG-ANALYTICS","SE-BG-INTERCA","SE-BG-SQL","SE-SECSQL","SE-SECSQL2","SPAZIO","SPK2RETAIL-01","SSEBANK2","SYMANTECLUA","SYSSQL12-NODE2","TCRSRV","TFSERVER","VASCO1","VMAILSERVER2","WEBLOCAL-01","WEB-PHONEX","WRPSQLNODE2","WWW-APP-02" | ForEach-Object {(write-host $_ , Get-HostToIP($_)) >> c:\temp\Addresses.txt}

$radnici=gc C:\temp\radnici2.txt
foreach ($radnik in $radnici){
    $
    $r=Get-ADUser -Filter 'Name -like "snezana sretenovic"'|select samacountname
   $r
}

$radnici=Import-Excel C:\temp\radnici.xlsx
#$radnici|gm

$array = [System.Collections.ArrayList]::new()
foreach ($r in $radnici){
    $disp=$r.displayname
    $filter=" displayname -like '$disp*'"
    $user=get-aduser -Filter $filter -Properties whencreated|select name,whencreated,samaccountname
    $array+=$user
}

$array|Export-Excel c:\temp\radniciIzvoz4.xlsx


foreach ($r in $radnici) 
{
    try 
    {
        $user = Get-ADUser $r.domen_user_name.Trim() -ea Stop -Properties whencreated
        $createdOn = $user.whencreated
    }
    catch 
    {
        $createdOn = "Nema korisnika" 
    }
    [void] $array.Add( [pscustomobject] @{ Ime = $r.IME + " " + $r.PREZIME ; CreatedOn = $createdOn ; UserName = $r.DOMEN_USER_NAME } )
} 
$array