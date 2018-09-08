foreach($esxcli in Get-VMHost | Get-EsxCli -V2){

    $esxcli.hardware.platform.get.Invoke() |

    Select @{N='VMHost';E={$esxcli.VMHost.Name}},VendorName,ProductName,SerialNumber

} 
 Get-VMHost | Get-EsxCli -V2

 $esxclis=get-vmhost bib-vwpap-a06.fbisp.eu |get-esxcli -V2
 $esxclis.hardware.platform.get.Invoke()|select Serialnumber