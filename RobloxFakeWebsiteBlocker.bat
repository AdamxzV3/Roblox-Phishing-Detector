
@echo off
rem Checking For Administrator
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    cls
) else (
    echo You must run me as an Administrator. Exiting..
    echo.
    echo Right-click on me and select ^'Run as Administrator^' and try again.
    echo.
    echo Press any key to exit..
    pause > NUL
    exit
)

setlocal enabledelayedexpansion

set websites=roblox.com.lr roblox.icu roblox.mk rblxcopy.so immortalsites.fun
set hosts_file=%SystemRoot%\System32\drivers\etc\hosts

echo Blocking Infected websites...
timeout /t 2 /nobreak > NUL
for %%i in (%websites%) do (
    set website=%%i
    echo 127.0.0.1 !website! >> %hosts_file%
)

echo Done.
pause
