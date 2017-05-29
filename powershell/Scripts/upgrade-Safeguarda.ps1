function new-localUsers {
    <#
.SYNOPSIS 
Funkcija koja kreira nove naloge i dodaje ih lokalne grupe na kompjuterima
.DESCRIPTION
Funkcija koja kreira nove naloge i dodaje ih lokalne grupe na kompjuterima. Imena naloga, kompjutera i grupa se mogu predati iz txt fajla ili navodjenjem vrednosti za parametre
.PARAMETER accounts
Nalozi koji ce se kreirati na komojuterima i koji ce biti odati u lokalne grupe. 
.PARAMETER serverName
Kompjuteri na kojima kreiramo lokalne naloge
.PARAMETER groupsForAccounts
Grupe u koje dodajemo novokreirane naloge
.NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 29th, 2017
            Purpose/Change: Initial script development
 .EXAMPLE
            new-localUsers -accounts (get-contents names.txt) -serverName Server1,Server2 -groupsForAccounts Administrators,Users
 .EXAMPLE
            new-localUsers -ime "SMART.Ime1.Prezime1", "SMART.Ime2.Prezime2" 
#>
    [cmdletbinding()]
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]] $accounts,

        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[] ]$serverName, 

        [parameter(ValueFromPipeline = $true)]
        [string[]] $groupsForAccounts
    )

   
    foreach ($account in $accounts) {
        $PasswordForUser = Read-Host -Prompt "Enter a password for user account $account" -AsSecureString
        $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordForUser)
        $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) 

        $compObject = [ADSI]"WinNT://$ServerName"
        $newUsr = $compObject.create("User", $account)
        $newUsr.setPassword($PlainPassword)
        $newUsr.setInfo()
        Write-verbose "Nalog $account kreiran uspesno" 
       
        foreach ($group in $groupsForAccounts) {
            $adsigroup = [ADSI]"WinNT://$serverName/$group,group" 
            $adsigroup.Add("WinNT://$serverName/$account,user")
            Write-verbose "Nalog $account dodat u grupu $group"
        }
    }

}
# new-localUsers -accounts (gc names.txt) -servername "testtermserver" -groupsForAccounts "Administrators", "Users" -Verbose
help new-localUsers -Full
