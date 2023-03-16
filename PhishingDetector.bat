@echo off

:start
echo made by RoGuard.
set /p url="Enter a URL: "

set "main_url=roblox.com"
set "second_url=www.roblox.com"
set "third_url=web.roblox.com"

if /i "%url:~0,8%"=="https://" (
  set "url=%url:~8%"
)

if /i "%url:~0,4%"=="www." (
  set "url=%url:~4%"
)

for /f "tokens=1 delims=/" %%a in ("%url%") do (
  set "hostname=%%a"
)

set "private_server_string=privateServerLinkCode="

if /i "%hostname%"=="%main_url%" (
  color 2
  echo Not a phishing
) else if /i "%hostname%"=="%second_url%" (
  color 2
  echo Not a phishing
) else if /i "%hostname%"=="%third_url%" (
  color 2
  echo Not a phishing
) else if not "%url:~-33%"=="%private_server_string%" (
  color 4
  echo Phishing detected
) else (
  set "psl=%url:*%private_server_string%=privateServerLinkCode=%"
  set "psl=%psl:~0,-33%"
  set "new_url=%url:privateServerLinkCode=%psl%"
  if not "%new_url%"=="%url%" (
    color 2
    echo Not a phishing
  ) else (
    color 4
    echo Phishing detected
  )
)

pause
cls
color 7
goto start
