@echo off

:setRootManage
echo.
echo.
echo.
echo Root directories available
for /f "skip=1 delims=" %%x in (
  'wmic logicaldisk get caption'
  ) do @echo.%%x
echo.
goto RootSearchManage

:RootSearchManage
set /p drive="Type the letter of the drive you want to search in: "
%drive%:
echo.
echo.
dir %drive%: >nul 2>nul
if not %errorlevel%==1 (goto DISPLAYrootS)
if %errorlevel%==1 (goto rootSearchErrorManage)

:DISPLAYrootS
cd %drive%:\
echo You are now in drive %drive%
pause
cls
echo.
echo Create new folder:
set /p parentFolderName=Folder name:
if [%parentFolderName%]==[] (goto folderErr)
goto createParent


:folderErr
cls
echo Please type in a keyword
goto DISPLAYrootS


:rootSearchErrorManage
echo Choose a letter from the above choices
goto setRootManage

:createParent
echo Making parent folder
PING -n 2 127.0.0.1>nul
echo.
mkdir %parentFolderName%
echo Opening parent folder
PING -n 2 127.0.0.1>nul
cd %parentFolderName%
goto newChild

:newChild
echo Create new child folder
set /p childFolderName=Folder name:
if [%childFolderName%]==[] (goto folderErr2)
goto createChild

:createChild
cls
echo Making child folder
PING -n 2 127.0.0.1>nul
echo.
mkdir %childFolderName%
echo Displaying child folder contents
PING -n 2 127.0.0.1>nul
dir %childFolderName% /b
echo.
echo.
echo Displaying parent folder contents
PING -n 2 127.0.0.1>nul
dir . /b
pause
goto renameFolder

:folderErr2
cls
echo Please type in a keyword
goto newChild

:renameFolder
cls
dir . /b
echo.
echo Do you want to rename a folder (yn)?
choice /c yn
echo %errorlevel%
pause
if %errorlevel%==1 goto renameFolder
if %errorlevel%==2 goto noRenameFolder

:renameFolder
cls
echo Current folders:
dir . /b
echo.
echo Folder to be renamed:
set /p oldfolder=
echo.
echo New folder name:
set /p newFolder=
echo.
echo.
echo Renaming %oldfolder% to %newFolder%
rename %oldfolder% %newFolder%
pause

:noRenameFolder
echo. Going back to main menu
call module1.1.bat
pause
