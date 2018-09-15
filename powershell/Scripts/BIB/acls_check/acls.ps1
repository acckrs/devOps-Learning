$aclZoki=get-acl \\fsi\bp\os\zoki
$ar=New-Object system.security.accesscontrol.filesystemaccessrule("deltabank\BMILENA","Modify","Allow")
$acl.SetAccessRule($ar)
Set-Acl temp $acl

******


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
$folder="\\fsi\bp\reprocena_kolaterala"
$sams = gc samaccounts.txt
#$acls = get-acl $folder | out-null
$acls= (get-acl $folder).access
#$acls.IdentityReference
foreach ($sam in $sams) {
    foreach ($acl in $acls) {
        if (-not (($acl.access | select -ExpandProperty IdentityReference) -contains $sam)){
            write-host "Korisnik $sam nema nikakva prava na folderu $folder"
        }
        else {
            write-host "Korisnik $sam ima $acl.access.FileSystemRights $acl.access.AccessControltype prava na folderu $folder"
        }
    }
}