@ECHO OFF
SETLOCAL

SET _SOURCE="X:\Config"

SET _DEST="\\octopus\bck-citrix-fs$\Config"


:: ---------------------------------------------------------

SET _WHAT=/E /B /COPY:DT 

:: /E       :: copy all subdirectories including empty once
:: /B       :: copy files in Backup mode. 
:: /COPY:DT :: copy Data and Timestamp file info



SET _OPTIONS=/R:0 /W:0 /XX /NP /NFL /XF LBAN* RecentDoc??.QRP Thumbs.db *.tmp /LOG:BackupLogFile.log

:: /R:n     :: number of Retries
:: /W:n     :: Wait time between retries
:: /XX      :: suppress reporting and processing of EXTRA files
:: /XF      :: eXclude Files matching given names/paths/wildcards
:: /NP      :: NO progress info
:: /LOG     :: Output log file

:: ---------------------------------------------------------


ROBOCOPY %_SOURCE% %_DEST% %_WHAT% %_OPTIONS%

