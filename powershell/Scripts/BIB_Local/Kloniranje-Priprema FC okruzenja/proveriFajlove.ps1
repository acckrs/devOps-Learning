[CmdletBinding()]
param
(
    $comps 
)

$result = New-Object System.Collections.ArrayList
$counter = $comps.Count
$i = 0
foreach ($comp in $comps)
{
    $i++
    
    try
    {
        $dir = dir \\$comp\c$\windows\bib\sysprep -ea Stop 
        $last = $dir.lastWriteTime
        $dir = $dir.name 
    }
    catch
    {
        $dir,$last = "Nema"
        
    }

    [void]$result.Add( ([pscustomobject] @{ Comp = $comp ; Dir = $dir ; LastWriteDate = $last }) )

    Write-Progress -Activity "Radim bre... $($i / $counter * 100)" -Status $comp -PercentComplete ($i / $counter * 100)
}

$result