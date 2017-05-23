$coms=gc C:\Acca\PowerShell_JA\hosts.txt 
gc C:\Acca\PowerShell_JA\hosts.txt | ForEach-Object {"$_,"+ (test-path "\\$_\c$\schtask")}
gc C:\Acca\PowerShell_JA\hosts.txt | ForEach-Object {"$_,"+(Get-ADComputer  name -like "$_*" |Select -Property dnshostname)}

$coms | % { Get-ADComputer $_  }  | select name,dnshostname 

$2k3s=gc C:\Acca\PowerShell_JA\patchovanje\2k3s.txt
$2k8r2s=gc C:\Acca\PowerShell_JA\patchovanje\2k8r2s.txt
$2k12s=gc C:\Acca\PowerShell_JA\patchovanje\2k12s.txt
$2k3s | % {Get-HotFix -ComputerName $_ -Id kb4012598 } | ft -auto  |Out-File C:\Acca\PowerShell_JA\patchovanje\result2k3s.txt
$2k8r2s | % {Get-HotFix -ComputerName $_ -Id KB4012212 } | ft -auto  |Out-File C:\Acca\PowerShell_JA\patchovanje\result2k8r2s.txt
$2k12s | % {Get-HotFix -ComputerName $_ -Id KB4012213 } | ft -auto  |Out-File C:\Acca\PowerShell_JA\patchovanje\result2k12s.txt

$2k3s | Measure-Object -Property -Line

$parms=@{'ComputerName'= 'ex-node-01';
         'LogName' = 'Symantec Endpoint Protection Client';
          'Newest'= 10;}
get-EventLog @parms


$msqmParams=@{'MsgStore'="E:\MSMQ\MessageFiles";
              'TransactionLogStore'= "E:\MSMQ\TransactionLogs";
              'MsgLogStore'= "E:\MSMQ\Storage"}
Set-MsmqQueueManager @msmqparamscp 'C:\Acca\Scenarija za vezbanje\xmlParser\*' '\testtermserver\c$\'
