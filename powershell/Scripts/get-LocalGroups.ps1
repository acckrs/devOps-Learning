 [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [Alias('Group')]
        [string[]]
            $LocalGroup,
        [Alias('CN','Computer')]
        [string[]]
            $ComputerName = '.'
    )

    foreach ($Computer in $ComputerName) {
        try {
            foreach ($Group in $LocalGroup) {
                ([adsi]"WinNT://$Computer/$Group,group").psbase.Invoke('Members') | ForEach-Object {
                    New-Object -TypeName PSCustomObject -Property @{
                        ComputerName = $Computer
                        LocalGroup   = $Group
                        Member       = $_.GetType().InvokeMember('Name', 'GetProperty', $null, $_, $null)
                    }
                }
                
            }
	    } catch {
		    Write-Warning $_
	    }
    }	
