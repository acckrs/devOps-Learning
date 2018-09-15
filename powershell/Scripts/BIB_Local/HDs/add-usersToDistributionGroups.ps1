$CBSR_Trade_Finance="Ivana.Matejic-Ivanovic@bancaintesa.rs","Marjana.Majhenic@bancaintesa.rs","Vera.Randjelovic@bancaintesa.rs","Snezana.Kovacevic@bancaintesa.rs","Jelena.Pepeljak@bancaintesa.rs","ivan.berginc@bancaintesa.rs","Maja.T.Nikolin@bancaintesa.rs","Valentina.Zgonjan@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_Treasury="Zorica.Subara@bancaintesa.rs","Milica.Martinovic@bancaintesa.rs","Djurdja.Lalic@bancaintesa.rs","dsi.bluca@bancaintesa.rs","Mario.Trapani@bancaintesa.rs","Ana.Popin@bancaintesa.rs","Marta.Latinovic@bancaintesa.rs","Jadranka.Katana@bancaintesa.rs","dtc.msvetlana@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs","dtc.mmarija@bancaintesa.rs"

$CBSR_Deposits="Ljubomir.Dimic@bancaintesa.rs","Jasmina.Kragic@bancaintesa.rs","Ksenija.Miholjcic@bancaintesa.rs","Miladin.Mares@bancaintesa.rs","Ana.Stanojevic@bancaintesa.rs","Sanja.Banovic@bancaintesa.rs","Aleksandra.Smiljkovic@bancaintesa.rs","Sinisa.Kovacevic@bancaintesa.rs","Bojana.BosanacMilovancevic@bancaintesa.rs","Vesna.Conic@bancaintesa.rs","Jelena.Jovic@bancaintesa.rs","Slavica.Mandic@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_Payments="olivera.sosiccacic@bancaintesa.rs","Jovana.Mandic@bancaintesa.rs","Jasna.Pesic@bancaintesa.rs","branislava.cukic@bancaintesa.rs","Biljana.D.Ristic@bancaintesa.rs","Svetlana.Lazovic@bancaintesa.rs","Ivana.Pupovac-popovic@bancaintesa.rs","dsi.rriccardo@bancaintesa.rs","Branislav.Cancarevic@bancaintesa.rs","Stojan.Simovic@bancaintesa.rs","Zeljko.Kondic@bancaintesa.rs","Dragana.Korlat@bancaintesa.rs","Zarko.Njegovan@bancaintesa.rs","Predrag.Vukoje@bancaintesa.rs","Milana.Zivanov@bancaintesa.rs","maurizio.tartaglia@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_FT="olivera.sosiccacic@bancaintesa.rs","Jovana.Mandic@bancaintesa.rs","Jasna.Pesic@bancaintesa.rs","branislava.cukic@bancaintesa.rs","Biljana.D.Ristic@bancaintesa.rs","Svetlana.Lazovic@bancaintesa.rs","Ivana.Pupovac-popovic@bancaintesa.rs","dsi.rriccardo@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_PC="olivera.sosiccacic@bancaintesa.rs","Branislav.Cancarevic@bancaintesa.rs","Stojan.Simovic@bancaintesa.rs","Zeljko.Kondic@bancaintesa.rs","Dragana.Korlat@bancaintesa.rs","Zarko.Njegovan@bancaintesa.rs","Predrag.Vukoje@bancaintesa.rs","Milana.Zivanov@bancaintesa.rs","maurizio.tartaglia@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_Retail_Teller="rade.cacic@bancaintesa.rs","Marko.Radmanovac@bancaintesa.rs","Natasa.Vrhovac@bancaintesa.rs","Katarina.Cakajac@bancaintesa.rs","Zorana.Krivokapic@bancaintesa.rs","Jelena.PopovicBubanja@bancaintesa.rs","Natasa.Petrovic@bancaintesa.rs","Natasa.Peric@bancaintesa.rs","Violeta.Terzic-puric@bancaintesa.rs","Giuseppe.Sommaruga@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"

$CBSR_Accounting="Marija.Djurkovic@bancaintesa.rs","Andjelka.Radisic@bancaintesa.rs","dsi.adavide@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs","Jelena.PopovicBubanja@bancaintesa.rs","Natasa.Petrovic@bancaintesa.rs","Natasa.Peric@bancaintesa.rs","Violeta.Terzic-puric@bancaintesa.rs","Giuseppe.Sommaruga@bancaintesa.rs","marko.mihailovic@bancaintesa.rs","Venera.ErorTesic@bancaintesa.rs"


$groups="bm","e-banking","kontakt_centar","kontaktcc","online","socnet_kc","supervisorCC","Internet3"
$users="Vesna.Stevic@bancaintesa.rs","Sanja.Banovic@bancaintesa.rs","Snezana.Pejovic@bancaintesa.rs","Marko.Radmanovac@bancaintesa.rs","itgma.dboban@bancaintesa.rs"

onikolina

foreach ($group in $groups) {
    Add-ADGroupMember -Identity $group -member (get-aduser -Properties mail  -filter {mail -eq $user})   
}
foreach ($user in $users) {
    Add-ADGroupMember -Identity Power_Agile_Retail  -member (get-aduser -Properties mail  -filter {mail -eq $user})   
}

get-adgroupmember -Identity Power_Agile_Retail |measure |select samaccountname



Za kreiranje distributivne grupe može se koristiti i ovaj cmdlet koji radi sve gore navedeno osim dodavanja članova u grupu
New-DistributionGroup -name ImeGrupe -alias ImeGrupe -OrganizationalUnit 'deltabank.co.yu/Serveri/MessagingCollaboration SVC/Messaging Service/Exchange Services/Global Distribution Groups' -managedby 'Exchange Recipient Administrators' -MemberDepartRestriction Closed -MemberJoinRestriction Closed –RequireSenderAuthenticationEnabled:$False
Sinhronizovati sa listom dozvoljenih mailova na Mail-In-01 serveru po uputstvu (schtasks /Run /S ex-node-01 /TN "rcpt update")
Sa nalogom koji član grupe Exchange Administrators, uraditi update offline address book-a (OAB):
Na exchange serveru pokrenuti Exchange management shell i u njemu ukucati
 get-offlineaddressbook | update-offlineaddressbook
