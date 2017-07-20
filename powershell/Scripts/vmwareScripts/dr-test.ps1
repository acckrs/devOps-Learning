
     $vms=get-resourcepool -name infrastructuretest | get-vm | where {($_.name -notlike "deki-test*") -and ($_.name -notlike 'dc*') }

     $vms|Get-NetworkAdapter |Set-NetworkAdapter -Connected:$true -Confirm:$false
