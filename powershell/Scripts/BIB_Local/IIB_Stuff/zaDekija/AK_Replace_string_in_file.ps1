param(
    [ValidateSet("FC1", "FC2", "FC3")]
    [String] $okruzenje
)


$original_files = gci ".\fc*"  | % {$_.FullName}
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
            $fhNew.Keys | % {'{0} = {1}' -f $_, $fhNew[$_]}  
        } 
    }
}
