
$pathToFolder='\\citrix-fs\config\clients'
$listaKompjutera=gc C:\Acca\PowerShell_JA\MALOobrisaniADcomps.txt
$listaKompjutera | ForEach-Object{$_, (test-path "$pathToFolder\$_.")}

#odkomentuj ovo ako hoces i da obrises foldere 
<#
$listaKompjutera | % {`
        if (test-path "$pathToFolder\$_.")
        {rm "$pathToFolder\$_." -recurse -force}
    }
#>


ForEach  ($server in $listaKompjutera) 
Write-Verbose
{   Try {
        Get-ADComputer $server -ErrorAction Stop
        $Result = $true
    }
    Catch {
        $Result = $False
    }
    [PSCustomObject]@{
        Name = $server
        Found = $Result
    }
}
