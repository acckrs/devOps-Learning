
' ================= MAIN() ===============================================
' cscript ScriptName //B //NoLogo //T:28800
On Error Resume Next
'Option Explicit
WScript.Timeout=28500


'-----------------------------------------
Dim sqlSrvList, sqlQueryList, rsList
Dim sqlSrvLog, sqlQueryLog
Dim RootPath, BckPath, LocPath, FileName, FullFileName, FullBckName
Dim objShell, LogFile, fso,  SqlErr, MaxFileNo, IsDeleted, errTxt

'--- max fajlova za brisanje po pozivu.
MaxFileNo=50000
BckPath="\\octopus\bck-citrix-fs$\Config\Clients\"
RootPath="\\Citrix-FS\Config\Clients\"


'--- open log file
Set fso=CreateObject("scripting.filesystemobject")
Set LogFile=fso.OpenTextFile("X:\SCHTASK\Citrix\CFS-WeeklyFilesRemove\Logs\RemoveOldCtxFile."+Replace(Replace(Replace(CStr(Now()),"/","-"),":","_")," ","_")+".log", 2, true, -2)
Call LogMsg("Start:"+CStr(Now()),"",0)
Call LogMsg("Limit file count for erase="+CStr(MaxFileNo),"",0)

' konekcija za listu kandidata
Set sqlSrvList = WScript.CreateObject("ADODB.Connection")
sqlSrvList.ConnectionString="Provider=SQLOLEDB;Data Source=octopus;Trusted_Connection=Yes;"+_
                            "Initial Catalog=SysSqlDB;" 
Set sqlQueryList=WScript.CreateObject("ADODB.Command")
Call sqlSrvList.Open()
Call LogMsg("sqlSrvList conekcija.", Err.Description, 1)
sqlQueryList.ActiveConnection=sqlSrvList
sqlQueryList.CommandType=1 'adCmdText = 1
sqlQueryList.CommandText="exec ctx.GetFileForDelete"

' konekcija za evidentiranje brisanja
Set sqlSrvLog = WScript.CreateObject("ADODB.Connection")
sqlSrvLog.ConnectionString="Provider=SQLOLEDB;Data Source=octopus;Trusted_Connection=Yes;"+_
                            "Initial Catalog=SysSqlDB;"
Set sqlQueryLog=WScript.CreateObject("ADODB.Command")
Call sqlSrvLog.Open()
Call LogMsg("sqlSrvLog conekcija.", Err.Description, 1)
sqlQueryLog.ActiveConnection=sqlSrvLog
sqlQueryLog.CommandType=1 'adCmdText = 1

' pocetak obrade/brisanja
Do 
  
  ' provera radnog vremena
  If IsWorkingTime()=1 Then Exit Do
  
  ' lista za brisanje
  Set rsList=sqlQueryList.Execute()
  SqlErr=Err.Description
  If SqlErr<>"" Then Call LogMsg("sql!", SqlErr, 1)

  ' ima li sta?
  If rsList.State=0 Then Exit Do
  rsList.MoveFirst()
  
  'obrada grupe (rsList)  
  Do 
    'get file name
    RootPath=rsList.Fields.Item("RootPath")
    LocPath=rsList.Fields.Item("LocPath")
    FileName=rsList.Fields.Item("FileName")
    FullFileName=RootPath+LocPath+"\"+FileName
    FullBckName=BckPath+LocPath+"\"+FileName
        
    ' dodatna kontrola extenzija /da li ima bekap.
    If InStr(";.xls;.doc;.qrp;.pdf;.mp3;",Right(FullFileName,4))=0 Then Call LogMsg(FullFileName,"Extenzija",1)
    
    ' obrisi ga ako ima bekap
    If fso.FileExists(FullBckName)=True Then 
      
      'log u text file
      Call LogMsg("Erase["+FullFileName+"]", Err.Description, 0)  
            
      ' pa pokusaj brisanja
      Call fso.DeleteFile(FullFileName, True)
      errTxt=Err.Description 
      If errTxt<>"" Then 
        ' mozda nema fajla ili permissije, ... (IsDeleted=2)
      	Call LogMsg("delete file ["+FullFileName+"]", errTxt, 0)
      	IsDeleted="2"
      Else
        IsDeleted="1"
      End if
      
      ' odradjena ponuda 
      MaxFileNo=MaxFileNo-1
    
    Else
 
      IsDeleted="0"
      Call LogMsg("Warning:NoBackupFile ["+FullBckName+"] ","",  0)
 
    End If
    
	' prvo evidencija evidencija
	sqlQueryLog.CommandText="exec [ctx].[LogDeletedFile] '@LocPath', '@FileName', @isDeleted" 
	sqlQueryLog.CommandText=Replace(sqlQueryLog.CommandText, "@LocPath", Replace(LocPath,"'","''"))
	sqlQueryLog.CommandText=Replace(sqlQueryLog.CommandText, "@FileName", Replace(FileName,"'","''"))
	sqlQueryLog.CommandText=Replace(sqlQueryLog.CommandText, "@isDeleted", IsDeleted)
	sqlQueryLog.Execute()
	SqlErr=Err.Description
	If SqlErr<>"" Then Call LogMsg("sql:LogDeletedFile["+FullFileName+"]", SqlErr, 1)
    
    
    ' next
    rsList.MoveNext()
    
  Loop While rsList.EOF=False And MaxFileNo>0
  rsList.Close()
  
  '-- limit
  If MaxFileNo<=0 Then  Call LogMsg("Obrisan limit u jednom pozivu scripte.","", 0): Exit Do
  
Loop 


Call LogMsg("Bye."+CStr(Now()), "", 0)
' end MAIN
'========================================================================


' --- provera radnog vremena
function IsWorkingTime()
On Error Resume Next
dim fn
fn=0
If Weekday(Now(), vbSunday)=1 Or (Hour(Now())<7 and Hour(Now())>19) Then 
  fn=0
Else
  fn=1
  Call LogMsg("Usli u radno vreme. EXIT script.","",0)
End If
fn=0 ' debug!
IsWorkingTime=fn
End Function


'--- log msg
Public Sub LogMsg( txt, errTxt, isFatal)
On Error Resume Next
LogFile.WriteLine txt
If errTxt<>"" Then
  LogFile.WriteLine string(5,".")+"<Error>"+String(5,".")+CStr(Now)+vbCrLf+vbTab+errTxt+vbcrlf
  If isFatal=1 Then 
    LogFile.WriteLine string(10,"-")+"<.QUIT.>"+String(10,"-")+vbCrLf
    WScript.Quit(99)
  Else 
    Err.Clear 
  End If
End If 
End Sub  
    
'---<END>---

