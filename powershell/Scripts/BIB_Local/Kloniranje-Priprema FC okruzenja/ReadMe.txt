1.	GetCompConfig.ps
	a.	Bez parametara. 
	b.	Script prikupi podatke o imenu ma�ine, mre�noj konfioguraciji i to sa�uva u fajlu �GetCompConfig.cfg�
	c.	Ako se pozove vi�e puta, file konfiguracije se prepisuje.


2.	SetCompConfig.ps
	a.	Parametar je ime okru�enja, ime parametra je (!) -okruzenje. Parametar WhatIF daje rezultat skripte ali je ne izvrsava.
	b.	Script prikupi podatke iz config fajla c:\ GetCompConfig.cfg,  prema navedenom imenu okru�enja uradi  konverziju imena i ip adrese i postavi setovanja na 			ma�ini. Nakon postavljanja setovanja ma�ina se restartuje.
		Ukoliko NIC nema defaultGateway ili DNS, nece biti upisan 
	c.	Ma�ine �e dobijati prefix imenna okru�enja fc1, ...fc4. Naprimer �dev-ppnlb� �e se zvati �fc1dev-ppnlb�.  (ime se ograni�ava na prvih 16 karaktera). Ip adrese 			ce se menjati samo po oznaci VLAN-a prema okru�enju. 
