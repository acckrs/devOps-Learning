$pcs = gc .\pcs.txt
foreach ($pc in $pcs) {
    if (test-path \\$pc\c$\temp) {
        write-host "Na racunaru $pc postoji folder \\$pc\c$\temp"
    }
    else {
        write-host "Na racunaru $pc NE postoji folder \\$pc\c$\temp"
        mkdir \\$pc\c$\temp
    }
}
$folder="\\fsi\bp\os\zoki\"
$sams = gc .\samAccounts.txt
#$acls = get-acl $folder | out-null
$acls= (get-acl $folder).access
foreach ($sam in $sams) {
    foreach ($acl in $acls) {
        if (-not (($acl.access | select -ExpandProperty IdentityReference) -contains $sam)){
            write-host "Korisnik $user nema nikakva prava na folderu $folder"
        }
        else {
            write-host "Korisnik $sam ima $acl.access.FileSystemRights $acl.access.AccessControltype prava na folderu $folder"
        }
    }
}