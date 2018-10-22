@ECHO OFF
SETLOCAL

REM *********************************************************
REM * EG creation script                                    *
REM * Desc: This script creates EGs on the configured broker*
REM * Author: Desmond David <desmond.david@oracle.com>      *
REM * Create date: 08th April 2018                          *
REM *********************************************************

REM *****Update below details only (do not add space except within filenames or directory names)
SET brokername=IIBINTNODE01
SET iibPath=C:\Program Files\IBM\IIB\10.0.0.8
REM ******************************************

ECHO. & ECHO =====Creating Integration Servers on %brokername%=====

ECHO. & ECHO Start time: %time%

SET workingPath=%CD%
ECHO. & ECHO =====EXECUTION START=====

CD /D %iibPath%\server\bin
CALL mqsiprofile.cmd

CD /D %workingPath%
FOR /F "eol=# tokens=1,2 delims==" %%i in (eg.properties) DO (
	ECHO. & ECHO Creating EG: %%i
	CALL mqsicreateexecutiongroup %brokername% -e %%i >> "egcreate.log"
	IF ERRORLEVEL 1 (
		ECHO Failed!
	) ELSE (
		ECHO Done!
	)
	ECHO.
	ECHO Setting HTTP port for %%i to %%j
	CALL mqsichangeproperties %brokername% -e %%i -o HTTPConnector -n explicitlySetPortNumber -v %%j >> "egcreate.log"
	IF ERRORLEVEL 1 (
		ECHO Failed!
	) ELSE (
		ECHO Done!
	)
)

ECHO =======EXECUTION COMPLETE=======
ECHO.
ECHO End time: %time%

PAUSE

ENDLOCAL
@ECHO ON