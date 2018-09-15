copy /Y \\%SMSSM%\Verzije\SMSSource\WS_Schtask\Pst_oversize\pst_oversize.ps1 pst_oversize.ps1
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
powershell -file pst_oversize.ps1