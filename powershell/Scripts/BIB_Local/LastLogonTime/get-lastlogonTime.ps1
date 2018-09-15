$accounts = gc accounts.txt
$all = @()
foreach ($account in $accounts) {
    if ((Get-ADUser -Filter {samaccountName -eq $account} -Properties samaccountname | select samaccountName).samaccountname) {
        $sam = (Get-ADUser -Filter {samaccountName -eq $account} -Properties samaccountname | select samaccountName).samaccountname
        $logonDate = (Get-ADUser -Filter {samaccountName -eq $account} -Properties lastlogondate | select lastLogonDate).lastLogonDate
        if ($logonDate -lt "1/1/1900"){
            $logonDate = "Nikad"
        }
    }
    else {
        $sam = $account
        $logonDate = "N/A"            
    }
$props = @{
    "sam"       = $sam;
    "LogonDate" = $logonDate
}
$obj = New-Object -TypeName psobject -Property $props
$all += $obj
}
$all