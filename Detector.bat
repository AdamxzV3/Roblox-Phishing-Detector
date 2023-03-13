@echo off
:start
set /p url="Enter a URL: "

set "main_url=www.roblox.com"
set "second_url=web.roblox.com"

for /f "tokens=1 delims=/" %%a in ("%url%") do (
  set "hostname=%%a"
)

if /i "%hostname%"=="%main_url%" (
  color 2
  echo Not a phishing
) else if /i "%hostname%"=="%second_url%" (
  color 2
  echo Not a phishing
) else (
  color 4
  echo Phishing deteced
)

pause
cls
color 7
goto start
