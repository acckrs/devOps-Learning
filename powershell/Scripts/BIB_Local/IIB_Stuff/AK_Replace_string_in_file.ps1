$okruzenje = "FC2"
$original_files = gci "C:\Acca\Powershell_local\BIB\IIB_Stuff\fc*"  | % {$_.FullName}
$okruzenjeJSON = gc .\okruzenja.json  -Raw| ConvertFrom-Json 

foreach ($okr in $okruzenjeJSON) {
    if ($okr.ImeOkruzenja -eq $okruzenje) {
        foreach ($file in $original_files) {
            "Obradjujem file $file"
            $ff = gc $file
            $fh = @{}
            foreach ($line in $ff) {
                $spl = $line.split("=")
                $fh[$spl[0]] = $spl[1]
            } 
            $fhNew = @{}
            foreach ($ky in $fh.Keys) {
                 $prop = $ky.trim()
                if ($okr.$prop) {
                    $fhNew[$ky] = $okr.$prop    
                }
                else {
                    $fhNew[$ky] = $fh[$ky]
                } 
            }
            $fhNew.Keys |% {'{0} = {1}' -f $_, $fhNew[$_]}  
        } 
    }
}


<# 

#Lista parametara koji se menjaju
$lookupTable = @{
    "fc2parmashare\spazio\fc2iib"                          = 'fc3parmashare\spazio\fc3iib'
    'http://fc2ssdev1f-04:8091'                            = 'http://fc3ssdev1f-04:8091'
    'http://fc2ssdev1f-02:54505'                           = 'http://fc3ssdev1f-02:545'
    'http://dgatewaybib.sys.cns.intesasanpaolo.com:18879'  = 'http://cgatewaybib.sys.cns.intesasanpaolo.com:18'
    'http://dflexcubebib.sys.cns.intesasanpaolo.com:18878' = 'http://cflexcubebib.sys.cns.intesasanpaolo.com:188'
    'FC2IIB'                                               = 'IIBPRODNODE'
    'QMTESTNODE01'                                         = 'QMPROD'
    'mailfc2.deltabank.co.yu:25'                           = 'email.bancaintesa.rs'
    'IIBINTNODE01'                                         = 'IIBPRODNODE'
    '10.35.159.55'                                         = '10.35.160.187'
    'spazio-dev'                                           = 'spazio'
}
(Get-Content $original_file)

ForEach ($f in $original_file) {
    #$orig_line = (Get-Content $f)
    (Get-Content $f) | ForEach-Object {
        $line = $_
        #$orig_line = $line
        $lookupTable.GetEnumerator() | ForEach-Object {
            if ($line -match $_.Key) {
                $orig_line = $line
                $line = $line -replace $_.Key, $_.Value
                $change_line = $line
                #Promene upisi u LOG
                #Compare-Object -ReferenceObject $orig_line -DifferenceObject $change_line  | select @{l=$f;e={$_.InputObject}},@{l='Promena';e={$_.SideIndicator}} | Format-Table | Out-File "D:\Users\zmilan\Desktop\03092018\03092018\ChangeProperties_LOG.txt" -Append

                Compare-Object $orig_line $change_line | ForEach-Object {
                    $i = 0; 
                    $ht = @{}; 
                    $vals = -split $_.InputObject
                    foreach ($col in 'Prop', 'Service', 'State', 'Mode') {
                        $ht.$col = $vals[$i++]
                    }
                    $ht.Before = $_.SideIndicator -eq '<='
                    [pscustomobject] $ht
                } | Group-Object Prop | ForEach-Object {
                    $ndxBefore, $ndxAfter = if ($_.Before) { 0, 1 } else { 1, 0 }
                    [pscustomobject] @{
                        "Time"         = get-date
                        "File Name"    = $f
                        "Properties"   = $_.Group[0].Prop
                        "Service"      = $_.Group[0].Service
                        'State Before' = $_.Group[$ndxBefore].State
                        'Mode Before'  = $_.Group[$ndxBefore].Mode
                        'State After'  = $_.Group[$ndxAfter].State
                        'Mode After'   = $_.Group[$ndxAfter].Mode
                    }
                } | Format-List | Out-File "C:\IIBShare\Bar_Files_Change_LOGS\ChangeProperties_LOG.txt" -Append
            }
        }
        $line
    
    } | Set-Content ($f + "")
} #>