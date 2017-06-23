Import-Module activedirectory
Import-Module lync

Get-CsAdUser -ResultSize unlimited | ?{$_.UserAccountControl -match "AccountDisabled" -and $_.Enabled} | Disable-CsUser