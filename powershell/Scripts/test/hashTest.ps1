$skup1 = @(1, 2, 3, 4, 5)
$skup2 = @(2, 3, 4, 5, 6)<# 
$s=@{}
foreach ($item in $skup1) {
    $s[$item]=1
}
$s #>
$h = @{}
$skup1 | % {$h[$_] = 1}
$skup2 | % { if( $h[$_] -eq null)
     {$h[$_] = 2}
      else {h[$_]=3}
     }


$h