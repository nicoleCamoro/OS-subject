@echo off

:START
cls
echo.
echo.
echo =========================
echo Welcome!
echo =========================
echo.
echo Choose an option:
echo [1]Login
echo [2]Register
echo [3]Exit
echo.
choice /C 123 /N /M "----> "
goto option-%errorlevel%

:option-1
cls
echo.
echo login
echo --------------
set /P un=Username:
set /P pw=Password:
if [%un%]==[] goto option-1
if [%pw%]==[] goto option-1
pause
FIND "%un%%pw$%" uname.dll
if %errorlevel% == 0 call module1.1.bat
if %errorlevel% == 1 echo Does not recognize username or password
pause
goto START


:option-2
cls
echo.
echo Register
echo --------------
set /P username=Username:
set /P password=Password:
if [%username%]==[] goto option-2
if [%password%]==[] goto option-2

echo %username%%password% >> uname.dll
echo.
echo Registration done!
goto START

:option-3
cls
echo.
echo Goodbye!
echo.
ECHO      ..::''''::..
ECHO    .;''        ``;.
ECHO   ::    ::  ::    ::
ECHO  ::     ::  ::     ::
ECHO  :: .:' ::  :: `:. ::
ECHO  ::  :          :  ::
ECHO   :: `:.      .:' ::
ECHO    `;..``::::''..;'
ECHO      ``::,,,,::''
ECHO.
ECHO.
pause
exit

:HOME
echo home
pause
