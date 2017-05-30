# Instalacija Enterprise Vault 11

## Priprema
* VM: 4 CPU, 8 GB RAM, 4 HDD-a, a od toga 3 moraju da budu na nezavisnoj ISC C:=50GB + 3 cluster diska (10 + 40 + 50 )
* Sa instalacionog diska EV-a pokrenuti Setup.exe. Onda izabrati `Enterprise Vault > Server Preparation > Prepare my system` da bi se instalirali neophodni windows-features. Ukoliko server na kome instaliramo EV nema izlaz na internet,
    potrebno je izmeniti ps1 skript koji se nalazi u folderu Launcher na EV instalacionom disku tako sto ce se u redu u kome pise
    `Add-WindowsFeature $featureList2012` dopisati `-source d:\sources\sxs` a u D:\ drajvu je instalacija Windowsa 2012
* Pored ovoga, potrebno je i instalirati sledece:
    * Outlook 2007 i SP3 za njega, kao i hotfix  KB2596598 za Outlook 2007  
        * nakon zavrsene instalacije Outlook-a, potrebno je podesiti mail profil za nalog koji cemo koristiti za pokretanje EV-a, kao i za njegovu instalaciju 
    * .net 4.5.2
    * Iskljuciti Windows Firewall

* Onda pristupamo instalaciji EV-a tako sto sa instalacionog diska pokrenemo 
    `Enterprise Vault > Server Installation > 


