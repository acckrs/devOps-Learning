Function add-userToLocalgroup
{
    [cmdletbinding()]
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]] $account,

        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[] ]$server, 

        [parameter(ValueFromPipeline = $true)]
        [string[]] $groups
    )
                    
    $adsigroup = [ADSI]"WinNT://$server/$groups,group" 
    $adsigroup.Add("WinNT://$server/$account,user")
    Write-verbose "Nalog $account dodat u grupu $group"
}

add-userToLocalgroup -account "deltabank\snow_mid_usr" -server "ict-211-5888" -groups "Administrators", "Users" -Verbose
