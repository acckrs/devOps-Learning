# Instalacija Enterprise Vault 11

## Priprema
* VM: 4 CPU, 8 GB RAM, C:=50GB + 3 cluster diska (10 + 40 + 50 )
* Sa instalacionog diska pokrenuti EV-a pokrenuti Setup.exe. Onda izabrati `Enterprise Vault > Server Preparation > Prepare my system` da bi se instalirali neophodni windows-feature. Ukoliko server na kome instaliramo EV nema izlaz na internet,
    potrebno je izmeniti ps1 skript koji se nalazi u folderu Launcher na EV instalacionom disku tako sto ce se u redu u kome pise
    `Add-WindowsFeature $featureList2012` dopisati `-source d:\sources\sxs` a u D drajvu je instalacija Windowsa 2012
* Pored ovoga, potrebno je i instalirati sledece:
    * Outlook 2007 i SP3 za njega
    * .net 4.5.2

