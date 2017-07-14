$servers = gc servers.txt
$patches = gc patches.txt

foreach ($server in $servers) {
    $hf = invoke-command -computername $server {
        $Patches = 'KB4012598', #Windows XP, Vista, Server 2003, 2008
        'KB4018466', "KB4012217", "KB4012213", #Server 2008
        'KB4012212', 'KB4012215', 'KB4015549', 'KB4019264', #Windows 7, Server 2008 R2
        'KB4012214', 'KB4012217', 'KB4015551', 'KB4019216', #Server 2012
        'KB4012213', 'KB4012216', 'KB4015550', 'KB4019215', #Windows 8.1, Server 2012 R2
        'KB4012606', 'KB4015221', 'KB4016637', 'KB4019474', #Windows 10
        'KB4013198', 'KB4015219', 'KB4016636', 'KB4019473', 'KB4016871', #Windows 10 1511
        'KB4013429', 'KB4015217', 'KB4015438', 'KB4016635', 'KB4019472' #Windows 10 1607, Server 2016
        Get-HotFix -Id $Patches
    } -ErrorAction  SilentlyContinue -ErrorVariable problem
    $props = @{
        "Name" = "$hf.name";
        "Msg"  = "Patch $hf.hotfixID"
    }
     $obj = New-Object -TypeName psobject -Property $props
    foreach ($p in $problem) {
        if ($p.origininfo.pscomputername) {
            $msg = "Patch not found " 
            $props = @{
                "Name" = "$($p.origininfo.pscomputername)";
                "Msg"  = $msg
            }
        }
        elseif ($p.targetobject) {
            $msg = "Unable to connect"
            $props = @{
                "Name" = "$($p.targetobject)";
                "Msg"  = $msg
            }
        }
        $obj = New-Object -TypeName psobject -Property $props
        Write-Output $obj
       
    }
}