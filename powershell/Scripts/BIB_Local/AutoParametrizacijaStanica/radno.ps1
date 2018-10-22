$okruzenjaRadno = @( 'UAT', 'DEV', 'MNT', 'TRN', 'FC1', 'FC2')
foreach ($okrradno in $okruzenjaRadno) {
    #$name= ".\"+"$okr"+"\config\default\"
    $name2 = ".\" + "$okrRadno" + "\config\clients\*"
    rm  $name2 -Force -Confirm:$false -recurse
    
}

for ($i = 1; $i -le 9; $i++) {
    $fajlName="\\xenapp-trn0$i\c$\Banka\pexsec.dll"
    cp C:\temp\trn917a\Device\C\banka\pexsec.dll  $fajlName -Force
}


class ping iib-node1





{
    
}


cp C:\temp\trn917a\Device\C\banka\pexsec.dll  \\xenapp-trn02\c$\Banka\pexsec.dll -Force




