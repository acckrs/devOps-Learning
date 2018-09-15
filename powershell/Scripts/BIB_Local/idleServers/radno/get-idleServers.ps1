$wmi = [WMI] ""
$results = get-wmiobject -ComputerName CTX-TST-001 -class Win32_UserProfile      | foreach-object {
  $userAccount = [WMI] ("root/cimv2:Win32_SID.SID='{0}'" -f $_.SID)
  $userName = "{0}\{1}" -f $userAccount.ReferencedDomainName,$userAccount.AccountName
  

  new-object PSObject -property @{
    "Name" = $userName
    "LastUseTime" = $wmi.ConvertToDatetime($_.LastUseTime)
  }
}
$results | sort LastUseTime -Descending 