@echo off

:ROOT
for /f "skip=1 delims=" %%x in ('wmic logicaldisk get caption') do @echo.%%x
pause 