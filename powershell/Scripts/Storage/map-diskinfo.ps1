$3par_full_str = gc .\3par.txt
$3par_props = $3par_full_str|select -Skip 1 -First 1

$3parvalues_rows = $3par_full_str|select -Skip 3 
$all=@()
foreach($3parvalues_row in $3parvalues_rows){
    $3parvalues_row_array=$3parvalues_row -split '\s+' 
    $props_hash = @{}
    for ($i = 0; $i -lt $3parvalues_row_array.Count; $i++) {
        $prop_name = "Prop " + "$i"
       
        $props = @{
            "$prop_name" = $3parvalues_row_array[$i];
        }
        $props_hash += $props
    }
    $obj = New-Object -TypeName PSObject -Property $props_hash
    $all+=$obj
    
}
$all




