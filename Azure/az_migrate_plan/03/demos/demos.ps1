#Powershell syntax to reveal the hash value of the OVA Collector

    get-filehash -path .\AzureMigrate_1_0_9_12.ova -algorithm md5

#TIP->Press [ctrl]+[space] one space after -algorithm to view all parameter value options