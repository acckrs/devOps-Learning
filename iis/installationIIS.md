* Import-module ServerManager # Nije potrebno u W2012
* add-windowsFeature Web-Server Install,web-asp,web-mgmt-service
* set-itemProperty -path "HKLM\SOFTWARE\Microsoft\WebManagement\Server\" -name EnableRemoteManagement -value 1
* get-service wmsvc | start-service | set-service -startupType Automatic




