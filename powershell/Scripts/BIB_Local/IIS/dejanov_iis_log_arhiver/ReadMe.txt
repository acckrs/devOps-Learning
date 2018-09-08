Parametri potrebni skripti iisLogToDB.ps1 
- hostname --- ime hosta
- applicatonPool --- ime foldera u kom se nalazi log
- path --- UNC putanja do loga (npr. \\spsnlb1\c$\inetpub\logs\logFiles\w3svc1)

spsNLB2.xml je sablon koji moze da sluzi za import SchTaska kad se dodaje novi server.

Folderi sa imenom servera sadrze error logove, prave se automatski (postoji parametar logujSve)