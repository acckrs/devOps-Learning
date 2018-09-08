$vms="ACS","ACS-ASA2","ACS2","CC-CBA","CC-MPP71","CISCO","CISCOWORKS01","JUNOSSPACE","MWG-DR","NTP-DMZ12","PERFMONBGD","SEC-222-5636","TCRSRV","TFS-BUILD2"
$v=@{}
foreach ($item in $vms) {
 #write-host    (get-vm $item).ExtensionData.Hostname
  $v[$item]=(get-vm $item).ExtensionData.guest.Hostname    
}
$v.GetEnumerator()|Export-Csv vmdrs.csv
start excel vmdrs.csv