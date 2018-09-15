#PS 2
    #dobijanje liste profila
    gci "c:\documents and settings" -filter ntuser.dat -Recurse -force -ErrorAction SilentlyContinue  |select directoryname 

#windows 2008
    #dobijanje liste profila
    split-path (split-path -path (gci c:\Users -filter ntuser.dat -Recurse -force -ErrorAction SilentlyContinue  |select psparentpath) -NoQualifier) -leaf



#windows 2008R2 - 2016
    #dobijanje liste profila
    split-path (split-path (gci c:\users ntuser.dat -Recurse -Attributes h -Depth 1  |select psparentpath).psparentpath -NoQualifier) -Leaf
 