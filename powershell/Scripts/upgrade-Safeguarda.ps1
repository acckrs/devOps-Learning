function new-localUsers {
    <#
.SYNOPSIS 
Skripta za instalaciju nove verzije SafeGuard
.DESCRIPTION
Nije da je neophodno ovako, ali bolje cu se pripremiti
.PARAMETER accounts
Comma separated imena ljudi iz SMART-a koje treba dodati u grupu lokalnih administratora. Korisnicki nalog koji kreiramo 
treba da bude u formatu SMART.Ime.Prezime
.PARAMETER serverName
Kompjuter na kome kreiramo lokalne naloge
.PARAMETER groupsForAccounts
Grupe u koje dodajemo novokreirane naloge
.NOTES
            Version:        1.0
            Author:         Aleksandar Krstic
            Creation Date:  May 29th, 2017
            Purpose/Change: Initial script development
 .EXAMPLE
            get-content names.txt | new-localUsers 
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
new-localUsers -accounts "SMART.Ime1.Prezime1","SMART.Ime2.Prezime2"  -servername "testtermserver" -groupsForAccounts "Administrators", "Users" -Verbose