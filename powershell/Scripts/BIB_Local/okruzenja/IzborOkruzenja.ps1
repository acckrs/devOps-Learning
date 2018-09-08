###############################
# Script kojom korisnik podešava svoje radno okruženje
# na kraju scripte se poziva i skripta za podesavanje okruženja tako da logon/logoff nije neophodan. 
# Izvrsava se u kontekstu korisnika koji je pokrenuo.
###############################

set-location C:\windows\bib\IzborOkruzenja;
$ErrorActionPreference='stop';
$logFile="$($MyInvocation.MyCommand.Definition).log";
@'
--------------------------------------
*** Error log izbora okruzenja. ***
Desila se greška tokom procesa i potrebno je da se obratite ict_techsuppor@bancaintesa.rs
--------------------------------------
'@ | Out-File $logFile;
#$Error.Clear();
Start-Transcript -Path $logFile -Append;

try{

# podesi okruženja
$envs=@('DEV-Development', 'UAT-Korisnicki test', 'TRN-Trening', 'FC1-Flex dev', 'FC2-Flex test')

"# uzmi tekuće podešavanje"
$e=(get-ItemProperty -Path 'HKLM:\SOFTWARE\BIB').Environment 

"# gradimo formu"
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
$Form = New-Object System.Windows.Forms.Form;
$Form.Text = ”Environment?";
$Font = New-Object System.Drawing.Font("Times New Roman",12); $Form.Font = $Font
 
"# Create a group that will contain your radio buttons"
$MyGroupBox = New-Object System.Windows.Forms.GroupBox;
$MyGroupBox.text = " Izbor okruženja ";

$Offset=20; $bhight=30; $bwidth=200; $bLastY=0;
$rb=@{};
$envs |
%{ $key=$_;
   $rb[$key]=New-Object System.Windows.Forms.RadioButton;
   $bLastY+=$bhight;
   $rb[$key].Location="$Offset,$bLastY";
   $rb[$key].Size= "$bwidth,$bhight"
   $rb[$key].Text = $key;
   $rb[$key].Checked= ($key.StartsWith($e));
   $MyGroupBox.Controls.Add($rb[$key]);
}
$bLastY+=$bhight+$bhight/2;
$MyGroupBox.Location = "$Offset,$Offset"
$MyGroupBox.size = "$($bwidth+2*$Offset),$bLastY"
$form.Controls.Add($MyGroupBox);    

"# Add an OK button"
$OKButton = new-object System.Windows.Forms.Button
$OKButton.Location = "$Offset,$($MyGroupBox.Height+$MyGroupBox.Location.Y+$bhight/2)"
$OKButton.Size = "$($MyGroupBox.Width),$bhight"   
$OKButton.Text = 'OK'
$OKButton.DialogResult=[System.Windows.Forms.DialogResult]::OK
$form.Controls.Add($OKButton);

"# Set the size of your form"
$Form.width = $MyGroupBox.Width+2*$Offset;
$Form.height = $OKButton.Location.Y+3*$bhight;
 
"# Activate the form"
$form.Add_Shown({$form.Activate()})    
    
"# Get the results from the button click"
$dialogResult = $form.ShowDialog()

if ($dialogResult -eq 'OK') {
  $e=$rb.GetEnumerator() | ?{$_.Value.Checked} | %{$_.Key} ;
  if ($e -ne $null) {
    $e=$e.Split('-')[0];
    $e;
    Set-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\BIB' -Name 'Environment' -Value $e;
  }
}

"#ako je sve ok log fajl nam ne treba"
Stop-Transcript;
del -Path $logFile -Force;

}
catch{
  Stop-Transcript;
  &'notepad.exe' $logFile;
  throw $Error;
}

  
"#startuj novo okruzenje"
$startEnvFile="$([System.IO.Path]::GetDirectoryName($logFile))\StartEnvironment.ps1"
invoke-expression -Command $startEnvFile; 

