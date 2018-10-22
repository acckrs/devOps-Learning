$hx = @{}

get-content C:\Acca\Powershell_local\BIB\IIB_Stuff\Auxiliary\MFA_CIFSYNC_CrtOrModCorpCustomer_1260.properties|
    % {$kv = $_.split('=');
    $hx[$kv[0]] = $kv[1]
}


$hx.Keys |
    % {'{0} = {1}' -f $_, $hx[$_]}  


$config = [xml]@'
<r>
  <key0001
    fc1="vrednost u 1"
    fc2="vrednost u 2"
    fc3="vrednost u 3"
  />
  <key0002
  fc1="vrednost u 1"
     fc2="vrednost u 2"
     fc3="vrednost u 3"
  />

</r>
'@


$k = 'key0001'
$e = 'fc1'
$x = $config.r.key0001.fc1
$x.GetType()

$x
$config.r.$k.fc1



