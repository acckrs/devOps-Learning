------------------------------------------------
Skripte su prilagodjene PS verziji za windows 7
------------------------------------------------


*** SetUp.ps1 ***
SetUp sistema se se svodi na:
-	Kreiranje registryx klju�a 'HKLM:\SOFTWARE\BIB' .
-	Davanje prava �BUILTIN\Users� nad ovim klju�em
-	Davanje prava na lokaciji �c:\windows\bib\IzborOkruzenja� da bi se mogli kreirati log fajlovi
SetUp ne kopira skripte na ovu lokaciju!


*** IzborOkruzenja.ps1 ***
Skripta pokre�e windows formu da bi korisnik izabrao �eljeno okru�enje. 
Ako je korinsik izabrao okru�enje i iza�ao sa �ok�:
-	setuje se tra�eno okru�enje u 'HKLM:\SOFTWARE\BIB' 
-	poziva se script �StartEnvironment.ps1� kojom se okru�enje startuje
-	poziva se �C:\Windows\bib\bginfo\startbginfo_win10_x64.bat�  radi prikaza
Ova skripta se ne poziva direktno ve� preko shortcut-a �StartIzbor.cmd� koji bi trebao biti izvu�en na desktop ili ...


*** StartEnvironment.ps1 ***
Skripta koja se treba pozivati kao jedna od �logon� skripti. Ova skripta prema vrednosti Environment striniga u klju�u 'HKLM:\SOFTWARE\BIB' striniga sprovodi pode�avaje korisni�kog okru�enja.

U okviru ove skripte su navedena mapiranja:
  <PROD ctxwi="http://xenapp-wi/Citrix/PNAgent/config.xml" ctxfs="citrix-fs"/>
  <DEV  ctxwi="http://dev-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsdev1"/>
  <MNT  ctxwi="http://mnt-wi/Citrix/PNAgent/config.xml"    ctxfs="CtxfsMNT1"/>
  <TRN  ctxwi="http://trn-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfstrn1"/>
  <UAT  ctxwi="http://uat-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsuat1"/>
  <FC1  ctxwi="http://fc1-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev2"/>
  <FC2  ctxwi="http://fc2-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev1"/> 
.
