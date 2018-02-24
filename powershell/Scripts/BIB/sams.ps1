$users=Get-Content ..\HD727461\users.txt
$gObj=@()
foreach ($user in $users){
    $adusr=Get-ADUser -filter * -Properties department,description | Where-Object {($_.name -like "$user") -and ($_.description -like "*Devizni sektor*")}|Select-Object name,SamAccountName,department
    $props=@{
        "name"=$adusr.name;
        "samaccountname"=$adusr.SamAccountName;
        "department"=$adusr.department
    }  
    $props
    $obj=new-object -TypeName PSObject -Property $props
    $gObj+=$obj
}
Write-Output $gObj