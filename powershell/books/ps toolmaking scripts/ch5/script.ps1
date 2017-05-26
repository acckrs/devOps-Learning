Function New-Drives {
    Param()
    New-PSDrive -Name AppData -PSProvider FileSystem -Root $env:Appdata
    New-PSDrive -Name Temp -PSProvider FileSystem -Root $env:TEMP
    $mydocs = Join-Path -Path $env:userprofile -ChildPath Documents
    New-PSDrive -Name Docs -PSProvider FileSystem -Root $mydocs
}
New-Drives
DIR temp: | measure  -Property length -Sum