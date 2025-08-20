@echo off
SETLOCAL

REM set JEUS_HOME if not specified
SET FileDir=%~dp0?
SET FileDir=%FileDir:\domains\@domain_name@\bin\?=?%
FOR /f "tokens=1,2 delims=?" %%a in ("%FileDir%") do set FileDir=%%a

IF "%JEUS_HOME%"=="" (
SET JEUS_HOME=%FileDir%
)

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

IF ERRORLEVEL == 3 EXIT /B

set argc=0
for %%x in (%*) do Set /A argc+=1
if %argc% == 0 (
    goto USAGE
) else (
    goto BEFORE
)
:USAGE
ECHO ****************************************************************************
ECHO   - Usage : stopServer ^<-host host:port^>
ECHO                     ^<-server server_name^> ^<-dasurl address:port^>
ECHO                     ^<-u username^> ^<-p password^>
ECHO                     ^<-cachelogin^> ^<-domain domain^> ^<-f cachelogin_file^>
ECHO                     ^<-g^> ^<-to wait_time^>
ECHO                 options :
ECHO                   -host: Specify the host and port information
ECHO                         for the server you want to shut down.
ECHO                         [Default: localhost:9736]
ECHO                   -server: Specifies the name of the managed server you want to shut down.
ECHO                         DAS cannot be shut down with this option.
ECHO                         To use this option, you must give the -dasurl option.
ECHO                         This option cannot be used with the -host option.
ECHO                   -dasurl: Specify the DAS address and port information for the domain
ECHO                         where the managed server you want to shut down is located.
ECHO                         [Default: http://localhost:9736]
ECHO                   -u: Specify the user identity with authority to shut down the server.
ECHO                   -p: Specify the password corresponding to -u option.
ECHO                   -cachelogin: Attempts to authenticate with the information
ECHO                               stored in the cache login file.
ECHO                               You must give -u, -domain option as key
ECHO                               to find corresponding user information.
ECHO                               You can store new cache login information
ECHO                               by giving -u, -p, -domain option with -cachelogin.
ECHO                               If you have single domain, you don't have to
ECHO                               specify -d option.
ECHO                   -domain: Specify the domain to use cachelogin.
ECHO                   -f: Set the file path to be used in cachelogin.
ECHO                     If -f option is omitted, default file path will be used.
ECHO                     [Default cachelogin file path: ~/.jeusadmin/.jeuspasswd]
ECHO                   -g: Wait for the server to finish works and then shut down.
ECHO                   -to: Even if the server is working,
ECHO                     it waits for the given time and then shut down.
ECHO.
ECHO                 examples :
ECHO                   stopServer -host localhost:9736 -u user -p passwd
ECHO                     -^> Basic usage of stopServer script.
ECHO                   stopServer -u user -p passwd
ECHO                     -^> You can omit -host option.
ECHO                       Default host(localhost:9736) will shut down.
ECHO.
ECHO                   stopServer -server ms1 -dasurl http://localhost:9736 -u user -p passwd
ECHO                     -^> You can use stopServer script by specifying managed server name.
ECHO                   stopServer -server ms1 -u user -p passwd
ECHO                     -^> You can omit -dasurl option.
ECHO                       Shut down the managed server using the default DAS address(localhost:9736).
ECHO.
ECHO                   stopServer -host localhost:9736 -u user -p passwd
ECHO                            -domain domain1 -cachelogin
ECHO                     -^> Stores user information with domain to the default cachelogin file.
ECHO                   stopServer -host localhost:9736 -u user -domain domain1
ECHO                            -cachelogin
ECHO                     -^> Attempts authentication using cachelogin information
ECHO                       instead of using -u, -p option.
ECHO                   stopServer -host localhost:9736 -u user -domain domain1
ECHO                            -cachelogin -f /home/jeus/jeusCachePW
ECHO                     -^> You can specify cachelogin file you want use.
ECHO ****************************************************************************
GOTO:EOF

:BEFORE
SET USER_NAME=
SET USERPASSWORD=
SET URL=
SET DEBUG=
SET VERBOSE=
SET CACHELOGIN=
SET DOMAIN=@domain_name@
SET FILENAME=
SET GRACEFUL=
SET SHUTDOWNTIMEOUT=
SET DAS=
SET SERVER_NAME=
SET ERR_ARGS=

:CHECK_ARGS
if "%1" == "" GOTO NEXT
    SET ARG=%1
    IF "%ARG:~0,1%" == "-" (
        SET FLAG_ARGS=
        if "%1" == "-host" (
            if NOT DEFINED URL (
                SET URL=%2
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-u" (
            if NOT DEFINED USER_NAME (
                SET USER_NAME=%2
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-p" (
            if NOT DEFINED USERPASSWORD (
                SET USERPASSWORD=%2
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-debug" (
            if NOT DEFINED DEBUG (
                SET DEBUG="-debug"
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-verbose" (
            if NOT DEFINED VERBOSE (
                SET VERBOSE="-verbose"
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-cachelogin" (
            if NOT DEFINED CACHELOGIN (
                SET CACHELOGIN="-cachelogin"
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-domain" (
            if NOT DEFINED DOMAIN (
                SET DOMAIN=%2
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-f" (
            if NOT DEFINED FILENAME (
                SET FILENAME=%2
          )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-g" (
            if NOT DEFINED GRACEFUL (
                SET GRACEFUL="-g"
            )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-to" (
            if NOT DEFINED SHUTDOWNTIMEOUT (
                SET SHUTDOWNTIMEOUT=%2
            )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-server" (
            if NOT DEFINED SERVER_NAME (
                SET SERVER_NAME=%2
            )
            SET FLAG_ARGS=TRUE
        )
        if "%1" == "-dasurl" (
            if NOT DEFINED DAS (
                SET DAS=%2
            )
            SET FLAG_ARGS=TRUE
        )
        IF NOT DEFINED FLAG_ARGS (
            SET ERR_ARGS=%ERR_ARGS% %1
        )
    )
	SHIFT
GOTO CHECK_ARGS
:NEXT

IF DEFINED ERR_ARGS (
    ECHO There is an unrecognized option: %ERR_ARGS%
    GOTO:EOF
)

IF NOT DEFINED USER_NAME (
	SET USER_NAME=
) ELSE (
	SET USER_NAME=-u %USER_NAME%
)

IF NOT DEFINED USERPASSWORD (
	SET USERPASSWORD=
) ELSE (
	SET USERPASSWORD=-p %USERPASSWORD%
)

IF NOT DEFINED DOMAIN (
	SET DOMAIN=
) ELSE (
	SET DOMAIN=-domain %DOMAIN%
)

IF NOT DEFINED FILENAME (
	SET FILENAME=
) ELSE (
	SET FILENAME=-f %FILENAME%
)

IF NOT DEFINED URL (
	SET URL=
)

REM set boot parameter
SET BOOT_PARAMETER=-p null
IF DEFINED JEUS_USERNAME (
	SET BOOT_PARAMETER=-u %JEUS_USERNAME% -p %JEUS_PASSWORD%
) ELSE (
    IF DEFINED USER_NAME (
        SET BOOT_PARAMETER=%USER_NAME% %USERPASSWORD%
    )
)

IF DEFINED URL (
    IF DEFINED SERVER_NAME (
        GOTO URL_SERVER_ERR
    )
)
REM set target
SET TARGET="local-shutdown" %GRACEFUL%

IF DEFINED SERVER_NAME (
    REM set target
    SET TARGET="stop-server" %SERVER_NAME%
    IF DEFINED DAS (
        SET URL=%DAS%
    )
)

IF DEFINED URL (
    SET URL=-host %URL%
)
IF DEFINED SHUTDOWNTIMEOUT (
    SET TARGET=%TARGET% -to %SHUTDOWNTIMEOUT%
)
GOTO EXECUTE
:URL_SERVER_ERR
ECHO Do not use the -host option and -server option together.
GOTO:EOF
:EXECUTE
REM execute jeusadmin
"%JAVA_HOME%\bin\java" -classpath "%BOOTSTRAP_CLASSPATH%" %TOOL_OPTION% ^
    -Djeus.home="%JEUS_HOME%" ^
    -Djava.naming.factory.initial=jeus.jndi.JNSContextFactory ^
    -Djava.naming.factory.url.pkgs=jeus.jndi.jns.url ^
    -Djava.util.logging.config.file="%JEUS_HOME%\bin\logging.properties" ^
    %JAVA_ARGS% ^
    %BOOTSTRAPPER% ^
    jeus.tool.console.console.ConsoleMain "%TARGET%" %URL% %BOOT_PARAMETER% %DEBUG% %VERBOSE% %DOMAIN% %FILENAME% %CACHELOGIN%

ENDLOCAL