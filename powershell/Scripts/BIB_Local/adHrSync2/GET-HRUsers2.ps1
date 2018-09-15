# GET-HrUsers
cls
$ErrorActionPreference='stop'
$DebugPreference='silentlycontinue'
$Error.Clear()

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

Set-Location 'C:\script\adhrsync2\'

#config file
$cfg=[xml] (Get-Content '.\Sync-AD-HR.xml')

## inic sql connection ## 
$sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
$sqlSrv.ConnectionString=$cfg.HA.SqlConnectionString
"Try to connect [$($sqlSrv.ConnectionString)]";
$sqlSrv.Open()

##podesiti !! ime procedure koja povlaci podatke sa HR baze
$sqlProc=$sqlSrv.CreateCommand()      
$sqlProc.CommandType=[System.Data.CommandType]::StoredProcedure;
$sqlProc.CommandText='[AD].[Get-HRUsers]'
"Try execute $($sqlProc.CommandText)";
$sqlproc.set_CommandTimeout($cfg.HA.SqlQuery.TimeOut)  
$sqlProc.ExecuteNonQuery() 


## obrada slika
"Start obrada nedostajucih AD slika!" 
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand=$sqlSrv.CreateCommand()
#Podesiti!!! upit kojim se selektuju slike koje se trabaju obraditi
$SqlAdapter.SelectCommand.CommandText= `
@'
      select h.winuser, h.Slika
      from AD.HRUsers2Ext s
      join AD.HRUsers2 h 
        on s.winuser=h.winuser 
        and h.Slika is not null 
        and s.adPhoto is null
      where datalength(h.Slika)>128
'@        

#podesiti!! ime procedure koja belezi obradjenu/AD sliku u sql-u
$sqlProc.CommandText='[AD].[Set-ADUserPhoto]'
$sqlProc.Parameters.Clear()
$sqlProc.Parameters.Add('@winUser', [System.Data.SqlDbType]::NVarChar) | Out-Null
$sqlProc.Parameters.Add('@ADPhoto', [System.Data.SqlDbType]::Image ) | Out-Null

#zemi slike za obradu
$maxPixels=[Int32]$cfg.HA.Photo.MaxPixels
$maxSize=[float]$cfg.HA.Photo.MaxSize;

$DataTable = New-Object System.Data.DataTable
$n=$SqlAdapter.Fill($DataTable) 
$DataTable |
  %{#uzimanje slike za obradu
    $photo=[Byte[]]$_.Slika; 
    $winUser=$_.WinUser;
    "Try photo ADUser=$winUser";
    
    #povlacim HR sliku iz datatable u memory stream zarad image (nema fajla)
    $msHr = new-object System.IO.MemoryStream
    $msHr.Write($photo, 0, $photo.Count);
    $ImgHr= new-object System.Drawing.Bitmap $msHr
    
    #prema startnoj velicini utvrdjujem koeficijent smanjivanja
    $k=[Math]::Sqrt($maxPixels/($ImgHr.Height*$ImgHr.Width))
    $adWidth=[Int32]($k*$ImgHr.Width);  $adHeight=[Int32]($k*$ImgHr.Height);
    
    #kreira se nova slika (prazna) u zadatom formatu. Nakon toga ga graphic popunjava!
    $ImgAD = new-object System.Drawing.Bitmap $adWidth, $adHeight  
    $g=[System.Drawing.Graphics]::FromImage($ImgAD)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($ImgHr, 0, 0, $adWidth, $adHeight)
    
    #export obradjene slike u memory stream zarad slanja sql-u
    $msAD = new-object System.IO.MemoryStream;
    $imgAd.Save($msAD,[system.drawing.imaging.imageformat]::jpeg)

    "--- User=[$winUser] Size=[$($msAD.Length)]"
    if ($cfg.HA.Photo.ExportPath -ne '') {
      $ImgAD.Save($cfg.HA.Photo.ExportPath+$winuser+'.jpg', ([system.drawing.imaging.imageformat]::jpeg))
    }
    #export u bazu
    $SqlProc.Parameters['@winuser'].Value=$winUser;
    $sqlProc.Parameters['@ADPhoto'].value=$msAD.GetBuffer()
    $sqlProc.ExecuteNonQuery() | Out-Null;
    
    "Kreirana AD slika za {$winuser}"
    #sledeci... :-)
  }
"Broj gresaka $($Error.Count)"  
##
