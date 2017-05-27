function get-sysInfo {
    [cmdletbinding()]
    param(
        [Parameter(mandatory=$true, 
                 ValueFromPipeline = $true)]
        [string[]] $ComputerName
    )
}