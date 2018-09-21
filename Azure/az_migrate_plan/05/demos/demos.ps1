# PowerShell command to download and install dependency agent
# https://docs.microsoft.com/en-us/azure/monitoring/monitoring-service-map-configure#installation-script-examples

Invoke-WebRequest "https://aka.ms/dependencyagentwindows" -OutFile InstallDependencyAgent-Windows.exe

.\InstallDependencyAgent-Windows.exe /S