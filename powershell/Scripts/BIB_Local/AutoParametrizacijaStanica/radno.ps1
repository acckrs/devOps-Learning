$okruzenja = @( 'DEV', 'MNT', 'TRN', 'FC1', 'FC2')
foreach ($okr in $okruzenja) {
    #$name= ".\"+"$okr"+"\config\default\"
    $name2= ".\"+"$okr"+"\config\clients\*"
    rm $name2 -Force 
}
