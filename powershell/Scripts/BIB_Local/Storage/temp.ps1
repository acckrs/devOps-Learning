
$t=Get-Process #Property to match ProcessName

$t2=Get-Service #Property to match Name

$i=0

$id=@{}

$t2.ForEach({

    $id["$($psitem.name)"]=$i #Create $var[name]=index

    $i++

})

$t.ForEach({

    $this=$psitem

    $r = New-Object System.Object

    $temp=$null

    try{

        $temp=$t2[($id[$psitem.ProcessName])]

    }

    catch {}

    finally {

        $r | Add-Member -MemberType NoteProperty -Name status -Value $temp.Status

        $r | Add-Member -MemberType NoteProperty -Name DisplayName -Value $temp.DisplayName

        $r | Add-Member -MemberType NoteProperty -Name Name -Value $this.Name

        $r | Add-Member -MemberType NoteProperty -Name Handles -Value $this.Handles

    }

    return $r

}) | Sort-Object stSelect-Object select -Last 30 