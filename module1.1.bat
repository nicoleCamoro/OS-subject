@echo off

:menu
cls
echo menu
echo --------------
echo  Choose a command:
echo.
echo [1] Display file management
echo [2] Search file management
echo [3] directory management
echo [4] File management
echo [5] Change password
echo [6] Restart Computer
echo [7] Logout
echo [8] About
choice /C 12345678 /N /M "----> "
cls
if %errorlevel% == 1 call module2.1.bat
if %errorlevel% == 2 call module2.2.bat
if %errorlevel% == 3 call module2.3.bat
if %errorlevel% == 4 call module2.4.bat
if %errorlevel% == 5 call module2.1.bat
if %errorlevel% == 6 shutdown /r
if %errorlevel% == 7 goto logout
if %errorlevel% == 8 call module3.4.bat
pause



:logout
echo goodbye!
pause
exitcm
