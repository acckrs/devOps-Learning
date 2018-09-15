1.	GetCompConfig.ps
	a.	Bez parametara. 
	b.	Script prikupi podatke o imenu mašine, mrežnoj konfioguraciji i to saèuva u fajlu „GetCompConfig.cfg“
	c.	Ako se pozove više puta, file konfiguracije se prepisuje.


2.	SetCompConfig.ps
	a.	Parametar je ime okruženja, ime parametra je (!) -okruzenje. Parametar WhatIF daje rezultat skripte ali je ne izvrsava.
	b.	Script prikupi podatke iz config fajla c:\ GetCompConfig.cfg,  prema navedenom imenu okruženja uradi  konverziju imena i ip adrese i postavi setovanja na 			mašini. Nakon postavljanja setovanja mašina se restartuje.
		Ukoliko NIC nema defaultGateway ili DNS, nece biti upisan 
	c.	Mašine æe dobijati prefix imenna okruženja fc1, ...fc4. Naprimer „dev-ppnlb“ æe se zvati „fc1dev-ppnlb“.  (ime se ogranièava na prvih 16 karaktera). Ip adrese 			ce se menjati samo po oznaci VLAN-a prema okruženju. 
