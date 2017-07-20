#
# Show TCP state changes
#
# Purpose:  Collects TCP event traces that indicate when a socket changes state.
#           Analyzes events to summarize all state changes
#

$provider = "Microsoft-Windows-TCPIP/Diagnostic"
$config = New-Object System.Diagnostics.Eventing.Reader.EventLogConfiguration $provider
$config.IsEnabled = $true
$config.SaveChanges()

Write-Host TCP logging enabled.  Reproduce the issue now.
Read-Host Press ENTER to stop logging and begin trace analysis

$config.IsEnabled = $false
$config.SaveChanges()

# Look for:
#   event 1017 is emitted when a listening TCP socket accepts a connection
#   event 1033 is emitted when a TCP socket is connected
#   event 1051 is emitted when a TCP connection changes state
$events = Get-WinEvent -LogName $provider -Oldest 
$events 

$tcbs = @{}

$events | ForEach-Object {
    if ($_.Id -eq 1017 -or $_.Id -eq 1033) {
        # If we see a new socket, add it to our table

        $tcb = $_.Properties[7].Value
        $tcbs[$tcb] = $_.Message

        "" + $_.TimeCreated.ToString("hh:mm:ss.fff") +
            "`t" + $_.Message

    } elseif ($_.ID -eq 1051) {
        # This socket has changed state.

        $tcb = $_.Properties[3].Value
        if ($tcbs.Contains($tcb)) {
            # If we knew about the socket (it was created during the trace),
            # display its information here

            # Do a bit of string munging to make the output more readable
            "" + $_.TimeCreated.ToString("hh:mm:ss.fff") +
                "`t" + [Regex]::Match($tcbs[$tcb], "PID = \d+").Value +
                "`t" + [Regex]::Match($tcbs[$tcb], "(?<=\().*(?=\))").Value +
                "`t" + $_.Message
        }    }
}