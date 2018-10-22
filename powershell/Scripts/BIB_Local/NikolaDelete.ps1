# Parameter help description
param(
    [string] $path,
    [int] $age
)
Start-transcript -path Log.log
$starost = ([datetime]::Now).AddDays( 0 - $age  )
$files = gci $path 
foreach ($file in $files) {
    if (($file.LastwriteTime -gt $starost ) -and ($file -isnot [System.IO.DirectoryInfo] )) {
        #    write-output "$file je star" $file.lastwritetime
        rm  -Path  $file.PSPath -Confirm:$false   -Force 
        $msg = "File " + $file.fullname + " deleted"
        write-output $msg
    }
}

<# for ($i = 1; $i -lt 15; $i++) {
#  new-item -Type File -Name $i 
    $filee=gci $i
    $filee.LastwriteTime=([datetime]::Now).AddDays( -10  )
} #>
Stop-Transcript
