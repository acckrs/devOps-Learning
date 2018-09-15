foreach ($ime in (gc .\dmz.txt)){
    nslookup $ime
}