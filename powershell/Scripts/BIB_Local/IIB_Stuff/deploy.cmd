@ECHO OFF
SETLOCAL

REM ***************************************************
REM * Bar override and deployment script              *
REM * Author: Desmond David <desmond.david@oracle.com>*
REM * Create date: 24th April 2018                    *
REM ***************************************************

REM *****Update below details for each release (do not add space except within filenames or directory names)
SET releasenumber=1
SET brokername=IIBINTNODE01
SET iibPath=C:\Program Files\IBM\IIB\10.0.0.8
REM ******************************************

SET releasePath=%CD%
SET totalBars=0
SET totalFailedDeploy=0
SET totalSuccessDeploy=0

ECHO ================================
ECHO =====BIB Release %releasenumber% for IIB=====
ECHO ================================& ECHO.

SET starttime=%time%
ECHO Start time: %starttime%

ECHO. & ECHO =====Setting up IIB environment=====
CD /D %iibPath%\server\bin
CALL mqsiprofile.cmd

ECHO. & ECHO =====Finding files=====& ECHO.
CD /D %releasePath%
ECHO Working path: %releasePath%
ECHO Found directories:
FOR /F %%d in ('dir /b /a:d') DO ECHO %%d

REM For each directory in current directory
ECHO. & ECHO =====Starting BAR override activity=====& ECHO.

FOR /F %%d in ('dir /b /a:d') DO (
	ECHO. & ECHO ***For Integration Server %%d*** & ECHO.
	CD %%d
	FOR /F %%f in ('dir /b *.bar') DO (
		ECHO Overriding %%f...
		CALL mqsiapplybaroverride -b %%f -p %%~nf.properties -r >> "%releasePath%\overrides.log"
		IF ERRORLEVEL 1 (
			ECHO Failed!
			ECHO An error occurred when overriding the bar file. Deployment will not proceed until this is fixed. Please remove the problematic bar and properties files or rectify the error and try again.
			GOTO end
		) ELSE (
			ECHO Done!
		)
		SET /A totalBars=totalBars+1
	)
	CD..
)

:skipoverride

ECHO. & ECHO =====Starting BAR deployment activity===== & ECHO.
ECHO ***Deploying to broker: %brokername%*** & ECHO.

FOR /F %%d in ('dir /b /a:d') DO (
	ECHO. & ECHO ***Deploying to Integration Server %%d*** & ECHO.
	CD %%d
	FOR /F %%f in ('dir /b *.bar') DO (
		ECHO Deploying %%f...
		CALL mqsideploy %brokername% -e %%d -a %%f -w 300 >> "%releasePath%\deploy.log"
		IF ERRORLEVEL 1 (
			ECHO Failed! Check deploy.log
			SET /A totalFailedDeploy=totalFailedDeploy+1
		) ELSE (
			ECHO Done!
			SET /A totalSuccessDeploy=totalSuccessDeploy+1
		)
	)
	CD..
)
	
:end
ECHO ================================
ECHO =======EXECUTION COMPLETE=======
ECHO ================================& ECHO.
ECHO Start time: %starttime%
ECHO End time: %time%
ECHO.
ECHO Total Bars: %totalBars%
ECHO Successfully deployed: %totalSuccessDeploy%
ECHO Failed deployment or unknown: %totalFailedDeploy%

PAUSE

CD %releasePath%
ENDLOCAL
@ECHO ON