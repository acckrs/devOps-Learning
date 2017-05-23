 [CmdletBinding()] 

 param(
 [parameter (mandatory=$true)]
 $servername,

 $sessionID
 )

#izlistaj sve terminal sesije na serveru $servername
qwinsta /SERVER:$servername

#Ubij terminal sesiju sa id-jem sesije $sessionID na serveru $servername 
#rwinsta /server:$servername $sessionID

