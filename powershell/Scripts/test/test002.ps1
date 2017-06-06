
for ($a=1; $a -lt 10; $a++) {
  Write-Progress -Activity "Working..."  -PercentComplete $a -CurrentOperation "$a% complete" -Status "Please wait"
  Start-Sleep 1
}
Write-Progress -Completed -Status "All done"