# Shell script for Linux download and installation of agent
# https://docs.microsoft.com/en-us/azure/monitoring/monitoring-service-map-configure#installation-script-examples 
wget --content-disposition https://aka.ms/dependencyagentlinux -O InstallDependencyAgent-Linux64.bin
sudo sh InstallDependencyAgent-Linux64.bin -s