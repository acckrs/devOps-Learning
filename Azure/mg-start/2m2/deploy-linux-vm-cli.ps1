break
# #############################################################################
# Deploy Linux VMs to Azure with Azure CLI v2.0
# Repo: https://github.com/timothywarner/linux
# AUTHOR:  Tim Warner
# EMAIL: timothy-warner@pluralsight.com
# TWITTER: @TechTrainerTim
# WEB: timw.info
# #############################################################################


az

az login

#az group create -n myResourceGroup -l eastus

az vm create --image credativ:Debian:8:latest --admin-username acckrs --ssh-key-value C:/users/acckr/.ssh/id_rsa.pub --public-ip-address-dns-name vm-azuretraining-acckrslin --resource-group azuretraining --location centralus --name vm-azuretraining-acckrslin

ssh acckrs@vm-azuretraining-acckrslin.centralus.cloudapp.azure.com