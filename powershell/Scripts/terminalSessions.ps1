 [CmdletBinding()] 

 param(
 [parameter (mandatory=$true)]
 $servername,

 $sessionID
 )

#izlistaj sve terminal sesije na serveru $servername
rwinsta /SERVER:inexnlb1 1


#Ubij terminal sesiju sa id-jem sesije $sessionID na serveru $servername 
rwinsta /server:$servername $sessionID

