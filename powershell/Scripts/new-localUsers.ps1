function new-localUsers {
    <#
        .SYNOPSIS 
        Funkcija koja kreira nove lokalne naloge i dodaje ih lokalne grupe na kompjuterima
        .DESCRIPTION
        Funkcija koja kreira nove lokalne naloge i dodaje ih lokalne grupe na kompjuterima. Imena naloga, kompjutera i grupa se mogu predati iz txt fajla ili navodjenjem vrednosti za parametre
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
        [string[] ]$serverNames, 

        [parameter(ValueFromPipeline = $true)]
        [string[]] $groupsForAccounts
    )

    foreach ($server in $servernames) {
        
        $serverOnline = Test-Connection -ComputerName $server -count 1 -quiet

        if ($serverOnline) {
            Write-Verbose "$server is online."
            foreach ($account in $accounts) {
  
                $PasswordForUser = Read-Host -Prompt "Enter a password for user account $account on server $server" -AsSecureString
                $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordForUser)
                $PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) 

                $compObject = [ADSI]"WinNT://$Server"
                $newUsr = $compObject.create("User", $account)
                $newUsr.setPassword($PlainPassword)
                $newUsr.setInfo()
                Write-verbose "Nalog $account kreiran uspesno" 
       
                foreach ($group in $groupsForAccounts) {
                    $adsigroup = [ADSI]"WinNT://$server/$group,group" 
                    $adsigroup.Add("WinNT://$server/$account,user")
                    Write-verbose "Nalog $account dodat u grupu $group"
                } #end foreach group loop
            }#end foreach account loop
        }
        else {
            Write-Warning "$server is not online."
        } #end if $serverOnline question
    } #end foreach server loop

}


function add-DomainUsersToLocalGroup {
    <#
        .SYNOPSIS 
        Funkcija koja dodaje domenske naloge u lokalne grupe na kompjuterima
        .DESCRIPTION
        Funkcija koja dodaje domenske naloge u lokalne grupe na kompjuterima. Imena naloga, kompjutera i grupa se mogu predati iz txt fajla ili navodjenjem vrednosti za parametre
        .PARAMETER accounts
        domenski nalozi koji ce se dodati u lokalne grupe. 
        .PARAMETER domainGroups
        Domenske grupe koje ce sedodati u lokalne grupe. 
        .PARAMETER serverNames
        Kompjuteri u cije lokalne grupe dodajemo domenske naloge
        .PARAMETER groupsForAccounts
        Lokalne grupe u koje dodajemo domenske naloge
        .NOTES
                    Version:        1.0
                    Author:         Aleksandar Krstic
                    Creation Date:  June 02nd, 2017
                    Purpose/Change: Initial script development
        .EXAMPLE
                    add-DomainUsersToLocalGroup -accounts (get-contents names.txt) -serverNames Server1,Server2 -groupsForAccounts Administrators,Users
        .EXAMPLE
                    add-DomainUsersToLocalGroup -serverNames Server1,server2 -accounts account1 -domainGroups srv_admins -groupsForAccounts Administrators,Users
#>
    [cmdletbinding()]
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]] $accounts,

        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[] ]$serverNames, 

        [parameter(ValueFromPipeline = $true)]
        [string[]] $groupsForAccounts,
        
        [parameter(ValueFromPipeline = $true)]
        [string[]] $domainGroups
    )

    foreach ($server in $servernames) {
        $serverOnline = Test-Connection -ComputerName $server -count 1 -quiet
        if ($serverOnline) {
            Write-Verbose "$server is online."
            foreach ($account in $accounts) {
                foreach ($group in $groupsForAccounts) {
                    $adsigroup = [ADSI]"WinNT://$server/$group,group" 
                    $adsigroup.Add("WinNT://$server/deltabank/$account,user")
                        Write-verbose "Nalog $account dodat u grupu $group"
                    foreach ($domainGroup in $domainGroups) {
                        $adsigroup.Add("WinNT://$server/deltabank/$domainGroup,group")
                        Write-verbose "Domenska grupa $domainGroup dodata u grupu $group"
                    }#endforeach domainGroup loop
                } #end foreach group loop
            }#end foreach account loop
        }
        else {
            Write-Warning "$server is not online."
        } #end if $serverOnline question
    } #end foreach server loop

}

add-DomainUsersToLocalGroup -serverNames localhost -accounts kaleksandar -domainGroups srv_admins -groupsForAccounts Administrators -verbose
