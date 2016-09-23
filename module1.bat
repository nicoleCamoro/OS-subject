From: nicolecamoro@gmail.com Franchette Camoro 
To:  
Date: Wed, 24 Aug 2016 10:51:42 +0800 
Subject: Re: draft 
 
AUG 24

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
pause
goto START




:option-2
cls
echo.
echo Register
echo --------------
set /P username=Username: || set username=blank
set /P password=Password: || set password=blank

echo %username% >> uname.dll
echo %password% >> pass.dll


pause
goto option-1

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
