
[CmdletBinding()]
param (
    #Imena servera razdvojena ','
    [String[]] $ComputerName,
    #PM5 folder
    $pm5dir = "\C$\SCHTASK\pm5\",
    #Ime perfmon template-a
    [String] $PerfmonTemplateName = "PM5.perfmon_template.xml"
)

BEGIN {
    $pwd = Get-Location
    $scriptPath = $MyInvocation.MyCommand
    $logFile = "$pwd\$scriptPath.log"
    Start-Transcript -Path $logFile -Force

    function Get-TimeStamp {
        return "[{0:dd/MM/yyyy} {0:HH:mm:ss}]" -f (Get-Date)
    }
    Write-host "$(Get-TimeStamp) Pocinjem..."
}

PROCESS {
 
    function distribute-pm5 {
        [CmdletBinding()]
        param (
            #Ime data collector-a
            [String] $DataCollectorName = "PM5",
            #Startuj data collector?
            [switch] $Start
        )
        $ErrorActionPreference = 'Stop';
        foreach ($computer in $computerName) {
            $fullPM5dir = "\\" + "$computer" + $pm5dir
            $arhPM5dir = $fullPM5dir + "\pmfile\Arhiv"
            #provera da li okruzenje postoji
            if (test-path $arhPM5dir) {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer vec postoji"
                #da ne bih proveravao da li su i fajlovi tu, pregazicu sve xml i ps1 fajlove ovima sa Octopusa
                cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.ps1' $fullPM5dir -Force -Confirm:$false 
                cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.xml' $fullPM5dir -Force -Confirm:$false
            }
            else {
                write-verbose "$(Get-TimeStamp) Okruzenje na serveru $computer ne postoji, kreiram foldere i kopiram fajlove..."
                mkdir  $fullPM5dir, $arhPM5dir | Out-Default
                write-verbose "$(Get-TimeStamp) Kreirani folderi $fullPM5dir i $arhPM5dir na serveru $computer"
                cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.ps1' $fullPM5dir  -Force -Confirm:$false
                cp '\\octopus\c$\SCHTASK\pm5\*' -Filter 'pm5*.xml' $fullPM5dir  -Force -Confirm:$false
            }
        
            $XMLFilePath = $fullPM5dir + $PerfmonTemplateName
        
            $logmanProvera = logman query $DataCollectorName -s $computer

            if ($logmanProvera -like "*$DataCollectorName*") {
                write-verbose "$(Get-TimeStamp) Data Counter $DataCollectorName na serveru $computer vec postoji"
                if ($logmanProvera -like "*running*") {write-verbose "$(Get-TimeStamp) Data Counter $DataCollectorName na serveru $computer je vec startovan."} else {
                    If ($Start) {
                        write-verbose  "$(Get-TimeStamp) Startujem data kolektor $DataCollectorName na kompjuteru $computer"
                        logman.exe start $DataCollectorName -s $computer | out-default
                    }
                }
            }
            else {
                write-verbose  "$(Get-TimeStamp) Data kolektor $DataCollectorName ne postoji na kompjuteru $computer"
                #importovanje data kolektora
                write-verbose  "$(Get-TimeStamp) Importujem data kolektor $DataCollectorName na kompjuteru $computer"
                logman.exe  import -n $DataCollectorName -xml $XMLFilePath -s $computer | out-default
                
                #startovanje data kolektora
                If ($Start) {
                    write-verbose  "$(Get-TimeStamp) Startujem data kolektor $DataCollectorName na kompjuteru $computer"
                    logman.exe start $DataCollectorName -s $computer | out-default
                }
            } # kraj provere logman.exe 
        } #end forEach $computerName
    } #end funkcije distribute-pm5

    function import-PM5schtask {
        [CmdletBinding()]
        param (
            #Computer names separated by ','
            #[String[]] $ComputerName,
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

    ### Pozivam funkcije ###
    distribute-pm5 -DataCollectorName pm5 -Start:$true 
    import-PM5schtask  
}
END {
    write-host  "$(Get-TimeStamp) Bye... " ;
    Stop-Transcript;
} 