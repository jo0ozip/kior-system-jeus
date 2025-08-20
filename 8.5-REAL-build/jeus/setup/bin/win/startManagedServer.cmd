@echo off
SETLOCAL

REM set JEUS_HOME if not specified
set FileDir=%~dp0
if "%JEUS_HOME%" == "" ^
set JEUS_HOME=%FileDir:~0,-5%

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

REM extract the server name from arguments
:loop
IF "%~1"=="" GOTO next
    SET ARG=%~2
    IF "%~1" == "-domain" (
        IF NOT "%ARG:~0,1%" == "-" (
            SET DOMAIN_NAME=%~2
            SHIFT
        )
        GOTO END_CASE
    )
    IF "%~1" == "-server" (
        IF NOT "%ARG:~0,1%" == "-" (
            SET SERVER_NAME=%~2
            SHIFT
        )
        GOTO END_CASE
    )
    :END_CASE
    SHIFT
GOTO loop
:next

REM set a domain name if only one domain directory exists
FOR /f %%i in ('dir /a:d /b "%JEUS_HOME%\domains" ^| find /c /v ""') do SET NUM_DOMAINS=%%i

IF %NUM_DOMAINS% == 1 (
    IF NOT DEFINED DOMAIN_NAME (
        FOR /f %%i in ('dir /a:d /b "%JEUS_HOME%\domains"') do SET DOMAIN_NAME=%%i
    )
)

REM set server-specific properties
IF EXIST "%JEUS_HOME%\bin\%DOMAIN_NAME%.%SERVER_NAME%.properties.cmd" (
    CALL %JEUS_HOME%\bin\%DOMAIN_NAME%.%SERVER_NAME%.properties.cmd
)

IF ERRORLEVEL == 3 EXIT /B

ECHO **************************************************************
ECHO   - JEUS Home         : %JEUS_HOME%
ECHO   - Added Java Option : %JAVA_ARGS%
ECHO   - Java Vendor       : %JAVA_VENDOR%
ECHO **************************************************************


IF DEFINED JEUS_USERNAME (
	SET BOOT_PARAMETER=-u %JEUS_USERNAME% -p %JEUS_PASSWORD% %*
) ELSE (
	SET BOOT_PARAMETER=%*
)

REM execute jeus with echo
@echo on
"%JAVA_HOME%\bin\java" %VM_OPTION% %LAUNCHER_MEM% ^
-classpath "%BOOTSTRAP_CLASSPATH%" ^
-Dsun.rmi.dgc.client.gcInterval=3600000 ^
-Dsun.rmi.dgc.server.gcInterval=3600000 ^
-Djeus.jvm.version=%VM_TYPE% ^
-Djeus.home="%JEUS_HOME%" ^
-Djava.naming.factory.initial=jeus.jndi.JNSContextFactory ^
-Djava.naming.factory.url.pkgs=jeus.jndi.jns.url ^
-Djava.library.path="%JEUS_LIBPATH%" ^
-Djava.util.logging.manager=jeus.util.logging.JeusLogManager ^
-Djava.util.logging.config.file="%JEUS_HOME%\bin\logging.properties" ^
-Djeus.properties.replicate=jeus,java.util.logging,sun.rmi.dgc,java.net ^
-Djava.net.preferIPv4Stack=true ^
jeus.server.ManagedServerLauncherBootstrapper %BOOT_PARAMETER%
@echo off

ENDLOCAL
