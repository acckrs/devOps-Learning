disconnect-viserver * -Confirm:$false -Force

connect-viserver  ict-test2
connect-viserver  bib-vcentar-02
connect-viserver  dr-vcentar-02
connect-viserver be-vce-bib.fbisp.eu
connect-viserver co-vc-bib-p01.fbisp.eu
connect-viserver co-vc-mb-p01.fbisp.eu
Open-VMConsoleWindow spsnlb1

Connect-SrmServer vra-01

Get-VM  | % {$strVMName = $_.Name; Get-NetworkAdapter -VM $_ | 
        select @{n = "VMName"; e = {$strVMName}}, Name, NetworkName, ConnectionState } | 
    ? {$_.ConnectionState.Connected -eq $false}

get-vm|Get-NetworkAdapter

$mojeVM = "MAIL-IN-01", "Logsrv", "LogCollector", "Leasing-calc", "JunosSpace", "JUNIPER-FS", "INTCOMM02", "ICT-SYSLOG-01", "ICT-BARCODE-01", "HVServer", "HP-OneView", "ex-gc-12", "ex-gc-11", "ERASERNEW2", "EPOServer12", "EFMSSERVER", "Ecawebenroll2", "Dns-Dmz2"
foreach ($item in $mojeVM) {
    $item
}

get-vm|Get-NetworkAdapter| ? {$_.ConnectionState.Connected -eq $false} |Set-NetworkAdapter -Connected:$true

$hsts = "bib-vwpap-a02.fbisp.eu","bib-vwpap-a04.fbisp.eu","bib-vwpap-a05.fbisp.eu","bib-vwpap-a06.fbisp.eu","bib-vwpap-a07.fbisp.eu","bib-vwpap-a08.fbisp.eu","bib-vwpap-a09.fbisp.eu","bib-vwpap-a10.fbisp.eu","bib-vwpap-a11.fbisp.eu","bib-vwpap-a12.fbisp.eu","bib-vwpap-a13.fbisp.eu","bib-vwpap-a14.fbisp.eu","bib-vwpap-c11.fbisp.eu","bib-vwpbp-a01.fbisp.eu","bib-vwpbp-a02.fbisp.eu","bib-vwpbp-a04.fbisp.eu","bib-vwpbp-a05.fbisp.eu","bib-vwpbp-a06.fbisp.eu","bib-vwpbp-a07.fbisp.eu","bib-vwpbp-a08.fbisp.eu","bib-vwpbp-a09.fbisp.eu","bib-vwpbp-a10.fbisp.eu","bib-vwpbp-a11.fbisp.eu","bib-vwpbp-a12.fbisp.eu","bib-vwpbp-a13.fbisp.eu","bib-vwpbp-a14.fbisp.eu","bib-vwpbp-c03.fbisp.eu","bib-vwpbp-c04.fbisp.eu"
$h = @{}
foreach ($item in $hsts) {
    $h[$item] = (get-vmhost $item).parent
}
$h