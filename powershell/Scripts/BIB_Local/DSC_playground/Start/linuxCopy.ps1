$nd ="dockerMachine1"
$Credential = Get-Credential -UserName:"root" -Message:"Enter Password:"
$opt = New-CimSessionOption -UseSsl:$true -SkipCACheck:$true -SkipCNCheck:$true -SkipRevocationCheck:$true
$Sess=New-CimSession -Credential:$credential -ComputerName:$Nd -Port:5986 -Authentication:basic -SessionOption:$opt -OperationTimeoutSec:90 





Configuration copyLinux{
    Import-DscResource  -Module nx

    node "$nd" {
        nxfile test {
            DestinationPath =  "/tmp/test/test.txt"
            Contents = "hello world `n"
            ensure="present"
            Type =  "file"
        }
    }
}
copyLinux -outputpath .\mofs
Start-DscConfiguration -Path .\mofs -CimSession $Sess -Wait -Verbose