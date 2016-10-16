@echo off

:ROOT
echo Root directories available
for /f "skip=1 delims=" %%x in (
  'wmic logicaldisk get caption'
  ) do @echo.%%x

echo.
goto ROOTchoice

:ROOTchoice
set /p drive=Type the letter of the drive you want to use:
%drive%:
echo.
echo.
dir %drive%: >nul 2>nul
if not %errorlevel%==1 (cls goto DISPLAY)
if %errorlevel%==1 goto ROOTchoice


:DISPLAY
cls
echo Displaying Root files...
PING -n 2 127.0.0.1>nul
echo.
cd %drive%:\
dir %drive%: /b /o:n /ad-h
echo.
goto ChooseFile

:ChooseFile
echo.
echo Choose a name in the list
set /p folder=
if [%folder%]==[] goto eDISPLAY
dir %folder% >nul 2>nul
if %errorlevel%==1 goto eDISPLAY
if not %errorlevel%==1 goto DISPLAYfolder


:eDISPLAY
echo Cannot find folder
goto ChooseFile
pause

:DISPLAYfolder
cls
echo Displaying Parent files...
PING -n 2 127.0.0.1>nul
dir %folder% /b /o:n /ad-h
cd %folder%
echo.
goto ChooseFile2

:ChooseFile2
echo.
echo Choose a name in the list
set /p folder2=
if [%folder2%]==[] goto eDISPLAY2
dir %folder2% >nul 2>nul
if %errorlevel%==1 goto eDISPLAY2
if not %errorlevel%==1 goto DISPLAYfolder2


:DISPLAYfolder2
cls
echo Displaying child files...
echo.
PING -n 2 127.0.0.1>nul
dir %folder2% /b /o:n /ad-h
cd %folder2%
echo.
echo.
echo Choose next action:
echo [1] Go to main menu
echo [2] Log out
choice /c 12 /n
if %errorlevel%==1 goto ROOT
if %errorlevel%==2 goto LOGOUT
pause


:eDISPLAY2
echo We couldn't find the folder specified
goto ChooseFile2

:LOGOUT
echo Goodbye!
PING -n 2 127.0.0.1>nul
exit
