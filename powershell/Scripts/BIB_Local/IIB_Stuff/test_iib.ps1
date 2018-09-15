$fc2_auxiliary=gc .\auxiliary.txt
$fc2_common=gc .\common.txt
$fc2_auxiliary |select -Unique|measure
$fc2_common |select -Unique|measure