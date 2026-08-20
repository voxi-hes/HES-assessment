@echo off
chcp 65001 >nul
title HES -SSD(Simple Server Diagnostics)

:menu
cls
call :HOME
echo.
echo 1. Ping IP
echo 2. Test Port
echo 3. SSH Into Server
echo 4. Exit
echo.

set "opt="
set /p opt="Choose a number: "

if "%opt%"=="1" goto :ping
if "%opt%"=="2" goto :testport
if "%opt%"=="3" goto :ssh
if "%opt%"=="4" exit /b
if "%opt%"=="67" goto :funnynumber
goto :menu

:ping
cls
set "IP="
set /p IP="IP: "
if not defined IP goto :menu

echo.
powershell -Command "Test-Connection -ComputerName '%IP%' -Count 1 -Quiet"
echo.
pause
goto :menu

:testport
cls
set "IP="
set "PORT="
set /p IP="IP: "
if not defined IP goto :menu
set /p PORT="Port: "
if not defined PORT goto :menu

echo.
powershell -Command "(Test-NetConnection -ComputerName '%IP%' -Port %PORT% -WarningAction SilentlyContinue).TcpTestSucceeded"
echo.
pause
goto :menu


:ssh
cls
set "IP="
set "USER="
set "PORT="
set /p IP="IP: "
if not defined IP goto :menu
set /p USER="Username: "
if not defined USER set "USER=root"
set /p PORT="Port: "
if not defined PORT set "PORT=22"

ssh -p %PORT% %USER%@%IP%

echo.
pause
goto :menu

:funnynumber
cls
echo bro...
timeout /t 3 >nul
for /l %%i in (1,1,67) do (
    echo 67 (%%i)
    timeout /t 1 >nul
)
pause
goto :menu

:HOME
echo $$\   $$\ $$$$$$$$\  $$$$$$\  
echo $$ ^|  $$ ^|$$  _____^|$$  __$$\ 
echo $$ ^|  $$ ^|$$ ^|      $$ /  \__^|
echo $$$$$$$$ ^|$$$$$\    \$$$$$$\  
echo $$  __$$ ^|$$  __^|    \____$$\ 
echo $$ ^|  $$ ^|$$ ^|      $$\   $$ ^|
echo $$ ^|  $$ ^|$$$$$$$$\ \$$$$$$  ^|
echo \__^|  \__^|\________^| \______/ 
echo made by voxi
exit /b
