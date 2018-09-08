SET InPath=C:\Application\ITT\FBIB0\DATA\in
SET OutPath=\\parmashare\Spazio\Kondor\INTEST

SET FileName=%1
ECHO %FileName% arrived at %DATE% %TIME% >> c:\fileIn\ReceiveLog\%1.log 2>&1
ECHO Will move %FileName% from %InPath%\%1 to %OutPath%!  >> c:\fileIn\ReceiveLog\%1.log 2>&1
ren %FileName% "%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%_%FileName%"
move /Y %InPath%\%1 %OutPath%  
 