$3par_full_str = gc .\3par.txt
$3par_props = $3par_full_str|select -Skip 1 -First 1
$3parvalues = $3par_full_str|select -Skip 3 

$3pprops_array = $3par_props -split '\s+' 
$3pprops.Count
$all = @()
$rowCount = 0
foreach ($3parvalue_row in $3parvalues) {
    $rowCount++
    write-host "Broj reda je ",$rowCount
    $obj = New-Object -TypeName PSObject
    $3parvalue_row_array = $3parvalue_row -split '\s+'
    $rowValueCount = 0
    foreach ($3parvalue_row_array_member in $3parvalue_row_array) {
        $rowValueCount++
        write-host "Broj vrednosti reda je ",$rowValueCount
        $rowValueCountInc = 0
        foreach ($3pprops_array_member in $3pprops_array) {
            $rowValueCountInc++
            write-host "Broj vrednosti Inkrementa reda je ",$rowValueCountInc
            #    Add-Member -InputObject $obj -MemberType NoteProperty -Name $3pprops_array_member -Value $3parvalue_row_array_member  -PassThru -Force
        }
    }
        
}

