import-module activedirectory
Add-PsSnapin Microsoft.SharePoint.PowerShell
if ((gci .\smartWorkLog.log).length -ge 10KB ){
    rm .\smartWorkLog.log -Force -Confirm:$false     
    new-item -ItemType File -Name smartWorkLog.log
}
start-transcript -Path c:\schtask\smartwork\smartWorkLog.log -Append
write-output "$(get-date):: Skripta je pokrenuta"

$sourceweburl = "http://portal/sites/ljr"
$sourcelistname = "Smart Work"
$spsourceweb = get-spweb $sourceweburl
$spList = $spsourceweb.Lists| Where-Object {$_.title -eq "$sourceListName"}

$spItems = $spList.getItems()

filter izaberi {
    $row = ([xml]$_.xml).row
    $datumOd = [datetime]$row.ows_DatumOd
    $zbd = [int]$row.ows_ZahtevaniBrojDana
    $datumDo = [datetime]$datumOd.addDays($zbd)
    $danas = [datetime]::Today
    if (($danas -ge $datumOd) -and ($danas -le $datumDo) -and ($row.ows__ModerationStatus -eq '0')) {
        $props = @{
            "Email"    = $row.ows_EmailZaposlenog;
            "OdDatuma" = $datumOd;
            "BrojDana" = $zbd;
            "DoDatuma" = $datumDo;
        }
        $obj = New-Object -TypeName pscustomObject -Property $props
        $obj
    }
}
$dozvoljeni = $spItems|izaberi
$dict = @{} # Otvaram hash tabelu gde je key Email adresa a value pripadnost skupu (1 - samo u skupu $dozvoljeni, 2 - samo u skupu $clanovi, 3 - u oba skupa )

$dozvoljeni | % {
    $dict[$_.Email] = 1
}


write-output "$(get-date):: clanovi grupe pre skripte: "
$adGrupa = Get-ADGroup sslvpnradodkuce -Server dc-bg-11
$clanovi = $adgrupa | Get-ADGroupMember |get-aduser -properties emailaddress  
write-output $clanovi|Select-Object samaccountname|Format-Table
$clanovi | % {
    if ($dict[$_.emailaddress] -eq $null) {
        $dict[$_.emailaddress] = 2
    }
    else {
        $dict[$_.emailaddress] = 3
    }
}

#Menjam clanove ad grupe  $dict[key]=value po sledecim uslovima 
$dict.keys | % {
    if ($dict[$_] -ne 3) {
        if ($dict[$_] -eq 2) {
            Remove-ADGroupMember -Identity $adGrupa -member ( Get-ADUser -Filter {emailaddress -eq $_} ) -Confirm:$false
        }
        else {
            if ($dict[$_] -eq 1) {
                add-ADGroupMember -Identity $adGrupa -member ( Get-ADUser -Filter {emailaddress -eq $_} ) -Confirm:$false
            }
        }
    }
}

$adGrupa = Get-ADGroup sslvpnradodkuce -Server dc-bg-11
$clanovi = $adgrupa | Get-ADGroupMember 

write-output "$(get-date):: clanovi grupe nakon zavrsetka skripte: "
write-output  $clanovi|Select-Object samaccountname|Format-Table
write-output "$(get-date):: Skripta je zavrsena"
stop-transcript