@echo off
SETLOCAL

REM set JEUS_HOME if not specified
set FileDir=%~dp0
if "%JEUS_HOME%" == "" ^
set JEUS_HOME=%FileDir:~0,-5%

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

IF ERRORLEVEL == 3 EXIT /B

ECHO ******************************************************************************************************************
ECHO   - Usage : startDomainAdminServerNM -host host -port port -domain domain -server server -u username -p password
ECHO ******************************************************************************************************************


IF DEFINED JEUS_USERNAME (
	SET BOOT_PARAMETER=-u %JEUS_USERNAME% -p %JEUS_PASSWORD% %*
) ELSE (
	SET BOOT_PARAMETER=%*
)

REM execute jeus with echo
@echo on
"%JAVA_HOME%\bin\java" -Xmx128m -classpath "%BOOTSTRAP_CLASSPATH%" %TOOL_OPTION% ^
-Djeus.home="%JEUS_HOME%" ^
-Djava.library.path="%JEUS_LIBPATH%" ^
-Djava.naming.factory.initial=jeus.jndi.JNSContextFactory ^
-Djava.naming.factory.url.pkgs=jeus.jndi.jns.url ^
-Djeus.baseport=%JEUS_BASEPORT% ^
-Djava.util.logging.config.file="%JEUS_HOME%\bin\logging.properties" ^
%BOOTSTRAPPER% ^
jeus.tool.console.console.ConsoleMain "_nm-start-server %BOOT_PARAMETER%"
@echo off

ENDLOCAL
