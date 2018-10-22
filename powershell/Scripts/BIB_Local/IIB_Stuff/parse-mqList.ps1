# Parameter help description
Param(
    [string] $qList
)
$pat = "(QUEUE\(S.*)|(AMQ.*)|(^\s*TYPE\(Q[LM].*\)\s*)"
$a = gc -Path "$qList" |Select-String -Pattern "$pat" -NotMatch
$a[5..($a.Length - 4)] | % {$_.tostring().trim().replace("TYPE(QLOCAL)", "").replace("QUEUE(","DEFINE QLOCAL('").replace(")","')")}
