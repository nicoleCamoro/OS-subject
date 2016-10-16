@echo off


:setRoot
echo.
echo.
echo.
echo Root directories available
for /f "skip=1 delims=" %%x in (
  'wmic logicaldisk get caption'
  ) do @echo.%%x
echo.
goto RootSearch

:RootSearch
set /p drive="Type the letter of the drive you want to search in: "
%drive%:
echo.
echo.
dir %drive%: >nul 2>nul
if not %errorlevel%==1 (goto DISPLAYrootSearch)
if %errorlevel%==1 (goto rootSearchError)

:DISPLAYrootSearch
cd %drive%:\
echo You are now in drive %drive%
pause
cls
echo.
echo Type a keyword to search files and folders:
set /p searchFile=
if [%searchFile%]==[] (goto keywordError)
goto STARTsearch


:keywordError
cls
echo Please enter a keyword
goto DISPLAYrootSearch


:rootSearchError
echo Choose a letter from the above choices
goto setRoot

:STARTsearch
echo.
echo.

REM for /f "skip=1 delims=" %%x in (
REM   'attrib  *%searchFile%*.* /D /S'
REM   ) do (
REM   	@echo.%%x
REM   )
attrib  *%searchFile%*.* /D /S
echo.
echo.
echo Done with search
echo.
pause
