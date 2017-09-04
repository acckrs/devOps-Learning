

function global:Log ($msg){
  [char]13+[char]10+'--- {0} ----' -f [Datetime]::Now.ToString('yyyy-MM-dd hh:mm:ss') | Out-File -Append -FilePath $logFile.FullName -Force ; 
  $msg | Out-File -Append -FilePath $logFile.FullName -Force ; 
}

function global:Chk-UnknownType{
  Log -msg "Tip [$ciType] nije pokriven kontrolom.";
  ren -Path $logFile.FullName -NewName $($logFile.Name.Replace('.log','._log')) -Force;
}

function global:Fin-Ok{
  Log -msg 'Check OK.';
  $dst=$($logFile.FullName.Replace('\toCheck\', '\ok\'));
  if (Test-Path -Path $dst) {del $dst -Force;}
  move -Path $logFile.FullName  -Destination  $dst -Force;
}

function global:Chk-Ping {
  $pingOk=$false;
  $hostName=$oName;
  if ($oName -match '([a-z0-9]+)\$.+') {$hostName=$Matches[1];}
  $cmd="ping $hostName -n 2";
  $msg=Invoke-Expression -Command $cmd;
  $msg | ?{$_ -match 'Received = [1-4],'} | %{$pingOk=$true;} 
  Log -msg $msg;
  $pingOk;
}

function global:Chk-Default {
  try{
    Log -msg 'Chk-Default';
    if ($IsWindows) {
      Chk-Share;
      #if (Test-Path -LiteralPath "\\$oName\c$") {
      #  Log -msg "\\$oName\c$ share is online.";
      #  Fin-Ok;
      #}
      #else {
      #  Log -msg "Putanja \\$oName\c$ nije dostupna";
      #  Chk-Ping;
      #}
    }
    else {
      if (Chk-Ping) {
        Fin-Ok;
      }
    }
  }
  catch {
    Log -msg $Error[0];
    Chk-Ping;
  }
}


function global:Chk-MSSQL {
  $sqlSrv=New-Object System.Data.SqlClient.SqlConnection;
  $sqlSrv.ConnectionString="Server=$($oName.replace('$','\')); Database=master; User ID=beta155; Password=web;Application name=check-DR";
  try{
    Log -msg $('Try to connect: '+$sqlSrv.ConnectionString); 
    $sqlSrv.Open();
    $sqlcmd=$sqlsrv.CreateCommand();
    $sqlcmd.CommandText='select Name, [Status]=cast(databasepropertyex(Name, ''Status'') as nvarchar(256)) from master.dbo.sysdatabases';
    $dt=New-Object System.Data.DataTable;
    $dt.Load($sqlcmd.ExecuteReader());
    $sqlSrv.Close();
    $bad=$dt | ?{$_.Status -notmatch 'ONLINE|RESTORING|OFFLINE'}; 
    $msg=$dt;
  }
  catch {
    $bad=$Error[0];
    Chk-Ping;
  }
  Log -msg $($dt |Format-Table);
  if ($bad -ne $null) {
    Log -msg $bad;
  }
  else {
    Fin-Ok;
  }
}


function global:Chk-IIS{
  $web=New-Object System.Net.WebClient;
  @(80, 81) |
    %{try{
        $cmd='http://{0}:{1}' -f $oName, $_;
        Log -msg $cmd;
        $msg=$web.DownloadString($cmd);
        Log -msg $msg;
        Fin-Ok;
        Break;
      }
      catch {
        $e=$Error[0];
        Log -msg $e;
        $eMsg=$e.Exception.get_InnerException().ToString();
        Log -msg $eMsg;
        if ($eMsg -match 'The remote server returned') {
          Log -msg 'IIS server je dostupan. Ovo je greška načina prisupa sajtu. Sa aspekta DR testa, server je ok.';
          Fin-Ok;
          Break;
        }
        Log -msg $Error[0];
        $Error.Clear();
        Chk-Ping;
      }
    }
}


function global:Chk-Share{
  $tcp=new-object System.Net.Sockets.TcpClient;
  $tcp.Connect($oName, 445);
  if ($tcp.Connected) {
    $tcp.Close();
    Log -msg "Connected $oName port 445"; 
    Fin-Ok;
  }
  else {
    Chk-Ping;
  }
}


function global:Chk-DCOM{
  $tcp=new-object System.Net.Sockets.TcpClient;
  $tcp.Connect($oName, 135);
  if ($tcp.Connected) {
    $tcp.Close();
    Log -msg "Connected $oName port 135"; 
    Fin-Ok;
  }
  else {
    Chk-Ping;
  }
}

 
function global:Chk-ORACLE{
  @(1521, 1522, 1525, 1527) |
    %{$port=$_; 
      Log -msg "Try connect $oName port=$port";
      $tcp=New-Object System.Net.Sockets.TcpClient;
      try{
        $tcp.Connect($oName, $port);
        $tcp.Close();
        Log -msg "Connected $oName port=$port";
        Fin-Ok;
        break;
      }
      catch {
        Log -msg $Error[0];
        $Error.Clear();
        Chk-Ping;
      }
    };
  Log -msg "Unable connect $oName on defined ports";
}
  
