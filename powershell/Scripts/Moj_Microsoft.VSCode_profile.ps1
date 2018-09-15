set-location "C:\Acca\Powershell_local\"
function Global:Prompt
{
    $p = Split-Path -leaf -path (Get-Location)
    $promptString = "PS>" + $p + ">"
    Write-Host $promptString -NoNewline -ForegroundColor Yellow
    return " "
}