Dodati u Template:
- Prebaciti server u high performance mod (PowerOptions -> High Performance)
- Iskopiraj psexec u c:\windows\system32
- command prompt pod admin nalogom, izvrši se komanda psexec \\ime_servera -s schtasks /change /tn psexec "\Microsoft\Windows\TaskScheduler\Maintenance Configurator" /DISABLE
- Tuning TCP protokola na serverima Windows 2008 i 2012
    - netsh interface tcp set global autotuninglevel=highlyrestricted
    - netsh interface tcp set global rss=disabled
- Sa lokacije \\fsi\ORG\DSL\Software\BIB\PM3 iskopirati na c:\SchTask\PM3  
