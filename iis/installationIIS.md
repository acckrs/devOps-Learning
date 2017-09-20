* Import-module ServerManager # Nije potrebno u W2012
* Podesi powershell kao default shell: Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name Shell -Value 'PowerShell.exe -NoExit'
* add-windowsFeature Web-Server,web-asp,web-mgmt-service,web-scripting-tools
* set-itemProperty -path "HKLM\SOFTWARE\Microsoft\WebManagement\Server\" -name EnableRemoteManagement -value 1
* get-service wmsvc | start-service | set-service -startupType Automatic

Organizing content:
    * Adding normal folders
    * Adding virtual directories - have aliases
    * Adding new web applications - have to be added to aplication pools

AppPools mgmt
    * New-WebAppPool –Name ImeAppPoola / remove-webAppPool
    * Get-Item -path iis:\appPools\ImeAppPoola |select -property *
    * Set-ItemProperty -path iis:\apppools\ImeAppPoola -name managedRuntimeVersion -value v4.0
    * Set-ItemProperty -path "iis:\webSites\Default Web Site" -name ApplicationPool -value imePoola  // Prebacivanje sajta u pool
    * worker process w3wp.exe se restartuje kada se uradi recycle app poola. w3wp je proces koji prima zahteve i isporucuje web stranice klijentu
    * (gwmi -class win32_process -filter "name='w3wp.exe'").getOwner().user i dobijemo u kom App Poolu je worker proces koji zauzima puno rama npr
    * restart-webappPool -name ImePoola # kada zelimo da uradimo recycle poola
    * Set-ItemProperty -Path IIS:\AppPools\DefaultAppPool -Name recycling.periodicRestart.time -value 3.00:00:00

Web Site mgmt
    * Kreiram folder, appPool i website: mkdir c:\Site; new-webAppPool -name SitePool; 
    * new-website -name Site -Hostheader Site.domain.com -PhysicalPath c:\Site -applicationPool SitePool
    * Umesto host-headera, mogu da radim binding po -IPAddress ili -Port

Web Farm MGMT
    ** za ARR, potrebno je instalirati i to ovim redom:
        1. Web PI 3.0
        2. Web Deploy 2.0
        3. Web Farm Framework 2.2
        4. ARR
        5. Nakon toga se moze upgradeovati Web Deploy na 5.6


Test

