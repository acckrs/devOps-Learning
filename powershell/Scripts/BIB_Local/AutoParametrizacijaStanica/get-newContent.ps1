$ErrorActionPreference='stop';
$DebugPreference='continue';

################################################################################################ 
# funkcija cita ceo fajl i vraća sve linije. 
# ako traženog atributa nema dodaje slog sa novim atributom.
# ako tražen atribut postoji, vraća liniju sa izmenjenom vrednošću
# ako nema ni ključa ni atribuda dodaje na kraju fajla noviu ključ sa jednim novim atributom. 
# Sve što je funckija vratila se samo preusmeri u novi fajl.
################################################################################################

function Get-NewContent (
  $filename, 
  $targetSeq, 
  $targetAttrib,
  $targetValue
  ) {
$curSeq='';
$add=$change=0;
# prepis uz izmenu po potrebi
Get-Content $filename |
  %{$line=$_.Trim();
    if ($line -match '^\[(.+)\]$') {
	  if (($curSeq -eq $targetSeq) -and ($change -eq 0)) {
	    #napustio sam traženu sekvencu a atribut nisam našao. Insertujem emisiju novog slog sa traženim atributom.
	    $targetAttrib+'='+$targetValue; 
		Write-Debug $("ADD-NEW: $($targetAttrib+'='+$targetValue)")
		$add++;
	  };
	  $curSeq=$line;
	}
	else {
	  if (($curSeq -eq $targetSeq) -and ($line -match '^'+$targetAttrib+' *=')) {
	    # u okviru tražene sequence sam i poklopio se atribut. Emitujem novu vrednost
		$line=$targetAttrib+'='+$targetValue;
		Write-Debug $("$targetSeq, $line");
		Write-Debug $("CHANGE: $line");
	    $change++;
	  }
	}
	$line; #emitujem slog!
  }
if (($change -eq 0) -and ($add -eq 0)) {
  write-debug $("NEW-KEY:$targetSeq"); #nov ključ 
  $targetSeq; #emitujem novi ključ
  Write-debug $("NEW-ATT:$($targetAttrib+'='+$targetValue))"); 
  $targetAttrib+'='+$targetValue; # emitujem novi atribut
}
}