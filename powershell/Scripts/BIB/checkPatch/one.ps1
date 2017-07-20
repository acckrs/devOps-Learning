  invoke-command -computername "fsi-node1" {
        $Patches = 'KB4012598', #Windows XP, Vista, Server 2003, 2008
        'KB4018466', "KB4012213", #Server 2008
        'KB4012212', 'KB4012215', 'KB4015549', 'KB4019264', #Windows 7, Server 2008 R2
        'KB4012214', 'KB4012217', 'KB4015551', 'KB4019216', #Server 2012
        'KB4012213', 'KB4012216', 'KB4015550', 'KB4019215' #Windows 8.1, Server 2012 R2
   
        foreach($patch in $patches) {Get-HotFix -HFID $Patch -ErrorAction SilentlyContinue
        } 
    } 