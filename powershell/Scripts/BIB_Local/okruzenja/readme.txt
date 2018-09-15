------------------------------------------------
Skripte su prilagodjene PS verziji za windows 7
------------------------------------------------


*** SetUp.ps1 ***
SetUp sistema se se svodi na:
-	Kreiranje registryx kljuèa 'HKLM:\SOFTWARE\BIB' .
-	Davanje prava „BUILTIN\Users“ nad ovim kljuèem
-	Davanje prava na lokaciji „c:\windows\bib\IzborOkruzenja“ da bi se mogli kreirati log fajlovi
SetUp ne kopira skripte na ovu lokaciju!


*** IzborOkruzenja.ps1 ***
Skripta pokreæe windows formu da bi korisnik izabrao željeno okruženje. 
Ako je korinsik izabrao okruženje i izašao sa „ok“:
-	setuje se traženo okruženje u 'HKLM:\SOFTWARE\BIB' 
-	poziva se script „StartEnvironment.ps1“ kojom se okruženje startuje
-	poziva se „C:\Windows\bib\bginfo\startbginfo_win10_x64.bat“  radi prikaza
Ova skripta se ne poziva direktno veæ preko shortcut-a „StartIzbor.cmd“ koji bi trebao biti izvuèen na desktop ili ...


*** StartEnvironment.ps1 ***
Skripta koja se treba pozivati kao jedna od „logon“ skripti. Ova skripta prema vrednosti Environment striniga u kljuèu 'HKLM:\SOFTWARE\BIB' striniga sprovodi podešavaje korisnièkog okruženja.

U okviru ove skripte su navedena mapiranja:
  <PROD ctxwi="http://xenapp-wi/Citrix/PNAgent/config.xml" ctxfs="citrix-fs"/>
  <DEV  ctxwi="http://dev-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsdev1"/>
  <MNT  ctxwi="http://mnt-wi/Citrix/PNAgent/config.xml"    ctxfs="CtxfsMNT1"/>
  <TRN  ctxwi="http://trn-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfstrn1"/>
  <UAT  ctxwi="http://uat-wi/Citrix/PNAgent/config.xml"    ctxfs="Ctxfsuat1"/>
  <FC1  ctxwi="http://fc1-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev2"/>
  <FC2  ctxwi="http://fc2-wi/Citrix/PNAgent/config.xml"    ctxfs="FC2Ctxfsdev1"/> 
.
