@echo off
SETLOCAL

REM set JEUS_HOME if not specified
SET FileDir=%~dp0?
SET FileDir=%FileDir:\domains\@domain_name@\servers\@server_name@\bin\?=?%
FOR /f "tokens=1,2 delims=?" %%a in ("%FileDir%") do set FileDir=%%a

IF "%JEUS_HOME%"=="" (
SET JEUS_HOME=%FileDir%
)

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

REM set server-specific properties
IF EXIST "%JEUS_HOME%\bin\@domain_name@.@server_name@.properties.cmd" (
    CALL %JEUS_HOME%\bin\@domain_name@.@server_name@.properties.cmd
)

IF ERRORLEVEL == 3 EXIT /B

ECHO **************************************************************
ECHO   - JEUS Home         : %JEUS_HOME%
echo   - JEUS Base Port    : %JEUS_BASEPORT%
ECHO   - Java Vendor       : %JAVA_VENDOR%
ECHO   - Added Java Option : %JAVA_ARGS%
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
jeus.server.ManagedServerLauncherBootstrapper %BOOT_PARAMETER% -domain @domain_name@ -server @server_name@
@echo off

ENDLOCAL
