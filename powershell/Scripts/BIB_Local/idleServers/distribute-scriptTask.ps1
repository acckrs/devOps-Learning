
[CmdletBinding()]
param (
    #Imena servera razdvojena ','
    [String[]] $ComputerName,
    #PM5 folder
    $workDir = "\C$\SCHTASK\SUPs\"
)

BEGIN {
    $pwd = Get-Location #ovo je visak
    $scriptPath = $MyInvocation.MyCommand
    $logFile = "$pwd\$scriptPath.log"
    Start-Transcript -Path $logFile -Force -Append



    function Get-TimeStamp {
        return "[{0:dd/MM/yyyy} {0:HH:mm:ss}]" -f (Get-Date)
    }
    Write-host "$(Get-TimeStamp) Pocinjem..."
}

PROCESS {
 
    function distribute-script {
        [CmdletBinding()]
        param (

        )
        $ErrorActionPreference = 'Stop';
        foreach ($computer in $computerName) {
            $fullworkDir = "\\" + "$computer" + $workDir
            #provera da li okruzenje postoji
            if (test-path $fullworkDir) {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer vec postoji"
            }
            else {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer ne postoji, kreiram foldere i kopiram fajlove..."
                mkdir  $fullworkDir | Out-Default
                write-verbose "$(Get-TimeStamp) Kreiran folder $fullworkDir "
            }
                    
            cp '\\octopus\c$\SCHTASK\sups\*' -Filter '*.ps1' $fullworkDir -Force -Confirm:$false 
            cp '\\octopus\c$\SCHTASK\sups\*' -Filter '*.xml' $fullworkDir -Force -Confirm:$false
            
        } #end forEach $computerName
    } #end funkcije distribute-pm5

    function brisanje-schTaska {
        [CmdletBinding()]
        param (
          
            #Name of scheduled task
            [String] $SchTaskName = "get_sups"
     
        )
        $ErrorActionPreference = 'Stop';
        foreach ($computer in $computerName) {
            $fullworkDir = "\\" + "$computer" + $workDir
            $schtasksProvera = schtasks /query /S $computer /TN $SchTaskName
            $Win32OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer
            $Build = $Win32OS.BuildNumber

            if ($schtasksProvera -like "*$SchTaskName*") {
                write-verbose "$(Get-TimeStamp) Brisem schedulovani task $DataCollectorName na serveru $computer" 
                schtasks /Delete /TN $SchTaskName /S $computer /F | out-default
                write-verbose "$(Get-TimeStamp) Brisem okruzenje $DataCollectorName na serveru $computer" 
                rm $fullworkDir -force -recurse -Confirm:$false 
            }
            else {
                write-verbose  "$(Get-TimeStamp) Schedulovani task $SchTaskName ne postoji na kompjuteru $computer"
            } # kraj provereschtasks.exe
        } #end forEach $computerName
    } #end funkcije brisanje-schTaska


    function import-schtask {
        [CmdletBinding()]
        param (
            #Name of taska
            [String] $SchTaskName = "get_sups"
        )

        foreach ($computer in $ComputerName) {
            $Win32OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer
            $Build = $Win32OS.BuildNumber
            $fullworkDir = "\\" + "$computer" + $workDir
            $SchTaskFilePath = $fullworkDir + "2get_SUP_2008r2_schtask.xml"

            $schtasksProvera = schtasks /query /S $computer /TN $SchTaskName 

            if ($schtasksProvera -like "*sups*") {
                write-verbose "$(Get-TimeStamp) Task $SchTaskName vec postoji na serveru $computer"
            }
            else {
                if ($Build -lt 6002) {
                   write-verbose "$(Get-TimeStamp) Server $computer je Windows 2003 - ne umem da napravim task na ovom OS-u"
                }
                else {
                    write-verbose "$(Get-TimeStamp) Kreiram task $SchTaskName  na $computer"
                    schtasks /Create /S $computer /XML $SchTaskFilePath /TN $SchTaskName | out-default 
                }
                write-verbose "$(Get-TimeStamp) Startujem task $SchTaskName  na serveru $computer"
                schtasks /Run /S $computer /TN $SchTaskName | out-default
            }
        }
    }#end funkcije import-PM5schtask

    ### Pozivanje funkcija ###
   distribute-script 
   import-schtask  
    #brisanje-schtaska
}
END {
    write-host  "$(Get-TimeStamp) Bye... " ;
    Stop-Transcript;
} 