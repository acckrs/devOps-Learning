#\\fsi\ORG\Dinamika odsustva  "c:\temp\fsi-ORG-Dinamika odsustva.xlsx"
#\\fsi\ORG\KOMERCIJALNO_PLANIRANJE_I_UPRAVLJANJE_MREZOM  "c:\temp\fsi-ORG-KOMERCIJALNO_PLANIRANJE_I_UPRAVLJANJE_MREZOM.xlsx"
#\\fsi\ORG\DIREKTNI_KANALI "c:\temp\fsi-ORG-DIREKTNI_KANALI.xlsx                     "

$folders=gci "\\fsi\ORG\Dinamika odsustva" -Directory -Recurse

foreach($obj in $folders){  
    get-acl $obj.fullname | %{$_.access} | ForEach-Object {
        $_ | Select-Object @{n="name";e={$obj.fullname}}, 
            @{n="security_principal";e={$_.identityreference}},
            @{n="type";e={$_.accesscontroltype}},
            @{n="rights";e={$_.filesystemrights}}
    }
  # $obj|select -Property *
}