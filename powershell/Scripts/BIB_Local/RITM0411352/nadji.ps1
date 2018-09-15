$mailovi = gc mailovi

foreach ($item in $mailovi) {
    #$item
    add-ADGroupMember -Identity AGDM_BIB_Report -Members (get-aduser -Properties mail -filter {mail -eq $item })
}
foreach ($item in $mailovi) {
    #$item
    Get-ADGroup -Properties mail -filter {mail -eq $item } |select samaccountname, mail 
}
$sams = gc .\samaccountnames
foreach ($iteem2 in $mailovi) {
    #$item
    Add-ADGroupMember -Identity ProdajaIntesaInvest -Members $iteem2
}

$groups = Get-ADGroup -Filter {(samaccountname -eq 'doznake.large') 
                                -or (samaccountname -eq 'doznake_rcbg')
                                -or (samaccountname -eq 'nostrodoznake_stn')
                                -or (samaccountname -eq 'bg_prilivi')
                                -or (samaccountname -eq 'prilivi.sme')
                                -or (samaccountname -eq 'prilivi.large')
                                -or (samaccountname -eq 'loro.doznakeFL')
                            }
$objAll=@()
foreach ($group in $groups) {
    $clanovi = Get-ADGroupMember -Identity $group
    foreach ($clan in $clanovi) {
        $props = @{
            'Grupa' = $group.name;
            "clan"  = $clan.samaccountname
        }
        $user = New-Object -TypeName pscustomobject -Property $props
        $objAll+=$user
    }
}
$objall|export-excel doznake.xlsx; start excel doznake.xlsx