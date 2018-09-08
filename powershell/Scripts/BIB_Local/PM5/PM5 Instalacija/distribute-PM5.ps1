
[CmdletBinding()]
param (
    #Imena servera razdvojena ','
    [String[]] $ComputerName,
    #PM5 folder
    $pm5dir = "\C$\SCHTASK\pm5\",
    #Ime perfmon template-a
    [String] $PerfmonTemplateName = "PM5.Standard.DC_template.xml"
)

BEGIN {
    $pwd = Get-Location #ovo je visak
    $scriptPath = $MyInvocation.MyCommand
    $logFile = "$pwd\$scriptPath.log"
    Start-Transcript -Path $logFile -Force

    function Get-TimeStamp {
        return "[{0:dd/MM/yyyy} {0:HH:mm:ss}]" -f (Get-Date)
    }
    Write-host "$(Get-TimeStamp) Pocinjem..."
}

PROCESS {
 
    function distribute-pm5DC {
        [CmdletBinding()]
        param (
            #Ime data collector-a
            [String] $DataCollectorName = "PM5"
         
        )
        $ErrorActionPreference = 'Stop';
        foreach ($computer in $computerName) {
            $fullPM5dir = "\\" + "$computer" + $pm5dir
            $arhPM5dir = $fullPM5dir + "\pmfile\Arhiv"
            #provera da li okruzenje postoji
            if (test-path $arhPM5dir) {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer vec postoji"
            }
            else {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer ne postoji, kreiram foldere i kopiram fajlove..."
                mkdir  $fullPM5dir, $arhPM5dir | Out-Default
                write-verbose "$(Get-TimeStamp) Kreirani folderi $fullPM5dir i $arhPM5dir na serveru $computer"
            }
                    
            cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.ps1' $fullPM5dir -Force -Confirm:$false 
            cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.xml' $fullPM5dir -Force -Confirm:$false
            
            $XMLFilePath = $fullPM5dir + $PerfmonTemplateName
        
            $logmanProvera = logman query $DataCollectorName -s $computer

            if ($logmanProvera -like "*$DataCollectorName*") {
                write-verbose "$(Get-TimeStamp) Data Counter $DataCollectorName na serveru $computer vec postoji"
            }
            else {
                write-verbose  "$(Get-TimeStamp) Data kolektor $DataCollectorName ne postoji na kompjuteru $computer"
                #importovanje data kolektora
                write-verbose  "$(Get-TimeStamp) Importujem data kolektor $DataCollectorName na kompjuteru $computer"
                logman.exe  import -n $DataCollectorName -xml $XMLFilePath -s $computer | out-default
            } # kraj provere logman.exe 
        } #end forEach $computerName
    } #end funkcije distribute-pm5

    function brisanje-pm5DC {
        [CmdletBinding()]
        param (
            #Ime data collector-a
            [String] $DataCollectorName = "PM5",
            #Name of scheduled task
            [String] $SchTaskName = "PM5"
     
        )
        $ErrorActionPreference = 'Stop';
        foreach ($computer in $computerName) {
            $fullPM5dir = "\\" + "$computer" + $pm5dir
            $logmanProvera = logman query $DataCollectorName -s $computer

            if ($logmanProvera -like "*$DataCollectorName*") {
                write-verbose "$(Get-TimeStamp) Zaustavljam Data Collector $DataCollectorName na serveru $computer" 
                logman stop $DataCollectorName -s $computer
                write-verbose "$(Get-TimeStamp) Brisem Data Collector $DataCollectorName na serveru $computer" 
                logman delete $DataCollectorName -s $computer |Out-Default
                write-verbose "$(Get-TimeStamp) Brisem schedulovani task $DataCollectorName na serveru $computer" 
                schtasks /Delete /TN $SchTaskName /S $computer /F | out-default
                write-verbose "$(Get-TimeStamp) Brisem okruzenje $DataCollectorName na serveru $computer" 
                rm $fullPM5dir -force -recurse -Confirm:$false 
            }
            else {
                write-verbose  "$(Get-TimeStamp) Data kolektor $DataCollectorName ne postoji na kompjuteru $computer"
            } # kraj provere logman.exe 
        } #end forEach $computerName
    } #end funkcije brisanje-pm5-DC


    function import-PM5_schtask {
        [CmdletBinding()]
        param (
            #Name of data collector
            [String] $SchTaskName = "PM5"
        )

        foreach ($computer in $ComputerName) {
            $fullPM5dir = "\\" + "$computer" + $pm5dir
            $SchTaskFilePath = $fullPM5dir + "PM5.sch_task.xml"

            $schtasksProvera = schtasks /query /S $computer /TN $SchTaskName

            if ($schtasksProvera -like "*PM5*") {
                write-verbose "$(Get-TimeStamp) Task $SchTaskName vec postoji na serveru $computer"
            }
            else {
                write-verbose "$(Get-TimeStamp) Kreiram task $SchTaskName  na $computer"
                schtasks /Create /S $computer /XML $SchTaskFilePath /TN $SchTaskName | out-default 
                write-verbose "$(Get-TimeStamp) Startujem task $SchTaskName  na $computer"
                schtasks /Run /S $computer /TN $SchTaskName | out-default
            }
        }
    }#end funkcije import-PM5schtask

    ### Pozivanje funkcija ###
    distribute-pm5DC 
    import-PM5_schtask  
    #brisanje-pm5DC 
}
END {
    write-host  "$(Get-TimeStamp) Bye... " ;
    Stop-Transcript;
} 