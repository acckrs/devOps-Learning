
#podesavanje mail servera

$PSEmailServer = "mail"

# Ucitavanje sadrzaja fajla

$a = Get-Content endofday.txt

# Konvertovanje sadrzaja fajla u datum

$b=[datetime]::ParseExact($a, "yyyyMMdd", $null)

# Dodavanje jednog dana

$b = $b.AddDays(1)

# string za pretragu

$c = '\\TSSRV\Increment_KYC2\Increment_' + $b.ToString("yyyyMMdd")

# provera da li postoji direktorijum i obavezni fajlovi TRANSACTIONS i CUSTOMERS

if ((Test-Path $c ) -and (Test-Path ($c+'\TRANSACTIONS_' +$b.ToString("yyyyMMdd") + '.txt') )  -and (Test-Path ($c+'\CUSTOMERS_' +$b.ToString("yyyyMMdd") + '.txt') ) )

	{	

	# ucitava se sadrzaj fajla prebaci.bat

	$d = Get-Content prebaci.bat

	# zamena starog datuma sa novim i snimanje 

	$d -replace $a, $b.ToString("yyyyMMdd") |  Out-File prebaci.bat -encoding ASCII

	# startovanje prebaci.bat sa logovanjem

	C:\DOKUMENTACIJA\AML\Transkcije_IMPORT\KOPIRAJ\prebaci.bat > log.txt

	# citanje log fajla zbog dodavanja podataka sa oracle baze

	$Z = Get-Content log.txt

	# PODACI iz norkom.calendar_signal TABELE ZA DATUM KOJI SE UCITAVA
msra /
	$connectionString = "Data Source=amldb.DELTABANK.CO.YU;User Id=rsappuser;Password=r51ppu5er;Integrated Security=no"
	[Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

	$connection = New-Object System.Data.OracleClient.OracleConnection($connectionString)

	$queryString = "select * from norkom.calendar_signal where business_day = '" + $b.ToString("yyyyMMdd") + "' order by update_timestamp  desc"

	$command = new-Object  System.Data.OracleClient.OracleCommand($queryString, $connection)
	$connection.Open()

	$reader=$command.ExecuteReader()

	# dodati objasnjenje za oracle tabelu

	$Z = $Z + "                                         " #-encoding ASCII
	$Z = $Z + "******** IZVESTAJ SA ORACLE BAZE ********" #-encoding ASCII
	$Z = $Z + "                                         " #-encoding ASCII
	$Z = $Z + $queryString #-encoding ASCII
	$Z = $Z + "                                         " #-encoding ASCII

	# Write out the results 
	while ($reader.read()) 
	{
	    $business_day=$reader.GetString(0)  
	    $signal_group_name=$reader.GetString(1)
        #   $ordunit_code=$reader.GetString(2)
	    $deletes=$reader.GetString(3)
	   $update_timestamp=$reader.GetDatetime(4)    

	    $Z = $Z + "$business_day $signal_group_name $deletes $update_timestamp " #-encoding ASCII
	}


	$connection.Close()

	$Z | Out-File log.txt -encoding ASCII

	# teks za slanje maila i slanje maila

	$d = 'Ucitani podaci za ' + $b.ToString("yyyyMMdd") + '. Prethodno ucitan datum ' + $a + '.'

	Send-MailMessage -SmtpServer $PSEmailServer  -From "AMLucitavanje@bancaintesa.rs" -To "Mikica.Petkovic@bancaintesa.rs","Nenad.Dragojevic@bancaintesa.rs","dragica.misic@bancaintesa.rs","marina.mijailovic@bancaintesa.rs","Boris.Milivojcevic@bancaintesa.rs","Nemanja.Gasic@bancaintesa.rs","Ana.Jovanovska@bancaintesa.rs","miljan.danilovic@bancaintesa.rs" -Subject ("AML ucitavanje za " +  $b.ToString("yyyyMMdd")) -Body $d -Attachments log.txt	

	}

else 	{
	$d = 'Nisu ucitani podaci za ' + $b.ToString("yyyyMMdd") + '. Prethodno ucitan datum ' + $a + '.'
	Send-MailMessage -SmtpServer $PSEmailServer -From "AMLucitavanje@bancaintesa.rs" -To "aleksandar.krstic@bancaintesa.rs" -Subject ("AML ucitavanje za " +  	$b.ToString("yyyyMMdd") + " NIJE POKRENUTO") -Body $d
	}

